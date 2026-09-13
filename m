Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A08C88E65
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIQ75Exr96AWaP5wNw+D7zI44MVSFGckXbHiQohme/o=; b=cWbcSYSh5mhSmx
	0Nx247Xmd8UkAoAaz+gFd+zFdMAP5G1DuPw6T94Z+/BrLR9u/fOT2nXm4TyxHgJJOa66q/ILEvUcy
	5PIVY3irCTnuCrGeVgeU7iUtIIvJLrhiUg8lmAPvymQE0uGSXk0qq0I048ua20KKDD69QLRjLwIuK
	vkcH4uqiNxBfMAHXrL4rfi8VgtobpnlzxCWVk+/3WLJpfl/E1i5adc5c1QvotirflbzhWa7rfSbt6
	4BxisDqkbSe0e5vdDKZb8h8RYXYXRMIso8Iy1DNZ5KMfocmfmdi4eYNH/y0euHnAjkO10/Woji/6w
	su/JWXqeBJ2VjnVcRDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSz-00000001MMj-49K2;
	Sun, 13 Sep 2026 04:05:22 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSt-00000001MEJ-4ApQ
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:19 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-4af173320f9so1657268b6e.2
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272315; x=1789877115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=TimLfmeaTdHUXgsymS0HqmAvI/1fa9yAm/7FsBwahs8wJvTh9bZkVHyliG+VtVlTAN
         bEiNvmI/Q1AI3vmnFmqxdZB+VuG+I5vQae7LrX/NkeZhXMqNoQgbeCDEjDHxp/+FEWgk
         z4Bh5xebAAVzEf0E/esXMpe2WiRQ+xiHtQm5YWwCy9LMWEaMXdeF/RtPFt/do4fOD7vo
         rlG8PGgJLe1RpjQbZG1zEsdqTM4eji+QA1c3Ie+SyuqHPYt/ZRxHdRRLjwWApIMPf00H
         Lv0Exu5Jvtrla7x0qntvoKdWnTcM5YWVdjOhiMVqygDSOSnP2xr012vChFRQTx5EcQCi
         ctTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272315; x=1789877115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=NZOTrCkiGmDSAULLmsIph+T98VWVhPpuQ3eF0yQsHu2t4vfVcJtywV5LU5he73Ury3
         iIefKQpTQmm6p0HicHUqILacuEMgcZlb2PoIL4tCF9GeajuL0KDCV5e1hou9RmTVUk/1
         JFQoJAmlBzUEcGUw34lg7w6YBPS6Tq7+wIgfMwXsir2h76gyPCtri6PH16vwvOGPvjPN
         wPaBsKSbKoFQiWQgAYhwaGB6gPORR9WYxwvtp0GtkTdcsqpxVT7KaZ8Gs5MEtulUHzs5
         kVNWSUAgr+j2/7kZZGRwrzIE4950H9ImrF4eMP/Z07qfNDjD83V4lIRnudZK/yeA6Gam
         E41Q==
X-Gm-Message-State: AFuF++l0eSPjgrL2qzo/poBq6gxAUF4lqTW8m+WNLzLLFEBaWgn7XU9I
	BoGqCYEx8MlYYSdl0zERcVa2RJ+44IjJ4Hvn/5o/uQF3zBFFbI22w3IE
X-Gm-Gg: AYBFou3LCOShQ2xaR7tJLW7TRTA3WKGbYYP4NYLW/ajbt+h9PyHes305C4J3EvILfRT
	tdwHkcy2LvrKHPT4eKybc+vmxcYjxaTNCHvDic3+b1Z9EyKzUIrAjSTv0Y/Eoe9npXbDszMZrlS
	Ji+UMq8M1tv1xWHwCEwAkZvAjN8E+6auqaam39aPTP72brG9FOHcHA0aLJIAZ/vIRvieT4cvkEt
	/6lwHDvCnzlUyTEUGwDKtLQCFrLopgQBM2LsAUuIgqij0Su4z/9A7S/mdJB6wxLo/USw34RsCWw
	ARN7iRM+E4wPB88K2FF3tOTkIOFP6P8TOvn3wcAt8gI7xFGQ42b3uXEDZ09yB7vxMs0gZqjUag5
	1iYRbA5xIimgscX1Y7tTfXGJ29dWT6XuP1G4vOD3sPdql8nQlW4D/ybFHGslVmfsK8Ga7I8KLuF
	RPQDpaHULq1D/rX4bkCZ+68eojZ6C8/tzvc+t51bCqdYG0typL00hl7u3ehyJRtkW4fC+IIfrZq
	5Bcz/4H+xcen5uPH5vHNKrvn1kXHTmDoMlUzMMn1CZH5yxsWZB1Hj7BRk1SL01sc71alzK6hgla
	eqTMvw4OFxSmSjV9mzM0MF+ET+CWMQj9xeCXOo0XaEBq1kXMyI6ZN5dibUkYu2k7B5ftgmP/li1
	9oiMxSQmOV1TAeFyerUPXtH2WCGKDOA==
X-Received: by 2002:a05:6808:d4c:b0:4b9:e5fa:8907 with SMTP id 5614622812f47-4c31b4c5e8amr7737916b6e.26.1789272314888;
        Sat, 12 Sep 2026 21:05:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:56 -0600
Subject: [PATCH v4 05/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-5-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_210518_418234_131804A8 
X-CRM114-Status: GOOD (  13.31  )
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

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
