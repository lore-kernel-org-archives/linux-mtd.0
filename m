Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bxhre-0007sD-4F
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 04:01:39 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Thu, 19 Aug 2004 10:06:06 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200408191006.06637.gruber.m@utanet.at>
Subject: JFFS2 with AM29LV256M
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi MTD users !

I am a new in using flash chips under linux. So i have some questions.
I have a problem with MTD and jffs2 on a ARM920T with AMD AM29LV256M Chips.
With redboot i can erase and flash the chips without problems.
I patched my 2.6.8 kernel with a MTD snapshot from yesterday. 

I have two 16bit AM29LV256M chips on a 32bit bus.Each chip has a erase size of 
0x10000 so i think i have to generate my jffs image with erasesize of 
0x20000?
My opinion is that I have to do following settings in the kernel:

# Memory Technology Devices (MTD)
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_CMDLINE_PARTS=y

# User Modules And Translation Layers
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

# RAM/ROM/Flash chip drivers
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_AMDSTD_RETRY=5
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y

# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x10000000
CONFIG_MTD_PHYSMAP_LEN=0x4000000
CONFIG_MTD_PHYSMAP_BANKWIDTH=4
and jffs2 is also set.

At boot I get following:
physmap flash device: 4000000 at 10000000
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
phys_mapped_flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
6 RedBoot partitions found on MTD device phys_mapped_flash
Creating 6 MTD partitions on "phys_mapped_flash":

until now is this correct, what does the Disabling erase-suspend-program due 
to code brokenness mean ?

then i make my jffs2 image on my host with:
mkfs.jffs2 -v -l -e0x20000 -d/tmp/testdir -o${VERZ}/rootfs.img

then i erase on flash partition with:
flash_eraseall /dev/mtd2
and copy the rootfs.img to the partition:
cp rootfs.img /dev/mtd2
mount it with:
mount -t jffs2 /dev/mtdblock2 /mnt

until now all worked, i think i have done the correct things... but:

when i now copy a file in the mounted jffs2-image dir i get alot of this 
messages:

MTD do_write_oneword(): WRITE 0x00286bc0(0x978d0902)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
Write of 1887 bytes at 0x00046b7c failed. returned -5, retlen 1884
And the file isnt there ..

Doese someone have a sollution for this ?

Thanks, regards Manfred
