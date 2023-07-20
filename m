Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC79EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JAd9D50Wd6ctvfm4H9xTE6j2qz3k9wpZ9kE/OLi4YI=; b=L3z0rBeKF2/BTI
	xoGB+2tWYhWF30b8U1GFniu4HXg4UI3JQH0twmwrU30X4JUTIpo9sWvlHYmHZ/F2MI1+5emt81LYo
	X6FQKyX2JdbFyhdXyg5F+RRaUPdk2kMptprSZMiB15unVlFlwXmJN9Oub2Wk4NN1CDO8YlO852yK9
	PjZZGJLCB3P8i/pz/Zoj7Q5PLyKcmtTs4xysH9COGUs4nTDVRNN86Z+Blt2pSJUwfRGIz8+HyqqHI
	LmeDMeH8j4/PdG4hm0iwYPZmG22rISXHJWqRAgvFddHEAgDqbaWrPDxyX5hQEI0U+q3O0lfb2pO9Z
	TMPKN5mHaxquL5i4Qtuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoH-00A4iY-0J;
	Thu, 20 Jul 2023 07:10:49 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoC-00A4cQ-0O
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:45 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5440e98616cso1144603a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837042; x=1690441842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsr95SM1EDDnPBPIsqw7OjWwW6AtPri8H9fxuNDvOLI=;
        b=F6x3Jk5gFRntRlWOyoUFjJvbjidQr/VTpA+ea3s6Md+QznbEY6/GOJQszwM5Zo7FMI
         Ac+yYB/EAP0qTPIZtbvmvbFr9fLFbFDBHo5fduo2XWmM+4xmsBNZDIkQ+aXjnXwB0N9u
         XOuuwBsXhekuuCuWwJqwXmyzG+hyMFOEOsKiuLNF56JHC2QKOEdq8ePoZHWQyosI5D77
         x7APc6542Ek+HkanUbHrIO6XQ2PvO99rnMsloshpIAa4oICeYetVarbfJTtqNlVIkBC+
         Kxec3ZZlnWE4qI0E4iFZ55f+HcOfnLOEVMv9HGN2kukMRUOEnTDI2CFU36ADnu8WNiCU
         pRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837042; x=1690441842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsr95SM1EDDnPBPIsqw7OjWwW6AtPri8H9fxuNDvOLI=;
        b=RzCUumpXlxQvGujAz0DvDg6vhXXsbcfLLiry6npNQxweMN6n3n0ZoUSpcJ099R0EdY
         WZMMw+QUfGfYOKit9URjJ1ZqfuxJfPflMFwZywgT5R45WWeDXj6sYRObyhDN/sRVHadf
         s0Arz36ofewuXjl8bHMRW3m6yVTshLUC6Q33UMPI1Yr250YdKVtOK9SGLsrv+3YjFwOq
         WBJFIBNKYnNuGDyYcqQwOUrR8k+KvUytka2HWcXvAwEi1ykRsoV09tCkyENeNdKLw8Zj
         myzHub8CvKAdQmg+EZf9IeblthpRtKnPxNuIkn9Cc7uEEuCB7QW+xaTfg+P6aQExPO8d
         WtfA==
X-Gm-Message-State: ABy/qLanqqxi4xofO3Q9a46d8gDh0/zqPuA/PCBiwGDz63zI8ZH95pZU
	FnzcWxU812zWIGVssr72RWy/Kt8zllw=
X-Google-Smtp-Source: APBJJlH5MgrdD4QE9Hj0gdBwocWEdtY2jdb64lKwtuf/BbTJN6r2P0uc5VPPm0QymeEwIc4Iv2WBvw==
X-Received: by 2002:a17:90b:4a91:b0:253:3eb5:3ade with SMTP id lp17-20020a17090b4a9100b002533eb53ademr5909490pjb.8.1689837041904;
        Thu, 20 Jul 2023 00:10:41 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:41 -0700 (PDT)
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
Subject: [PATCH v2 6/8] mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
Date: Thu, 20 Jul 2023 16:10:01 +0900
Message-Id: <da9b661abde00380071dd428b69aa00322d0efa2.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001044_175541_20AC6C79 
X-CRM114-Status: GOOD (  14.34  )
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

Infineon multi-chip package (MCP) devices require the Octal DTR
configuraion to be set on each die. We can access to configuration
registers in each die by using params->n_dice and params->vreg_offset[]
populated from SFDP. Add MCP support in set_octal_dtr().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 00d8305e25f4..4e791f1b9044 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -206,17 +206,19 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
-	ret = cypress_nor_set_memlat(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR2;
+		ret = cypress_nor_set_memlat(nor, addr);
+		if (ret)
+			return ret;
 
-	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
-	if (ret)
-		return ret;
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_octal_dtr_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
@@ -251,14 +253,17 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
+	const struct spi_nor_flash_parameter *params = nor->params;
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
-	int ret;
+	int i, ret;
 
-	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
-	ret = cypress_nor_set_single_spi_bits(nor, addr);
-	if (ret)
-		return ret;
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_set_single_spi_bits(nor, addr);
+		if (ret)
+			return ret;
+	}
 
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
