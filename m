Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C928C44506
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=227ZNuo6CxhGPQ9t+O2504PIY4Wb/BCXm87nN+yD/mw=; b=IPh3nvTHUu9gbq
	ik5RrKU5YPgXVWTStd2lH4Yhq59XR010IO+8Z58tdEQI9h9M8jrWY3fDhDIiGe22gmq3JZ9HZimNW
	8ISaefY7Ywlo3J/3IA7syJgW4F6iNR/9Pi2T/1iNLQJ+0ATkTcwzmTfL8HjpY/A8Drm+95bXvyQ5l
	I72usO3tRBm/Tjx02SkYNMUakezFa1bUTUM/13NXc8AVSx3o1P569W+qhFrdDIlW5lq8YqWHQ5Jqo
	g23LxOUINWEUtypbdxYdt/xTE1hD5ogACXoGsoiBK5hv/t1hfS0BK7hHpGV/7C9kglHZdM4Fzpamf
	u9IbnY9vbFsEfL9KNx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiN-00000008gXT-1Cle;
	Mon, 13 Jul 2026 09:12:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiM-00000008gW1-0IZN
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0618436EF;
	Mon, 13 Jul 2026 09:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEC31F000E9;
	Mon, 13 Jul 2026 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933957;
	bh=CFDXpLNh24+JGMYs/6MJppxx8XjB0puOlhJty8pm6MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gEmk8j1JgoowC5OglNxpBJsxH2uyk70g6dao1LLKCKkfSNysZ8CdFfuOS3/NGS085
	 dLIyBG2cPTwZL9Ehtl4SWwORTsF1XwsT89/Mgl0NjYxp7RMGf+FyY8e5G4SAvD3ATl
	 PViv/xfjcsPsUOaaXe4wZB14cf1B51MVWJD6a+w1KnrGkahIpuh1f43jbWZD8rJVHF
	 5IaJTjVjPGiZ1s+lFPODcGMcOH+fDYmLU/zxaV2CliX82qJxEgGiv422pm+7vhVi9e
	 OPuSr6ivvwT73uIdTyqKtjF2jR5xEXm5t6BRXRRIymMY+aVgQhDDeaeiDztYxH099y
	 4LTxKB7wlcF/w==
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
Subject: [PATCH v2 8/8] mtd: spi-nor: rework flash parameter initialization
Date: Mon, 13 Jul 2026 11:11:46 +0200
Message-ID: <20260713091206.2414400-9-mwalle@kernel.org>
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

Rework how the flash parameters are initialized. It used to make a
difference whether a flash is in the in-kernel database, whether it
supports multi I/O and so on. Recently, that makes more and more
problems because flash IDs are reused among legacy flashes (w/o SFDP
support) and newer flashes [1,2,3,4].

Simplify the whole parameter initialization, by starting with the
parameters we have in the in-kernel database and the try to parse SFDP
(and let it override any settings).

This has the consequence that all the flashes now get a RDSFPD opcode
which might be an unknown opcode from the perspective of the flash. With
the generic SPI NOR flash driver, this was already the case for any
flashes not listed in the in-kernel database. So far, there was not a
single complaint.

[1] https://lore.kernel.org/linux-mtd/CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com/
[2] https://lore.kernel.org/linux-mtd/DGB4745HRCFI.1DRYTHXURWZJO@kernel.org/
[3] https://lore.kernel.org/linux-mtd/DD10GE4EOCD7.CPTN7198QFUV@kernel.org/
[4] https://lore.kernel.org/linux-mtd/DD6SI06QNEE4.2YCRTWJHEAAQM@kernel.org/

Signed-off-by: Michael Walle <mwalle@kernel.org>
Tested-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Tested-by: Miquel Raynal <miquel.raynal@bootlin.com> # w/ W25Q02JVFIM
Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com> # w/ s25fl128s0, s25fl128s1, s25fl256s0
---
 drivers/mtd/spi-nor/core.c | 53 ++++++++++----------------------------
 drivers/mtd/spi-nor/core.h |  5 +---
 2 files changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8446b7b39f55..dffa81ec89f7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2853,11 +2853,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 
 /**
  * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
- * settings based on nor->info->sfdp_flags. This method should be called only by
- * flashes that do not define SFDP tables. If the flash supports SFDP but the
- * information is wrong and the settings from this function can not be retrieved
- * by parsing SFDP, one should instead use the fixup hooks and update the wrong
- * bits.
+ * settings based on nor->info->sfdp_flags.
+ * If the flash supports SFDP but the information is wrong and the settings from
+ * this function can not be retrieved by parsing SFDP, one should instead use
+ * the fixup hooks and update the wrong bits.
  * @nor:	pointer to a 'struct spi_nor'.
  */
 static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
@@ -3039,28 +3038,6 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	return 0;
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
-		spi_nor_parse_sfdp(nor);
-}
-
 /**
  * spi_nor_init_default_params() - Default initialization of flash parameters
  * and settings. Done for all flashes, regardless is they define SFDP tables
@@ -3121,7 +3098,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
  *
  * 1/ Default flash parameters initialization. The initializations are done
  *    based on nor->info data:
- *		spi_nor_info_init_params()
+ *		spi_nor_init_default_params()
+ *		spi_nor_no_sfdp_init_params()
  *
  * which can be overwritten by:
  * 2/ Manufacturer flash parameters initialization. The initializations are
@@ -3132,7 +3110,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
  * which can be overwritten by:
  * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
  *    should be more accurate that the above.
- *		spi_nor_parse_sfdp() or spi_nor_no_sfdp_init_params()
+ *		spi_nor_parse_sfdp()
  *
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
@@ -3158,17 +3136,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		return -ENOMEM;
 
 	spi_nor_init_default_params(nor);
+	spi_nor_no_sfdp_init_params(nor);
+	spi_nor_manufacturer_init_params(nor);
 
-	if (spi_nor_needs_sfdp(nor)) {
-		ret = spi_nor_parse_sfdp(nor);
-		if (ret) {
-			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
-			return ret;
-		}
-	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
-		spi_nor_no_sfdp_init_params(nor);
-	} else {
-		spi_nor_init_params_deprecated(nor);
+	ret = spi_nor_parse_sfdp(nor);
+	if (ret && spi_nor_needs_sfdp(nor)) {
+		dev_err(nor->dev,
+			"SFDP parsing failed. You need to manually declare the flash parameters.\n");
+		return ret;
 	}
 
 	ret = spi_nor_late_init_params(nor);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3d0bdb320721..0e554d3d4aa0 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -502,9 +502,7 @@ struct spi_nor_id {
  *                            be used with SPI_NOR_HAS_LOCK.
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
- *                  Used when SFDP tables are not defined in the flash. These
- *                  flags are used together with the SPI_NOR_SKIP_SFDP flag.
- *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
+ *                  Used when SFDP tables are not defined in the flash.
  *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
  *   SPI_NOR_DUAL_READ:       flash supports Dual Read.
  *   SPI_NOR_QUAD_READ:       flash supports Quad Read.
@@ -552,7 +550,6 @@ struct flash_info {
 #define SPI_NOR_HAS_CMP			BIT(10)
 
 	u8 no_sfdp_flags;
-#define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
