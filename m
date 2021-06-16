Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7189EC48BE6
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4517F6115B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4517F6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hxJaz/WF28yzm/YzsWnk8vGVC+BQBdvLEmQvfdb8x8=; b=3/60sem4iCPCee
	jUWnPAsMGYpkvWRXSp4F68Nh++jq41vIPzs8LAPB1SUnecZ2b30mYu8Xsn61q7/QNVBWnZ7PiiTPV
	jWjpwwNNcblLVav2l1rGol3/Gxf1ZKVbrl9wNVHB4DbN42eW+bLxpLd7CrS6aLI2M3vFjbkV569kp
	T97bS6sC/Y2dsqbTPyo39YfpjyQb8x2dCrDipn4wglxsrqjRV9dLtSHNM20IjGOvlPyqt2RJ/1Qdq
	zpKkJpnfGZ34eZu8GDN8FXgD405wdOlLyjiqFQhfLW3ycqGHFjPY7nyvi4GNdnNYVxX9+/JN79fRB
	xZEizwvKjFVmp4LrkGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRFr-005RSG-Dd; Wed, 16 Jun 2021 08:50:35 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltRF1-005REg-V5
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 08:49:45 +0000
Received: by mail-oi1-x235.google.com with SMTP id m137so1765755oig.6
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZRhfUzzX1zas0ups/S9IRAx5abdei+IY7pnMKbKUhI=;
 b=NUaGISUdQ6oahila/jOLio0Gl8XIqaCmmH4ktXS7/rhK7f2GnlzOo7WsOjc3BiGlXg
 fb2sVD5GrjG2y5pCpESptiRGG4MrkkanqiSP1ug9rgnjbYHnR7Jdrc193gJxLY6gI0op
 agiI41nCWHUiiBRRFm21pss3V6jiNK3yjlQhAGTYKXnjIbKv0Yv/iucUSOob28zOQeOB
 zLZvDhIgnDhcGKc9TysuO3sHlhidR3TwtIihLUxBSJ9scgFMbBZPcUUnJlDlslj0oQIZ
 OSAYsZzUiQHP6WDSCPb+yGx1a7b57fCniytTsZq9qGvoyqo4DMHMoV6FxjaPk8Dp4orB
 r7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZRhfUzzX1zas0ups/S9IRAx5abdei+IY7pnMKbKUhI=;
 b=DOySHqvFbVJnhjdiE3JuT689l76zTAGSfnqUjzwRCKnlhfTQcp2ClMrRD6NnQU/R9a
 SwDa6JX90dvr6NHHvisEDdLRaOUqU/4Fq513sOKYIa5XeM7fWEYnKmjUfYIYUTFGmGMO
 XGGSI2aFJqDo9jTnYsadxlOUhG1u2x5+A5CmpkI5h5aZO/9qoTDJIgEI21VWOhsjwlc7
 pFF6OD7yZ8cgG2LcUBZASpnOgeQs49jvS27+xBpm9GeCl8duSt3mdezsYC6q/Pfb+MNy
 qbR5cpQR6ffM18aBdK0XN/itwARiXuVprUupBl4A0+QZyTFwBw5X9VBdNBb27jngfdAy
 irlQ==
X-Gm-Message-State: AOAM530Jijce5pmLK71AFrGS/lC0/pjw+k2fg+6X34esMgrc4nTQBW55
 l5+vQ52sHJYTKwmV26rTRBHDYdebuis=
X-Google-Smtp-Source: ABdhPJyQzwoyCPrAxrYuyEEKoZAaQsUMBUMBcCMfMqgwEapxSXQyjZ6S3Lm3ItFfNMpT1jaX0TyDZw==
X-Received: by 2002:aca:ed09:: with SMTP id l9mr2418355oih.151.1623833382847; 
 Wed, 16 Jun 2021 01:49:42 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id e15sm325272oow.38.2021.06.16.01.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:49:42 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v6 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Wed, 16 Jun 2021 17:44:55 +0900
Message-Id: <259dab867faae2ea41b0cbda98057bf37948ca0a.1623831222.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
References: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_014944_054397_ABBC55BA 
X-CRM114-Status: GOOD (  19.31  )
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

The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.

For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
uniform sector sizes are supported. This is due to missing or incorrect
entries in SMPT. Fixup for other sector sizes configurations will be
followed up as needed.

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v6:
  - Remove 2Gb multi die pacakge support

Changes in v5:
  - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT

Changes in v4:
  - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
  - Remove USE_CLSR flags from S25HL02GT and S25HS02GT

Changes in v3:
  - Remove S25HL256T and S25HS256T
  - Add S25HL02GT and S25HS02GT 
  - Add support for multi-die package parts support
  - Remove erase_map fix for top/split sector layout
  - Set ECC data unit size (16B) to writesize

 drivers/mtd/spi-nor/spansion.c | 79 ++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 73ed587c5ee4..6a9048ed7f0c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -218,6 +218,85 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
 	return 0;
 }
 
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	int ret = spansion_quad_enable_volatile(nor, 0);
+
+	/* Reset WEL bit in any error cases */
+	spi_nor_write_disable(nor);
+
+	return ret;
+}
+
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params)
+{
+	int ret;
+	u32 addr;
+	u8 cfr3v;
+
+	ret = spi_nor_set_4byte_addr_mode(nor, true);
+	if (ret)
+		return ret;
+	nor->addr_width = 4;
+
+	/* Replace Quad Enable with volatile version */
+	params->quad_enable = s25hx_t_quad_enable;
+
+	/*
+	 * The page_size is set to 512B from BFPT, but it actually depends on
+	 * the configuration register. Look up the CFR3V and determine the
+	 * page_size.
+	 */
+	ret = spansion_read_any_reg(nor, addr + SPINOR_REG_CYPRESS_CFR3V,
+				    nor->addr_width, 0, &cfr3v);
+	if (ret)
+		return ret;
+
+	if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ))
+		params->page_size = 256;
+	else
+		params->page_size = 512;
+
+	return 0;
+}
+
+void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+
+	/*
+	 * For the single-die package parts (512Mb and 1Gb), bottom 4KB and
+	 * uniform sector maps are correctly populated in the erase_map
+	 * structure. The table below shows all possible combinations of related
+	 * register bits and its availability in SMPT.
+	 *
+	 *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
+	 *  -------------------------------------------------------------------
+	 *      0    |    0    |    0    | Bottom     | YES
+	 *      0    |    0    |    1    | Top        | NO (decoded as Split)
+	 *      0    |    1    |    0    | Split      | NO
+	 *      0    |    1    |    1    | Split      | NO (decoded as Top)
+	 *      1    |    0    |    0    | Uniform    | YES
+	 *      1    |    0    |    1    | Uniform    | NO
+	 *      1    |    1    |    0    | Uniform    | NO
+	 *      1    |    1    |    1    | Uniform    | NO
+	 *  -------------------------------------------------------------------
+	 */
+}
+
+static struct spi_nor_fixups s25hx_t_fixups = {
+	.post_bfpt = s25hx_t_post_bfpt_fixups,
+	.post_sfdp = s25hx_t_post_sfdp_fixups
+};
+
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
