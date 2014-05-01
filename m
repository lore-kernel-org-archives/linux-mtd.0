Received: from mail-we0-f181.google.com ([74.125.82.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlH-0003S5-Vw
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:40 +0000
Received: by mail-we0-f181.google.com with SMTP id q58so2788283wes.26
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 37/47] mtd: nand: stm_nand_bch: load flash-resident BBT
Date: Thu,  1 May 2014 10:56:44 +0100
Message-Id: <1398938214-17847-38-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If load of existing BBT fails (first run), scan device for factory-set
BBMs (Bad-Block Markers) and create a new flash-resident.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 2df452b..a06dca8 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1235,6 +1235,30 @@ static int bch_load_bbt(struct nandi_controller *nandi,
 	return 0;
 }
 
+static int bch_scan_bbt(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandi_controller *nandi = chip->priv;
+	struct nandi_bbt_info *bbt_info = &nandi->info.bbt_info;
+	int err;
+	/* Load Flash-resident BBT */
+	err = bch_load_bbt(nandi, bbt_info);
+	if (err) {
+		dev_warn(nandi->dev,
+			"failed to find BBTs:"
+			"  scanning device for bad-block markers\n");
+
+		/* Scan, build, and write BBT */
+		nandi_scan_build_bbt(nandi, bbt_info);
+		err = bch_update_bbts(nandi, bbt_info, NAND_IBBT_UPDATE_BOTH,
+				      bbt_info->bbt_vers[0] + 1);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /*
  * Initialisation
  */
@@ -1318,6 +1342,8 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 
 	chip->ecc.read_page = bch_read;
 	chip->write_page = bch_write;
+
+	chip->scan_bbt = bch_scan_bbt;
 }
 
 /*
-- 
1.8.3.2
