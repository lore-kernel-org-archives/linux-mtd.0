Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-0000zc-Bp
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:31 +0000
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
Subject: [RFC PATCH 06/34] mtd: spi-nor: Rework the ->quad_enable() selection
 logic
Date: Fri,  7 Dec 2018 10:26:09 +0100
Message-Id: <20181207092637.18687-7-boris.brezillon@bootlin.com>
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

The goal is to move the quad_enable manufacturer specific init in the
<manuf>_post_sfdp_fixups() hooks.

First thing we do is add a spi_nor_quad_enable() wrapper that only
calls nor->quad_enable() when needed (when Quad opcodes are selected).
This way we can populate nor->quad_enable() without risking a switch
to Quad mode when we don't expect it.

Second thing we do is add an explicit no_quad_enable() implementation
so that params->quad_enable() is no longer NULL when
BFPT_DWORD15_QER_NONE is detected, and we can easily override any
manufacturer specific function when SFDP parsing succeeds.

And the last thing we do is move the default nor->quad_enable init in
spi_nor_scan() and the manufacturer specific init in
<manuf>_post_sfdp_fixups().

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 60 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1f15b93adc11..049b67b8f986 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1385,6 +1385,11 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 	return 0;
 }
 
+static int no_quad_enable(struct spi_nor *nor)
+{
+	return 0;
+}
+
 /**
  * macronix_quad_enable() - set QE bit in Status Register.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2836,7 +2841,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* Quad Enable Requirements. */
 	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
 	case BFPT_DWORD15_QER_NONE:
-		params->quad_enable = NULL;
+		params->quad_enable = no_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
@@ -3312,25 +3317,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 
-	/* Select the procedure to set the Quad Enable bit. */
-	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
-				   SNOR_HWCAPS_PP_QUAD)) {
-		switch (JEDEC_MFR(info)) {
-		case SNOR_MFR_MACRONIX:
-			params->quad_enable = macronix_quad_enable;
-			break;
-
-		case SNOR_MFR_ST:
-		case SNOR_MFR_MICRON:
-			break;
-
-		default:
-			/* Kept only for backward compatibility purpose. */
-			params->quad_enable = spansion_quad_enable;
-			break;
-		}
-	}
-
 	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
 	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
 		struct spi_nor_flash_parameter sfdp_params;
@@ -3510,7 +3496,6 @@ static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
 	u32 ignored_mask, shared_mask;
-	bool enable_quad_io;
 	int err;
 
 	/*
@@ -3556,16 +3541,24 @@ static int spi_nor_setup(struct spi_nor *nor,
 	}
 
 	/* Enable Quad I/O if needed. */
-	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
-			  spi_nor_get_protocol_width(nor->write_proto) == 4);
-	if (enable_quad_io && params->quad_enable)
+	if (params->quad_enable)
 		nor->quad_enable = params->quad_enable;
-	else
-		nor->quad_enable = NULL;
 
 	return 0;
 }
 
+static int spi_nor_quad_enable(struct spi_nor *nor)
+{
+	if (spi_nor_get_protocol_width(nor->read_proto) != 4 &&
+	    spi_nor_get_protocol_width(nor->write_proto) != 4)
+		return 0;
+
+	if (!nor->quad_enable)
+		return 0;
+
+	return nor->quad_enable(nor);
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
@@ -3583,12 +3576,10 @@ static int spi_nor_init(struct spi_nor *nor)
 		spi_nor_wait_till_ready(nor);
 	}
 
-	if (nor->quad_enable) {
-		err = nor->quad_enable(nor);
-		if (err) {
-			dev_err(nor->dev, "quad mode not supported\n");
-			return err;
-		}
+	err = spi_nor_quad_enable(nor);
+	if (err) {
+		dev_err(nor->dev, "quad mode not supported\n");
+		return err;
 	}
 
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
@@ -3673,11 +3664,13 @@ static void st_micron_post_sfdp_fixups(struct spi_nor *nor)
 	/* All ST/Micron NORs support the unlock/lock operations. */
 	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->set_4byte = st_micron_set_4byte;
+	nor->quad_enable = no_quad_enable;
 }
 
 static void macronix_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->set_4byte = macronix_set_4byte;
+	nor->quad_enable = macronix_quad_enable;
 }
 
 static void winbond_post_sfdp_fixups(struct spi_nor *nor)
@@ -3877,6 +3870,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_HAS_LOCK)
 		nor->flags |= SNOR_F_HAS_LOCK;
 
+	/* Kept only for backward compatibility purpose. */
+	nor->quad_enable = spansion_quad_enable;
+
 	/*
 	 * Post SFDP fixups. Has to be called before spi_nor_setup() because
 	 * some fixups might modify params that are then used by
-- 
2.17.1
