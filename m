Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3722CD5AE75
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pB+lCClpETuSTNYB52D3Z/A+dyEc7Q902q6qmdSg/48=; b=d1QqVZ/AnlE0Jl
	k9AuU2CGJsPEnRB7dvx4/QIUn9K15C4uDGOI0dnNPgqvk7uW65RiDgtTQg0mjtbeJ9qhydebWS+M1
	4izsk91Tdytc0yRm9o+5tnyn7k5woBuSt1CLuUX7tbCBkPAbCj+MmmgzfVwsRZWkCSj8fhkU8zNx8
	s/t5YsuvHZ6zjWjDF8qjfwjct5Pws0F5Yjz6Jq3lHPSd8TgxNRczLz3nBcsRWdBY/elygzqolyPV5
	7drFU9+kWmTICesPDnGDZTQw2gIaaglVB1cIK7F3m3oDwxgab9kg40z1Pbv75ZVlB6n27xGyeuHhK
	uqu/Ns+n7l2MMfdV4r7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ygg-00000006H4F-0u2Q;
	Thu, 07 Nov 2024 09:20:22 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yge-00000006H36-1snl
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 09:20:21 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso577803e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 01:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730971218; x=1731576018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smTKmYgVjf2tZh/nJwAXDtC0KskLoU7un/mwCANgBrg=;
        b=MhhGSwGiDDKNiTWdh9gsj1gpgy6rKWWL2s8nCV00GBMxpwGcDzzzbxKha5YhbgGuXO
         BmPDY6Q7BDntp+FfuBNjLypozUGcxKtGvyROCBEc16pNALqdc8OOXCHxMuaS1yD+yGg/
         CERExiot4/SbvAdDT/r5+FBhUIJx32BbWMF/4bDXRr3S97gs1Ci8AJl+oX0QVSYwBndf
         1dsgWg0gDqiugF8Oe4x4/jGH1r+S1yYgbBn44GpsX+DVsqZGW1OK04tlVw1IaC/ZpS/m
         GQgsHYfp7zqD4D8X0O624UpOTpDFIozBI5Xwg21HZPs2KT/yVvkrI5ffc5HfBYh1sNCi
         6yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730971218; x=1731576018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smTKmYgVjf2tZh/nJwAXDtC0KskLoU7un/mwCANgBrg=;
        b=rlQkqxgRgp4IbqSFSr+2fPmPIxxSEUkhWFjLPJO0VJprVm2RtXTQaBodJcPCDBwU52
         RGdYKzSIi3WsQgABSW2xhiTJ3tyCU+cpVK9d02RBBBiiDAbkr2DjDKzSF0DAk6IMHhXk
         hRGPP065Ng+S7BgkJSzWur1Pg0TIbt4ueOCK3KiwA5xHFPafjqzKI3E4c7QMF6+udFG1
         qgMYfTOz9UX/9Lcj1U8VMew+HHgsJ1jA3smmb8tgtibxEVrKuVCfpPNuglxnNAi+27X4
         SqIAxX38rF8iUJiUjrjMSqXfBsTKHhsMTVcH8G5mu3OftS3OOp0VTs315MnWD0G69ExK
         bQ8A==
X-Gm-Message-State: AOJu0YwUhHsjmk4xDvdJk9dR7unlS5ufhwPB3WH9wynQDYbjpIFQA7Uq
	OljHvfc3Uc3ta6t4+5EOTwMyxzKMGI6szBLtYt/UwY40DYERAVTf1QJlkt02
X-Google-Smtp-Source: AGHT+IFuIiLW2mk1ed3zYO/2ZhWW3/RTdXo26ke6p/NuYlsoFxOGKyvFrI12iIQ0sjMuQZgqnxIZdw==
X-Received: by 2002:a05:6512:2248:b0:53a:aea:a9e1 with SMTP id 2adb3069b0e04-53d840a6931mr152942e87.54.1730971218007;
        Thu, 07 Nov 2024 01:20:18 -0800 (PST)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b50sm139509e87.182.2024.11.07.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:20:16 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 07 Nov 2024 10:19:53 +0100
Subject: [PATCH v6 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241107-ondie-v6-1-f70905dc12bf@gmail.com>
References: <20241107-ondie-v6-0-f70905dc12bf@gmail.com>
In-Reply-To: <20241107-ondie-v6-0-f70905dc12bf@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=aEezSAYRZux5sp8R/V/BZi69L/f49HVcP44j8wR1Vf8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnLIZAFjNw3EK+EcvSnpI7MpKvyuxjbmeYprbII
 Nj8FMoFDj+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZyyGQAAKCRCIgE5vWV1S
 MnnwEACCRn+mYJTDuG0gkPH7hwwi6zmKOcnUZD3SCKVhRNOrsVTg2PZ5Umq1fzK5h+5bE+NtpcQ
 qifVLbFXsZRTdioh6g39Jrv/tjnmFxqWU5GaHoGpkwIBtZL3D/m/UOX+DCLhZa2X68lJs5gQBpH
 Uh2uh2WJfKh+sPeZm1si8XFbdEH/n5c3HbALGsIcGTZ2pSMHdZmqVAkqiuc4+FPAgNZ2rhbzC+2
 t8/LcKGCCgEpx1K6r5U66qaDxJQBXOZGcpAw3PgV61L4PaWoD+IbQgLTK8U3vqOiTWuaYHBckWy
 6JKidxhiuQ4LhL2L9FQ8zLyx+Q7SQ0b1qk6Vg7+heGCBXaHs+M39oaT9TFAH/b+ErC04W47hTWD
 3r2txc0uFt4I37L+njC8FvlU+coNkddbXzPF2anYdroxAlZ58TGuNB//yORCtwfKBAcrbUSnO4g
 avgNppx7IgggmDscuFhSF1SUqJA+yLbypacQjgfUagaA3WXO3+GvYMQFi8RDY0bXMs9hJt/XF46
 u8RWKZlYJS0nfN+hVEDVBS/zgcml85faQbFY7Ed1tx8L0VAREB/7vN0C+oG0+BNO/DjuDHydtH1
 KCExe1TrVkK+xPR2gl4noWDoRbLHMj+tHZ2VnXCZAVk9glf/sj+YDMfNe08bY+UjwF+8BIkKqwV
 d+uOlwpVh3WdK/g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_012020_539080_F618FC79 
X-CRM114-Status: GOOD (  14.50  )
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
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
