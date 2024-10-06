Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5BCFB43F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Oct 2024 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDXr6KXlttRnSw/RCOOdHl8768ED+fq2M35+/BPj+kk=; b=fm2FM+FbszFjZ3
	1bu0I3NEbv71qzttBSDiFqptxdDPHPqauR3B4RvJmFx2pwcHoe2Ismh3dKjPVmD1w14V5zYgDRtxB
	vWiBpW4pvZ2xll1Xt/F3QSbPMIssK8rAdwhtpZtAe/dT8SWrIOELj1EaXJeFsOD0U+aaIsD3oPkJM
	jaiOVd4HWBl9bHWZlBzVHNuiQ2HVXKAler0FxFoAxG2SZ1p9+JMML7OeToB6Wjp6UN1xZwUmmX5yu
	spDz+x+ZgZJTA0YHhj+fDdcCHVEHficNDQhkVjPIR6Sd4FhrtpJHyGXiZMC7VO6JABi/HnqvgQLr9
	U1nShcM03Pi43VoDioKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQxi-000000003rR-3QgU;
	Sun, 06 Oct 2024 13:06:14 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQxe-000000003q7-2QGy
	for linux-mtd@lists.infradead.org;
	Sun, 06 Oct 2024 13:06:11 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5398d171fa2so3985336e87.0
        for <linux-mtd@lists.infradead.org>; Sun, 06 Oct 2024 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728219969; x=1728824769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=hEELr6gJC4Wj/DFSeajWdxRmn5XMnXpXguTvmJ2k0jDzlYCMYR95Y1CN6ptGnnIuqr
         AyF9efQ7ht61wzsoGZniWYGHXWpXdliqdS0oA6DsFUnl22FeOB5NmT69Ntk/hr9ZBItq
         UZEibIB+jBl/zkFd6Rj6PHvruWQAcZsWd9oLy3eF8ikyUxlb77ammQhj1Kpmd4dE8ea4
         V+5xEgcvBuGs0j7F9z3A5g6eSTe7GYhNupy2iFxtEO1phEVUGWRXgvcfmYGpcXjtPdu7
         L+Wg0AH3LtD1KehCC95iEo+GdJChwM4YcyDSqBbx8npmAUmNY/2lw8VAsjgjAANww/Fy
         L0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728219969; x=1728824769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=Hq11ObXEkkG1/Czu3Uy3xG/xQV0jBKrn8vIiFEBOoA/My5A7z7u93epC99wBEgMmep
         H/kX7HH2frQPLmluitQ6Vh4yxK3t7junXT80QiFoU8xJ+DY7TQAT2o86+vygJ8pQjKj0
         c7Onl4jtyNlad5VqFkQThweWZ9Uk45xsDpF7HFn688GdfyblrW6Osrp3QtkLFJ9Po/m9
         6B6gtnXTkEFlcOeMbEDuom5OIvuIoxBV+c6k0Hk6l1AO+1aSd6EUdUmY865iAHTleGp+
         AuVtblHR+zwwesBL6jCk8oCV8lJCtvrTOKy+tPYKJ9l3lmjDFNM9rmMZ57XZgAMKiiPe
         /hxw==
X-Gm-Message-State: AOJu0Yxq8JDeY59llS79u0HzFcgfsiatF3PT/7q9Ne1Ea1fzaOms+RJp
	6pTdYI/kfPm7fSaJZUSmerZpxq+dhNrqm+dXqewgWcP/tBxEtHiZ
X-Google-Smtp-Source: AGHT+IFHqIqGqXtJ+xCvOKuflBKgh6mxClHsjT61U0OhrcQrDQ3ZJ481fuo61ATx/3yQc3Ga4fqBvQ==
X-Received: by 2002:a05:6512:e91:b0:52c:dd3d:85af with SMTP id 2adb3069b0e04-539ab88a2e8mr4163371e87.25.1728219968324;
        Sun, 06 Oct 2024 06:06:08 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff2904csm512749e87.304.2024.10.06.06.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 06:06:06 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 06 Oct 2024 15:05:46 +0200
Subject: [PATCH v4 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241006-ondie-v4-1-ff9b9fd9a81d@gmail.com>
References: <20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com>
In-Reply-To: <20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com>
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
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnAoswOJ1pZOzYvme7rOBZkvdBMKiY6lb2UMKMQ
 hfdLyGcOKWJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZwKLMAAKCRCIgE5vWV1S
 MkpiD/0ZNPL/5fjeuikolIZe2d2NTBwIUOMM6jr9VPfQYdO5KNWn85H9ZqKMwTCMpi6wauqElni
 XeAnDHP1eTfyoyqiGbf709Og0pvZAY8ONQ8WBNAnto5DkzH3/TPDMKR/Rqhn+jJpDE9BTDSADs3
 kUHaIzA72NnB//pgJksJ3UzzTxOvTzVuc+LD8SviYB6sTz+iQNH+/KOCQsAr9maaycHBsXeI5U1
 UE74yq4j7z/uRf+ND/Pr2w/c0OqUKP+qskMgE2bWrKblSGOls/NOMMRI5swdW+PxCEFEZwwjEkk
 RbWJILBS/ccypyYqEVfYPPoCFu48TGGyMY2bObxDPpvZAScXt5V6mRqmA8ELywuUvR1EGCnCSRd
 AYwmi42jTlw8a65wBx6GzGo5mK2j0/EjIgsu2wZhT8FPdygS74pw78Be2TxIAWysokUgEC/WToG
 PIQoslNpne7CRMj67QhMUEfgoZGuivXlm9UQpj/j8IcDolY78ZXhLD57G2aprw5ePsBo/2viwo8
 2TqnfZcmTNnCTT549VaFwUVI2b+oB+CcLhy47CDYpzOmKUfQlVi8cvcxP5p1LQvzVclqdAL1m0r
 pdlnm1XNW5bVEcJ9Cj2eVZbdOCUWfZTnZIRHAqX9oplgEU08ivX1gRbi+sfT5QYKiou0syu6WXk
 Rk/6u/lw2z0/s5A==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_060610_633858_404700B1 
X-CRM114-Status: GOOD (  14.25  )
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
