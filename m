Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBBCE7D0F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDXr6KXlttRnSw/RCOOdHl8768ED+fq2M35+/BPj+kk=; b=IEt8LQLK+dMmUS
	GG5cAQ+e7wW4NnOZpfzjHo64xhrHjlMHMt/uFf1sCdLArJrJHvn7/uDVz6AYPxJ3NR5RxkxRLXSnd
	wFGWRb/dI0764SspY/ILeBXNpNLPJ5ctyMgbMZu7xqpZMvcN7JbyOxZDsFLun7/cHOGuFiaArv4Ak
	LqJrPcMARbGVJLHuBZmij+If5G1ouwX953wF23oEAN3u9tkd9/4ShUiuMZ8wHM5fKsuJxI1T0g9bo
	br6XQOhCrX22/3nWqV87xQiKdwHBCOuVGdEDphK9bhvAHlxJ2xVwnS1d7ER6HopWqe2tdFinAtOW6
	D5I+zZgfMnlNucs2KF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaOu-00000002Ogz-1l5M;
	Tue, 01 Oct 2024 10:46:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svaLO-00000002Ndm-24bH
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 10:43:03 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so6553351e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2024 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727779380; x=1728384180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=BcJBwz/6iAcQLPJp+EqC2LPQNaFf16dqZo+JXiCdMxYPyqUPasvOhjmSwPLRPiGmq1
         XQC8D4bda5kR3tLAn5ToiZ824ShWRiMBgYCIwwPETrQF0NjSpGXECS+ziiaSlmI6sCXj
         3pWNcPIs7niQ7X8IjVIUP3XQBuW050Hvca81YVZxmTcMTbT/AdY/YnbEQx/NJ++vtvt4
         D0TZdOpiVVc/eZsD0yfWXFR4Mnzd4Jx0b0fjU+zP21FZuN0c/F7njImVSpAv/aSu8AcD
         hiPrj+sQrGfsPq+yF7f6WkhIjlxdJYm48+j8+tVx16sz/2ArKVvAA/6BPDDzjDJROvyS
         zAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727779380; x=1728384180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=DPylqcn3hLJb5T1bT1wDQv6GnRdTzhW/NG/m2SmRuHWpXqxUL2rt4LC2NJhBvTgCwI
         7N1//l+Z37NLO5d4/WCdETR82fB3QgzP+plUtWQmaVx/CicWo5MuYsztbT0PKTyJgjI3
         pb9VWqNneyb6M6lO1w+yJ+Pr7ti8xjf6L1kbV6qrk4YzHlA5S1WXm6vRotTiiMH2iS3I
         L8PYU16SycHdax5F55qmYg/8J4WSJ1Y57lnJkDkY/PhSAqgPDpEv8S88FhRxNCU2PK1R
         kFj/pnVAH9qAx5+Lsxa0GXZYVnSaXpOPEp4LB0AVprp9nmYYzPaT2U65vkRjtGDdYx/B
         nIQg==
X-Gm-Message-State: AOJu0YwzdBgGMaVJY5RuRLWwTOUy2PWpH9U2GdYuj2Xef3sHbpbjLraw
	yU1LijAnw+BhY7fDiliCcT8vxa+qwGn65cEbVm1BAFzMp68Xn9GY
X-Google-Smtp-Source: AGHT+IG/BL9G/CZbs5/Ht2iGEeN/cEVttH0ft6CqPCNk1DwVJTPXgXzlAtVOF0UsrZaLqTUuPf9RsA==
X-Received: by 2002:a05:6512:6cd:b0:530:aa09:b6bf with SMTP id 2adb3069b0e04-5389fc3747emr8558112e87.24.1727779380179;
        Tue, 01 Oct 2024 03:43:00 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd53a02sm1549026e87.31.2024.10.01.03.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 03:42:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 01 Oct 2024 12:42:26 +0200
Subject: [PATCH 1/2] mtd: nand: davinci: add support for on-die ECC engine
 type
MIME-Version: 1.0
Message-Id: <20241001-ondie-v1-1-a3daae15c89d@gmail.com>
References: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
In-Reply-To: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PDm1f5NEBuhwxeXGvwzqxiOMHTZXe7TWbR431qOgkS4=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBm+9Ih92PxVphriOcHjQalCKMkkaHpNrUhRbjz4
 cPS9+Z8r12JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZvvSIQAKCRCIgE5vWV1S
 MpvtD/96jhTVsSN+ptMU+Evlwhv4dTAoF+mcghcW50wrwJYXrKw6dk7YYGRIJJ2FuoSfzJh+umA
 bpomSUCLh9GjLDlFKY2iC77wbW04fuuib3Gwcx8Tvyz+zqDxDRwjbEBZ9XM6NJUPprT61m0yJYX
 geuuwzG9yAL0GCMKW3IQD8f/HXEWkV96V60dFrf/hqYVuhsmh7v3juoy0m2oRjE67ButuD3eB5G
 U8gV19UImOA6G0WubUc3uLHC4ormjbYV7GPP6uUJ/3OEtqynTODYZiy/rPxHU7/gLStdMfG0el7
 zQME1WtkXJMcGlcdEw1gGpGYG22vIBYiJeW4jkejWPm2KnBCRQuoZrtq1y77xyDfj0S4bx5DWsF
 U23nq6A6oE+v9lQNCxeUX+XKfkd1y/zkkrdBbLfvkgfpu5mwtZ5SRqgayZocYv/sz3iUd1TWsts
 IWPGTqhpr9bbjiAIIytn9hI6qU4bbaATOs1TVuMSwlPDbfYxSv2IueSfuNOohuDmqCWVaYLYDD5
 FAAxuwdrS14E5dBDD+PNHsJnXv5ZszHKmpnJZO4UIPVnSpoH2G2f/whmMNkITwGwNxOoIMmHLP3
 nenkxKdIrntuUldfB3QRADQvvXenEHN7FUD+3jo5rWgSdv7AKwXxQu58N2TNEQIUd4kUY/iKKX0
 M3stbVMlRmcfc1w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_034302_568539_059E91F0 
X-CRM114-Status: GOOD (  15.16  )
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

Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
Add "on-die" as ECC engine type in order to be compatible with those.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 392678143a36b20b42c1827eee8203dc2e41889a..79e768d337ae12f6e8d7f21f1acd4e259f4f3020 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -66,6 +66,7 @@ struct davinci_nand_pdata {
 
 	/* none  == NAND_ECC_ENGINE_TYPE_NONE (strongly *not* advised!!)
 	 * soft  == NAND_ECC_ENGINE_TYPE_SOFT
+	 * on-die == NAND_ECC_ENGINE_TYPE_ON_DIE
 	 * else  == NAND_ECC_ENGINE_TYPE_ON_HOST, according to ecc_bits
 	 *
 	 * All DaVinci-family chips support 1-bit hardware ECC.
@@ -524,6 +525,8 @@ static struct davinci_nand_pdata
 				pdata->engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
 			if (!strncmp("hw", mode, 2))
 				pdata->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+			if (!strncmp("on-die", mode, 6))
+				pdata->engine_type = NAND_ECC_ENGINE_TYPE_ON_DIE;
 		}
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-ecc-bits", &prop))
@@ -580,6 +583,7 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_NONE:
+	case NAND_ECC_ENGINE_TYPE_ON_DIE:
 		pdata->ecc_bits = 0;
 		break;
 	case NAND_ECC_ENGINE_TYPE_SOFT:
@@ -914,4 +918,3 @@ module_platform_driver(nand_davinci_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Texas Instruments");
 MODULE_DESCRIPTION("Davinci NAND flash driver");
-

-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
