Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2583C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOPYeFL1qPk03hiVYCuYJPqQ1gwJm38I+b+OG3qH+mM=; b=r3Erp49wnh7QJs
	sH71bkhBm3hJ+uUwpMKVqS3HPQuDszPp3pFUisQ/tF1BoRB65VN56U/DW4ZGRMRPCbLg8sPu3ObTW
	8gjF56GH4L1Xxe/Exo2Wt87Cw5iLdxqAovqp2ImYeqGMmBP16vmA1Ave1X1h2kjf+Rp11GYbsNncM
	V3ClnEAR/fGkwPDmfjJqYIV15bEIqxJ03DW1WOPpPP4XOA0s9vQBrfVeuZiOgPWqIl3GDKmCvqqlU
	+4s2lAeGpLWY95mTe9EI2DK4IHM3vvVlHykVhg1oEBgIRfvk5e2yK2/Y6NuhLPaWZG8wA2u/xHF1m
	8RY/G2U9lBVoajJe6R1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkK6n-006dX1-2G;
	Thu, 06 Apr 2023 07:32:37 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIy9-006T5c-1G
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:40 +0000
Received: by mail-pf1-x435.google.com with SMTP id q20so13967101pfs.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSP3he235YJq+sebkYxRm/FPH06fgXP7LoGZfMYU9z0=;
        b=dK7WMfOwD/Ws1ShwtnMKsOqkfQmtyFzz/w7xq5Imd2bhA/50H0A7//HThofQIavf5u
         xKZeVsSQ8RdNG75/KioWwPnkcva3h/6cW4vGHuXQYYVRN8D0WP4Bm199BzH/ZwBgimif
         A5mMa8axs6QHoHpzmPQI++DGvWKbxd6TtcdEFkZomxWphUKtwyJtCJcadUG91R3gvw8c
         Aa/oKVKfQhQi3ZsrCnxx1iwrMANLh+IdAGqwC+sakqNXRbcx1oPH3qFxPbmXbOLJus9c
         Xe/RSre3sBy8JaC+QNlLBs3RbznKNMLh+4f406t3WrxeGmQ7SXU1Q9LAqwypAih3cKD7
         Rd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSP3he235YJq+sebkYxRm/FPH06fgXP7LoGZfMYU9z0=;
        b=UxYTe/FtwwEt7a9LLFbK1TjbJzNWZdjVYyb3U2HTqiV5z5/lBtfwFNt9oU70r5Na3S
         QZ456OnfJPRP8lLXtqLoaiEobLO/96dHz0dvnsmizYEZSE02dkxYPDvAPF8OVGvKDDAh
         2BWmRqUYhbIM+eBpPX2jt03uabMyBo4Y+kezVfQWcMmftp6GV8cLlz7lTHTSSiv0slGh
         0qNWzSrVgp78LL633YmEru8gEsirh+F+ZOS27UV9S7Z8BzAK8vHEwn+qnsX9CGMLJbRJ
         m3f+GCdDWjDIPc+3f8y9mNPseOCiulb7f8IcInfzDkNJbcKKJ51soBXDW3WvhFH8+9D8
         0VTg==
X-Gm-Message-State: AAQBX9fajKrG9YESx8cuJ7cZpS/Janydmq6JbmiCsoRL3YmKGgkKsDKY
	xLo7RbGDCGWQtrNp9lgb/HMw4M6hkrICSg==
X-Google-Smtp-Source: AKy350aTipPoOBW87vZd+xBXbeoJ0yOxvDx71criMrHisXLHooVKS3xJvEGJ3NsQFrGxIUeqO+5ULA==
X-Received: by 2002:a62:1bc3:0:b0:61d:e10f:4e70 with SMTP id b186-20020a621bc3000000b0061de10f4e70mr7795400pfb.0.1680761974297;
        Wed, 05 Apr 2023 23:19:34 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:34 -0700 (PDT)
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
Subject: [PATCH v3 4/8] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
Date: Thu,  6 Apr 2023 15:18:55 +0900
Message-Id: <89b7eb9508b28a48c4d0a8b1ef46983202a0d360.1680749578.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231937_428586_0D42C5A4 
X-CRM114-Status: GOOD (  16.60  )
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
 drivers/mtd/spi-nor/sfdp.c | 73 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 9d43e18d3770..00a40bd8aa1e 100644
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
 
@@ -1264,6 +1269,70 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	return ret;
 }
 
+#define SCCR_MC_MAX_DICE		255
+
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
+	if (params->n_dice > SCCR_MC_MAX_DICE) {
+		dev_dbg(nor->dev, "Improbable number of dice defined in SCCR MC table, use one die.\n");
+		ret = -EINVAL;
+		goto out;
+	}
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
@@ -1480,6 +1549,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
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
