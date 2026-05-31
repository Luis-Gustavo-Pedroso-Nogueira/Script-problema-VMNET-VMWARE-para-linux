#!/bin/bash
set -e
echo "=== Corrigindo módulos VMware para kernel $(uname -r) ==="
cd /tmp
rm -rf vmware_fix
mkdir vmware_fix && cd vmware_fix
tar xf /usr/lib/vmware/modules/source/vmmon.tar
tar xf /usr/lib/vmware/modules/source/vmnet.tar
find . -name "Makefile*" -exec sed -i 's/EXTRA_CFLAGS/ccflags-y/g' {} \;
find . -name "*.c" -o -name "*.h" | xargs sed -i 's/del_timer_sync/timer_delete_sync/g'
find . -name "*.c" -o -name "*.h" | xargs sed -i 's/rdmsrl_safe/rdmsrq_safe/g'
echo 'OBJECT_FILES_NON_STANDARD := y' >> vmmon-only/Makefile.kernel
echo 'OBJECT_FILES_NON_STANDARD := y' >> vmnet-only/Makefile.kernel
python3 -c "
content = open('vmmon-only/common/phystrack.c').read()
content = content.replace('   dir3->bits[pos] |= bit;\n}', '   dir3->bits[pos] |= bit;\n   return;\n}', 1)
content = content.replace('   dir3->bits[pos] &= ~bit;\n}', '   dir3->bits[pos] &= ~bit;\n   return;\n}', 1)
open('vmmon-only/common/phystrack.c', 'w').write(content)
"
cd vmmon-only && make && sudo cp vmmon.ko /lib/modules/$(uname -r)/misc/ && cd ..
cd vmnet-only && make && sudo cp vmnet.ko /lib/modules/$(uname -r)/misc/ && cd ..
sudo depmod -a
sudo modprobe vmmon
sudo modprobe vmnet
echo "=== Pronto! VMware pronto para usar ==="
