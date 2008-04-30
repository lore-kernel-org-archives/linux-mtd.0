Received: from mail3.rossvideo.com ([209.5.118.99])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JrHtK-0004AD-C4
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2008 19:22:58 +0000
From: "Andrew E. Mileski" <andrewm@isoar.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_wait_ready() timeout scaling
Date: Wed, 30 Apr 2008 15:22:55 -0400
Message-Id: <1209583375-11136-1-git-send-email-andrewm@isoar.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_wait_ready() timeout was hardcoded to 2 jiffies, which does not
scale with the system timer frequency.  Using a guess of a 250 Hz system
timer frequency, I believe the timeout was meant to be 8 ms.  This patch
sets an 8 ms timeout that scales with the system timer frequency.

Tested with a 1000 Hz system timer frequency and with a device requiring
at least a 3 ms timeout.

Signed-off-by: Andrew E. Mileski <andrewm@isoar.ca>
--

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ba1bdf7..ef7e1c1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -415,13 +415,13 @@ static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
 }
 
 /*
- * Wait for the ready pin, after a command
- * The timeout is catched later.
+ * Wait 8 ms for the ready pin, after a command
+ * The timeout is caught later.
  */
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + 2;
+	unsigned long timeo = jiffies + (HZ * 8) / 1000;
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 	/* wait until command is processed or timeout occures */
