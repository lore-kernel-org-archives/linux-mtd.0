Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA5CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRtS04gM27rQIBrvTgc6u+uMcFih7TF5JYzPOwOt80s=; b=efANoWr6tG/pQH
	ybVe39H6+CQ4ag5F5em3NVYPUL51vkgY5osq85UI2EW9UY7LZ6lA6yqQVZUcF+76UX+x5gOqkJOxZ
	shtbx69FgXLs+lv87p6Lp8SOEY7+Xu559e0vLonyFSqeI1P5VXIm6prfDt9ZIxmgASgGfP36qaU1L
	f7mdN9yzcF+yDiUccWcMxqDSc3LljmOdWi+uSkjSVRmyZZEOe8dnEtwRbNft7Vu0yc8FL3loAlhPt
	G1Bta9M8m5Qk9EYMCeLtvdf4Uf0hF4jgR4rOivIML4Dc1pQztuick+Unaz5aOcNEX2mDFDza9Wwhb
	Rk04bAvHLG6i1c2TBtaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtB-00000001sYy-27GS;
	Fri, 16 Oct 2026 03:45:49 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYsz-00000001sGz-35ca
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:39 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-823e4047037so4571184a34.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122337; x=1792727137; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=jVF7I8cLcBZOtTRevnx0qPzn18R7prytcvdchK9Uy0CGvJkyT3lkwi6QVvxDnvCb66
         y9PzpBo1wffoNhKIe5115eLBTzTVEYBNBYy1JSWM2F94efboZ+za7ODxg/i2opSvhqBd
         8Q974+7ObNXt0oENzc103aNYasakywTl5j0QIWkBB1MpLq+TK3lsQDluuuHAb54MwFwR
         T03cwL2LxvLMhrt4cv0vsBniK3DlM++akchfaT68nK0PnO9hRnHPhTxvCfxKyWpzhfOK
         ZEFCRH8e08rwhpZaJrJxwsmcd5ktPbuUEia2wxqLTf+oEG7duXcDTkw91xqtuwfitW/h
         0eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122337; x=1792727137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=i+BTPKgtCK5AJezMmKNHod8mFHX/dq1hDXsGHKQXjKflnxDvgGtYKNgKa6viQ3wdCF
         Ciu9I1Nrtmf/VRhd7Lrb8SSIyrJwd/ym+EMvXuxgdmJ77U+8b84DEmcP3M0FjEctMk7U
         dDQbjSc7fbDHgbquGmC/YS8IRM8jSM1QJA12EWpYyzIYC3/YpRZxq75uPffY6CfEsd3c
         Ikqwl5wZFYoCrAaFqo41qOzFlB8kIH0BsrzKOpmvkwQk6A+J02j3cXWDKbx38tu71YoL
         zrkgqn1pfwuJEvzuAyhhJovaUC5t5oBCPvG6Z3WLarvZAaYmjcUKSZVIVvdW1LFW6UX1
         Vc8g==
X-Forwarded-Encrypted: i=1; AKwUvBzhlNDLxqSB60PWWaYkU/VrQhiw31JbibVp8DDHX797ZNDdwuZNeL3x4S5jEOZd3RbtkXMpTilQz+s=@lists.infradead.org
X-Gm-Message-State: AFq9FYIdAtC4eK+Di+dkVCVIjk3+dZBFni8ZAivaKyttowCT0jcrPJtC
	6mR0PCTlzGPUfsj+MoYQktrFCJfpyCxxqGskFvwUCu1x2PLsXIn3SZUa
X-Gm-Gg: AYBFou3KqeK9Zlzfd4F/bMTAzPHdOEYboDYdh0h93GuW62N5mFLV8T2Q89GoSz8xMJH
	diyze2V3Odskwkr0z+zm0H3f5qxGKvAAl2FoVLs8PEFuvK8h2liCQvoJWwVux9FehveUC3wek6s
	MnoI8Kp1bflBUZc3BSUIKbrnBz0+KY3p/CtwHy1Ygn6Xg4ySh8k2beOJom6FwUACrJFkCBrPsMK
	e28XpvzAXIsPWP+7yTS5rjUCjrJvNaAFDj+To+KxmdoEhrsE3dtD4lTSpF+sfGe+t/BBZe+p0al
	aZJpWjSkNmV+AAvNCrs11WGd6WTgm3VwXLvKxOWs/Nv0okuOBatOu6R5xKXBI8VuhwDc0wgQOXv
	NJ3qHTVJDUiHsI0R6nqwlr7NVePccM8QslpoKhWABlzuDKUgik1xW+6ZzWU2YAHY1hjMr05B4Lh
	L4bMYcrj7fqk0em2IuMk0AaVQikGApYEBO65P1JsJgOBhjP+NlS0YvgfhetApycIKaq6LB+ZjGl
	6oZzkuS+wgmHNA6Mhw+/pzKbwA8+COXrMTuSeokY1lRG0Pz99kac3TN9GP3/I/xuAXLryfUOFH+
	9uttIi7m5ey8i5okXv/2rjqYKKHw/eTOGHawhvNXB8+E4lp1nIIsVmeLOOSeZLale6KAPUT1236
	LMGoPZM8aCJODzoBp3scHqg==
X-Received: by 2002:a05:6830:6a14:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-8309814bd65mr21830521a34.29.1792122336679;
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:21 -0600
Subject: [PATCH v8 06/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-6-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204537_812206_BF013720 
X-CRM114-Status: GOOD (  14.52  )
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d71b980ababb..661ced4e07de 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1108,7 +1108,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
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
