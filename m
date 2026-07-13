Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72539C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXh4/XtdmON4aFyohI9tsmjX9XOZJfPcs2cywIjecc8=; b=2L1X4DGIlVL3KS
	4EaGVjYTEoh/FXgqjCQSIOfmiQZbl5dEUEkjgTZnKQU3XTrfj4bb4fD51u4iY5jf1CnRuvSH4iDty
	gx+bMj5u6TOAHJGEC6vCtsjdVyWgF7PFHf3q9b9FEB7stpx1BtoA0RJ4Sz3wUPxk3jVRoUMlcK9T6
	bQ5wwhThXCTItbMCAhP8DQEbZDsg/JXL8N7A//1TxZk5oQ5fOxqTwFQ5hIU0D49B0IDcE4g445zMu
	Tp2yG2WKn83QPv/L2etnhnY+AJ8EF5tJV0FhvKv3CipO0c+Shd4xE4mjBwTbd5jjQGOq89ykknnxl
	tuiJwP/AdlyI6mGIdrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiM-00000008gWD-0bXf;
	Mon, 13 Jul 2026 09:12:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiK-00000008gTk-0Hj6
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 734FF6132C;
	Mon, 13 Jul 2026 09:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112651F00A3A;
	Mon, 13 Jul 2026 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933955;
	bh=Xk8e4R+H42y2X26eswZEsVW+1nENJHFvcV1dMcQyF0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T5NAmIF421qTHrJbbX75qhF//Ctt9IYCOmDMGTz79RXOGYQIGRFwpWb8OV6sGDG38
	 Q7MKyV3XL7FsM+18mkxikrAivbJVXB+PtHD8w7UWxBZm5/uQ07uH8DBmppvRQ16vHn
	 xD9yn56KkgtWFRXU8aMZMNWI+IrNHqii7DrKo5B1GZGGuoWQgrXy4FacwsHZ8m2Gib
	 1ZDct6N5UElGP/p5QaomkiHR6CqeJ4UH/1ivgCpkCzQb0jgQrqBo8Cx9iIcRr1P3UR
	 aGL8e2x1AcJLRHANqfdEhtPKJC5JDbA15IK4EW8cs/gV7sBdQiuC4pssftwD7lThKC
	 iRE8+kyja6BUQ==
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
Subject: [PATCH v2 7/8] mtd: spi-nor: push the rollback mechanism into the sfdp module
Date: Mon, 13 Jul 2026 11:11:45 +0200
Message-ID: <20260713091206.2414400-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
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

Funny enough, there is a comment in the SFDP table handling code that
each table parser is responsible to roll back any changes. But none of
them did. So while add it, expand the logic to that and roll it back for
them. There is one simple rule though:

  SFDP parsing and fixups may only modify the spi_nor_flash_parameters.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
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
index 5ffd695d1e8b..1c890dc379ba 100644
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
+	struct spi_nor_flash_parameter params, params2;
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
+		memcpy(&params2, nor->params, sizeof(params2));
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
+			memcpy(nor->params, &params2, sizeof(*nor->params));
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
