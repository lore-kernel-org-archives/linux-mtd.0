Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ4-0005hX-Vn
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:38 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 34/34] mtd: spi-nor: Add sfdp fixups hooks
Date: Fri,  7 Dec 2018 10:26:37 +0100
Message-Id: <20181207092637.18687-35-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Experience has proven that SFDP tables are sometimes wrong, and the
parsing that is done by the core can lead ton erroneous flash config
which can sometimes be harmful.

This leaves us 2 options:

1/ set the SPI_NOR_SKIP_SFDP flag and completely ignore SFDP parsing
2/ fix SFDP tables at runtime

While #1 should always work, it might implies extra work if most of the
SFDP is correct. #2 has the benefit of keeping the generic SFDP parsing
logic almost untouched while allowing SPI NOR manufacturer drivers to
fix the broken bits.

Add three new hooks to do that.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/internals.h |  7 ++++
 drivers/mtd/spi-nor/sfdp.c      | 57 +++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index ae3eb40d7241..da71145995d9 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -188,6 +188,8 @@ struct sfdp_bfpt {
 
 /**
  * struct spi_nor_fixups - SPI NOR fixup hooks
+ * @sfdp_hdr: SFDP header fixups
+ * @sfdp_hdr: SFDP parameter headers fixups
  * @post_bfpt: called after the BFPT table has been parsed
  * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
  *	       that do not support RDSFDP). Typically used to tweak various
@@ -199,6 +201,11 @@ struct sfdp_bfpt {
  * table is broken or not available.
  */
 struct spi_nor_fixups {
+	int (*sfdp_hdr)(struct spi_nor *nor,
+			struct sfdp_header *hdr);
+	int (*sfdp_param_hdrs)(struct spi_nor *nor,
+			       struct sfdp_header *hdr,
+			       struct sfdp_parameter_header *param_hdrs);
 	int (*post_bfpt)(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt,
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 36343e3e6be0..a8cd070e4ea2 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -534,8 +534,8 @@ static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
 static int
 spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
-			 const struct sfdp_bfpt *bfpt,
-			 struct spi_nor_flash_parameter *params)
+                         const struct sfdp_bfpt *bfpt,
+                         struct spi_nor_flash_parameter *params)
 {
 	int ret;
 
@@ -748,6 +748,50 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
 }
 
+static int spi_nor_sfdp_hdr_fixups(struct spi_nor *nor,
+				   struct sfdp_header *hdr)
+{
+	int ret;
+
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->sfdp_hdr) {
+		ret = nor->manufacturer->fixups->sfdp_hdr(nor, hdr);
+		if (ret)
+			return ret;
+	}
+
+	if (nor->info->fixups && nor->info->fixups->sfdp_hdr) {
+		ret = nor->info->fixups->sfdp_hdr(nor, hdr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+spi_nor_sfdp_param_hdrs_fixups(struct spi_nor *nor, struct sfdp_header *hdr,
+			       struct sfdp_parameter_header *param_hdrs)
+{
+	int ret;
+
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->sfdp_param_hdrs) {
+		ret = nor->manufacturer->fixups->sfdp_param_hdrs(nor, hdr,
+								 param_hdrs);
+		if (ret)
+			return ret;
+	}
+
+	if (nor->info->fixups && nor->info->fixups->sfdp_hdr) {
+		ret = nor->info->fixups->sfdp_param_hdrs(nor, hdr, param_hdrs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
@@ -777,6 +821,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 	if (err < 0)
 		return err;
 
+	err = spi_nor_sfdp_hdr_fixups(nor, &header);
+	if (err)
+		return err;
+
 	/* Check the SFDP header version. */
 	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
 	    header.major != SFDP_JESD216_MAJOR)
@@ -815,6 +863,11 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 			dev_err(dev, "failed to read SFDP parameter headers\n");
 			goto exit;
 		}
+
+		err = spi_nor_sfdp_param_hdrs_fixups(nor, &header,
+						     param_headers);
+		if (err)
+			return err;
 	}
 
 	/*
-- 
2.17.1
