Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EBCC3F6B0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 02:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udtz8uNwDQ/Vk3UZDro6BChI59+3g65H9+9jFQ9/nQM=; b=OYcRd6qI03ELSy
	sATo/h4bbC5v58TUdF2ygUf+x0clk7/xem5zFjTtEhvV4Ec9xUl7HQolynabm5lMvNsxugudUVhTG
	3ycq9y1LDBxN4Hc6S2NHvFaOxWBJ5nRWxk5lm3L1ExqaNZQN49lZ2gEU46H3soktyHAQ5bTpfwfl3
	XHpHC5px+V60/k00Jo7ZOjohpoUZMtqQiYElgJP/E7nhnl4yk+1pByHhIFbQL6VMMsEamnin5/7YJ
	mQKwcN4U03lsK8DSkOJfLCNeeZv3CYG7nVMLXEVlAKzgtknxBTgziDcLquqw2gOcQRLbG5KlBJIbV
	L3lRZ0Nq8/mI9GmCJArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2Uj-004MXG-V3; Thu, 25 Aug 2022 02:21:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2Ua-004MPW-1N
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 02:21:13 +0000
Received: by mail-pj1-x102d.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso3505343pjk.0
        for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2022 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uFU+6xGq7vMV4NCj8NMJBnu9+wM2o967cIfl0K+SJBU=;
        b=DRBs1qnfDRkJQ3gQcM3oJ2wDHMUxnSfpkV64lqevoPyxfN0C8FwO/V3g+F11Zcc7dg
         fLI6/DlnMrWKKo8AJ5c6IcMRw8KeJbuo+FPRAD85gzfrQOtEmJK5eprHLOJjrORl+nf7
         NXRBEVmBoWG8NWCvsldZ5xZEcb9AODWI2n8YWNj3RvPbTthbfG4pmElPE36b5ioWnka9
         icXJ0cKcdP+nm5hH8GYEjGZAOlXp7LVz4OI6hTRo4XuN0PpWykLz6BsQoswg3nQ56fyI
         AVyiy+pgWQ0stpJQo+uIN827MUCUd22z0Jezzn6lq1raUNDN6ikM4qLCcp8WXs70eFZF
         GqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uFU+6xGq7vMV4NCj8NMJBnu9+wM2o967cIfl0K+SJBU=;
        b=n5CycDF8RFFdmcY4HcLapWRz5S9QZ5dKv23EgGwi/I724ZABnNSG9c5fMbYPYyQtM3
         deUAE5Qt3iqvtNbil3dBcQlJWCMKLgp/udiLWWZK0TyJ2ehCqY2eW18FY63QlIwKYP7q
         /Td2sLfUzS/LB6N1ZsCfmaj1i/1atVCfI1op5ckxz7jmZJ3cY/CddiMVLum0ljZe41aw
         8Y9V7qxy9TMYs1AEDg9pMZi1iJB8XzqIy/zsLQAG/3s97G7DO7u1Y3D9nGctzAwOa6we
         TRX5nNxQnRVqMcvge73u8Jz8WoNYcWxPaR4wcBJ2cmSvT8Yscy5Liy7VTiA6g0aQ4C6B
         yicA==
X-Gm-Message-State: ACgBeo3EN05So9x8HRAp9T4YAEYsZnAvXujjUTyHURGttCyW1zWnIfgi
	G+tsLUgvFBmQVw1bE7t3IYie3tcdrJ0=
X-Google-Smtp-Source: AA6agR4oyldLT3Dl3GQQ7teW1n4IuB5/HuAJMcXUe37dUF2n5aGMmbZg3jr0zQRN3oLcjwSi1sMvIA==
X-Received: by 2002:a17:902:db12:b0:16e:eaf9:e98d with SMTP id m18-20020a170902db1200b0016eeaf9e98dmr1809145plx.172.1661394068424;
        Wed, 24 Aug 2022 19:21:08 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id g15-20020aa796af000000b00536c7a1012csm6447917pfk.184.2022.08.24.19.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 19:21:07 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and s28hs01gt info
Date: Thu, 25 Aug 2022 11:20:18 +0900
Message-Id: <475bdde1b012af8b36f266bca3230c3262f78700.1661392740.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_192112_096410_E71875B2 
X-CRM114-Status: GOOD (  10.77  )
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

Add flash info table entries for s28hl512gt, s28hl01gt, and s28hs01gt.
These devices have the same functionality as s28hs512t.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 03f361089a05..76a0e31c8323 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -459,11 +459,26 @@ static const struct flash_info spansion_nor_parts[] = {
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
+	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP)
+		.fixups = &s28hx_t_fixups,
+	},
+	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP)
+		.fixups = &s28hx_t_fixups,
+	},
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
 			      SPI_NOR_OCTAL_DTR_PP)
 		.fixups = &s28hx_t_fixups,
 	},
+	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP)
+		.fixups = &s28hx_t_fixups,
+	},
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
