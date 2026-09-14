Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9C8C88E6A
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW1bYtC18dbvxcxdecYp/Kw/PV5SzAcZ5tzkUT5gTUA=; b=o0xU//HGfdPi08
	48knVbAtwIIdYrMMbXlNZOdYWzIcRiu6/3+WnQwe7PJ3tZohgCy28qV24JE+RFY/Ehz1Eg/XaCNqC
	uxF37ozrF+WEGr+zl2ELjjXAi6AyaTKzLoePcRFRX6o7JFUSGUauzHBdH60eDQS5BJu+jPnYSrEp2
	e3f05cAYgzH6uu7fa1VRzb3cStCdnszBc4pQKFF3DeEO0Ur81oYU6lu3PQS2bglHiBdUVzyawyQYU
	Vpt7AXuuU8qcHpzpE61TXOvPTIlMoXEk3soHuMpp978ixE5zQ/aQQApZdSGuQVmbyTJvVg5kUDkNS
	5tGcrR5v5Iu04BsF/sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx9-00000002Co1-0iPZ;
	Mon, 14 Sep 2026 03:01:55 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwz-00000002Ccn-0pyV
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:47 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-7f4f0d298ccso453926a34.3
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354904; x=1789959704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=Q4vzQv6pWUOrfnty1o/mXybynBRHyaVbr4gdlrvDCmd8xQmPi2YUm8j9/A3GDODtWi
         6eK/Io/2fSJ0wZ5ISvEdRWfzT4+ew4gcLsFe1UX63DY+cK24mqhy/un+PJMbWPo18kME
         g3Fge0f7C/jXkqpKkaN+gcvEkWxMWJYNC9VD3EfOnqmcDrKU7CRubX8CZDM0ksg5e8LH
         Gc61FZdtB5d92a3ZsGDCqHpJUc2w3lHo/VBjZa1gHiReIcVgwuTi5gSRHBQltSpenEXa
         UN5gGk3fOhTL10Zgj8bj5D+Q4g2Nw6x71Qge8ngiIkgoyp77c+GzLOA/fUatZfVVSzmK
         AKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354904; x=1789959704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=RaugaauHcIPNacIzsLzQGVUnXXO685KDJ9hXmU0iRQzphCoK1Q7aMW0/8ykzKxLEpI
         OuhfxemMCBBX5heyHhdh9zINJiM00MlWisDEb4+tWMOBbCfi+WRqsuIDsc5zu4gVIMDz
         by5sli2wKLvjvQZAkYDXvcBJJ4Pk6+8JnIjg8I7fQu3efFyysSB1yNDw771HlQ3RV7t/
         CwlJ/BW7fCJ2dPYSytl3Di29y789m7/Cjm8JON/WVQwkusrzDwoJPSQi7FwMRjMeE59W
         L+PE+FAI/M2X/H1ZDbwSXvsuk2lHGaMOkYHrE10frxycVDKHLXIK4E6dq1skrQ1o6F8j
         kNlQ==
X-Gm-Message-State: AFuF++lVawXAKW1+hUiYi72YZsI68TtePk6dUDZM+3I2YFUMgyBpGGb3
	L7eRzNxfODwPY56ODLIDn4zdrK+QZp3ud1FTTfBz7k2VNXYEfRgMfKXi
X-Gm-Gg: AYBFou3+6CyZUKHGHxAytg/XPsb0x/4L5/wmyFvbqzTPb9xG7cj5P5L9MFKVFp/d6ro
	tjZwPUzMY2jSIHeyFhfxneU9qNt5iWSnHaR4zim3Rd84wOE2SsVWZeI/KJg40Io0C+7QwKBT7hA
	TgpNI3CQP6uwbZYmRI5NHlwjKKZnbcZxVDp51Vdj/9HidalM0336puFDu4AcGwPHUeHq864Hz/e
	UJkznLuQFHFE947xeH5ECSi9CWpTX29Cnt1hjHACmh/nw/7P0x8vs9W3dVpF7HDGIONG6hkCpO8
	THHKsyUgGDZsCjZA0nOItJNdnP/mvai+yszt4292jseRSV8wBau6+iGMnmENcN1ZiKxAv5dSm7m
	2H6++fdYbVYZV20aGDK9oq9s4o4BK0ClNSH1eOPCCQGCmsIfNiTi8wh8xBcYSvQB+19xp7In04a
	l27hrnK6vT9Fl2NHk71MTs1piFPydRmKgENAFEXzCDdnp0/a7oB7aS/JNU/TkXXyyGQbbcQAu2Q
	eeJ7GrSXpqtglJTrmRNNGc0ESGTnea/Omv3zpCvCjkpOt+GLIAA/ySv6okZqd4BXwIjTkhwDYBu
	JAvALRog4VXEGvT0gbtnynGV/DYL8NIQ9V1OKGIOiz6BZTZNeXdQlpfK51cNWfbPPrx+XAKOLOH
	1J+/BvBmXRwpgLJJMxODCtRMJmX9D2A==
X-Received: by 2002:a05:6830:67d9:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-80897e81b85mr306525a34.13.1789354904353;
        Sun, 13 Sep 2026 20:01:44 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:11 -0600
Subject: [PATCH v5 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-5-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200145_308010_0C280708 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: stable@vger.kernel.org
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
