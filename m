Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GCEdp-0007pw-Dp
	for linux-mtd@lists.infradead.org; Sun, 13 Aug 2006 08:00:52 -0400
Date: Sun, 13 Aug 2006 11:24:35 +0100 (BST)
From: John <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: OneNAND - Cannot mount jffs2 partition
Message-ID: <Pine.LNX.4.33.0608131059220.32638-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to use a OneNAND device fitted to a MIPS board.
I am the first person to use this device on this board.

And I am fairly new to the MTD world. My problems may be generic to MTD
rather than being OneNAND specific.

My Kernel is based on Linux 2.6.12 patched with the OneNAND code from
Linux 2.6.16.

I am running little endian.
My mtd-utils are from October 2005.


Questions:
  Is this a suitable pair of commands?
   $ flash_eraseall -j /dev/mtd5
   $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand

  Would they work on an ordinary NAND device?

  Should I be using the NFTL code is some way?

  What is the likely underlying cause of the error message
      "Cowardly refusing to erase blocks on filesystem with
       no valid JFFS2 nodes"

I'd be very grateful for any guidance,

John
(John Smith)


Here is some log stuff from the Kernel showing what happens:

(The board has both a NOR flash device, and a oneNAND flash device)
At boot time the kernel reports:

  Flash device: 1000000 at 1f000000
  Mapped flash: Found 1 x16 devices at 0x0 in 16-bit bank
   Amd/Fujitsu Extended Query Table at 0x0040
  Mapped flash: CFI does not contain boot bank location. Assuming top.
  number of CFI chips: 1
  cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
  Creating 5 MTD partitions on "NOR flash":
  0x00000000-0x00c00000 : "rootfs"
  0x00c00000-0x00c80000 : "loader"
  0x00c80000-0x00fff800 : "vmlinux"
  mtd: partition "vmlinux" doesn't end on an erase block
      -- force read-only
  0x00fff800-0x00fff890 : "config"
  mtd: partition "config" doesn't start on an erase block boundary
      -- force read-only
  0x00fff890-0x01000000 : "nvram"
  mtd: partition "nvram" doesn't start on an erase block boundary
      -- force read-only
  MTD: pace_onenand_init
  OneNAND 16MB 2.65/3.3V 16-bit (0x05)
  Lock scheme is Continues Lock
  Scanning device for bad blocks
  Creating 2 MTD partitions on "Onenand":
  0x00000000-0x00800000 : "part_one"
  0x00800000-0x01000000 : "part_two"

##
## Looking at /proc/mtd, the partitions seem to exist
##

~ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00c00000 00020000 "rootfs"
mtd1: 00080000 00020000 "loader"
mtd2: 0037f800 00020000 "vmlinux"
mtd3: 00000090 00020000 "config"
mtd4: 00000770 00020000 "nvram"
mtd5: 00800000 00010000 "part_one"
mtd6: 00800000 00010000 "part_two"

##
## I can build a jffs2 partition on the NOR device
##  (with a worring error message)

~ # flash_eraseall -j /dev/mtd0
Erasing 128 Kibyte @ be0000 -- 98 % complete. Cleanmarker written at
be0000.
~ # mount -t jffs2 /dev/mtdblock0 /mnt/nor
Eep. No valid nodes for ino #1
~ #~ # cp /my-registers.txt /mnt/nor
~ # ls -l /my-registers.txt /mnt/nor/my-registers.txt
-rw-r--r--    1 0  0   2087754 Jan  1 00:02 /mnt/nor/my-registers.txt
-rw-r--r--    1 0  0   2087754 Aug 13  2006 /my-registers.txt
~ # md5sum /mnt/nor/my-registers.txt /my-registers.txt
3b8b150e7067d2a7b251cfcd0200e530  /mnt/nor/my-registers.txt
3b8b150e7067d2a7b251cfcd0200e530  /my-registers.txt

(after rebooting and mounting, the file was still there)

##
## Equivalent commands on the OneNAND flash fail
##
~ # flash_eraseall -j /dev/mtd5
Erasing 64 Kibyte @ 7f0000 -- 99 % complete. Cleanmarker written at
7f0000.
~ # mount -t jffs2 /dev/mtdblock5 /mnt/onenand/
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 128
mount: Mounting /dev/mtdblock5 on /mnt/onenand failed: Input/output error

##
## And afterwards only the NOR device is mounted:
##
~ # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root             76255996  64592052   7790272  89% /
tmpfs                      256        12       244   5% /var
/dev/mtdblock0           12288       852     11436   7% /mnt/nor

##
## mtd_debug reports the right sizes.
## (oneNAND has internal ECC logic. It has 16 bytes of OOB space
##  for every 512 byte sector, several of which are reserved for use by
the
##  ECC logic)
~ # mtd_debug info /dev/mtd5
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB | MTD_ECC
mtd.size = 8388608 (8M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 1024 (1K)
mtd.oobsize = 32
mtd.ecctype = MTD_ECC_NONE
regions = 0
