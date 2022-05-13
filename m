Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FB4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jhe1631jnV0fK5E55itoEkwAPoX4jJracwd2l37roY0=; b=LcmF09Ei7sbE18
	2iPv78N17VBEKx3bUn5IUOC7Gn0tJU1FiPH+ND8WqWw7Wtj3VMmXtBiWhElqNIa5UaZJqfHjnyhks
	0M6Mm4w7XU9yvuHEpCxiF9eeI/ad4c1ConB4hbWMZfAUmFjOOPyB1kvPOYLT6B7ftHwZ4kffxYXOS
	8PtrkVJvNNb/l5MxZIwI7DooGBavHIs77Yvo3I0/NX5bCTeW8I3O8kMFDzjWYMXHiFx+kJyiZZ5uN
	nXaUPD3X2Y28i3jLfnQpLR/6gPQgiEfEqrTz99p30tfb5r8WGnJommd7NpiFM1iHkXlPnbyxwEG6n
	He7cTlDowA5WAcLyIsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npVSb-00GIPM-Pm; Fri, 13 May 2022 13:36:02 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npVSH-00GIGc-2g
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 13:35:43 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 672202224F;
 Fri, 13 May 2022 15:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652448929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJSt6IT3ECdLzAVmB/COzMrm9/Mol0eBhyUGK0zCRhc=;
 b=lVVp1YCd4TNs7AOsWX50tJLf4Fe/V+31U8QWT4eM33NZIvm8U2aoEGWZnFh0mWl6x36RoL
 RXFsr/GhNPSShK1g/EwEdHNbjeU/jG15FulAojMh52qz6xadEiMIScEESlW8TERlPGT/4/
 hLqzVn/UCeNA6Gf5hQgmEtbZxjCmcyE=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Date: Fri, 13 May 2022 15:35:19 +0200
Message-Id: <20220513133520.3945820-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513133520.3945820-1-michael@walle.cc>
References: <20220513133520.3945820-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_063541_394123_4DD554EB 
X-CRM114-Status: GOOD (  17.75  )
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

Our SFDP is parsing is everything we need to support all basic
operations of a flash device. If the flash isn't found in our in-kernel
flash database, gracefully fall back to a driver described solely by its
SFDP tables.

It is still recommended to add the flash to the in-kernel database.
First, we get a proper partname and secondly, for all features not
described by the SFDP like OTP we need the entry anyway.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 13 +++++++++++++
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/sfdp.c | 27 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65cd8e668579..ee193a61310a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1632,6 +1632,11 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_xmc,
 };
 
+static const struct flash_info spi_nor_generic_flash = {
+	.name = "spi-nor-generic",
+	.parse_sfdp = true,
+};
+
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 						 const u8 *id)
 {
@@ -1670,6 +1675,14 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 		return ERR_PTR(-ENOMEM);
 
 	info = spi_nor_match_id(nor, id);
+
+	/* Fallback to a generic flash described only by its SFDP data. */
+	if (!info) {
+		ret = spi_nor_check_sfdp_signature(nor);
+		if (!ret)
+			info = &spi_nor_generic_flash;
+	}
+
 	if (!info) {
 		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
 			SPI_NOR_MAX_ID_LEN, id);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3a19b8092ab8..aa9f218245a5 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -694,6 +694,7 @@ int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
 int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 				     const u8 *buf, size_t len);
 
+int spi_nor_check_sfdp_signature(struct spi_nor *nor);
 int spi_nor_parse_sfdp(struct spi_nor *nor);
 
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a5211543d30d..9bdb3d5dc7e8 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1247,6 +1247,33 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 		nor->info->fixups->post_sfdp(nor);
 }
 
+/**
+ * spi_nor_check_sfdp_header() - check for a valid SFDP header
+ * @nor:		pointer to a 'struct spi_nor'
+ *
+ * Used to detect if the flash supports the RDSFDP command as well as the
+ * presence of a valid SFDP table.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_check_sfdp_signature(struct spi_nor *nor)
+{
+	u32 signature;
+	int err;
+
+	/* Get the SFDP header. */
+	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(signature),
+					   &signature);
+	if (err < 0)
+		return err;
+
+	/* Check the SFDP signature. */
+	if (le32_to_cpu(signature) != SFDP_SIGNATURE)
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
