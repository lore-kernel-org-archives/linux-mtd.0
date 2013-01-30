Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0Nw6-0004rk-R8
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 03:02:07 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3] mtd: fix the wrong timeo for panic_nand_wait()
Date: Wed, 30 Jan 2013 10:03:56 +0800
Message-ID: <1359511436-12107-1-git-send-email-b32955@freescale.com>
In-Reply-To: <201301292200.14622.ffainelli@freebox.fr>
References: <201301292200.14622.ffainelli@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 matthieu.castet@parrot.com, gabriel.matni@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The panic_nand_wait() expects the timeo in ms and not in jiffies.
But in nand_wait(), the timeo for panic_nand_wait() is assigned with
wrong value(jiffies + some delay). The timeo should be set like the
panic_nand_write() does.

This patch passes timeo in ms to panic_nand_wait().
And this patch also passes timeo in jiffies(converted by msecs_to_jiffies)
to time_before() which makes the code more readable.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
v1 --> v2:
	fixed a compiler error.

v2 --> v3:
	add more comments.
---
 drivers/mtd/nand/nand_base.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8323ac9..a8c1fb4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -825,13 +825,8 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
 
-	unsigned long timeo = jiffies;
 	int status, state = chip->state;
-
-	if (state == FL_ERASING)
-		timeo += (HZ * 400) / 1000;
-	else
-		timeo += (HZ * 20) / 1000;
+	unsigned long timeo = (state == FL_ERASING ? 400 : 20);
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
@@ -849,6 +844,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	if (in_interrupt() || oops_in_progress)
 		panic_nand_wait(mtd, chip, timeo);
 	else {
+		timeo = jiffies + msecs_to_jiffies(timeo);
 		while (time_before(jiffies, timeo)) {
 			if (chip->dev_ready) {
 				if (chip->dev_ready(mtd))
-- 
1.7.0.4
