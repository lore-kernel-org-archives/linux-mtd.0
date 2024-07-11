Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D6C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcBBn8HBnKgV7mf9lv48+0SIEi5l4Qfpgm/dw+i7IHM=; b=X0H0nvrXRehiQM
	9hp+7RrxdhxRivXsxH/2xko+QlJW2vhHZ6eNKuTFyYRD5js94hb9dZGpxZXgWKpwlRFReTzFa5ZkA
	7rscuYS1rAEUpRm4IpstphIHN1+wCjHxbVqwW60zm4YAoAqRhYwysbC7+w65fpgZVvcl//RbMRKf7
	weYeZJUA2Pl5HyoyzyW+r7io0qipCuZYg8/gUHE4hxBCKcpJycdEtqpvaLwo+7MJ0xtb+ecVvyq+Q
	DeIxvyxtLDqBKXQiajK/RFY/6I76uiIOx38Pxq8HgJtyMw1uTFnqV2lcvVsq3uBOXJqTY0nT/Vdm/
	bIfBn5hLly/L6JeTgeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtQT-0000000E25T-0Ygl;
	Thu, 11 Jul 2024 13:01:33 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPI-0000000E1Ud-03ZW;
	Thu, 11 Jul 2024 13:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pxA3/BuB6HUs2tgm/oJDzWCo9cDxy9kfseU0w3KrlBM=; b=oj2PWEA3AHARezlANl6lNDnw3f
	DvU0ld7f7gMyTCCX+XqI8sRYOGGAYOMJJpthQAdWjFiXWr1cAZ/STJF+cORLJiTwDpA26BJZXTVxo
	jRIU5rSUyaBOCGp1ykEb1/YoFRaUVUlLHOSkWgHvspJvDRzM7pDI18ZPEQhg9SpTosyurS1DlwZNI
	XF06pNTYOCpQITU3znkVgtuP4IozyRVUJlV/bDMeWhJnGvkNvftx9dHMPPE7gE4oRo/FeM9T+4FFu
	vIEOcUzf/UZqEFVPFWJ9H/UJh1+6Bz03hnj3ENbWp8W3kc9nZi1reKPe6NwAYGQSkPPeJzWqtfkFP
	RqWluiTQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPF-000BRh-6r; Thu, 11 Jul 2024 15:00:17 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPF-000325-05;
	Thu, 11 Jul 2024 15:00:16 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:01 +0200
Subject: [PATCH v3 01/15] mtd: spi-nor: core: add flag for doing optional
 SFDP parsing
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-1-99353461dd2d@geanix.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=7503;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=WHJBUERZdI5anYsL4qiSt3EgClUaLQjxdDb2lFpx5J4=;
 b=aPo3kjmNJg4ZG/Jk8HSE8b2OJJtk00MAsuWZNutgFfPkLAhHZ8msjdGZnka1BMxpq5bmZ47GR
 3xzfEdOiyJ/DQsOR5bAp9sTfDtPhmBbCyPvZWxPLJeqT63Yb09IbR/m
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060020_425480_A83DA58A 
X-CRM114-Status: GOOD (  22.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is the first step in replacing the old deprecated mechanism for
initializing flash parameters and settings based on SFDP, with fallback to
static parameters from struct flash_info.

A dedicated SPI_NOR_TRY_SFDP flag is used to request this handling, where
as the deprecated mechanism relies on the setting of either of the
SPI_NOR_DUAL_READ, SPI_NOR_QUAD_READ, SPI_NOR_OCTAL_READ or
SPI_NOR_OCTAL_DTR_READ bits.

Compared to the deprecated mechanism, SPI_NOR_TRY_SFDP flags allow optional
SFDP parsing for flashes where the fallback does not include
dual/quad/octal read.

This kind of mechanism is needed for flashes that reuses flash id from old
non-SFDP flashes for newer flashes with SFDP, with different parameters and
settings required. Macronix is known to reuse flash ids for replacement
parts, so for those lines where the initial part did not have SFDP, this
mechanism is needed.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/core.c | 49 ++++++++++++++--------------------------------
 drivers/mtd/spi-nor/core.h | 35 ++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3e1f1913536b..39b28700ce28 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2717,11 +2717,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 
 /**
  * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
- * settings based on nor->info->sfdp_flags. This method should be called only by
- * flashes that do not define SFDP tables. If the flash supports SFDP but the
- * information is wrong and the settings from this function can not be retrieved
- * by parsing SFDP, one should instead use the fixup hooks and update the wrong
- * bits.
+ * settings based on nor->info->sfdp_flags. This method is for flashes that do
+ * not define SFDP tables. If the flash supports SFDP but the information is
+ * wrong and the settings from this function can not be retrieved by parsing
+ * SFDP, one should instead use the fixup hooks and update the wrong bits.
  * @nor:	pointer to a 'struct spi_nor'.
  */
 static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
@@ -2899,14 +2898,15 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sfdp_init_params_deprecated() - Deprecated way of initializing flash
- * parameters and settings based on JESD216 SFDP standard.
+ * spi_nor_try_sfdp_init_params() - Try to initialize flash parameters and
+ * settings based on JESD216 SFDP standard, with fallback to pre-initialized
+ * flash parameters and settings if SFP parsing fails.
  * @nor:	pointer to a 'struct spi_nor'.
  *
  * The method has a roll-back mechanism: in case the SFDP parsing fails, the
  * legacy flash parameters and settings will be restored.
  */
-static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
+static void spi_nor_try_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter sfdp_params;
 
@@ -2918,28 +2918,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 	}
 }
 
-/**
- * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
- * parameters and settings.
- * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method assumes that flash doesn't support SFDP so it initializes flash
- * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
- * when parsing SFDP, if supported.
- */
-static void spi_nor_init_params_deprecated(struct spi_nor *nor)
-{
-	spi_nor_no_sfdp_init_params(nor);
-
-	spi_nor_manufacturer_init_params(nor);
-
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
-		spi_nor_sfdp_init_params_deprecated(nor);
-}
-
 /**
  * spi_nor_init_default_params() - Default initialization of flash parameters
  * and settings. Done for all flashes, regardless is they define SFDP tables
@@ -3046,13 +3024,16 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	if (spi_nor_needs_sfdp(nor)) {
 		ret = spi_nor_parse_sfdp(nor);
 		if (ret) {
-			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
+			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP or SPI_NOR_TRY_SFDP when declaring the flash\n");
 			return ret;
 		}
-	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
-		spi_nor_no_sfdp_init_params(nor);
 	} else {
-		spi_nor_init_params_deprecated(nor);
+		spi_nor_no_sfdp_init_params(nor);
+		if (!(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
+			spi_nor_manufacturer_init_params(nor);
+
+		if (spi_nor_try_sfdp(nor))
+			spi_nor_try_sfdp_init_params(nor);
 	}
 
 	return spi_nor_late_init_params(nor);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 442786685515..dfc81716e068 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -485,9 +485,12 @@ struct spi_nor_id {
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
- *                  flags are used together with the SPI_NOR_SKIP_SFDP flag.
+ *                  flags are used together with the SPI_NOR_SKIP_SFDP or
+ *                  SPI_NOR_TRY_SFDP flag.
  *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
  *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
+ *   SPI_NOR_TRY_SFDP:        try parsing SFDP tables before using the
+ *                            parameters specified in this struct.
  *   SPI_NOR_DUAL_READ:       flash supports Dual Read.
  *   SPI_NOR_QUAD_READ:       flash supports Quad Read.
  *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
@@ -535,6 +538,7 @@ struct flash_info {
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
+#define SPI_NOR_TRY_SFDP		BIT(2)
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
 #define SPI_NOR_OCTAL_READ		BIT(5)
@@ -706,6 +710,35 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
 	return !nor->info->size;
 }
 
+/**
+ * spi_nor_try_sfdp() - returns true if optional SFDP parsing should be tried
+ * for this flash, with fallback to static parameters and settings based on
+ * flash ID if SFDP parsing fails.
+ *
+ * Return: true if optional SFDP parsing should be tried
+ */
+static inline bool spi_nor_try_sfdp(const struct spi_nor *nor)
+{
+	if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP)
+		return false;
+	if (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
+		return true;
+
+	/* Deprecated/legacy way for triggering optional SFDP parsing.
+	 * If one of the no_sfdp_flags indicating dual, quad or octal read is
+	 * set, SFDP parsing will be tried.
+	 * When all drivers have been converted to set SPI_NOR_TRY_SFDP where
+	 * needed, this deprecated mechanism can be removed.
+	 */
+	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
+					SPI_NOR_QUAD_READ |
+					SPI_NOR_OCTAL_READ |
+					SPI_NOR_OCTAL_DTR_READ))
+		return true;
+
+	return false;
+}
+
 #ifdef CONFIG_DEBUG_FS
 void spi_nor_debugfs_register(struct spi_nor *nor);
 void spi_nor_debugfs_shutdown(void);

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
