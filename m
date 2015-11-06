Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuhOY-0003oy-T7
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 13:49:36 +0000
Received: by wicfv8 with SMTP id fv8so29191117wic.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2015 05:49:12 -0800 (PST)
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org
From: Mark Marshall <markmarshall14@gmail.com>
Subject: [PATCH] mtd: Add locking to cfi_cmdset_001:do_getlockstatus_oneblock
Message-ID: <563CAFD7.7060803@gmail.com>
Date: Fri, 6 Nov 2015 14:49:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function (do_getlockstatus_oneblock) switches the flash out of
array-read mode and into query mode.  It should not run in parallel to
another function that uses array-read mode.  We therefore need to
acquire the chip mutex and call get_chip(..., FL_JEDEC_QUERY).

I also assume that we should invalidate the cache in the same way that
we do for do_otp_read.

Signed-off-by: Mark Marshall <Mark.Marshall@omicron.at>
---

Hi all,

We have had a device in production (and operation) for a long time
running Linux and using a CFI NOR flash chip.  We have recently
started to get devices come back from the field with strange errors in
the JFFS2 file system that is on this flash.  It appeared that blocks
of files on the image were being dropped (not flash blocks, just 4K
sections from the middle of the files were being replaced with 0's).

After some debugging I found that sometimes, when the JFFS2 FS was
reading the JFFS2 inode block it would get an CRC error.  After adding
some debug code I could see that in the error cases the "second half"
of the read data was replaced with a fixed repeating pattern, and that
this pattern was part of the CFI "QRY" data (It contained the flash
manufacturer and device ID's).

This led me to think that maybe the problem was that some part of the
MTD code was switching the device out of the normal "array-read" mode
and into the query mode.  After looking through the mtd code I found
that the function 'do_getlockstatus_oneblock' does switch the mode of
the flash without taking the chip mutex.  Adding code to take the
mutex has fixed our problem.

I am slightly surprised that no one else has seen this bug - the only
thing I can think of is that reading the lock status of the flash is
not something that happens in normal operation very often?  We have a
process on the device that generates a hardware check report at boot
up, and one of the things that it does is report on the 'locked'
status of the flash.  This is always running while the JFFS2 code is
performing it's initial scan.

The bug is fairly easy to reproduce if you have a system with the
correct type of flash.  In one terminal run something like:

 while true ; do ( hd -n 65536 /dev/mtd0 | md5sum ) ; done

And in a second terminal run a program or utility that will check the
lock status of the flash (mtdinfo should work).  Assuming nothing else
is writing to the flash partition mtd0 the md5sum will remain
constant.  When the bug bites you can see the md5sum change (but then
recover).

Best Regards,

Mark Marshall

 drivers/mtd/chips/cfi_cmdset_0001.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
index 286b97a..d675efb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2051,13 +2051,32 @@ static int __xipram
do_getlockstatus_oneblock(struct map_info *map,
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int status, ofs_factor = cfi->interleave * cfi->device_type;
+	int ret;

 	adr += chip->start;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, adr, FL_JEDEC_QUERY);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	/* let's ensure we're not reading back cached data from array mode */
+	INVALIDATE_CACHED_RANGE(map, adr+(2*ofs_factor), 1);
+
 	xip_disable(map, chip, adr+(2*ofs_factor));
 	map_write(map, CMD(0x90), adr+(2*ofs_factor));
 	chip->state = FL_JEDEC_QUERY;
 	status = cfi_read_query(map, adr+(2*ofs_factor));
 	xip_enable(map, chip, 0);
+
+	/* then ensure we don't keep query data in the cache */
+	INVALIDATE_CACHED_RANGE(map, adr+(2*ofs_factor), 1);
+
+	put_chip(map, chip, adr);
+	mutex_unlock(&chip->mutex);
+
 	return status;
 }

-- 
1.9.1
