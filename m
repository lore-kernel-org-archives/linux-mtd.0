Received: from chello080110132030.102.11.vie.surfer.at
	([80.110.132.30] helo=mail.hurricane.at ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AyASi-0007CQ-0y
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2004 14:01:32 +0000
Date: Tue, 2 Mar 2004 14:58:26 +0100 (CET)
From: Matthias Gorjup <mgorjup@norik.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.10.10403021452090.17724-100000@mail.hurricane.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Speed of writing to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we are developing an embedded device, based on MPC860/Linux 2.4.20
platform.
We have 8 MB of flash and 16 MB of RAM. We have implemented a JFFS2 flash
filesystem with following partitions: 128 kB bootloader, 1 MB kernel A, 1
MB kernel B, 5.8 MB root FS. In root FS partition we have two complete
root filesystems, in two directories, A and B. One (for example A) is
mounted douring booting, the other directory (B) can be overwritten during
runtime and the device can then be rebooted  with this new (B) FS. This
makes downloading the new FS (updating the software) during runtime
possible.

Our problem is following:
- we have a requirement to download the zipped FS (B) that is 3.5 MB large
to the embedded device via 64kb/s ISDN line, extract the FS and copy it to
the second (B) directory. Then reboot the system. This must be done in 10
minutes.
Our procedure of extracting the FS takes too long... 30 minutes. If we
kill all the processes, then extracting time can be reduced to less than
10 minutes.

What is the cause of this behavioure? How could we optimize the procedure
of downloading the new file system to the device?

Please note also that as we have only 16 MB of RAM, we do not have enough
space to implement ramdisk which could reduce the time of extracting the
FS into flash.

Here are also the settings for MTD:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
CONFIG_MTD_CFI_B2=y
# CONFIG_MTD_CFI_B4 is not set
CONFIG_MTD_CFI_I1=y
# CONFIG_MTD_CFI_I2 is not set
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set
#
# Mapping drivers for chip access
#
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_MBX860 is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
CONFIG_MTD_KEYMILE_AG=y
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set


And here are settings for JFFS2
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_CRAMFS is not set
# CONFIG_TMPFS is not set
CONFIG_RAMFS=y

Best Regards

Matthias Gorjup
www.norik.com
