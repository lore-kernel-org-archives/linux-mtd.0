Received: from postfix3-2.free.fr ([213.228.0.169])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178pfH-0006ol-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 22:53:31 +0100
Received: from g9p8w1 (lyon-2-a7-62-147-22-81.dial.proxad.net [62.147.22.81])
	by postfix3-2.free.fr (Postfix) with SMTP id 3AF7417F44
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 23:53:28 +0200 (CEST)
Message-ID: <000d01c1fded$191704e0$5116933e@g9p8w1>
From: "Olivier ERIBON" <olivier.eribon@free.fr>
To: <linux-mtd@lists.infradead.org>
Subject: Nand flash driver problem
Date: Fri, 17 May 2002 23:52:09 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I tried to port MTD_CVS with linux 2.4.19pre1 to an Walnut board with a nand
flash memory Toshiba TC58V32 (my specific hardware driver test.c is
under-mentionned with a part of .config).

I have 2 problems in a first time.

Linux/PPC load: console=ttyS0,9600 console=tty0 root=/dev/nfs
nfsroot=172.16.26.45:/home/oeribon/targetfs nfsaddrs=11
Uncompressing Linux...done.
Now booting the kernel
<9>Calibrating delay loop... PCI: Probing PCI hardware
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at 0xef600300 (irq = 0) is a 16550A
ttyS01 at 0xef600400 (irq = 1) is a 16550A
loop: loaded (max 8 devices)
NAND device: Manufacture ID: 0x98, Chip ID: 0xe5 (Toshiba TC58V32DC)
Creating 1 MTD partitions on "Toshiba TC58V32DC":
0x00000000-0x00400000 : "TEST flash p1"
mtd: Giving out device 0 to TEST flash p1
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
Reset ethernet interfaces
<9>eth0: PPC405 EMAC: link up, 10 Mbps Half Duplex, auto-negotiation
complete<9>eth0: PPC405 EMAC: MAC 00:04:ac:e3:1d
<9>IP-Config: Complete:<9>      device=eth0, addr=172.16.27.111,
mask=255.255.252.0, gw=172.16.24.1<9>     host=serd.
Looking up port of RPC 100003/2 on 172.16.26.45
Looking up port of RPC 100005/1 on 172.16.26.45
INIT: version 2.78 bootingemory: 72k init
Activating swap...
Checking all file systems...
Parallelizing fsck version 1.19 (13-Jul-2000)
Setting kernel variables.
Mounting local filesystems...
not mounted anything
Hostname: serdmq7111.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Tue Apr 14 21:19:25 UTC 1970

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Checking password and group files... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd klogd.
Starting internet superserver: inetd.
Starting FTP server: wu-ftpd.
Starting periodic command scheduler: cron.

MontaVista Software's Hard Hat Linux 2.0

serdmq7111 login: root

[root@serdmq7111 /root]# cd /new_util/


#### FIRST PROBLEM ####

[root@serdmq7111 /new_util]# ./eraseall /dev/mtd0
Erased 4096 Kibyte @ 0 -- 100% complete.
[root@serdmq7111 /new_util]# od -x /dev/mtd0
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
20000000
[root@serdmq7111 /new_util]# date
Tue Apr 14 21:23:27 UTC 1970
[root@serdmq7111 /new_util]# date > /dev/mtd0
[root@serdmq7111 /new_util]# od -x /dev/mtd0
0000000 5475 6520 4170 7220 3134 2032 313a 3233
0000020 3a32 3920 5554 4320 3139 3730 0aff ffff
0000040 ffff ffff ffff ffff ffff ffff ffff ffff
*
20000000
[root@serdmq7111 /new_util]# date
Tue Apr 14 21:23:40 UTC 1970
[root@serdmq7111 /new_util]# date > /dev/mtd0

************* Here no error, I am surprised !!!!! *************
Because the flash has been first writing  by a date and tried to be
re-writed by another different date without error message

[root@serdmq7111 /new_util]# od -x /dev/mtd0
0000000 5475 6520 4170 7220 3134 2032 313a 3233
0000020 3a30 3020 5554 4320 3139 3730 0aff ffff
0000040 ffff ffff ffff ffff ffff ffff ffff ffff
*
20000000


#### SECOND PROBLEM ####

[root@serdmq7111 /new_util]# ./eraseall /dev/mtd0
Erased 4096 Kibyte @ 0 -- 100% complete.
[root@serdmq7111 /new_util]# od -x /dev/mtd0
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
20000000
[root@serdmq7111 /new_util]# mount -t jffs /dev/mtdblock0 /mnt/jffs
JFFS: Trying to mount device 1f:00.
JFFS: GC thread pid=141.
JFFS: Successfully mounted device 1f:00.
jffs_garbage_collect_thread(): Starting infinite loop.
thread_should_wake(): free=4194304, dirty=0, blocksize=8192.
[root@serdmq7111 /new_util]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root             31121854  19412401  11398235  64% /
/dev/mtdblock0            4064         0      4064   0% /mnt/jffs
[root@serdmq7111 /new_util]# ll /mnt/jffs
total 0
[root@serdmq7111 /new_util]# cp /kernel-doc-nano-HOWTO.txt /mnt/jffs
thread_should_wake(): free=4194216, dirty=0, blocksize=8192.
jffs_write_node(): setting version of kernel-doc-nano-HOWTO.txt to 2
thread_should_wake(): free=4190092, dirty=88, blocksize=8192.
jffs_write_node(): setting version of kernel-doc-nano-HOWTO.txt to 3
thread_should_wake(): free=4189944, dirty=88, blocksize=8192.
jffs_write_node(): setting version of kernel-doc-nano-HOWTO.txt to 4
thread_should_wake(): free=4189696, dirty=88, blocksize=8192.
[root@serdmq7111 /new_util]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root             31121854  19412432  11398204  64% /
/dev/mtdblock0            4064         8      4056   1% /mnt/jffs
[root@serdmq7111 /new_util]# ll /mnt/jffs
total 5
-r--r--r--    1 root     root         4255 Apr 14 21:30
kernel-doc-nano-HOWTO.txt
c-nano-HOWTO.txt /new_util]# diff /mnt/jffs/kernel-doc-nano-HOWTO.txt
/kernel-doc
1c1,11
<                                                          t
---
> kernel-doc nano-HOWTO
> =====================
>
> Many places in the source tree have extractable documentation in the
> form of block comments above functions.  The components of this system
> are:
>
> - scripts/kernel-doc
>
>   This is a perl script that hunts for the block comments and can mark
>   them up directly into DocBook, man, text, and HTML. (No, not
132c142,143
< !I<filename> is replaced by the                               PORT_SYMBOL.
---
> !I<filename> is replaced by the documentation for functions that are
> _not_ exported using EXPORT_SYMBOL.

************* Why these differences betxeen initial and copy file ? Could it
be due to an electrical problem with my test development board (Walnut with
Nand flash added (very experimental installation)) ?  *************

With Regards,
Thanks in advance

Olivier Eribon

###################### test.c ######################
/*
 *  drivers/mtd/nand/test.c
 *
 * $Id: test.c,v 0.1 2002 april 22
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  Overview:
 *   This is a device driver for the NAND flash device found on the
 *   walnut board which utilizes the Toshiba TC58V32AFT part. This is
 *   a 32Mibit (4MiB x 8 bits) NAND flash device.
 */

#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>
#include <linux/init.h>

/*
 * MTD structure for walnut board
 */
static struct mtd_info *test_mtd = NULL;

/*
 * Values specific to the WALNUT board (used with GP405 processor)
 */

#define TEST_FIO_BASE 0xF1000000 /* Address where flash is mapped */

#define GPIO0_OR        0xEF600700 /* GPIO Output */
#define GPIO0_TCR       0xEF600704 /* GPIO Three-State Control */
#define GPIO0_ODR       0xEF600718 /* GPIO Open Drain */
#define GPIO0_IR        0xEF60071C /* GPIO Input */

#define GPIO_CLE        0x00000008 /* GPIO_04 */
#define GPIO_ALE        0x00000020 /* GPIO_02 */
#define GPIO_NCE        0x00000002 /* GPIO_06 */
#define GPIO_RNB        0x00008000 /* GPIO_08 */

/*
 * Module stuff
 */

#ifdef MODULE
MODULE_PARM(test_fio_base, "i");
MODULE_PARM(test_gpio0_or, "i");

__setup("test_fio_base=",test_fio_base);
__setup("test_gpio0_or=",test_gpio0_or);
#endif

/*
 * Define partitions for flash device
 */
const static struct mtd_partition partition_info[] = {
 { name: "TEST flash p1",
   offset: 0,
   size: 4*1024*1024 }
};

#define NUM_PARTITIONS 1

void * test_fio_base;
void * remap_gpio0_or;
void * remap_gpio0_tcr;
void * remap_gpio0_odr;
void * remap_gpio0_ir;

/*
 * hardware specific access to control-lines
 */
void test_hwcontrol(int cmd){
    unsigned long reg;

    asm (" sync");
    reg = readl (remap_gpio0_or);
    switch(cmd){
 case NAND_CTL_SETCLE:
   // CLE  1
          reg |= GPIO_CLE;
   break;
 case NAND_CTL_CLRCLE:
   // CLE  0
          reg &= ~GPIO_CLE;
   break;
 case NAND_CTL_SETALE:
          // ALE   1
          reg |= GPIO_ALE;
   break;
 case NAND_CTL_CLRALE:
          // ALE  0
          reg &= ~GPIO_ALE;
   break;
 case NAND_CTL_SETNCE:
   // CE   1
   reg &= ~GPIO_NCE;
   break;
 case NAND_CTL_CLRNCE:
          // CE  0
   reg |= GPIO_NCE;
   break;
    }
    writel (reg, remap_gpio0_or);
}

int board_pre_init (void)
{
    unsigned long reg;

    reg = readl (remap_gpio0_odr);
    reg &= ~0x0000002A;
    writel (reg, remap_gpio0_odr);

    reg = readl (remap_gpio0_tcr);
    reg |= 0x0000002A;
    writel (reg, remap_gpio0_tcr);

    reg = readl (remap_gpio0_or);
    reg &= (~0x00000028);
    reg |= 0x000000002;

    writel (reg, remap_gpio0_or);

    printk("<1>{board_pre_init} end\n");
    return 0;
}

/*
 * read device ready pin
 */
int test_device_ready(void)
{
    unsigned long reg;

    reg = readl (remap_gpio0_ir);
    if( (reg & GPIO_RNB) == (GPIO_RNB) ) {
     return 1;
    } else {
     return 0;
    }
}

/*
 * Main initialization routine
 */
int __init test_init (void)
{
 struct nand_chip *this;

 test_fio_base = ioremap(TEST_FIO_BASE, 0x00000010);
 if(!test_fio_base) {
  printk(KERN_ERR "TEST driver : ioremap (test_fio_base) failed \n");
  return (1);
 }

 remap_gpio0_or = ioremap(GPIO0_OR, 0x00000010);
 if(!remap_gpio0_or) {
  printk(KERN_ERR "TEST driver : ioremap (gpio0_or) failed \n");
  return (1);
 }

 remap_gpio0_tcr = ioremap(GPIO0_TCR, 0x00000010);
 if(!remap_gpio0_tcr) {
  printk(KERN_ERR "TEST driver : ioremap (gpio0_tcr) failed \n");
  return (1);
 }

 remap_gpio0_odr = ioremap(GPIO0_ODR, 0x00000010);
 if(!remap_gpio0_odr) {
  printk(KERN_ERR "TEST driver : ioremap (gpio0_odr) failed \n");
  return (1);
 }

 remap_gpio0_ir = ioremap(GPIO0_IR, 0x00000010);
 if(!remap_gpio0_ir) {
  printk(KERN_ERR "TEST driver : ioremap (gpio0_ir) failed \n");
  return (1);
 }

 /* Allocate memory for MTD device structure and private data */
 test_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct nand_chip),
    GFP_KERNEL);
 if (!test_mtd) {
  printk ("Unable to allocate TEST NAND MTD device structure.\n");
  return -ENOMEM;
 }

 /* Get pointer to private data */
 this = (struct nand_chip *) (&test_mtd[1]);

 /* Initialize structures */
 memset((char *) test_mtd, 0, sizeof(struct mtd_info));
 memset((char *) this, 0, sizeof(struct nand_chip));

 /* Link the private data with the MTD structure */
 test_mtd->priv = (void*)this;

 /* Set address of NAND IO lines */
 this->IO_ADDR_R = (unsigned long)test_fio_base;
 this->IO_ADDR_W = (unsigned long)test_fio_base;
 /* Set address of hardware control function */
 this->hwcontrol = test_hwcontrol;
 this->dev_ready = test_device_ready;
 /* 20 us command delay time */
 this->chip_delay = 30;

 /*
  * Set GPIO Port E control register so that the pins are configured
  * to be outputs for controlling the NAND flash.
  */
 board_pre_init(); /* between  Link the ... and Set address of ... */

 /* Scan to find existence of the device */
  if (nand_scan (test_mtd)) {
  kfree (test_mtd);
  printk ("Unable Scan to find existence of the device\n");
  return -ENXIO;
 }

 /* Allocate memory for internal data buffer */
 this->data_buf = kmalloc (sizeof(u_char) * (test_mtd->oobblock +
test_mtd->oobsize), GFP_KERNEL);
 if (!this->data_buf) {
  printk ("Unable to allocate NAND data buffer for TEST.\n");
  kfree (test_mtd);
  return -ENOMEM;
 }

 /* Allocate memory for internal data buffer */
 this->data_cache = kmalloc (sizeof(u_char) * (test_mtd->oobblock +
test_mtd->oobsize), GFP_KERNEL);
 if (!this->data_cache) {
  printk ("Unable to allocate NAND data cache for TEST.\n");
  kfree (this->data_buf);
  kfree (test_mtd);
  return -ENOMEM;
 }
 this->cache_page = -1;

 /* Register the partitions */
 add_mtd_partitions(test_mtd, partition_info, (int)NUM_PARTITIONS);

 /* Return happy */
 return 0;
}
module_init(test_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit test_cleanup (void)
{
 struct nand_chip *this = (struct nand_chip *) &test_mtd[1];

 /* Unregister the device */
 del_mtd_device (test_mtd);

 /* Free internal data buffer */
 kfree (this->data_buf);
 kfree (this->data_cache);
 /* Free the MTD device structure */
 kfree (test_mtd);
}
module_exit(test_cleanup);
#endif
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Steven J. Hill <sjhill@cotw.com");
MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on SPIA
board");

###################### .config ######################

#
# Platform support
#
CONFIG_PPC=y
CONFIG_PPC32=y
# CONFIG_6xx is not set
CONFIG_4xx=y
# CONFIG_POWER3 is not set
# CONFIG_8xx is not set
# CONFIG_PPC_ISERIES is not set
# CONFIG_PPC_STD_MMU is not set
# CONFIG_ASH is not set
# CONFIG_CEDER is not set
# CONFIG_CPCI405 is not set
# CONFIG_EP405 is not set
# CONFIG_PIP405 is not set
# CONFIG_MIP405 is not set
# CONFIG_OAK is not set
# CONFIG_REDWOOD_4 is not set
# CONFIG_REDWOOD_5 is not set
# CONFIG_TIVO is not set
CONFIG_WALNUT=y
# CONFIG_ALL_PPC is not set
# CONFIG_SMP is not set
# CONFIG_MATH_EMULATION is not set
CONFIG_405GP=y
CONFIG_BIOS_FIXUP=y
CONFIG_TREEBOOT=y
CONFIG_IBM405_ERR77=y
CONFIG_IBM_OCP=y
# CONFIG_405_DMA is not set
# CONFIG_PM is not set
# CONFIG_OCP_PROC is not set
CONFIG_UART0_TTYS0=y
# CONFIG_UART0_TTYS1 is not set
CONFIG_IBM405_ERR51=y
CONFIG_NOT_COHERENT_CACHE=y

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_TEST=y                      <=   Key for my test driver

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
# CONFIG_ADFS_FS is not set
# CONFIG_ADFS_FS_RW is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_JBD is not set
# CONFIG_JBD_DEBUG is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=0
# CONFIG_JFFS_PROC_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_CRAMFS is not set
CONFIG_TMPFS=y
# CONFIG_RAMFS is not set
# CONFIG_ISO9660_FS is not set
# CONFIG_JOLIET is not set
# CONFIG_ZISOFS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS_RW is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVFS_MOUNT is not set
# CONFIG_DEVFS_DEBUG is not set
# CONFIG_DEVPTS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX4FS_RW is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_UDF_FS is not set
# CONFIG_UDF_RW is not set
# CONFIG_UFS_FS is not set
# CONFIG_UFS_FS_WRITE is
