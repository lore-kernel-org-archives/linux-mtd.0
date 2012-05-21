Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWOCX-0004aY-BK
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 08:42:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by anubis.se.axis.com (Postfix) with ESMTP id 1F1A419DE5
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:40 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
 by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RSb6ITRQEkh7 for <linux-mtd@lists.infradead.org>;
 Mon, 21 May 2012 10:42:39 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by anubis.se.axis.com (Postfix) with ESMTP id 4C51F19DE0
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:39 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by seth.se.axis.com (Postfix) with ESMTP id 494873EC91
 for <linux-mtd@lists.infradead.org>; Mon, 21 May 2012 10:42:39 +0200 (CEST)
From: Johan Gunnarsson <johan.gunnarsson@axis.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: nand: panic_nand_wait expects timeout in ms.
Date: Mon, 21 May 2012 10:42:37 +0200
Message-ID: <1337589758-8775-2-git-send-email-johan.gunnarsson@axis.com>
In-Reply-To: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: jespern@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Johan Gunnarsson <johan.gunnarsson@axis.com>
---
 drivers/mtd/nand/nand_base.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index eb88d8b..b927e64 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -867,14 +867,16 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
  */
 static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
-
+	unsigned long timeout_ms;
 	unsigned long timeo = jiffies;
 	int status, state = chip->state;
 
 	if (state == FL_ERASING)
-		timeo += (HZ * 400) / 1000;
+		timeout_ms = 400;
 	else
-		timeo += (HZ * 20) / 1000;
+		timeout_ms = 20;
+
+	timeo += (HZ * timeout_ms) / 1000;
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
@@ -890,7 +892,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 
 	if (in_interrupt() || oops_in_progress)
-		panic_nand_wait(mtd, chip, timeo);
+		panic_nand_wait(mtd, chip, timeout_ms);
 	else {
 		while (time_before(jiffies, timeo)) {
 			if (chip->dev_ready) {
-- 
1.7.2.5
