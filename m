Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4D3ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 05:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdVXPHAUGXjtDzUw9VoBmoSgSuLky9G0mMYpQDFegzM=; b=j85B7zztpkVCpP
	Hu2DPC53DYOfIofbTccC1suddy9loHuwqVhwbRkCcrGQbD/yeGR6F08p4cwijxrdQzMmgTObI16fU
	NMnmyyMTQNsISlEUmI2B69AyS8iVMyjMaTs0vDNSA5E87VazVWluBBkJvTk8NgSHjSrvQEPFhwdOw
	TQ8FLsnXQlmwjNYbmcX8QckFFZ1Zk/J6Y2xs8yOCOuKmmqs2szIZo9PKJzp4mKtBcU3KXV0dJfciw
	yDSs9s3Q6n/Bn960+NakHpgY8BE8nNXpOcte7A/NSwffQitQmDc5nZKF0NED9oVtCVp42iRhS7LgG
	9FG+SV+LHc22mVXzmT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpI-003oVl-Qh; Wed, 31 Aug 2022 04:59:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpG-003oSo-Qr
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 04:59:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id l65so3002720pfl.8
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 21:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lIr3K6wwMam8Fl9wwzv0OUwX91GmwdbPSgLr8F1TCs8=;
        b=RJAthxhl2mq1w+/3VWB/c4RkaeCayEPG1ODFBUA+F+Yxmgt/EImQV2im65NBaUfxyl
         bdR8KAIHPc/eNDYNffuVOus+JMcC9uFuP0f3c/rcUx7Mjs9K3/SYnROYhJ/+JXSXf87I
         LkexNWBNFoPM87eV3Q8hPNEKqP9r+OE5TB4ZB0vu3yP3egXWhXqLyyOd/6n2yq5QmoqG
         2xyhkOxQ+JBmhT3Xm1Ghg8gHZyog32TNcRKx29C4F0lDOfG6qWd/hN4l1WJrJ2q58ZKB
         j2oNxdmERrmnJzPEyOuDb8O3JZX2Ayx23jY+HY3H3mDPCCuAQ7Jo9Ez386fWwuMW/udl
         znGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lIr3K6wwMam8Fl9wwzv0OUwX91GmwdbPSgLr8F1TCs8=;
        b=HjZwVY82pb8gG1C/JpqJX5SLoeEO3e+kG9S0BBYBwaEzcnKUNMfgnE4aHwig4uiZTD
         2VJnlOJhVpfPdNe71ZcS/FABqGrc7lOmcTvsxn0/iRJP5toGAJ70VzaUp8iBNygV+7OF
         zNeiu6GN8w8BakHT2ZBxqC8XDECOCaDTzIi6CLG3xKCtEkO2HcogrSjFXUJ1gaxRQ4cZ
         OLyCuaTiU+eI6u4aa4WJZKzJSK7G9VSbLHUyV3ePKsCUf2rGd2d5d1xzo4+K5/PZlpe+
         Bd+OK3RHyoJhxuYjD27I9zkmkCckAsP7e6dPG34/FBkbZ3IdFEYBkEFoAnuhInR8XNua
         nXWQ==
X-Gm-Message-State: ACgBeo1Pj6Rbe5RnKzksUe2dfhjxqC2VRy8uvPbEXemSuWy3dkIvGbpQ
	f9HCPZdVNjsSfU+XBu6i8L4o6UsYE3g=
X-Google-Smtp-Source: AA6agR6K+rWnA7jN3YwulU3hwVTeGNHaW7TQ2qVHrFyK9c/+yb9gF8bLnD633fxHY+6VwTFpNioOEQ==
X-Received: by 2002:a65:6048:0:b0:412:73c7:cca9 with SMTP id a8-20020a656048000000b0041273c7cca9mr21277190pgp.257.1661921980327;
        Tue, 30 Aug 2022 21:59:40 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7954d000000b005367ef405e0sm10178519pfq.85.2022.08.30.21.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 21:59:39 -0700 (PDT)
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
Subject: [PATCH v2 3/4] mtd: spi-nor: spansion: Rename s28hs512t prefix
Date: Wed, 31 Aug 2022 13:59:05 +0900
Message-Id: <8cf6bc9bffd50e486867c0817de1fa56c5d308ec.1661915569.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_215942_896994_DD2EDEAB 
X-CRM114-Status: GOOD (  12.28  )
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
Reviewed-by: Michael Walle <michael@walle.cc>
---
Changes in v2:
  - Fix wrong indentation

 drivers/mtd/spi-nor/spansion.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index babf88171902..4f63e9cbb4a4 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -281,7 +281,7 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 			cypress_nor_octal_dtr_dis(nor);
 }
 
-static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
+static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/*
 	 * On older versions of the flash the xSPI Profile 1.0 table has the
@@ -309,23 +309,23 @@ static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
 	nor->params->rdsr_addr_nbytes = 4;
 }
 
-static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
-				     const struct sfdp_parameter_header *bfpt_header,
-				     const struct sfdp_bfpt *bfpt)
+static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
+				   const struct sfdp_parameter_header *bfpt_header,
+				   const struct sfdp_bfpt *bfpt)
 {
 	return cypress_nor_set_page_size(nor);
 }
 
-static void s28hs512t_late_init(struct spi_nor *nor)
+static void s28hx_t_late_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
 	nor->params->writesize = 16;
 }
 
-static const struct spi_nor_fixups s28hs512t_fixups = {
-	.post_sfdp = s28hs512t_post_sfdp_fixup,
-	.post_bfpt = s28hs512t_post_bfpt_fixup,
-	.late_init = s28hs512t_late_init,
+static const struct spi_nor_fixups s28hx_t_fixups = {
+	.post_sfdp = s28hx_t_post_sfdp_fixup,
+	.post_bfpt = s28hx_t_post_bfpt_fixup,
+	.late_init = s28hx_t_late_init,
 };
 
 static int
@@ -461,7 +461,7 @@ static const struct flash_info spansion_nor_parts[] = {
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
 		PARSE_SFDP
-		.fixups = &s28hs512t_fixups,
+		.fixups = &s28hx_t_fixups,
 	},
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
