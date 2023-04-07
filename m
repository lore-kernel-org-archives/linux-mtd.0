Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C3AC76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdoJyxTtrSw/RvMMBHyttySzN6DIMf8yC79ylv3ii4s=; b=E/fh8yh5GhzvjH
	MWba17CT3ghFk6U1gVf07316J821BTrkYU+yYJKUUUUL5MXv491Ml2U9kt+0jCZcQF2I1kDUTfYXQ
	fxxRq12AmR1fQ5stKN0GRJB32+DZFw/LpYtKTziK6711ghzljt7rKSWjq9qwwrtiarxLBrS/Bcq7G
	xUPTx/nGFZFnuc8v29L+iuDX40Yrvs0UjogfQU/qg7pFXDEvg0Hlx+t/FkN9/yc87ajQqGYWPeCiV
	jRkaomGEzys+VO2+p5iKRDgvuLkFTWzQ1vXZBEx/lZSFnWXTD+oRdqRGaX6lg3vlLpUUqTfqf6GB7
	EIRZvv9z9GG1QTLaHcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfn9-009I8x-1Q;
	Fri, 07 Apr 2023 06:41:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfn6-009I7c-0E
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:41:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id ja10so39346830plb.5
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5r7UPPkseUhBzWAUvrXpdASTQy85OZR5IXroYkj52w=;
        b=AOCePNOi1wYzvnS68uchOlSjok8RC8aeBBYDEXKy7EjqPpgFbzBFZLwHO5us/a42hY
         M1tB+GRHpfn1WeDu6ERfFB5M4cYEb7VEZgKVHv72mGx7edLPBqqHSxAiHYB2Si+bNPfV
         kHdkwpyOG9uVRMhcgEQ4DZIX/0qbFu7VK538DuxZTNwnz4jUAUHZgeVzg5zbg3uTwe20
         K8QaMVHh40StH3aPiSycKsy6yVI83ulJLKBbnmxvFMT0WAbDrb3VLSAEx5a9Emq74NE4
         l/vJjdSPoWhPqzruXMEHW/NSn4TzQJa2mHynugl9tijCu/PdR+6vV7wQw9R7TAZaQgeR
         mcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5r7UPPkseUhBzWAUvrXpdASTQy85OZR5IXroYkj52w=;
        b=FPd6EtIuBb0FjLjr53dhI37niNDv6rnVwLqdG0fhsP6YizNowTQVJ3tk/+iuJQqNPl
         h2/vVlJXaNGytqXUGj/aOFnKhE3YvOC0oaZvF5oQl1yOtizP40qMQqmouKzpbNByrR0u
         bnO+GwQfj5EaGai3Lxu/WTUTXUYK3P7hLeZd5MBNPjfWqVeiLChRStlHC0ScMY5mYz0X
         2WwDbh68xpHL4sfDEuG5BK/9ZnTc5S7eEbF1F6i0QISLH/6O6lwsdlu6M8dCKDbdxI8N
         DLrEIjvRK6ct/GWuT9uMuKVeS3gXXRqW9lGNUzBMJoCCMzBvfNpWD86ruS3P9254VIuy
         H7Yg==
X-Gm-Message-State: AAQBX9fjgE1jjuXtjSZ1wyrppmy/zSR3fEuE2x3TvBr7lNev+Hpni2D/
	BkStx1czTM9taqbpDcQ4SukeMzuYDBQ=
X-Google-Smtp-Source: AKy350YaSXBcFmz6SKJq9W7gMLKedDjkfbeGMJazeyKLYDz2hqdR8L1g8jV1hiKAk+Zkmi0wn86VFw==
X-Received: by 2002:a05:6a20:6626:b0:d8:e90b:78 with SMTP id n38-20020a056a20662600b000d8e90b0078mr1641857pzh.45.1680849703341;
        Thu, 06 Apr 2023 23:41:43 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:43 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 4/8] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
Date: Fri,  7 Apr 2023 15:41:00 +0900
Message-Id: <89c892d52f8cbddbd14373f6a02db496885ae4f1.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234144_135639_A93B3C84 
X-CRM114-Status: GOOD (  14.98  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

SCCR map for multi-chip devices contains the number of additional dice in
the device and register offset values for each additional dice.

spi_nor_parse_sccr_mc() is added to determine the number of dice and
volatile register offset for each die. The volatile register offset table
may already be allocated and contains offset value for die-0 via SCCR map
parse. So, we should use devm_krealloc() to expand the table with
preserving die-0 offset.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 9d43e18d3770..b3b11dfed789 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -26,6 +26,11 @@
 					 * Status, Control and Configuration
 					 * Register Map.
 					 */
+#define SFDP_SCCR_MAP_MC_ID	0xff88	/*
+					 * Status, Control and Configuration
+					 * Register Map Offsets for Multi-Chip
+					 * SPI Memory Devices.
+					 */
 
 #define SFDP_SIGNATURE		0x50444653U
 
@@ -1264,6 +1269,63 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	return ret;
 }
 
+/**
+ * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
+ *                           Register Map Offsets for Multi-Chip SPI Memory
+ *                           Devices.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the SCCR Map offsets table length and version.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
+				 const struct sfdp_parameter_header *sccr_mc_header)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u32 *dwords, addr;
+	u8 i, n_dice;
+	size_t len;
+	int ret;
+
+	len = sccr_mc_header->length * sizeof(*dwords);
+	dwords = kmalloc(len, GFP_KERNEL);
+	if (!dwords)
+		return -ENOMEM;
+
+	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
+	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
+	if (ret)
+		goto out;
+
+	le32_to_cpu_array(dwords, sccr_mc_header->length);
+
+	/*
+	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
+	 * additional die. Hence, length = 2 * (number of additional dice).
+	 */
+	n_dice = 1 + sccr_mc_header->length / 2;
+
+	/* Address offset for volatile registers of additional dice */
+	params->vreg_offset =
+			devm_krealloc(nor->dev, params->vreg_offset,
+				      n_dice * sizeof(*dwords),
+				      GFP_KERNEL);
+	if (!params->vreg_offset) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 1; i < n_dice; i++)
+		params->vreg_offset[i] = dwords[SFDP_DWORD(i) * 2];
+
+	params->n_dice = n_dice;
+
+out:
+	kfree(dwords);
+	return ret;
+}
+
 /**
  * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
  * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
@@ -1480,6 +1542,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			err = spi_nor_parse_sccr(nor, param_header);
 			break;
 
+		case SFDP_SCCR_MAP_MC_ID:
+			err = spi_nor_parse_sccr_mc(nor, param_header);
+			break;
+
 		default:
 			break;
 		}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
