Received: from f160.mail.ru ([194.67.57.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kj8lp-0007wj-DM
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 08:33:49 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: David Woodhouse <dwmw2@infradead.org>,
	Nicolas Pitre <nico@cam.org>
Subject: =?windows-1251?Q?[PATCH]_mtd=3A_fix_cfi=5Fcmdset=5F0001_FL=5FSYNCING_race_(resend)?=
Mime-Version: 1.0
Date: Fri, 26 Sep 2008 12:33:46 +0400
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1Kj8lm-000LDx-00.abelyako-mail-ru@f160.mail.ru>
Cc: "=?windows-1251?Q?linux-mtd=40lists.infradead.org?="
	<linux-mtd@lists.infradead.org>, Alexander Belyakov <abelyako@gmail.com>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch fixes CFI issue with multipartitional devices leading to the set of errors or even deadlock. The problem is CFI FL_SYNCING state race with flash operations (e.g. erase suspend). It is reproduced by running intensive writes on one JFFS2 partition and simultaneously performing mount/unmount cycle on another partition of the same chip.


Signed-off-by: Alexander Belyakov <abelyako@googlemail.com>
Acked-by: Nicolas Pitre <nico@cam.org>

---
diff -uNrp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-09-08 21:40:20.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-09-19 10:47:34.000000000 +0400
@@ -701,6 +701,10 @@ static int chip_ready (struct map_info *
 	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
 	unsigned long timeo = jiffies + HZ;
 
+	/* Prevent setting state FL_SYNCING for chip in suspended state. */
+	if (mode == FL_SYNCING && chip->oldstate != FL_READY)
+		goto sleep;
+
 	switch (chip->state) {
 
 	case FL_STATUS:
@@ -806,8 +810,9 @@ static int get_chip(struct map_info *map
 	DECLARE_WAITQUEUE(wait, current);
 
  retry:
-	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING
-			   || mode == FL_OTP_WRITE || mode == FL_SHUTDOWN)) {
+	if (chip->priv &&
+	    (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE
+	    || mode == FL_SHUTDOWN) && chip->state != FL_SYNCING) {
 		/*
 		 * OK. We have possibility for contention on the write/erase
 		 * operations which are global to the real chip and not per
@@ -857,6 +862,14 @@ static int get_chip(struct map_info *map
 				return ret;
 			}
 			spin_lock(&shared->lock);
+
+			/* We should not own chip if it is already
+			 * in FL_SYNCING state. Put contender and retry. */
+			if (chip->state == FL_SYNCING) {
+				put_chip(map, contender, contender->start);
+				spin_unlock(contender->mutex);
+				goto retry;
+			}
 			spin_unlock(contender->mutex);
 		}
 
