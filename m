Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydNy-0001W5-U2
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:02:40 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 01/16] mtd: rawnand: brcmnand: fix probe function error path
Date: Wed, 21 Mar 2018 14:01:42 +0100
Message-Id: <20180321130157.9524-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180321130157.9524-1-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_cleanup().
The helper mtd_device_register() returns an error code that should
be checked and nand_cleanup() called accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index c28fd2bc1a84..1306aaa7a8bf 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2297,7 +2297,11 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		nand_cleanup(chip);
+
+	return ret;
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
-- 
2.14.1
