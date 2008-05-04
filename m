Received: from f188.mail.ru ([194.67.57.254])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jsaon-00076u-Tg
	for linux-mtd@lists.infradead.org; Sun, 04 May 2008 09:47:42 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: David Woodhouse <dwmw2@infradead.org>,
	=?windows-1251?Q?linux-mtd=40lists.infradead.org?=
	<linux-mtd@lists.infradead.org>, Nicolas Pitre <nico@cam.org>
Subject: =?windows-1251?Q?Re=3A_[RFC/PATCH][NOR]_Fix_cfi=5Fcmdset=5F0001.c_FL=5FSYNCING_race?=
Mime-Version: 1.0
Date: Sun, 04 May 2008 13:47:39 +0400
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1Jsaol-0007Gx-00.abelyako-mail-ru@f188.mail.ru>
Cc: Alexander Belyakov <abelyako@gmail.com>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> We found this issue was related to FL_SYNCING state race with other operations.
> The patch below tries to remove these races.
> 
> Any comments on this patch are welcome.
> 

No one is interested in fixing these issues?
I hope it is not because of some trailing whitespaces :)
I've fixed them and checkpatch.pl has passed.

---
Signed-off-by: Alexander Belyakov <abelyako@googlemail.com>

diff -uNrp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-01 22:15:28.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-04 13:51:20.000000000 +0400
@@ -701,6 +701,10 @@ static int chip_ready (struct map_info *
 	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
 	unsigned long timeo = jiffies + HZ;
 
+	/* Prevent setting state FL_SYNCING for chip in suspended state. */
+	if (FL_SYNCING == mode && FL_READY != chip->oldstate)
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
 
