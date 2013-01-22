Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TxI41-0004Z0-Ei
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 14:09:30 +0000
Received: by mail-pb0-f42.google.com with SMTP id rp2so3368823pbb.1
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2013 06:08:19 -0800 (PST)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: fix the wrong timeo for panic_nand_wait()
Date: Mon, 21 Jan 2013 22:11:05 -0500
Message-Id: <1358824265-3425-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In nand_wait(), the timeo for panic_nand_wait() is assigned with
wrong value(jiffies + some delay).

This patch fixes it, and also uses the msecs_to_jiffies() to make the
code more readable.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8323ac9..acdd508 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -825,14 +825,9 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
 
-	unsigned long timeo = jiffies;
+	unsigned long timeo = (state == FL_ERASING) ? 400 : 20;
 	int status, state = chip->state;
 
-	if (state == FL_ERASING)
-		timeo += (HZ * 400) / 1000;
-	else
-		timeo += (HZ * 20) / 1000;
-
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
 	/*
@@ -849,6 +844,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	if (in_interrupt() || oops_in_progress)
 		panic_nand_wait(mtd, chip, timeo);
 	else {
+		timeo = jiffies + msecs_to_jiffies(timeo);
 		while (time_before(jiffies, timeo)) {
 			if (chip->dev_ready) {
 				if (chip->dev_ready(mtd))
-- 
1.7.4.4
