Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62727C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeXJNwCQjh4mtOQVlqIHdmyNFO7ywGbGjg2CPh5wE0k=; b=dHd/BezDTsTDHb
	6RU6UMKOyjZhSfQJ3i7XwzevKw8duyFOLskZtP6+YFp+5OKTM+7hkMisf/7yBMFb2eC+FHskHIguM
	r6l7DGAIfqusVJQ4cL4R0rWQJWzqCkVTdtn41NIjImtotrnC27gLY5qYZV8aTdLz+GPKXeytwN54W
	YZiCNans9DxV9IeV/lMMrXA0dOKQRAph9OzRkOnibrkUB6EWIbGTIsypAEnAOKaBAmDMByFTbLjQp
	SLqVO1oxglR6JsKixI+cWoPC1Arlj4NV0zOr7ckKTL2XRNQVlbj/5280TjbrMzXJEhue6lYHRGm85
	vmQEgxeO3DjmkL+VNMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4mh-004Y10-9f; Mon, 21 Feb 2022 09:15:07 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RG-004Qkj-Lb
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:53:01 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 82533223F7;
 Mon, 21 Feb 2022 09:52:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPwyUqw9bIye7MTeMw3+l2+GgFM/jhis7VAg9kKcJLA=;
 b=I0Du+d/9S66NNNRZ30yQncUrmCAwO2XS28J9sRjG8uXUfY+jXZx8uswIuHChclIOqE/Hp1
 LTirK/MXfIy39iqU0+ToyfjNwRiTHhyjbI9bjxF4D4Dps/JtoRIyOMRJS1m4qb37lXPLrg
 H1Gbhs73E9pzVTe1MXyDh+icga8REW4=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 17/32] mtd: spi-nor: slightly refactor the spi_nor_setup()
Date: Mon, 21 Feb 2022 09:52:21 +0100
Message-Id: <20220221085236.1452024-18-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005258_912795_D40F7A14 
X-CRM114-Status: GOOD (  15.17  )
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

Instead of always using a function pointer (and initializing it to our
default), just call the default function if the flash didn't set its own
one. That will make the call flow easier to follow.

Also mark the parameter as optional now.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 10 +++++-----
 drivers/mtd/spi-nor/core.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 04ea180118e3..4d2036cdce42 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2532,11 +2532,12 @@ static int spi_nor_setup(struct spi_nor *nor,
 {
 	int ret;
 
-	if (nor->params->setup) {
+	if (nor->params->setup)
 		ret = nor->params->setup(nor, hwcaps);
-		if (ret)
-			return ret;
-	}
+	else
+		ret = spi_nor_default_setup(nor, hwcaps);
+	if (ret)
+		return ret;
 
 	return spi_nor_set_addr_width(nor);
 }
@@ -2786,7 +2787,6 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
-	params->setup = spi_nor_default_setup;
 	params->otp.org = &info->otp_org;
 
 	/* Default to 16-bit Write Status (01h) Command */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2afb610853a9..4fe16b5aa3f5 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -257,10 +257,10 @@ struct spi_nor_otp {
  * @convert_addr:	converts an absolute address into something the flash
  *                      will understand. Particularly useful when pagesize is
  *                      not a power-of-2.
- * @setup:              configures the SPI NOR memory. Useful for SPI NOR
- *                      flashes that have peculiarities to the SPI NOR standard
- *                      e.g. different opcodes, specific address calculation,
- *                      page size, etc.
+ * @setup:		(optional) configures the SPI NOR memory. Useful for
+ *			SPI NOR flashes that have peculiarities to the SPI NOR
+ *			standard e.g. different opcodes, specific address
+ *			calculation, page size, etc.
  * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
