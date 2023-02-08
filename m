Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D127C636D4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myDbLJ2kjBOPxxAjVicW73xEfvnb/E+PP41r1doD0ok=; b=hGf4tR1KETMiil
	U+42HS/zHwp1t7EbEs8hIshRcLsvG5DvPnnmHhFBiAqOKAfwmPZyKWdTZJfWwWO43QqP5wz6q7HoN
	5kGPDpZevIpku/KAweh54VjbdsdjmywZNCmPyexcnlBnVkUsf1Tb4vHxrZNvUBGN6VKsv60Axm5g3
	9cqS0GfpqRrl28KIeaxJp6bctXg3FrkxVKR87gSM/E96oScTb6A4YkHGJXuGPDcxKZZRXP1BNcX7W
	Fxj9e3N+iptfP+pO/1Coap6DpGDhXUPNIvdTxcREWu7jeR6JqXxgLB4Y7KU3H56pnAsQ697mKpWrr
	3BVsksKdXbSSrxu6KBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPo-00EE2L-8d; Wed, 08 Feb 2023 05:54:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPl-00EE0A-KJ
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id h15so10758231plk.12
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQzOrDXzo/0XjOhBQ1/gU0GmcYLGvSg6bU/ShvqrjAQ=;
        b=LaHIt90Xx7BRdU9dAPo6eDV+EVM9uGpJO98JDLrKq1T4+UA3X0LqAPYY/mWBgPyVs2
         Qx5QYj/1jZa/7ZB9YGxINsgHthxVOh413/LveatRmvmpgVKzJoy18joAS5amcizOg7Ds
         DwxntSX/yxMHGX3ADFxefMTgZ7UGp+F6xP3Bbv/ArD2lhs2alsFbX8SeWCMMqFPwUKKn
         7D/dNYUohYDjsCeVrJep9gcNFvJjIr8CgMUZillgMdOp+0yjmr/8cxS4G8WvhTT66DtD
         HsnZWKsX2yWaOTBk/+r4vp3ICwNgHgM0Ld6b0MHl6dngvYjEyV1kj52tIUAfh2h5K0ck
         ya5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQzOrDXzo/0XjOhBQ1/gU0GmcYLGvSg6bU/ShvqrjAQ=;
        b=3dKdfuAFkz+6jBAZSkHsmMFcem5QM+7aZW50j434Pdh27Aq3vgE67SYntT5S83uuxS
         sMStPmUDKeVpMu0l/+A/TcLqJumkaTW1ZxMP6jCn+4qv9G9jhlRtNM0LtuLlLV1v1SjH
         YMOTqE/7yTBCzFZATUl3iQA83GAUa8+4sHGGT2gdQS88YcDoRW7e/nAvqQ9pfpZeFA4Q
         dbEtgCJEjWeZV4yWM7UBliFe0lKBMhW0CNVrG2r8zwS6DgVEsP7R9lrv+jCq8qJBxC0H
         zmMJKAVC11yf1JrVKivfPC8WeQkYDQop5cqsNLYr440EOaaPzpKOE4KlAdjCrf/4yiu+
         p6mA==
X-Gm-Message-State: AO0yUKXw9qXrvHKQUcNG0mEPC+ErXuc7P/9yvva9kiV7iMGfQ/xSfefr
	rvyHLYg6+ku7zbFiB27lp9cWGT6B73g=
X-Google-Smtp-Source: AK7set+JW0umq+R/wypATia7Drtg+oiFYGfs4LZjeEOuLH39ZZ+Xd/+c4FBa0E11LNootUsGc6m+4A==
X-Received: by 2002:a17:90b:30c2:b0:230:caa5:5213 with SMTP id hi2-20020a17090b30c200b00230caa55213mr7483583pjb.24.1675835678524;
        Tue, 07 Feb 2023 21:54:38 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:38 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 3/8] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
Date: Wed,  8 Feb 2023 14:53:40 +0900
Message-Id: <5ffa62bf55f2e6e3fee5104e4c53e2b1caa8c8cc.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215441_694009_BAC22F34 
X-CRM114-Status: GOOD (  15.90  )
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
 drivers/mtd/spi-nor/sfdp.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e5b5776d8172..b7c08fe86239 100644
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
 
@@ -1252,6 +1257,61 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
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
+	size_t len;
+	int ret;
+	u8 i;
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
+	params->num_of_dice += sccr_mc_header->length / 2;
+
+	/* Address offset for volatile registers of additional dice */
+	params->vreg_offset =
+			devm_krealloc(nor->dev, params->vreg_offset,
+				      params->num_of_dice * sizeof(*dwords),
+				      GFP_KERNEL);
+	if (!params->vreg_offset) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 1; i < params->num_of_dice; i++)
+		params->vreg_offset[i] = dwords[(i - 1) * 2];
+
+out:
+	kfree(dwords);
+	return ret;
+}
+
 /**
  * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
  * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
@@ -1461,6 +1521,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
