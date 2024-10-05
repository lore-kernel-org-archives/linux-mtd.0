Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7110CCF8876
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2024 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDXr6KXlttRnSw/RCOOdHl8768ED+fq2M35+/BPj+kk=; b=YBUcDhuG7VQgLw
	tN0cu9qmrw8H9mRih82HMASM/7SbrwUsG59b+moaeTPfWkmaXXhyf7BI0APwL2Iqw+25qreLiR8D5
	l5fAzX/K6hVcKMr/U35fmpJ5uxniy8+BuS9X1JrjiaUHPwCH73llCzIUoyjKqVAVPvL+hkcPhQIIs
	QfbUUqYBZjGnEwZlRTjt60CrDpolh1SwWlSdlYkkC6EywHLsw0HVh3NsY13NaJwZY5k1GqZX11RoM
	u3SyFK2V1aytpnOzLlV34YA0haBe+06DyoVWLkhRikXVSib49qMHEvexBYyOxe2oFDSKGE9MzdXu9
	Dp9hRy5RvrYT+QtNbIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx07l-0000000F1iL-3ZT1;
	Sat, 05 Oct 2024 08:26:49 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx07j-0000000F1hM-1a7N
	for linux-mtd@lists.infradead.org;
	Sat, 05 Oct 2024 08:26:48 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fadb636abaso29340411fa.3
        for <linux-mtd@lists.infradead.org>; Sat, 05 Oct 2024 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728116805; x=1728721605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=nqka5vfcoOGHsRGYec9NVsOXCJeuTaK6hk+wJW/x8NA5o6yAdQezE+AUrzCTL/pKtA
         fGXQBRFM6f+o1qyzrPPe+g1OR+mGj3n+77HxiY4jFzj3SWviwGPbLQX0HzIexg1vXLR1
         uhAT+0qwYVIomtDB8/iOdioCOnT3M7z1iXnDlZ49+LPZJG1m60dWUJbTHi28Jjpp0iyG
         T7Ezbnib2dVX0mQ318y1ZS8gbJWOkQrbLQhLjBLhGdQBu99cWY1czzXsxZqe6hDcILJl
         5qsBrnKLCB3NkDHRTBBsYD285CxdP0gT/HfexVW5ceXdaQPkVRrk0+m3MbAsux6It4WD
         17Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728116805; x=1728721605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=n8vbJGjJm1c94+GesRSI8xRMrhD3ofCRunzL17veil8+WLG0F/ToBQDoY0viDBvIh3
         ZO9neYYjhn2AjLp7ZJo9GMfJCSfSzdECPdJ2vsZkhxdd7NW4LPaHjEWXH5zHzTO4XCua
         R+msPv8iKhCDZGiERe6n61m2ybIuOcpZgWfbOFGoA6DE+IJGm2ghhsKpZcOoqaAWZ3EJ
         XqqZ+IXPcZU3OEMDdsD/WFigCj40Xw8GtJo0LROfbfupmiLanqSLhfe5AlRKKx/pI3bS
         25tIeH52T7o4n2jgQG3xVKG0S55wW4wnepl9kHVvWEDudeCWKpsdEuWUzwDMucfvvni+
         iEeg==
X-Gm-Message-State: AOJu0YzlWPp5MFzwe6PndLGYRr67V5tqiJM45kDyjnLHRkbZWQZpcBqM
	uDGvtDOHb1ma3NVj5daIAIOpVDqnbZC3xweCj/DmcdCJbTA35GPuD2/nDyww
X-Google-Smtp-Source: AGHT+IFVwvOqVPGo03VnhqxHzm3JDs5eAGUx4DD90f/N4FGPaFbMyYpEsXFOvf6ViHdbr9hk3Y461A==
X-Received: by 2002:a2e:5119:0:b0:2fa:c59d:1af3 with SMTP id 38308e7fff4ca-2faf3c41693mr19330691fa.20.1728116804793;
        Sat, 05 Oct 2024 01:26:44 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b3a88esm1857711fa.125.2024.10.05.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 01:26:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 05 Oct 2024 10:26:11 +0200
Subject: [PATCH v3 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241005-ondie-v3-1-459d9c32225c@gmail.com>
References: <20241005-ondie-v3-0-459d9c32225c@gmail.com>
In-Reply-To: <20241005-ondie-v3-0-459d9c32225c@gmail.com>
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
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnAPgxCpGkVQjrQwxeY7yelCHPP4Knt13Zym1Ok
 Mdnp/0SIeqJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZwD4MQAKCRCIgE5vWV1S
 MkiDEACc732NOWaYcnSMRquMSA/lGhB49H478+wBt9qie+3WcgpwB5JT+mC2G4iPmmYRQK3nGVG
 dHotjDqMC6Iw4S59OS3uHUIPItzhaBP+Yv+yE7ds30pRyVrW3ELjACNIbM1/l+krxjgt3HMp97P
 uRYBx/zN/ClslaVSKoExd9DG+o2u8n+OSb0mjKskVnn3qGnOm/Rx17dMSLVSs1Y7uonitNUhPWm
 JNz9epjEfNBtV9Neh9KjmctakSNua8O0Mt7Vfq/uHbVePn1Nof/kbRElO/fFZiTifpOrZJ6Fxk+
 8W8m8Z1Ag0Uz+v7jTo0lIbZdpM9E+GL7sORwtlzVVTtf9ZCDKEci+2drsq4oZWJ+akDkqE8/akz
 rG8LbEGztQunNugJhLaepROxbusYOJoK8KY9Q6IYlh9CBINFRXbB9OItX8LTwtpezUrudj3Sw3V
 7zi0r9JC6/slryo6exmc1GnokhP/ww3MUFflwqRO/EqXm3vzmfcXd+9CqGaohFfaFhU7S0Dg5/j
 6E3a+BMYisHWJK+tV5yyWRqWBAsZYhfGxbD+CNh3Kt/yIXiZRJq9jA4vLp1pXvGloAMSWWiLFQR
 uicjj8xkP3jOVrPfpXz+3RlZBnSGptba9lUVVyisN3kYSDc8AWhMXiyymGcf4RUN8erfFSzI3Fg
 9qPUeZD7pDCOnXA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_012647_516009_E96846EC 
X-CRM114-Status: GOOD (  14.32  )
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
