Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvBPo-00051k-U8
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2015 21:52:55 +0000
Received: by wicll6 with SMTP id ll6so46970265wic.1
 for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2015 13:52:31 -0800 (PST)
Subject: Re: [PATCH] mtd: Add locking to
 cfi_cmdset_001:do_getlockstatus_oneblock
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <563CAFD7.7060803@gmail.com>
 <1446891117.21216.223.camel@infinera.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>
From: Mark Marshall <markmarshall14@gmail.com>
Message-ID: <563E729C.1010905@gmail.com>
Date: Sat, 7 Nov 2015 22:52:28 +0100
MIME-Version: 1.0
In-Reply-To: <1446891117.21216.223.camel@infinera.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/11/15 11:11, Joakim Tjernlund wrote:
> On Fri, 2015-11-06 at 14:49 +0100, Mark Marshall wrote:
>> The function (do_getlockstatus_oneblock) switches the flash out of
>> array-read mode and into query mode.  It should not run in parallel to
>> another function that uses array-read mode.  We therefore need to
>> acquire the chip mutex and call get_chip(..., FL_JEDEC_QUERY).
>>
> Hmm, this mail has NL breaks in it for long lines and won't apply.
> Is it on my end or yours?
> 

Sorry, it was on my end, here it is again.

>From 49a50d75c7f4eed7a367d35f11afcdbd4573d193 Mon Sep 17 00:00:00 2001
From: Mark Marshall <mark.marshall@omicron.at>
Date: Fri, 6 Nov 2015 14:09:49 +0100
Subject: [PATCH] mtd: Add locking to cfi_cmdset_001:do_getlockstatus_oneblock

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

(mark dot marshall at omicron dot at)

 drivers/mtd/chips/cfi_cmdset_0001.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 286b97a..d675efb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2051,13 +2051,32 @@ static int __xipram do_getlockstatus_oneblock(struct map_info *map,
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
