Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C133DC44500
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0lvQ6qxD5qRvyAzOlbAeCp5HrTn6ueMhflh1gmkLTE=; b=wKFlF+g6ZJ8LyV
	7qxvWqjdMPmn+6q8kiuukckO4nmYw/hTJu9i9moSANvBkf/XRinGNZi20b6b29/SbwKvdYNBPrmlv
	/M4wOQKzdpVpELWY8UCy3KHj255UW+CUY4WGHfT9VC/vkCSvQq65FGcSKCuxoJUPa7nAQ0xQIBzJC
	TsGssfLKJBPgqMqEZQieXVrMeZ58CL1MiQhcna0NdVwa2DDYKG8n/JNuY206OHX8u08IQLcKvzGmC
	XwCO+NzARzwYhoaQb+kMa3qpQNdSuUNzzDKFwPbAloiVtP5JenWixGc8TseelOzVitd79Ku4nKBM1
	hVcPIM21vuGc5JoDsbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuh-00000007Gio-20pG;
	Fri, 03 Jul 2026 14:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeug-00000007Ggy-037O
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 14:30:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2CAE43F0F;
	Fri,  3 Jul 2026 14:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD951F00A3A;
	Fri,  3 Jul 2026 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089041;
	bh=ikWdMXAs92SxDi6Z7DDP0/XEmpbRDMQkJFUff0S5Zu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RsVloat/RnGlkDl5Z55THFt2y+GHm2DG46FkJkltN4qoeQNlyZC3Zwytp8kl9+c3u
	 lHTug7ranNE1pxouicebj9X7AJcuNEY5O3nkR7k8t2xP/SggUi2wyaaqygeMD06DNF
	 N9lnD8J+rWOpMVLjGU781pet8l69oEodz9kqc4jG1eSHZfKNPdoi25Yxe63Ol52EVS
	 SJWIEDJM609ByQDAIyRGmGmoA6tstPEPfOy0YWokh1UehGiVnMugBI010VSnFvvjGt
	 dugA8rCORFBAI1z1UB95BbsNbuZWDRXmrb+//g3awi0BToaEDx91UpSweO8JSfsF5j
	 TXRHmu8AB2Wpw==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/8] mtd: spi-nor: push the rollback mechanism into the sfdp module
Date: Fri,  3 Jul 2026 16:29:18 +0200
Message-ID: <20260703143003.1809579-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143003.1809579-1-mwalle@kernel.org>
References: <20260703143003.1809579-1-mwalle@kernel.org>
MIME-Version: 1.0
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

Right now, the core is handling the rollback of the parameters. But it
doesn't have the knowledge what has to be rolled back. And in fact,
havent rolled back everything. Push it down to the called function and
make it mandatory, that this function has no side effects if it fails.

Funny enough, there is a comment in the SFDP table handing code that
each table parser is responsible to roll back any changes. But none of
them did. So while add it, expand the logic to that and roll it back for
them. There is one simple rule though:

  SFDP parsing and fixups may only modify the spi_nor_flash_parameters.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 20 +-------------------
 drivers/mtd/spi-nor/sfdp.c | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8cbe44e12385..8446b7b39f55 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3039,24 +3039,6 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	return 0;
 }
 
-/**
- * spi_nor_sfdp_init_params_deprecated() - Deprecated way of initializing flash
- * parameters and settings based on JESD216 SFDP standard.
- * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
- */
-static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter sfdp_params;
-
-	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
-
-	if (spi_nor_parse_sfdp(nor))
-		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-}
-
 /**
  * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
  * parameters and settings.
@@ -3076,7 +3058,7 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 					SPI_NOR_QUAD_READ |
 					SPI_NOR_OCTAL_READ |
 					SPI_NOR_OCTAL_DTR_READ))
-		spi_nor_sfdp_init_params_deprecated(nor);
+		spi_nor_parse_sfdp(nor);
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5ffd695d1e8b..a48bd74f3cef 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1473,12 +1473,16 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  * runtime the main parameters needed to perform basic SPI flash operations such
  * as Fast Read, Page Program or Sector Erase commands.
  *
+ * Because the parsing is optional, all the settings have to be reverted. IOW,
+ * nothing of struct spi_nor shall be changed.
+ *
  * Return: 0 on success, -errno otherwise.
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
+	struct spi_nor_flash_parameter params;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1486,6 +1490,12 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	size_t psize;
 	int i, err;
 
+	/*
+	 * Get a backup of all the parameter to roll back to in case of an
+	 * error.
+	 */
+	memcpy(&params, nor->params, sizeof(params));
+
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
 	if (err < 0)
@@ -1607,6 +1617,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
+		memcpy(&params, nor->params, sizeof(params));
 		param_header = &param_headers[i];
 
 		switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1640,15 +1651,19 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			/*
 			 * Let's not drop all information we extracted so far
 			 * if optional table parsers fail. In case of failing,
-			 * each optional parser is responsible to roll back to
-			 * the previously known spi_nor data.
+			 * roll back to the previously known
+			 * spi_nor_flash_parameter data.
 			 */
 			err = 0;
+			memcpy(nor->params, &params, sizeof(*nor->params));
 		}
 	}
 
 	err = spi_nor_post_sfdp_fixups(nor);
 exit:
 	kfree(param_headers);
+	if (err)
+		memcpy(nor->params, &params, sizeof(*nor->params));
+
 	return err;
 }
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
