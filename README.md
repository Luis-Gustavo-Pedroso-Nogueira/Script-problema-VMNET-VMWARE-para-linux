# Script-corre-o-problema-VMNET-VMWARE-para-linux
Script para corrigir problema de inicialização do VMWare no Linux com erro de inicialização devido o erro de VMNET e VMMON

crie o arquivo abaixo adicione o script fix-vmware.sh
sudo nano /usr/local/bin/fix-vmware
salve ctrl + O
e execute: sudo fix-vmware.sh 

Resultado esperado:

=== Corrigindo módulos VMware para kernel 6.17.0-29-generic ===
Using kernel build system.
make -C /lib/modules/6.17.0-29-generic/build/include/.. M=$PWD SRCROOT=$PWD/. \
  MODULEBUILDDIR= modules
make[1]: Entrando no diretório '/usr/src/linux-headers-6.17.0-29-generic'
make[2]: Entrando no diretório '/tmp/vmware_fix/vmmon-only'
warning: the compiler differs from the one used to build the kernel
  The kernel was built by: x86_64-linux-gnu-gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
  You are using:           gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
  CC [M]  linux/driver.o
  CC [M]  linux/driverLog.o
  CC [M]  linux/hostif.o
  CC [M]  common/apic.o
  CC [M]  common/comport.o
  CC [M]  common/cpuid.o
  CC [M]  common/crosspage.o
  CC [M]  common/memtrack.o
  CC [M]  common/moduleloop.o
  CC [M]  common/phystrack.o
  CC [M]  common/sharedAreaVmmon.o
  CC [M]  common/statVarsVmmon.o
  CC [M]  common/task.o
  CC [M]  common/vmx86.o
  CC [M]  bootstrap/bootstrap.o
  CC [M]  bootstrap/monLoader.o
  CC [M]  bootstrap/monLoaderVmmon.o
  CC [M]  bootstrap/vmmblob.o
  LD [M]  vmmon.o
  MODPOST Module.symvers
  CC [M]  vmmon.mod.o
  CC [M]  .module-common.o
  LD [M]  vmmon.ko
  BTF [M] vmmon.ko
Skipping BTF generation for vmmon.ko due to unavailability of vmlinux
make[2]: Saindo do diretório '/tmp/vmware_fix/vmmon-only'
make[1]: Saindo do diretório '/usr/src/linux-headers-6.17.0-29-generic'
make -C $PWD SRCROOT=$PWD/. \
  MODULEBUILDDIR= postbuild
make[1]: Entrando no diretório '/tmp/vmware_fix/vmmon-only'
make[1]: 'postbuild' está atualizado.
make[1]: Saindo do diretório '/tmp/vmware_fix/vmmon-only'
cp -f vmmon.ko ./../vmmon.o
Using kernel build system.
make -C /lib/modules/6.17.0-29-generic/build/include/.. M=$PWD SRCROOT=$PWD/. \
  MODULEBUILDDIR= modules
make[1]: Entrando no diretório '/usr/src/linux-headers-6.17.0-29-generic'
make[2]: Entrando no diretório '/tmp/vmware_fix/vmnet-only'
warning: the compiler differs from the one used to build the kernel
  The kernel was built by: x86_64-linux-gnu-gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
  You are using:           gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
  CC [M]  driver.o
  CC [M]  hub.o
  CC [M]  userif.o
  CC [M]  netif.o
  CC [M]  bridge.o
  CC [M]  procfs.o
  CC [M]  smac_compat.o
  CC [M]  smac.o
  CC [M]  vnetEvent.o
  CC [M]  vnetUserListener.o
  LD [M]  vmnet.o
  MODPOST Module.symvers
  CC [M]  vmnet.mod.o
  CC [M]  .module-common.o
  LD [M]  vmnet.ko
  BTF [M] vmnet.ko
Skipping BTF generation for vmnet.ko due to unavailability of vmlinux
make[2]: Saindo do diretório '/tmp/vmware_fix/vmnet-only'
make[1]: Saindo do diretório '/usr/src/linux-headers-6.17.0-29-generic'
make -C $PWD SRCROOT=$PWD/. \
  MODULEBUILDDIR= postbuild
make[1]: Entrando no diretório '/tmp/vmware_fix/vmnet-only'
make[1]: 'postbuild' está atualizado.
make[1]: Saindo do diretório '/tmp/vmware_fix/vmnet-only'
cp -f vmnet.ko ./../vmnet.o
=== Pronto! VMware pronto para usar ===
