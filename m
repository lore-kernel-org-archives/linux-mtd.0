Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yF-00075v-V2
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:08:49 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 10/22] mtd: rawnand: ams-delta: Check mtd_device_register()
 return code
Date: Tue,  6 Nov 2018 16:07:58 +0100
Message-Id: <20181106150810.9569-11-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_device_register() can fail, and when it does we should propagate
the error and cleanup what has been done before.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- None
---
 drivers/mtd/nand/raw/ams-delta.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 2f49be4077df..ccdd114495bc 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -281,10 +281,16 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto err_unmap;
 
 	/* Register the partitions */
-	mtd_device_register(mtd, partition_info, ARRAY_SIZE(partition_info));
+	err = mtd_device_register(mtd, partition_info,
+				  ARRAY_SIZE(partition_info));
+	if (err)
+		goto err_nand_cleanup;
 
 	return 0;
 
+err_nand_cleanup:
+	nand_cleanup(this);
+
 err_unmap:
 	iounmap(io_base);
 
-- 
2.17.1
