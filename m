Received: from mail.lotsys.com ([213.39.33.126] helo=smtp-dmz.lotsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DDfMD-0002b2-1W
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 04:07:27 -0500
To: linux-mtd@lists.infradead.org
Message-ID: <OFB60D2AA5.53149DE8-ONC1256FC0.003E7E1D-C1256FCC.00321BD6@lotsys.com>
From: thierry.chantry@lotsys.com
Date: Tue, 22 Mar 2005 10:07:18 +0100
MIME-Version: 1.0
Content-type: text/plain; charset="us-ascii"
Cc: vincent.laporte@lotsys.com
Subject: rmmod mtd driver produces a segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
Does this post is so stupid that nobody wants to give us a short
explanation ?
Thanks
Thierry Chantry

-------- Posted on Thu Mar 10 07:07:15 EST 2005 ------------
Sent by Thierry Chantry on behalf Vincent Laporte:

HARDWARE
- Standard PC motherboard
SOFTWARE configuration:
- Fedora Core 2 distribution
- Vanilla Kernel 2.6.7
- MTD version provided with the above vanilla kernel

   Hi all,

I'm writing two MTD drivers to manage specific SRAM and FLASH devices.
All works well until I try to remove both modules. The problem is
systematic,
you have just to insert two mtd drivers (with insmod) and then remove them
with
rmmod.

Find bellow a sample and its makefile to help you to reproduce the problem.

To reproduce the problem run the following commands:
modprobe mtdram  (your test drivers)
modprobe mtdblock (it is necessary to reproduce the bug)
insmod mtd_sram.ko (my driver)
rmmod mtd_sram
rmmod mtdram

The last rmmod produces a page fault. It seems that the bug is located in
the
block device managment because if mtdblock isn't loaded everything works
well.

You'll find bellow a dmesg result after the page fault.

I have also tested the MTD version embedded in the Fedora Core 2 kernel
(2.6.10-1.12_FC2).
I guess the isn't a very old version of the MTD layer. The problem still
exist with that version.

Can you help me to solve that problem ?
Thanks a lot for your help.
Regards,

      Vincent Laporte


############  MY SAMPLE ################################
#include <linux/mtd/mtd.h>

static struct mtd_info sMyMtd;

//****************************************************************************
static int DeviceRead(struct mtd_info *psMtd, loff_t From, size_t Len,
                      size_t *pRetlen, u_char *pucBuf)
{
  printk("SRAM(%d) : DeviceRead.\n", __LINE__);

  return 0;
}

//****************************************************************************
static int DeviceWrite(struct mtd_info *psMtd, loff_t To, size_t Len,
                       size_t *pRetlen, const u_char *pucBuf)
{
  printk("SRAM(%d) : DeviceWrite.\n", __LINE__);

  return 0;
}

//****************************************************************************
static int __init init_mtdsram(void)
{
  int iRet = 0;

  printk("SRAM(%d) : Init begin.\n", __LINE__);

  memset(&sMyMtd, 0, sizeof(sMyMtd));

  sMyMtd.name    = "MTDSRAM#1";
  sMyMtd.type    = MTD_RAM;
  sMyMtd.flags   = MTD_CAP_RAM;
  sMyMtd.size    = 1024 * 1024;
  sMyMtd.read    = DeviceRead;
  sMyMtd.write   = DeviceWrite;

  iRet = add_mtd_device (&sMyMtd);

  printk("SRAM(%d) : iRet begin return %d.\n", __LINE__, iRet);

  return iRet;
}

//****************************************************************************
static void __exit cleanup_mtdsram(void)
{
  int iRet = 0;

  printk("SRAM(%d) : Release begin.\n", __LINE__);

  iRet = del_mtd_device(&sMyMtd);

  printk("SRAM(%d) : iRet release return %d.\n", __LINE__, iRet);
}

module_init(init_mtdsram);
module_exit(cleanup_mtdsram);

############ EOF  MY SAMPLE #############################

############   MY MAKEFILE ###############################

ifeq ($(KLINUX_TARGET),)
KLINUX_TARGET:=/lib/modules/`uname -r`/build
endif

# If KERNEL_RELEASE defined we are in the MAKE processus
# otherwise the make command has just been launched
ifneq ($(KERNELRELEASE),)

obj-m := mtd_sram.o
mtd_sram-objs := mtd_sram.module.o

EXTRA_CFLAGS += -Wall

else
default:
      $(MAKE) -C $(KLINUX_TARGET) SUBDIRS=`pwd` modules
#     $(MAKE) -C $(KLINUX_TARGET) SUBDIRS=`pwd` KBUILD_VERBOSE=1 modules
clean:
      rm -rf *.o *.ko *.mod.c
endif

############   EOF MY MAKEFILE ############################

############  DMESG after the crash  ############################
mtd_sram: module license 'unspecified' taints kernel.
SRAM(28) : Init begin.
SRAM(41) : iRet begin return 0.
SRAM(51) : Release begin.
SRAM(55) : iRet release return 0.
------------[ cut here ]------------
kernel BUG at include/linux/dcache.h:276!
invalid operand: 0000 [#1]
Modules linked in: mtdram mtdblock mtd_blkdevs mtdchar mtdcore
snd_mixer_oss
snd soundcore parport_pc lp parport autofs4 smbfs rfcomm l2cap bluetooth
sunrpc e100 mii floppy sg scsi_mod
microcode usblp dm_mod joydev mtouchusb uhci_hcd usbcore ipv6 ext3 jbd
CPU:    0
EIP:    0060:[<c01802c8>]    Tainted: P
EFLAGS: 00010246   (2.6.7)
EIP is at sysfs_remove_dir+0xe8/0x100
eax: 00000000   ebx: cefc507c   ecx: c0206e90   edx: 00000000
esi: c135dc00   edi: d03af618   ebp: c135fd58   esp: cfdabedc
ds: 007b   es: 007b   ss: 0068
Process rmmod (pid: 3521, threadinfo=cfdaa000 task=d07759f0)
Stack: cefc507c c135dc00 c135dcdc c01aa7c6 cefc507c c01aa7d8 cefc502c
c020237f
       cefc502c c0205cbf c135dc00 d89cc56c c0206a38 c135dc00 c017d6af
d3350a54
       d89cc574 d89c7792 d3350a54 d89cb768 d89cc56c d89c7810 d89cc540
d89c92f0
Call Trace:
 [<c01aa7c6>] kobject_del+0x16/0x20
 [<c01aa7d8>] kobject_unregister+0x8/0x10
 [<c020237f>] elv_unregister_queue+0xf/0x30
 [<c0205cbf>] blk_unregister_queue+0x2f/0x50
 [<c0206a38>] unlink_gendisk+0x8/0x20
 [<c017d6af>] del_gendisk+0x4f/0xc0
 [<d89c7792>] del_mtd_blktrans_dev+0x52/0x60 [mtd_blkdevs]
 [<d89cb768>] mtdblock_remove_dev+0x8/0x10 [mtdblock]
 [<d89c7810>] blktrans_notify_remove+0x70/0x80 [mtd_blkdevs]
 [<d89c1155>] del_mtd_device+0x85/0xf0 [mtdcore]
 [<c012ec7c>] __try_stop_module+0x1c/0x30
 [<c012c906>] try_stop_module+0x16/0x20
 [<d898b2c5>] cleanup_mtdram+0x15/0x35 [mtdram]
 [<c012cabe>] sys_delete_module+0x11e/0x170
 [<c014291a>] unmap_vma_list+0x1a/0x30
 [<c0142c69>] do_munmap+0x109/0x150
 [<c01168b0>] do_page_fault+0x0/0x4cc
 [<c0105cad>] sysenter_past_esp+0x52/0x71

Code: 0f 0b 14 01 46 a7 2c c0 e9 23 ff ff ff 5b 5e 5f c3 8d b4 26

############ EOF  DMESG after the crash  ############################





******************************************************************************
Ce message et les pieces jointes associees sont confidentiels et a l'attention
exclusive des destinataires. Si vous avez recu ce message par erreur, merci
d'avertir l'administrateur de la messagerie: postmaster@lotsys.com                                         

This email and files transmitted with it are confidential and intended solely     
for the use of the individual to whom they are addressed. If you have received    
this email in error, please notify the system manager: postmaster@lotsys.com                                                 
******************************************************************************
