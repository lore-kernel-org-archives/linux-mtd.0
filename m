Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHzMG-0004lx-8Z
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 17:30:25 +0000
Received: by mail-wi0-f180.google.com with SMTP id hm4so3364019wib.7
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 09:30:00 -0800 (PST)
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 1/2] mtd: nand: add manufacturer specific init
 infrastructure
Date: Mon, 24 Feb 2014 18:29:52 +0100
Message-Id: <1393262993-22040-2-git-send-email-b.brezillon.dev@gmail.com>
In-Reply-To: <1393262993-22040-1-git-send-email-b.brezillon.dev@gmail.com>
References: <1393262993-22040-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add new fields in nand_manufacturers and nand_chip struct to provide
manufacturer specific handling like read retries.

Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    7 +++++++
 include/linux/mtd/nand.h     |    4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9715a7b..8b16479 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3610,6 +3610,13 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	if (nand_manuf_ids[maf_idx].init) {
+		int err;
+		err = nand_manuf_ids[maf_idx].init(mtd, id_data);
+		if (err)
+			return ERR_PTR(err);
+	}
+
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		*maf_id, *dev_id);
 	pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 32f8612..6189312 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -575,6 +575,9 @@ struct nand_chip {
 	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
 			int feature_addr, uint8_t *subfeature_para);
 	int (*setup_read_retry)(struct mtd_info *mtd, int retry_mode);
+	void (*manuf_cleanup)(struct mtd_info *mtd);
+
+	void *manuf_priv;
 
 	int chip_delay;
 	unsigned int options;
@@ -720,6 +723,7 @@ struct nand_flash_dev {
 struct nand_manufacturers {
 	int id;
 	char *name;
+	int (*init)(struct mtd_info *mtd, const uint8_t *id);
 };
 
 extern struct nand_flash_dev nand_flash_ids[];
-- 
1.7.9.5
