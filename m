Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF17606A326
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i5NdBkgP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2aInR3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KxHxzpNI52x6jntyPxIk/OF6Xa3ZCSAuOzXla571fEk=; b=i5NdBkgPMsqbg3SKtEzSYClKyI
	vd3X7qIkMbJt5rQ80rDeMDKu9AuqWPEa1P1h+J4iQDnkTyMk0MA73lgPWW1LiM353Sn57oQuIKHni
	cFXV5PjTEhklmSS1Z/2z9ebYbWxd31c3Yb80vYaVYpA7QKewQZoWlhg7xOy71dQvu5cO9bXMhzyd2
	jzqviwzTOI+uVHbujcXT4bQ1c2bXOyAMeuqkGTq7gf9t3Oh1Ro8IxXQ8VofK7KZ37KQUHNespdRIi
	3zMquvyLCxaQUMYEgEP1oXl3tmOyjdcIbKNuZt3Jyktfyx91L7SSmSAPwgoks86Y3UvmAe43mrfwn
	UhPWO+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2fb-0000000AF5z-2oHe;
	Thu, 05 Nov 2026 18:58:43 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cm-0000000ADKd-0qDt
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:03 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6f8a519e215so1084202eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904947; x=1794509747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=x2aInR3cevixV9yM+0W85z/n3GzNe6sXXmZeN0CR+e7xfoQUGzvEOEJBX1wmfoDFFw
         lN1Vo1KeC/10c+v6JBll6yigPkhZj3gYQ7fIv92H2zJxiz2veSfL7hSrTN5vojT8FFop
         CrArlvgn/4kbp58WVF3baLVZwlzKcPfT2nBpObDhFHr237DM/N1OI1QIGEavZeglavVc
         LhrUJ5OjO2mUXh87usQnltr2eLvRA1ofdXViYo3d7dRIzQdbCYbEDRD3xEL9Zt+2HNhr
         yG9tz7aI/nEGCRBXrMbne//XaHp6wnQbNRdA5pZzddSjvaSLnNHvPP0wDJrkD/POWuZ9
         eKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904947; x=1794509747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=lTE00PdbnawOTaJsD+gfYRAKBKs9hU97E6NA5dNF2Zk0kATwRcPQHWJB+/lSpFxsjY
         5CQwNJ7okvwW/wkiHpv2F21P3WWHvjVIi9zGkwSPTI3iWHBrTlr3rAFEM2hgbG+arJZF
         HCbg7OGdrDetYI5NDJysTsg6Y0sEVtBj6XWLHdhSLUGVpbokGXfaRrsr0gNnZ5b+rwBx
         65Gkp/7MAh+VkCvMEKApdvBAVbA26zev1CGAhAMRAsLZMTbEzvxZ4y6G6XDX19VDSvR3
         VcKy0bTlPvZRNA0nqMdbJBuOnocy1E3Fw8sQV3opoqvSn0DHQuej2blBS6yBQ3veBrJy
         yfNw==
X-Forwarded-Encrypted: i=1; AKwUvByABY7LvLKpreQfqKmYBMuOMNa/5NjUX1/cC3SmxLKieSvpTonqAaZnYCQD8n7YN48VRvcEpPOoSM8=@lists.infradead.org
X-Gm-Message-State: APuU4Z8snyLX3jP6rQRkAIOUS+qXYkoIXQaGmW47G3LfwzIP5JJaRdHU
	B86zN0bftp40YTVhjkvktmMgKLDEBBNfVmfgRDljGF2xY6ljZoDYR2Cd
X-Gm-Gg: AYBFou3jBU/ldT8YLa4ZtTqnHvYlimMZOExhAk7TF9p3/AdHwWaqTZwCDicPjEeNEGa
	dV1S28AprVnL7Ao7zaQzBQGkq99ZCYiE5gU8FZ+DMKGSe/hsTrdGd+ChA9ppEP6qDZCXMlB71CV
	yHAi84nCEBxyJ52lWmFr1jvgPwOQvYyXk+y4qXzs693iGDhuxDXFRUvbeecnX3+q3Wl5ezJsUJ6
	WoWcq9YOsIkAa60hWVboeby107QI+ndueafRYhRrb2vI6maFpzR+ld/bUrFIEs7eJRjkVx7FT5f
	zKoaodySiuEfI+0POlcP9KNVP534iGBVu7qrN3MMIkYCwUFZr/r9ZaQ9ce4504I7JZb+hREePWV
	+OP/Lqyu5pAzav1LHB0IiWSDg1MQCNcXwJJqYhKqWYB6QJhNJSVnUpxxyFigmprA7w5G6mGoKnW
	7nx44zQfZNbhkL4MSkqpIsyv37sUPS07JOq3Luf4HThlxp7E/fZPBPt2P0dPu0Y0iS0HcjfPlnc
	DjYsywi8A8Ha2m5Ct6GH5XdHPiETKIuzAvspmnfr28iVXRZa+5UbobxrnPvI5Kq8o81WNd011/9
	0sR64F86fOsxQv1BQlB1sQAIYWq/2nYa6732zDzcUKMd46q4rgImSORr29Q1ijeDts3ZBmR2FcT
	MClA5ZbJww5DAuPSw9W4HWcXziDmjXJDGyaRr2IoLUGAmOPyKgk2sYSEswtg5aThvHDAr2aTv8p
	DbdUDd24kBG1mQG3qGChHMmxHdnqs+EfMUt71uLOXFq/QzSZdXz4Zw
X-Received: by 2002:a05:6820:2308:b0:70e:177b:eafd with SMTP id 006d021491bc7-716e78881b2mr244556eaf.16.1793904947324;
        Thu, 05 Nov 2026 10:55:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:25 -0700
Subject: [PATCH v10 09/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-9-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105549_734523_DCDBA819 
X-CRM114-Status: GOOD (  14.69  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 02aa02d2cdb9..e952d7f6abef 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1125,7 +1125,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
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
