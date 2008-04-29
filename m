Received: from f60.mail.ru ([194.67.57.94])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqmHS-0003Yv-4l
	for linux-mtd@lists.infradead.org; Tue, 29 Apr 2008 09:37:47 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: Alexander Belyakov <abelyako@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	=?windows-1251?Q?linux-mtd=40lists.infradead.org?=
	<linux-mtd@lists.infradead.org>, Nicolas Pitre <nico@cam.org>
Subject: =?windows-1251?Q?[RFC/PATCH][NOR]_Fix_cfi=5Fcmdset=5F0001.c_FL=5FSYNCING_race?=
Mime-Version: 1.0
Date: Tue, 29 Apr 2008 13:37:42 +0400
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1JqmHO-000AQf-00.abelyako-mail-ru@f60.mail.ru>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we've met another CFI driver issue with multipartitional devices.

One can easily reproduce the bug by
1. Running intensive writes on one jffs2 volume and
2. Simultaneously performing mount/unmount cycle with another jffs2 volume at the same chip.

With almost 100% probability we hit the deadlock or/and the following errors:

---
Newly-erased block contained word 0x20031985 at offset 0x006c0000
flash1: buffer write error (status 0x1d0)
jffs2_flush_wbuf(): Write failed with -22
Write of 3681 bytes at 0x006c0400 failed. returned -22, retlen 0
Not marking the space at 0x006c0400 as dirty because the flash driver returned retlen zero
Error writing new dnode: -22
Error garbage collecting node at 00254700!
No space for garbage collection. Aborting GC thread
---

We found this issue was related to FL_SYNCING state race with other operations.
The patch below tries to remove these races.

Any comments on this patch are welcome.

---
Signed-off-by: Alexander Belyakov <abelyako@googlemail.com>


diff -uNrp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-04-24 02:34:28.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-04-28 16:41:03.000000000 +0400
@@ -702,6 +702,10 @@ static int chip_ready (struct map_info *
 	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
 	unsigned long timeo = jiffies + HZ;
 
+	/* Prevent setting state FL_SYNCING for chip in suspended state. */
+	if (FL_SYNCING == mode && FL_READY != chip->oldstate)
+		goto sleep;
+
 	switch (chip->state) {
 
 	case FL_STATUS:
@@ -807,8 +811,9 @@ static int get_chip(struct map_info *map
 	DECLARE_WAITQUEUE(wait, current);
 
  retry:
-	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING
-			   || mode == FL_OTP_WRITE || mode == FL_SHUTDOWN)) {
+	if (chip->priv &&
+	    (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE 
+	    || mode == FL_SHUTDOWN ) && chip->state != FL_SYNCING) {
 		/*
 		 * OK. We have possibility for contention on the write/erase
 		 * operations which are global to the real chip and not per
@@ -858,6 +863,14 @@ static int get_chip(struct map_info *map
 				return ret;
 			}
 			spin_lock(&shared->lock);
+			
+			/* We should not own chip if it is already in FL_SYNCING state.
+			 * Put contender and retry. */
+			if (chip->state == FL_SYNCING) {
+				put_chip(map, contender, contender->start);
+				spin_unlock(contender->mutex);
+				goto retry;
+			}
 			spin_unlock(contender->mutex);
 		}
 
