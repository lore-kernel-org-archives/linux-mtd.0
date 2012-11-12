Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXsjx-00055k-23
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 12:03:46 +0000
Received: by mail-ee0-f49.google.com with SMTP id c1so3339724eek.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 04:03:44 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH V2 6/6] mtd: bcm47xxnflash: enable BCM4706 driver
Date: Mon, 12 Nov 2012 13:03:25 +0100
Message-Id: <1352721805-14064-7-git-send-email-zajec5@gmail.com>
In-Reply-To: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
References: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/Makefile        |    2 +-
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |    2 ++
 drivers/mtd/nand/bcm47xxnflash/main.c          |    4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/Makefile b/drivers/mtd/nand/bcm47xxnflash/Makefile
index 4f688f9..f05b119 100644
--- a/drivers/mtd/nand/bcm47xxnflash/Makefile
+++ b/drivers/mtd/nand/bcm47xxnflash/Makefile
@@ -1,4 +1,4 @@
 bcm47xxnflash-y				+= main.o
-bcm47xxnflash-				+= ops_bcm4706.o
+bcm47xxnflash-y				+= ops_bcm4706.o
 
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
index 264aec4..0bdb2ce 100644
--- a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
@@ -17,4 +17,6 @@ struct bcm47xxnflash {
 	u8 id_data[8];
 };
 
+int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n);
+
 #endif /* BCM47XXNFLASH */
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index fc9139d..2b8b05b 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -40,8 +40,8 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	b47n->mtd.priv = &b47n->nand_chip; /* Required */
 	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
 
-	if (0) {
-		/* TODO: init device */
+	if (b47n->cc->core->bus->chipinfo.id == BCMA_CHIP_ID_BCM4706) {
+		err = bcm47xxnflash_ops_bcm4706_init(b47n);
 	} else {
 		pr_err("Device not supported\n");
 		err = -ENOTSUPP;
-- 
1.7.7
