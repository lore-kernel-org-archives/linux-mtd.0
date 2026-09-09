Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB46C79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG8OKAidD9IuLpr9/PtXxrbbciC2Y4OJLEG4d8GoCvc=; b=DvrD92F0YO499+
	Rp+l7JGwcsQLLCQzw73++IX0yvGia6q9DotySo83GSjj3+il6LvU/3FRklxRZ8TtvLM+SYhJIlrA4
	8pHZr1sjExP/2tTS0ya9QW8itLm7rov+XW/z+Z0T8r0NkouihShdcsLotqI0DKDaf2ugGndOfIitr
	+qorQc29LHlDnwxZuv2WuoflF2vm8VfDH9Vh1ldnLj3Z3ZFM0VUvDQb+T8BSOpmLD/pP7pELHEKGh
	BI/BHVEXpM26BhBN8gLalcLaRyU72jF/4PRqISSRVNi9CXd1lwThDSeW6byRqjNOXrJ8hfm5fw+pi
	w2d5qL0CpHu0hl4a/dpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dik-0000000B71S-2fS9;
	Wed, 09 Sep 2026 08:31:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Di7-0000000B6VH-29nu
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=; b=CS22lvd4K+124rDy1vr9mgAtdL
	ASiIOrsv0H9ouhASMPH1Bxy4OISsOJclTDTV8GF9akf5wNRCPMNHgBxDRytD1twMPdkyTalcvXZIm
	57QjWfBzFoAytjjacrJauxndIBog2Z7/nANSVV/HUwQOgTDlvwrxTwkJPXV6uYLhzqJY/pNiC2Yw0
	ugq2b9nlB4WSzSLJvU9mhBm/uWs1UyghqnPdgr7cDgEH0WQft//zuHpXgbidEV3ymGDF6Fx5h9ik+
	NgJHndbTGPQ5mhpvXjvBUXrVyHfUjSD0UNazt2gBOIoEMFZ5VepsdxYNNpfy1zq1JzpKOAuoRvOHd
	blAKT0WQ==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Dhw-00000000ulF-2xKr
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:10 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4ab47c40e7eso3470467b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942662; x=1789547462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=a2c0PYCDZTbzwUEcaJGDtUsb/c6+P7DeSNZCG8RVCsjmdgWNlWvkGefcKh3/W4pUgA
         0LRcEzHmFfEBZtcSVyLw4huL1KZWZlUQw/55/fLVZB3jRv/eF7m/u9AwSjshCKHef6ZN
         dOEhc1/T9YATkGij3ja+PazSVGwdO5PPQBElYexUCphwLutU4qhL7LyEPAiO0MPWnbTY
         6VfX1kAmA6R84+gfWD7CbvUxJaYdE9cQ3UmjYDmKOBvaYfw0Mb5xwkEXumDSYNFyfZ/B
         q5b3FiY+bVZsaTQcawFGQUHX4isM411lAuqom1XJl3TGor3ucCnvEfHaz37z9f7kXRyw
         CGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942662; x=1789547462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=Vw8LcXAXkmo23QSuMqqSeav6XEYu5BtRW9/SkzckI9o9PW5LOnq7/NhaPLpPUXF/5t
         E0ih3ow3MUeK8VW4O3VyJruipKF3gKljP8w25EkF6kxBJp1rmf/2ubEKtwjnKy4AcHyp
         PaJWmlyHcZ7qIGVsgXn7w1nHqsenGuXbAYHXx9u/TuM+YNU31XwfHCnzM7uKAxNdbHsX
         X3rQ1yjiKpczvHIOmb2FxBjvtEGNmd79gIBxmn8wzWw0GBz7vQVNAxAiJXR/G/DgO9Gx
         WYTU/DL9FZZbImZjnMIcMdxQRc7Pqho2W5y9IB38BYyLijJPBPQkt+lfshac2SWSvyy2
         mjQQ==
X-Gm-Message-State: AFuF++l5N4pwV9U0mD6046tZGF2N6wFze041ngc6rqFQDQbd1uZlAFdj
	66asscxtW1twgmwDfFkGGCwHYPE95ZrzfP231RzHexJTBE60wZBeO42z
X-Gm-Gg: AYBFou3rntiZ82uOFmsI6zSd+83iWPx1tMs1DToCXVY/0pFyXJqdmH7Rd7UIEGBKh3c
	+SBRZ8Q5d9vtGooyNmJW0Ou2lVkmZlvZPRjqqRPTmXyKsrDTOn9BTGOd7CqAShybSOYSAJClD8a
	wdNw+3ZIxA80fXq2pbHybapfUUW4x7Amz+Lv/Y4+RXZ5AjoM6nP0d8XSdMLnLZx/DHcTfTb2ekm
	BkTDFxRG8tDEdnrdsONkfKeOKOUxClCyqQaIiz6UfPOu+b9vD+ISBfZBh/JB2kXEZxyJS0cXH8y
	kxZJbvcyjSnptuWDHr0xzE0A8gW7tgKdhcXJ66v287a8AiPxNd95jRDzfeDNURvgW64LkK+DGD5
	drzfs6zNOiR6E1qa2anzvYATovpPNxGHmy2Zvj4J55djN3Y8BFGebMMF4Xohg4gdg1PGWlI/fM9
	KupYUKYKViE+2XC9fpmv4oM/acflO9LTq5UxY3/prj+DoLztQskKQ6XaW5otOzQIqgQFdysKrmt
	J8axNtsWCjSfwT18jFEaMSsF1bH7Gda+fExEADm7W2/+joF6TpUbNqkiGBwL6xLsro0KtUM5MJ8
	QDyKWk3xgo4TYuSvAW7akkMwznuu+QZEGXizRGtj7cfW71J/TSzOv91k9+t72bQWM9GzqzsGIkZ
	3jyzx5JHIvplkJfwGfB8d4i4U9rkF
X-Received: by 2002:a05:6820:162b:b0:6b6:f16d:d672 with SMTP id 006d021491bc7-6b6fdfb6581mr30282006eaf.16.1788942662447;
        Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:40 -0600
Subject: [PATCH v3 07/15] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-7-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093106_220297_8ABE3063 
X-CRM114-Status: GOOD (  16.05  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 545da54b8908..16b2b39524a7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1497,7 +1497,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
