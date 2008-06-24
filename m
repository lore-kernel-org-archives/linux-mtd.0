Received: from bay0-omc3-s40.bay0.hotmail.com ([65.54.246.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KAwHx-0005pz-E1
	for linux-mtd@lists.infradead.org; Tue, 24 Jun 2008 00:21:37 +0000
Message-ID: <BAY111-DS45E28300966699E920AB691A10@phx.gbl>
From: <xiangguo_li@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: problem in probing flash for MTD
Date: Tue, 24 Jun 2008 08:21:29 +0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"; reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello,

the system is similar to HPC-II from Freescale, but a SMP system with two 
MPC7448 and Tsi109. the development platform is ELDK(v4.1, Linux version 
2.6.23.1), and the host system is Fedora 7.

the problem is: the probing result of flash is not correct: the (big) flash 
system is made up of two 16-bit (28F128, x8/x16, in x16 mode), while in 
Linux codes, member '.bankwidth' in 'struct map_info' could not set to 4 
(32-bit) and 2 (16-bit) -- if set so, the result is "map probe failed", but 
could only be set to '1'.

(1) probing in U-Boot is correct and reading\ writting\ erasing are normal. 
the 'fli' command in U-Boot results in the following:
---
Bank # 2: CFI conformant FLASH (32 x 16)  Size: 32 MB in 128 Sectors
  Intel Extended command set, Manufacturer ID: 0x89, Device ID: 0x18
  Erase timeout: 4096 ms, write timeout: 1 ms
  Buffer write timeout: 2 ms, buffer size: 32 bytes

  Sector Start Addresses:
  FC000000        FC040000        ......
DF80000        FDFC0000
---
according to:
printf ("CFI conformant FLASH (%d x %d)",
(info->portwidth << 3), (info->chipwidth << 3));
printf (" Size: %ld MB in %d Sectors\n",
info->size >> 20, info->sector_count);

it's clear that info->portwidth is 32, and info->chipwidth is 16.
the result is correct.

(2) the probing result in Linux initialization is in the following 
(.bankwidth=1):
---
SMP7448 Small Flash: Found 1 x8 devices at 0x0 in 8-bit bank

number of JEDEC chips: 1

cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

Creating 2 MTD partitions on "SMP7448 Small Flash":

0x00000000-0x00040000 : "u-boot"

mtd: Giving out device 1 to u-boot

0x00040000-0x00080000 : "global"

mtd: Giving out device 2 to global
---
smp7448: big flash mapping: 2000000 @ fc000000

SMP7448 Big Flash: Found 1 x32 devices at 0x0 in 8-bit bank

Intel/Sharp Extended Query Table at 0x0031

Using buffer write method

cfi_cmdset_0001: Erase suspend on write enabled

Creating 4 MTD partitions on "SMP7448 Big Flash":

0x00000000-0x00200000 : "kernel"

mtd: Giving out device 3 to kernel

0x00200000-0x00240000 : "dtb"

mtd: Giving out device 4 to dtb

0x00240000-0x00640000 : "initrd"

mtd: Giving out device 5 to initrd

0x00640000-0x02000000 : "jffs2"

mtd: partition "jffs2" extends beyond the end of device "SMP7448 Big 
Flash" -- size truncated to 0x9c0000

mtd: Giving out device 6 to jffs2
---
the flash system could be probed, but the result is not correct.

according  cofiguration options are like these:
---

CONFIG_MTD=y

CONFIG_MTD_DEBUG=y

CONFIG_MTD_DEBUG_VERBOSE=3

CONFIG_MTD_CONCAT=y

CONFIG_MTD_PARTITIONS=y

CONFIG_MTD_CHAR=y

CONFIG_MTD_BLKDEVS=y

CONFIG_MTD_BLOCK=y

CONFIG_MTD_CFI=y

CONFIG_MTD_JEDECPROBE=y

CONFIG_MTD_GEN_PROBE=y

CONFIG_MTD_MAP_BANK_WIDTH_1=y

CONFIG_MTD_MAP_BANK_WIDTH_2=y

CONFIG_MTD_MAP_BANK_WIDTH_4=y

CONFIG_MTD_CFI_I1=y

CONFIG_MTD_CFI_I2=y

CONFIG_MTD_CFI_INTELEXT=y

CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_ROM=y

CONFIG_MTD_SMP7448=y
---

(3) because HPC-II platform is similar to my board, I compiled the kernel of 
mpc7448_hpc2 with my map_info file added, and the result of flash probing 
was the same as my own, that is, .bankwidth could not be set to 2 and 4, 
when set to 1, the result was the same above.

(4) I printed the register values of Tsi109's HLP interface (the one flash 
attached), the value unchanged.

==>
the result in U-Boot is correct, it seems that hardware wiring and register 
configuration are correct.

it is quite strange that the results in both HPC-II and my own are the same.

I have been puzzled with this for two weeks, please give me any advice and 
information of this problem. what is the possible reason and what may i do?

should i supply more information?

thank you ver much!


----------------------------
/*
 *
 * drivers/mtd/maps/smp7448.c
 *
 * FLASH map for the SMP7448 boards.
 *
 * 2008 IACAS This file is licensed under
 * the terms of the GNU General Public License version 2. This program
 * is licensed "as is" without any warranty of any kind, whether express
 * or implied.
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/init.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>

#include <asm/io.h>

#define SMALL_ADDR	0xfff00000
#define SMALL_SIZE	0x00080000

#define BIG_ADDR 	0xfc000000
#define BIG_SIZE 	0x02000000


static struct mtd_partition smp7448_small_partitions[] = {
	{
		.name = "u-boot",
		.offset = 0x00000000,
		.size = 0x00040000,
		.mask_flags = MTD_WRITEABLE     /* force read-only */
	},
	{
		.name = "global",
		.offset = 0x00040000,
		.size = 0x00040000
	}
};

struct map_info smp7448_small_map = {
	.name = "SMP7448 Small Flash",
	.size = SMALL_SIZE,
	.bankwidth = 1,
	.phys = SMALL_ADDR,
};

static struct mtd_partition smp7448_big_partitions[] = {
	{
		.name = "kernel",		/* Kernel */
		.offset = 0,
		.size = 0x00200000,
		.mask_flags = MTD_WRITEABLE	/* force read-only */
	},
        {
                .name = "dtb",			/* flattened device tree */
                .offset = 0x00200000,
                .size = 0x00040000,
                .mask_flags = MTD_WRITEABLE    /* force read-only */
        },
	{
		.name = "initrd",		/* ramdisk image */
		.offset = 0x00240000,
		.size = 0x00400000,
		.mask_flags = MTD_WRITEABLE    /* force read-only */
	},
	{
		.name = "jffs2",		/* jffs2 fs */
		.offset = 0x00640000,
		.size = 0x019c0000
	}
};


struct map_info smp7448_big_map = {
	.name = "SMP7448 Big Flash",
	.size = BIG_SIZE,
	.bankwidth = 4,
	.phys = BIG_ADDR,
};


static struct mtd_info *smp7448_mtd;

int __init init_smp7448_flash(void)
{

	printk(KERN_NOTICE "smp7448: small flash mapping: %x @ %x\n",
	       SMALL_SIZE, SMALL_ADDR);
	smp7448_small_map.virt = ioremap(SMALL_ADDR, SMALL_SIZE);
	if (!smp7448_small_map.virt) {
		printk("init_smp7448_flash: failed to ioremap for small flash\n");
		return -EIO;
	}
	simple_map_init(&smp7448_small_map);
	smp7448_mtd = do_map_probe("jedec_probe", &smp7448_small_map);
	if (smp7448_mtd) {
		smp7448_mtd->owner = THIS_MODULE;
		add_mtd_partitions(smp7448_mtd,
				   smp7448_small_partitions,
				   ARRAY_SIZE(smp7448_small_partitions));
	} else {
		printk("map probe failed (small flash)\n");
		return -ENXIO;
	}

	printk(KERN_NOTICE "smp7448: big flash mapping: %x @ %x\n",
	       BIG_SIZE, BIG_ADDR);
	smp7448_big_map.virt = ioremap(BIG_ADDR, BIG_SIZE);
	if (!smp7448_big_map.virt) {
		printk("init_smp7448_flash: failed to ioremap for big flash\n");
		return -EIO;
	}
	simple_map_init(&smp7448_big_map);
	smp7448_mtd = do_map_probe("cfi_probe", &smp7448_big_map);
	if (smp7448_mtd) {
		smp7448_mtd->owner = THIS_MODULE;
		add_mtd_partitions(smp7448_mtd,
				   smp7448_big_partitions,
				   ARRAY_SIZE(smp7448_big_partitions));
	} else {
		printk("map probe failed (big flash)\n");
		return -ENXIO;
	}

	return 0;
}

static void __exit cleanup_smp7448_flash(void)
{
	if (smp7448_mtd) {
		del_mtd_partitions(smp7448_mtd);
		/* moved iounmap after map_destroy - armin */
		map_destroy(smp7448_mtd);
	}

	if (smp7448_small_map.virt)
		iounmap((void *)smp7448_small_map.virt);
	if (smp7448_big_map.virt)
		iounmap((void *)smp7448_big_map.virt);
}

module_init(init_smp7448_flash);
module_exit(cleanup_smp7448_flash);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("MTD map driver for the SMP7448 board");

-lxg 
