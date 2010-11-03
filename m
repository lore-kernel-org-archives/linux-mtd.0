Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDbgD-0003BC-Q2
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 11:39:02 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co202.xi-lite.net (Postfix) with ESMTPS id 1462A2602A7
	for <linux-mtd@lists.infradead.org>;
	Wed,  3 Nov 2010 13:09:28 +0100 (CET)
Message-ID: <4CD149D2.5080900@parrot.com>
Date: Wed, 3 Nov 2010 12:38:58 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] nand wait timeout fix
Content-Type: multipart/mixed; boundary="------------050705070200060505040906"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------050705070200060505040906
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

nand_wait_ready timeout should not depends of HZ value.
panic_nand_wait take an relative timeout, not a absolute one.
warn if nand_wait exit while the nand is still busy.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

--------------050705070200060505040906
Content-Type: text/x-diff; name="nand_wait.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="nand_wait.diff"

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 12e4b72..07289c0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -519,7 +519,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + 2;
+	unsigned long timeo = jiffies + (2 * HZ) / 1000;
 
 	/* 400ms timeout */
 	if (in_interrupt() || oops_in_progress)
@@ -874,7 +874,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 
 	if (in_interrupt() || oops_in_progress)
-		panic_nand_wait(mtd, chip, timeo);
+		panic_nand_wait(mtd, chip, 400);
 	else {
 		while (time_before(jiffies, timeo)) {
 			if (chip->dev_ready) {
@@ -890,6 +890,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
 	status = (int)chip->read_byte(mtd);
+	/* This can happen if in case of timeout or buggy dev_ready */
+	WARN_ON(!(status & NAND_STATUS_READY));
 	return status;
 }
 

--------------050705070200060505040906--
