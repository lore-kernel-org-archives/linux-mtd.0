Received: from rn-out-0910.google.com ([64.233.170.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGYVQ-0005BI-Dg
	for linux-mtd@lists.infradead.org; Wed, 09 Jul 2008 12:10:44 +0000
Received: by rn-out-0910.google.com with SMTP id m7so814631rnd.3
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Jul 2008 05:10:43 -0700 (PDT)
Message-ID: <7f0bd2d90807090504ib5dadc5lb44ce55dc83c3a91@mail.gmail.com>
Date: Wed, 9 Jul 2008 09:04:06 -0300
From: "rtkk 2008" <rtkk2008@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Problem when booting partitions on a powerpc platform
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have got a 32M bytes flash and want to make five partitions on it
according to my flash map which is, from my mpc83xx_flash.c source:

#ifdef CONFIG_MPC832x_RDB
#define WINDOW_ADDR 0xFE000000
#define WINDOW_SIZE 0x2000000
#define PARTITION_0 0x0080000 /* 0xFE0size of U-boot partition */
#define PARTITION_1 0x0080000 /* size of device tree partition */
#define PARTITION_2 0x0200000 /* size of kernel partition */
#define PARTITION_3 0x0100000 /* size of JFFS2 HOME partition */
#define PARTITION_4 0x0100000 /* size of JFFS2 ETC partition */
#define PARTITION_5 0x0B00000 /* size of JFFS2 TESTE partition */
#define PARTITION_6 0X1000000 /* size of EXT2 partition */

I compiled my kernel and filesystem with this configuration and burnt
them into my powerpc platform.
When booting the first time, there were some mount messages appearing
in the boot log below:

It seems that the kernel is mounting correctly the partitions, as
showed in the log but, when I verify, on the linux prompt, using the
mount command, it just shows that only the Kernel, JFFS2_HOME and
JFFS2_ETC are mounted. The EXT2 partition is also ok since if not, I
guess the linux would not start correct?

The prompt mount command:

~ # mount
/dev/root on / type ext2 (rw)
proc on /proc type proc (rw)
rwfs on /mnt/rwfs type tmpfs (rw)
shm on /dev/shm type tmpfs (rw)
devpts on /dev/pts type devpts (rw)
sysfs on /sys type sysfs (rw)
/dev/mtdblock3 on /home type jffs2 (rw)
/dev/mtdblock4 on /etc type jffs2 (rw)



Have anyone got this problem? How could I make the JFFS2_TESTE be
mounted? Does anyone please help me to solve that question?

Thanks and best regards


==================== boot log ================================

MPC832X_RDB flash device: 2000000 at fe000000 Partition number 7
MPC832X_RDB Flash Map Info: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Creating 7 MTD partitions on "MPC832X_RDB Flash Map Info":
0x00000000-0x00080000 : "U-Boot"
mtd: Giving out device 0 to U-Boot
0x00080000-0x00100000 : "Device tree (dtb)"
mtd: Giving out device 1 to Device tree (dtb)
0x00100000-0x00300000 : "Kernel"
mtd: Giving out device 2 to Kernel
0x00300000-0x00400000 : "JFFS2_HOME"
mtd: Giving out device 3 to JFFS2_HOME
0x00400000-0x00500000 : "JFFS2_ETC"
mtd: Giving out device 4 to JFFS2_ETC
0x00500000-0x01000000 : "TESTE"
mtd: Giving out device 5 to TESTE
0x01000000-0x02000000 : "RAMDISK"
mtd: Giving out device 6 to RAMDISK
MPC832X_RDB flash device initialized
e01004c0.spi: MPC83xx SPI Controller driver at 0xc505c4c0 (irq = 21)
usbmon: debugfs is not available
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
i2c /dev entries driver
nf_conntrack version 0.5.0 (512 buckets, 4096 max)
ip_tables: (C) 2000-2006 Netfilter Core Team
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
RAMDISK: Compressed image found at block 0
Time: timebase clocksource has been installed.
VFS: Mounted root (ext2 filesystem).
Freeing unused kernel memory: 156k init
Setting the hostname to freescale
Mounting filesystems
Unknown but compatible feature node (0x2005) found at offset 0x00000000
Unknown but compatible feature node (0x2005) found at offset 0x00000000
do_read_inode_internal: consider node ver 2, phys offset 0x000a24(0),
range 4096-8192.
Unknown but compatible feature node (0x2005) found at offset 0x00020000
