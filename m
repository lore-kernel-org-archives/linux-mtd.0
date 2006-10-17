Received: from smtpa1.aruba.it ([62.149.128.206] helo=smtp2.aruba.it)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZmLm-0004Q9-Sb
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 06:39:19 -0400
Subject: JFFS2 on Lite5200
From: Andrea Galbusera <andrea.galbusera@teamware.it>
To: linuxppc-embedded@ozlabs.org, linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 17 Oct 2006 12:33:03 +0200
Message-Id: <1161081183.22948.58.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I'm currently using linux-2.6.16 from denx on a Lite5200 V2.0. I need to
access a JFFS2 filesystem on the onboard flash ( 16MB Am29L652D ).

I see the flash using physmap driver and cmdline partitions.
I experience a problem when creating files on JFFS2 with filename longer
than a few characters. They appear to be created correctly with the
content I want, but, after unmounting and remounting the filesystem they
result unreadable and ls complains with "no such file or
directory" (short-named files are ok).

I can deterministically reproduce the problem this way:

$ eraseall /dev/mtd1	(start with a fresh MTD partition)
$ mount -t jffs2 /dev/mtdblock1 /mnt/flash
$ date > /mnt/flash/short
$ date > /mnt/flash/timestamp
$ ls /mnt/flash/
short  timestamp
$ umount /dev/mtdblock1
$ mount -t jffs2 /dev/mtdblock1 /mnt/flash
$ ls /mnt/flash
ls: /mnt/flash/time: No such file or directory
short

...than I cannot access /mnt/flash/timestamp anymore,
while /mnt/flash/short is ok!

These are the kernel relevant settings:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CMDLINE_PARTS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_AMDSTD_RETRY=0
CONFIG_MTD_CFI_UTIL=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0xff000000
CONFIG_MTD_PHYSMAP_LEN=0x01000000
CONFIG_MTD_PHYSMAP_BANKWIDTH=1

#
# Miscellaneous filesystems
#
CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=0
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=2
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y


I enabled both MTD and JFFS2 maximum verbosity debug messages. If
relevant, I can post them for any of the commands in the sequence. Btw I
have the same problem with crafted filesystem images built with
mkfs.jffs2 (they fail at first mount).

Trying to exclude MTD issues I tested the same with JFFS and I don't
have any problem, but JFFS is not suitable for my needs :-(

By digging the net, I can't find any reference to this problem. Hope
anybody out there is using this setup (lite5200_defconfig as MTD
disabled) and can help. TIA.

Regards,
Andrea
