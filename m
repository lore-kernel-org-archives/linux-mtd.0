Received: from rproxy.gmail.com ([64.233.170.192])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ce2Fp-0004ek-Jg
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 21:17:35 -0500
Received: by rproxy.gmail.com with SMTP id i8so925900rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Dec 2004 18:17:31 -0800 (PST)
Message-ID: <a46577d50412131817139c1966@mail.gmail.com>
Date: Tue, 14 Dec 2004 10:17:31 +0800
From: Wang JinFeng <wangjinfeng@gmail.com>
To: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1862_32313845.1102990651620"
Cc: 
Subject: Failed to implent MTD on uclinux(kernel version 2.4.20-uc0)
Reply-To: Wang JinFeng <wangjinfeng@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_1862_32313845.1102990651620
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

****When I boot a kenel compileded with MTD support, error messages
below are printed:
s3c2410 flash device: 200000 at 1000000
writew called, but not implemented<2>kernel BUG at traps.c:505!
writew called, but not implemented<2>kernel BUG at traps.c:505!
readw called, but not implemented<2>kernel BUG at traps.c:505!
CFI: Found no s3c2410 flash device device at location zero
init_mtdchar: allocated major number 90.
init_mtdchar: allocated major number 90.

****Don`t know why this happen,somebody may give me some advice,thanks
****kernel version 2.4.20-uc0
****SoC:s3c4510b
****Flash chip:am29lv160DB

****CONFIG informations are:
[redhat@arim-linux uClinux-dist]$ grep -v  '^#' linux-2.4.x/.config | uniq
CONFIG_ARM=y
CONFIG_UID16=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_UCLINUX=y
MAGIC_ROM_PTR=y

CONFIG_MODULES=y
CONFIG_KMOD=y

CONFIG_ARCH_SAMSUNG=y
CONFIG_ROMKERNEL=y
CONFIG_BOARD_SNDS100=y
CONFIG_NO_PGT_CACHE=y
CONFIG_CPU_32=y
CONFIG_CPU_S3C4510=y
CONFIG_CPU_ARM710=y
CONFIG_CPU_WITH_CACHE=y
CONFIG_SERIAL_SAMSUNG=y
DRAM_BASE=0x00000000
DRAM_SIZE=0x01000000
FLASH_MEM_BASE=0x01000000
FLASH_SIZE=0x00200000

CONFIG_NET=y
CONFIG_KCORE_ELF=y
CONFIG_BINFMT_FLAT=y
CONFIG_KERNEL_ELF=y

CONFIG_PACKET=y
CONFIG_INET=y

CONFIG_NETDEVICES=y

CONFIG_NET_ETHERNET=y
CONFIG_ETH_S3C4510=y

CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_CFI_B2=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_AMDSTD=y

CONFIG_MTD_S3C4510B=y

CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=1024
CONFIG_BLK_DEV_BLKMEM=y
CONFIG_NOFLASH=y

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=2
CONFIG_RAMFS=y
CONFIG_JFS_FS=y
CONFIG_PROC_FS=y
CONFIG_ROMFS_FS=y
CONFIG_EXT2_FS=y

CONFIG_NLS=y

CONFIG_NLS_DEFAULT="iso8859-1"

CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_NONSTANDARD=y

CONFIG_FRAME_POINTER=y
CONFIG_DEBUG_ERRORS=y
CONFIG_DEBUG_INFO=y

CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
[redhat@arim-linux uClinux-dist]$

****the map file i wrote is also attached.



-- 
wanG:)

------=_Part_1862_32313845.1102990651620
Content-Type: text/plain; name=administrator; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="administrator"

/*
 * Normal mappings of chips on Samsung s3c2410 in physical memory
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>
#include <linux/config.h>

#define WINDOW_ADDR 0x01000000 //Base addr
#define WINDOW_SIZE 0x00200000   //Flash length 2M
#define BUSWIDTH 2

static struct mtd_info *mymtd;

__u8 s3c2410_read8(struct map_info *map, unsigned long ofs)
{
	return readb(map->map_priv_1 + ofs);
}

__u16 s3c2410_read16(struct map_info *map, unsigned long ofs)
{
	return readw(map->map_priv_1 + ofs);
}

__u32 s3c2410_read32(struct map_info *map, unsigned long ofs)
{
	return readl(map->map_priv_1 + ofs);
}

void s3c2410_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
	memcpy(to, (void *)(map->map_priv_1 + from), len);
}

void s3c2410_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	writeb(d, map->map_priv_1 + adr);
}

void s3c2410_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	writew(d, map->map_priv_1 + adr);
}

void s3c2410_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	writel(d, map->map_priv_1 + adr);
}

void s3c2410_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy((void *)(map->map_priv_1 + to), from, len);
}

struct map_info s3c2410_map = {
	name: "s3c2410 flash device",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH,
	read8: s3c2410_read8,
	read16: s3c2410_read16,
	read32: s3c2410_read32,
	copy_from: s3c2410_copy_from,
	write8: s3c2410_write8,
	write16: s3c2410_write16,
	write32: s3c2410_write32,
	copy_to: s3c2410_copy_to,
	
	map_priv_1:	WINDOW_ADDR,
	map_priv_2:	-1,	
};
//division
static struct mtd_partition s3c2410_partitions[] = {
    {
            name: "reserved for kernel",
            size: 0x0100000,
            offset: 0x0,
			mask_flags: MTD_WRITEABLE,
    },
	{
		name: "jffs2(8M)",
		size: 0x0100000,
		offset: 0x0100000,
	}
};

int __init init_s3c2410(void)
{
    printk(KERN_NOTICE "s3c2410 flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
	s3c2410_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
//	printk("0\n");
	if (!s3c2410_map.map_priv_1) {
		printk("Failed to ioremap/n");
		return -EIO;
	}
//	printk("1\n");
//	mymtd = do_map_probe("jedec_probe", &s3c2410_map);
//	if (!mymtd)
	mymtd = do_map_probe("cfi_probe", &s3c2410_map);
//	printk("2\n");
//	if (!mymtd)
//		mymtd = do_map_probe("amd_flash", &s3c2410_map);
//	printk("3\n");
	if (mymtd) {
		mymtd->module = THIS_MODULE;
		mymtd->erasesize = 0x10000; //erase volume INTEL E28F128J3A-150 64kb
		return add_mtd_partitions(mymtd, s3c2410_partitions, sizeof(s3c2410_partitions) / sizeof(struct mtd_partition));
	}
//	printk("4\n");
	iounmap((void *)s3c2410_map.map_priv_1);
	return -ENXIO;
}

static void __exit cleanup_s3c2410(void)
{
	if (mymtd) {
		del_mtd_partitions(mymtd);
		map_destroy(mymtd);
	}
	if (s3c2410_map.map_priv_1) {
		iounmap((void *)s3c2410_map.map_priv_1);
		s3c2410_map.map_priv_1 = 0;
	}
}

module_init(init_s3c2410);
module_exit(cleanup_s3c2410);


------=_Part_1862_32313845.1102990651620--
