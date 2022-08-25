Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97724C04AA5
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 02:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfPaKIC/BWZ7yxGcob6n4jv6TtfY+qBoqHtraXnqGTM=; b=FLp9lUeHaSlrZ3
	PF3kWfKE+zDku3mqhWaLO8YTfkfaASrNMqVQqarYkqlT6bjauoVa3fHj510EljPlMZxhJdKCm4QbT
	3UbZImpd05dCEE4Xtgv6Foy8FtkGiavCEB2VNyDt3/z3hYPvig1we0hJFjLn+MTrsx3qJcRLvGShD
	DJh+8r8U5YCcX8G1ehxDdojjVQMdVELkIca+TFiG62JAETuY5HyFvX/Qj4TziEqPrU8QjLr3+KcAg
	VHdEcPNUPzR3j142ttYdBVBGdwA9VDkPctANz3VK4agQGtHVG2fl9WoK+VwIiHLNEWtHQh4yba3HV
	D7OgxGwr1EhK63pkcsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2Ui-004MVf-4A; Thu, 25 Aug 2022 02:21:20 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2UW-004MNR-Aj
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 02:21:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id pm13so9984504pjb.5
        for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2022 19:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AhAeunNfQ1Qg/cevbmzsXbEGZ/SAgOmkEJ25O4qht48=;
        b=pbTGvKMedJ0eNwqh0xbrV3TeUPB6I0OYjYx4OmNsG7G06kyVTiilsp5hkQEG6iyzor
         clmyw0YE894dTMxBHHPwSOsBCVdmg0CrzsboD4BVSgtugPMKRQ4SGHwYlzPyV/92xmdZ
         KU9Ci7ycremp/hv1N3tFE6loY+nGZy2uFvclmmb5N/+jbnpVE5VpXDE1II7r3mdfZueu
         a8GoW/K067AEcIog4EemgWNz2+xUzUFCRH0T3STAjEd9Vc86VEWOUpIyvhLz9WhzTPIQ
         9rSkO5/5VhjBs5Ts5UnFegis7dCEE4VB8zWpFl9/wLOHfVbu1BLmHEHkgBf9xKreqaVm
         eL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AhAeunNfQ1Qg/cevbmzsXbEGZ/SAgOmkEJ25O4qht48=;
        b=kXxwAeU5S17MdBIK9TuqGo03gM0eiLYUI7DbCJOKa2zdYVTb3N4ntaYgLPmYjnHX2W
         iP6nkE0FX+OuUfTXCkFZGzVTC1CFtkk/CoiKJCEc6U9uvHrX6JH3bp2tpP8WN89zKeOq
         oTecBcPnzK5TlrSnA0Tv+UpoW9mzKEAzxLK7oqeUhZFJt5tlEv++/u4QZ5VJBaiEMTYi
         5SJV5yBoD/DYGyGEmaVZU9kuBXw4g1GYPF1koVdcYwFJoxg6NxiCCW5N52MfuPZSQCKs
         tCGM74TT6J8pl8MQ/TbFODm1e5a6MagTpaQ78NdcUTy00pYhBxqRIpjtW5HhKHWkBSVQ
         XGcw==
X-Gm-Message-State: ACgBeo3fWTsbrvUo5XxP2nnPk+ujxtkd2voozTrMNVj462mnXjRR/jcN
	htdlyIDFYwVPS24ZZiwJ2pcqc/G1piI=
X-Google-Smtp-Source: AA6agR4HLXBtEA5jBk9Yxrg9nNMuUugL6O+YTAAQJzfc8t6RTS9Voixka57F+sHnZEFCBnelBhJh/g==
X-Received: by 2002:a17:90b:a14:b0:1fa:bc6e:e5e8 with SMTP id gg20-20020a17090b0a1400b001fabc6ee5e8mr157323pjb.1.1661394064371;
        Wed, 24 Aug 2022 19:21:04 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id g15-20020aa796af000000b00536c7a1012csm6447917pfk.184.2022.08.24.19.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 19:21:04 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 1/2] mtd: spi-nor: spansion: Rename s28hs512t prefix
Date: Thu, 25 Aug 2022 11:20:17 +0900
Message-Id: <a304d1402ac8922cac63bb955069715b53ab60a5.1661392740.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_192108_390060_A7D7CEA1 
X-CRM114-Status: GOOD (  12.21  )
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

Change prefix to support all other devices in SEMPER S28 family.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 676ffd6d12ec..03f361089a05 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -281,13 +281,13 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 			cypress_nor_octal_dtr_dis(nor);
 }
 
-static void s28hs512t_default_init(struct spi_nor *nor)
+static void s28hx_t_default_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
 	nor->params->writesize = 16;
 }
 
-static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
+static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/*
 	 * On older versions of the flash the xSPI Profile 1.0 table has the
@@ -315,17 +315,17 @@ static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
 	nor->params->rdsr_addr_nbytes = 4;
 }
 
-static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
+static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 				     const struct sfdp_parameter_header *bfpt_header,
 				     const struct sfdp_bfpt *bfpt)
 {
 	return cypress_nor_set_page_size(nor);
 }
 
-static const struct spi_nor_fixups s28hs512t_fixups = {
-	.default_init = s28hs512t_default_init,
-	.post_sfdp = s28hs512t_post_sfdp_fixup,
-	.post_bfpt = s28hs512t_post_bfpt_fixup,
+static const struct spi_nor_fixups s28hx_t_fixups = {
+	.default_init = s28hx_t_default_init,
+	.post_sfdp = s28hx_t_post_sfdp_fixup,
+	.post_bfpt = s28hx_t_post_bfpt_fixup,
 };
 
 static int
@@ -462,7 +462,7 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
 			      SPI_NOR_OCTAL_DTR_PP)
-		.fixups = &s28hs512t_fixups,
+		.fixups = &s28hx_t_fixups,
 	},
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
