Received: from science.horizon.com ([192.35.100.1])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6TEN-0002gJ-Hf
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 12:08:48 +0100
Date: 6 Oct 2003 11:07:12 -0000
Message-ID: <20031006110712.4605.qmail@science.horizon.com>
From: linux@horizon.com
To: linux-mtd@lists.infradead.org
Subject: On the usefulness of CONFIG_MTD_BLOCK_RO
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was just fixing a performance problem caused by upgrading an old Pentium
system above 64 MB of memory.  This led me to limit the kernel's memory
usage but try to use the slram device as swap space.

RTFM, read some example HOWTOs
(http://hedera.linuxnews.pl/_news/2002/09/03/_long/1445.html)
and set up a 2.6.0-test6 kernel...

# Memory Technology Devices (MTD)
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# Self-contained MTD device drivers
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
# CONFIG_MTD_NAND is not set

Booting with "mem=65151k slram=slram,64M,96M"
(mem= is 64M minus 384K of unusable PC high memory, minus 1K of EDBA at 639K.)

gives me a nice entry in /proc/mtd:
dev:    size   erasesize  name
mtd0: 02000000 00000000 "slram"

but when I try to mkwap /dev/mtdblock0, I get complaints...

kernel: end_request: I/O error, dev mtdblock0, sector 0
kernel: Buffer I/O error on device mtdblock0, logical block 0
kernel: lost page write due to I/O error on mtdblock0

Note that this is with CONFIG_MTD_DEBUG_VERBOSE=3.

I'm not quite sure why it doesn't work, although the following code
snippets look suspiscious:

slram.c:204:	(*curmtd)->mtdinfo->erasesize = 0x0;
(in register_device())

and mtdblock_writesect() in mtdblock.c:
static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
			      unsigned long block, char *buf)
{
	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
	if (unlikely(!mtdblk->cache_data)) {
		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
		if (!mtdblk->cache_data)
			return -EINTR;
		/* -EINTR is not really correct, but it is the best match
		 * documented in man 2 write for all cases.  We could also
		 * return -EAGAIN sometimes, but why bother?
		 */
	}
	return do_cached_write(mtdblk, block<<9, 512, buf);
}

Note that vmalloc(0) will return 0, and I'm not sure what the higher layers
will do with a -EINTR return, but the error mesage eems consistent.

I think there's a bug here somewhere.  (And a second bug that the first
bug doesn't elicit a log message.)


Further searching through the code and CV archives led me to discover
mtdblock_ro.c, and enabling that instead has provided me with a working
system.  I'd like to propose the following documentation patch.

--- drivers/mtd/Kconfig	2003-10-06 09:47:34 +0000
+++ drivers/mtd/Kconfig	2003-10-06 10:00:35 +0000
@@ -156,15 +156,25 @@
 	  those, enable NFTL support (CONFIG_NFTL) instead.
 
 config MTD_BLOCK_RO
-	tristate "Readonly block device access to MTD devices"
+	tristate "Readonly/RAM block device access to MTD devices"
 	depends on MTD_BLOCK!=y && MTD
 	help
-	  This allows you to mount read-only file systems (such as cramfs)
-	  from an MTD device, without the overhead (and danger) of the caching
-	  driver.
+	  The full MTD_BLOCK driver supports writes smaller than the erase
+	  size of the device by performing a read/modify/write sequence.
+	  This is a much simpler driver that does not hide the underlying
+	  device's limitations.  Despite the name, it does have limited
+	  write support.
+
+	  This driver can be used with any MTD device read-only, to mount
+	  read-only file systems (such as cramfs) from an MTD device,
+	  without the overhead (and danger) of the caching driver.
+
+	  It can also be used to write to devices which do not have
+	  erase size limitations, particularly RAM-based devices such
+	  as slram and mtdram.
 
-	  You do not need this option for use with the DiskOnChip devices. For
-	  those, enable NFTL support (CONFIG_NFTL) instead.
+	  This driver provides the same mtdblock0 devices (major 31) as
+	  the full MTD_BLOCK driver, so the two are mututally exclusive.
 
 config FTL
 	tristate "FTL (Flash Translation Layer) support"



As an aside, the description of the MTD_BLOCK option seems potentially
out of date.  It talks about future extension to read/erase/modify/write,
which appears to have been accomplished some time ago.

But I'd like to leave that change to someone who has a better overview
of the state of the mtd system.

Thanks!
