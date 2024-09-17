Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901EFC36005
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeiZavqAXyMR1bHCDPTshC6Ism0NyjxvETt4EzMmxxo=; b=sG8S56gJfnbAfR
	6sZYMioIMiQVcLQb0hPJY5MwKYr/hqRrY2M/J6p4vqvsYqjx7UV4EetP8hYl5z7IEDGeKOlTEL8Wy
	mIME44ZeR/cOOPgED7HRszabg/7aGg5bMjgs99VFY+sL9YHIJm3v6ZrZTG4cyRUIWo5AL/yD3ky95
	+kCO09bDPsMhHiZS2XboxO/t8QFdpL51eSHHCQKJ4xL9B3T57X6gjbRIxnlHHsWIy42BDu8DMclVl
	Eb/cUW9wCJHq1yfwKBvJVZSy17XHw6daOqqPG8xx7NC7POInvSLfjx2dfxqmlN196rcoYwkW6OF07
	poMpAJnLV7tKUmaWvETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUtt-00000005sZ9-1sd9;
	Tue, 17 Sep 2024 09:53:37 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUr9-00000005s4S-2nXL
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 09:50:49 +0000
Received: from localhost.localdomain (unknown [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4X7H8S1Ls9zMR5Q;
	Tue, 17 Sep 2024 09:50:32 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v4 1/5] mtd: spi-nor: core: add manufacturer flags
Date: Tue, 17 Sep 2024 11:49:52 +0200
Message-Id: <20240917094956.437078-2-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917094956.437078-1-erezgeva@nwtime.org>
References: <20240917094956.437078-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_025047_733858_EF781BB1 
X-CRM114-Status: GOOD (  20.69  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Add flag for always trying reading SFDP:
Some vendors reuse all JEDEC IDs on manufacture table
 with new chips that support SFDP.

Add flag for reading OTP parameters from device tree.
Some vendors reuse JEDEC IDs
 with several chips with different OTP parameters.
Alternatively we read parameters from SFDP.
But the OTP parameters are absent from the SFDP.
So there is not other way but to add the OTP parameters in the device tree.

In this patch series we use the new flags with Macronix.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 drivers/mtd/spi-nor/core.c    | 36 ++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h    |  7 ++++++-
 drivers/mtd/spi-nor/otp.c     |  6 +++---
 drivers/mtd/spi-nor/winbond.c |  2 +-
 4 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e0c4efc424f4..23e3d5720ec0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2891,10 +2891,11 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
+	if ((nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
+					 SPI_NOR_QUAD_READ |
+					 SPI_NOR_OCTAL_READ |
+					 SPI_NOR_OCTAL_DTR_READ)) ||
+	     nor->manufacturer->flags & SPI_NOR_MANUFACT_TRY_SFDP)
 		spi_nor_sfdp_init_params_deprecated(nor);
 }
 
@@ -2911,7 +2912,32 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->otp.org = info->otp;
+	memset(&params->otp.org, 0, sizeof(struct spi_nor_otp_organization));
+	if (info->otp) {
+		memcpy(&params->otp.org, info->otp, sizeof(struct spi_nor_otp_organization));
+	} else if (nor->manufacturer->flags & SPI_NOR_MANUFACT_DT_OTP) {
+		/* Check for OTP information on device tree */
+		u32 n_regions, len;
+
+		if (!of_property_read_u32(np, "opt_n_regions", &n_regions) &&
+		   n_regions > 0 &&
+		   !of_property_read_u32(np, "otp_len", &len) &&
+		   len > 0) {
+			u32 base, offset = 0;
+
+			if (n_regions > 1) {
+				/* If offset is not defined use length as offset */
+				if (of_property_read_u32(np, "otp_offset", &offset))
+					offset = len;
+			}
+			if (of_property_read_u32(np, "otp_base", &base))
+				base = 0;
+			params->otp.org.n_regions = n_regions;
+			params->otp.org.offset = offset;
+			params->otp.org.base = base;
+			params->otp.org.len = len;
+		}
+	}
 
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..c862e42c844f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -326,7 +326,7 @@ struct spi_nor_otp_ops {
  * @ops:	OTP access ops
  */
 struct spi_nor_otp {
-	const struct spi_nor_otp_organization *org;
+	struct spi_nor_otp_organization org;
 	const struct spi_nor_otp_ops *ops;
 };
 
@@ -560,12 +560,17 @@ struct flash_info {
  * @parts: array of parts supported by this manufacturer
  * @nparts: number of entries in the parts array
  * @fixups: hooks called at various points in time during spi_nor_scan()
+ * @flags: manufacturer flags
  */
 struct spi_nor_manufacturer {
 	const char *name;
 	const struct flash_info *parts;
 	unsigned int nparts;
 	const struct spi_nor_fixups *fixups;
+
+	u8 flags;
+#define SPI_NOR_MANUFACT_TRY_SFDP	BIT(0)
+#define SPI_NOR_MANUFACT_DT_OTP		BIT(0)
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 9a729aa3452d..ffb7ffeb9030 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -11,8 +11,8 @@
 
 #include "core.h"
 
-#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
-#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
+#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org.len)
+#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org.n_regions)
 
 /**
  * spi_nor_otp_read_secr() - read security register
@@ -222,7 +222,7 @@ int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
 
 static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, unsigned int region)
 {
-	const struct spi_nor_otp_organization *org = nor->params->otp.org;
+	const struct spi_nor_otp_organization *org = &nor->params->otp.org;
 
 	return org->base + region * org->offset;
 }
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e065e4fd42a3..15af62aacc9a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -307,7 +307,7 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	if (params->otp.org)
+	if (params->otp.org.n_regions)
 		params->otp.ops = &winbond_nor_otp_ops;
 
 	/*
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
