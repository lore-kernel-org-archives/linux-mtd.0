Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3ix-0005fS-KX
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:57:47 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [RFC PATCH 4/5] mtd: rawnand: Stop using chip->state in drivers
Date: Tue, 20 Nov 2018 11:57:19 +0100
Message-Id: <20181120105720.23081-5-boris.brezillon@bootlin.com>
In-Reply-To: <20181120105720.23081-1-boris.brezillon@bootlin.com>
References: <20181120105720.23081-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are about to simplify the locking in the rawnand framework, and part
of this simplication is about getting rid of chip->state, so let's
first patch drivers that check the state.

All of them do that to get a timeout value based on the operation that
is being executed. Since a timeout is, by definition, something that
is here to prevent hanging on an event that might never happen,
picking the maximum timeout value no matter the operation should be
harmless.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c     | 7 ++-----
 drivers/mtd/nand/raw/r852.c      | 3 +--
 drivers/mtd/nand/raw/tmio_nand.c | 6 ++----
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 086561811896..c93cf3fb46ca 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -994,12 +994,9 @@ static int omap_wait(struct nand_chip *this)
 {
 	struct omap_nand_info *info = mtd_to_omap(nand_to_mtd(this));
 	unsigned long timeo = jiffies;
-	int status, state = this->state;
+	int status;
 
-	if (state == FL_ERASING)
-		timeo += msecs_to_jiffies(400);
-	else
-		timeo += msecs_to_jiffies(20);
+	timeo += msecs_to_jiffies(400);
 
 	writeb(NAND_CMD_STATUS & 0xFF, info->reg.gpmc_nand_command);
 	while (time_before(jiffies, timeo)) {
diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index c01422d953dd..86456216fb93 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -369,8 +369,7 @@ static int r852_wait(struct nand_chip *chip)
 	unsigned long timeout;
 	u8 status;
 
-	timeout = jiffies + (chip->state == FL_ERASING ?
-		msecs_to_jiffies(400) : msecs_to_jiffies(20));
+	timeout = jiffies + msecs_to_jiffies(400);
 
 	while (time_before(jiffies, timeout))
 		if (chip->legacy.dev_ready(chip))
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index 4405273898ac..db030f1701ee 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -195,15 +195,13 @@ static int tmio_nand_wait(struct nand_chip *nand_chip)
 	reinit_completion(&tmio->comp);
 	tmio_iowrite8(0x81, tmio->fcr + FCR_IMR);
 
-	timeout = nand_chip->state == FL_ERASING ? 400 : 20;
+	timeout = 400;
 	timeout = wait_for_completion_timeout(&tmio->comp,
 					      msecs_to_jiffies(timeout));
 
 	if (unlikely(!tmio_nand_dev_ready(nand_chip))) {
 		tmio_iowrite8(0x00, tmio->fcr + FCR_IMR);
-		dev_warn(&tmio->dev->dev, "still busy with %s after %d ms\n",
-			nand_chip->state == FL_ERASING ? "erase" : "program",
-			nand_chip->state == FL_ERASING ? 400 : 20);
+		dev_warn(&tmio->dev->dev, "still busy after 400 ms\n");
 
 	} else if (unlikely(!timeout)) {
 		tmio_iowrite8(0x00, tmio->fcr + FCR_IMR);
-- 
2.17.1
