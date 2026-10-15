Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8636ECC6B2D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXHgmKLfx0E1+50Ay/MM1dMyQRDq2zm6YgQDM1NASks=; b=dRpXm9LZCiA03B
	MGSCxtYH3jHvkpujLkBqJFigJVD43WsFziKQuXkN/mZNZbwhcjf+WC+12UEqxLEsTAnbO9JiEC5IK
	B+j1w1JuAg/x4EATDisa6eOyhPzBQgvPy5Q+z9/3814ke4TuUt8Jgk58FIKVJ/aqGZ1ORzElhvjOk
	d+ky8g1QipQp6ypVF7shzxKLmHJ/QnCjZIT3eiEExJHb9MlqqcYQT5avVPf5aXJt2N3/gRtxufgNp
	wFTSKUc6TWcciG6HUryrMv/A38k1rgLEGUc6ldKe90Dp7YvHgpwJpvBPfjpEj7CcyH/9FgvtTBkEj
	AZptzkxbN9CkhhkpxXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMZ-0000000GYNI-3MiI;
	Thu, 15 Oct 2026 01:34:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMW-0000000GYHU-0fUt
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=; b=lahlCQWG9/9KYbSHsPCY4gGoK/
	Dp99l8++S3BcMgJULqgI/gYeEUbtgZrFwSBBT3MS498nuuY4c8q3nG/4B/gVwzZemh9Vr36TltCZm
	AuKPVSxpD7C4Ym2IT+6LrQFOkQBLpFYz7tKAEkd7gBZg8SXLhISLqZ4BxCzM7eGg8xKoaicVB7WMg
	CNRHJ0m9aF2F396PzVcEeHGrVqj+VCl/WObjpaXcsz3/0BUBlbovce/YR2TCeHQdihtJuzf7mXJvU
	e8z4RVMH4xXueX5gfCPNX4U7hdzQKo9FfoupjZDBhIItx1YZ34dW3DIEL6iS/SH5lwE//VOxGXJTg
	V+MyQhGw==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMS-0000000HLWn-40ia
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:26 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6d68de53053so2032450eaf.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028062; x=1792632862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=gZN/a7+abz+7BjZoY8qeDsa+zaQqvccgPqLXCfSNio/8gVmglSDyesAtOxmoZ0cv4n
         enFIw2GUGtu4pZ2Xztw+FYiuKCbmQyIi4m3e9hNNbK0uETze9GA8em/UXHX00MXhbPj3
         9ibpKdje7hbhfNj8M6M5UgAfV7DeSOEdP8E3rSSG8kAskMh6UcxSsgHkHNKaWzOrVJcW
         0ZqRTEwch26M33eHZj7y2BrF8GkZDxzXacwJMl9idreWW0GLnOaAWRhFXJFJbMWkeS6x
         XNZ/HIo0Lw2d0bnkSap8qGzp3GeCRjaDbtCq25MlN9YimTrH6gjOcjfTOpMvekdMZFEi
         tctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028062; x=1792632862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=q7QYOM5axHuM4yymSEtwTWh9lIY6x56JGZxfNYSsGb5Dwoxm0bqMYIuHDc+dqAYQ1X
         S1fDruPtFOnZrlk/WPOqeVR3aH+vBdAFSPDO3qoecUTpRxMjcRP+Rsw/hPLPwf+gacvX
         MRLrBH6QFNfRSYbQOVdBy0JFX5ujB1S7QSzf6Qr5gQCxKDVAZC7CVsQZpFIbXvzQFUbk
         mnlW+c/4JH/mNOl41b8ABVzTj1OvLa01PtTG3mzez93UMbDxWN2szP0H0QVT2pksgy0f
         7oH9/X0L1iEr5/zqFdt0pRzvWtGu6TXJTKXb00hRX7gLv4RVbaA9coDbRoNJlBgGsZjW
         RqVg==
X-Forwarded-Encrypted: i=1; AKwUvByM9I5hvnBNE30zPC3KSg3PMl/O9WwLUSFi9vM6jam+QWZHnqTh2o1nM1mIe+2e/ImXyiJc7Fu0d3k=@lists.infradead.org
X-Gm-Message-State: AFq9FYIaJewyBFynLY42fgDKbkVW9FfuSc0PPKUkm284Cjk5xMWQSoVq
	mlpXITU+KL2/ahtQ1ZiI5WjOkUaKM03gV5tvXe6luXScmN04GX3O16vg
X-Gm-Gg: AYBFou3Gobg10GkM5QCgJYnVvwQpIc8JeAsOz9UDsUNOqPlyV4pg6p7lD8ayQX+CfQy
	aP+6VwP4gAw3nWESZQEwK/vl0oBCzUwDv97XNJmKIxwelGtZj0zMldpm1SKYZbI6c/VHXbt4I9+
	M8lPL287Ct40L3BKm7yOX2atcOq0vf2jESjaRaYDlP/cJE587ywI9tsBqxVrV88qNLJSgRp2zTj
	zvQllBhcvTkMi+pIb7wlilDPFla8VcW45LsUHsm8NBUcGGHIFBz4fK/x77uQiuEybSYheH7AbBq
	wy9pD/esb45qIQoxEwYhGNwEQ+NeuPneCapZtw5vTaxlB1Vg7bX7woQ1xSpgOeHdw9XNGZ0RN0d
	CqPPf+27A/eKhrCKT402WdR845msTfb57oVE6aIocWp2Qd4Y7elO1aAgqbT9Bv9vriekdzSkPlB
	Rafn3IAaPdKdrmcHq+7a/YfJpp0FHp2lSWJCXLrGmk27Ov2olnli1fjxI7ohGyDz08qpNIHeAtU
	zesNWYU1zs3cOxL+gY33PNaZ8nSF8/33SzzVBVQbTZC8AQ7vt6vUuzkTq99zDxb+qxe/Af/FPck
	tr9ag7IWbr53kdVmXHXCUJrbV2DJHdX/aerreioI+socsowb6aoj8evfOd0xlOgquPqh2jmTHTV
	zmcwkwjawXITCS/azX+XB
X-Received: by 2002:a05:6820:1517:b0:6cd:3fdc:a936 with SMTP id 006d021491bc7-6ef1144ff66mr12723501eaf.83.1792028061915;
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:53 -0600
Subject: [PATCH v7 06/16] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_023425_294184_BF0F4B28 
X-CRM114-Status: GOOD (  15.62  )
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
index 57df88099206..8256982d1d56 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1101,7 +1101,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
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
