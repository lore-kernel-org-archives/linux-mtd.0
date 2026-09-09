Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0749C79FBF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg4Ms2dL1UNL3hGsD0OiGDiTsmIxqAe/Xbi7rGoyqoQ=; b=w941iEMZybjDAG
	QvOCQ4d4j+UTZY3AtCmXMjCDdznnuothZWGB1CQ5yyPert4EVwMoYL5OqOFSMsdieTfib+XEc7exL
	r7i6CAAaEqUS7wSdh8dWNDHPEqgwcp4lOycom/+NUPiY4MHKFb/loYoYf0JfVykxjpGa4l5BA9IJc
	gpkyWvgrwUZqg2JwGf3RSD6uaPHnmK1o8105o7zLWmX7qPveEPC1SQzecWam/3yGqQMAtwbbQJFsa
	C2zVnkOsaFf307UGqhtOobmYpTWa+iBamMJamfv71eNKJswsyQpLCoDVofb2q5behdsR3/y1GRz15
	XO1OSsFRr1VMmTR1jsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Diu-0000000B7H3-3rQV;
	Wed, 09 Sep 2026 08:32:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Di7-0000000B6VM-29Sa
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=; b=TLYViFFNA53Vt+AKQHIG2ohosN
	PhOtYTmOtBbU3HZrT0IWrhRp/mSVlY4aolnGTZyfW8oYZvGZizK7vBN5liXoD3l/fPsGlkgtuLpWn
	LOwVqdGKCiv95xamoUDKBg/7mIr7lKKMT6dgY9fp4bKV1dlyafcQWHk1jxVfA3XBy2v4ZMpE80V1/
	fp0EmNxEURwLHG7IusKLqBJC4tN635qgnsXzTdnLNkQ9qdrdlIyACujb6WObIaaPINOkMmsKEYPDD
	G9JQ60JnXYzFN92IJ3D53QWuIxkLI6KeFN6aC3i3DglE8m/0u+qY6Wtu7KZg5TJ3s/C9FvuhxA+S9
	TiNd50RQ==;
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Dhr-00000000uki-44nU
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:11 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so4457634eaf.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942658; x=1789547458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=fPYbb/rttgNTA6UcQCiWQbLnEELbIal//fij4oduB65xDZFsznoFrIl8nNeeXloz9c
         R3Z0fQmUANFKQpys1joBIsQZ1VOb7cjKFWRTlwYvjg/S9fELbFihdrb3UdzstkDEA7Wa
         xe5CNUZvnKEyTDXz4V/9tJMCQ/cu7RLntSL3h2FOH9Pz2PYmt8i/9ImUyrCbumvoOArq
         RTPiwZeI2u9qkz7289ao4voSf68boypwioz3T4057SI5vU/Tyi3RZE3Tn7RFYi95Leeo
         mFSW2pbdPq0CoPLeVSNWOVOU79w2xf2Gt4y+pGiRa0/bxpts8gZNuO9o9QOJQmj0wWnn
         g6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942658; x=1789547458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=jeVe6bQGsZS3Hxe5bu1GNhtgBqqQgphwAJ9XCr2ePVBVQU0kpDrJ7Ns/4G03CcA9MF
         i90gkVIcHdwLd7P/LidJlgPhbgwHA3qDevs4PBuHXid5Y8qEzu0mZz2R6ZHHMVmZYSH0
         /z/GVuWvf6vqRmHVjdrG4dymQiUDkjI0LiVnPmvf1D3g+LR3W37h6nL/zjUaMdmHcbqM
         NVekplnRVodJzzF6QTsekMafRGStXM0P0xk7TQMX3izNK1ujgSrbldgNTzKpfE3JM8dE
         I0Qu9maa3X5Cy1hzBCV6oacgqmlg5OQiDWX8vHC8H3vHTN4gA5i1mXMIW+u8VoVTcEXg
         dLCA==
X-Gm-Message-State: AFuF++lAJzN1WFFux33tj+t0+mqgX8NJNfOy3DfcZpksCG/tznriH/GH
	kYpajY0s0ndIoVH2tdO0J+sULGgLYQ0yhUyJhEoQwGAY2r8GzuTPoIXx
X-Gm-Gg: AYBFou3zO6hS9GK/9iyOJjToREbfrq71J4FWM70+7mJXzUMgVEIrQZWGklgnEYouFnd
	i4dlpBksA4jEQtdmuLEefTJBd3o14gkIwEwwvQ1+J/ZNvbc4M6I3T0zhFBKVEPjfhqyczNIujPb
	8pVX1+4KPBtR9uNeGVJFxtaq0PLOQq0n7wyBbujrHK/PgxKkQ/nsmetlsV3at/QMWKTWxjjS64U
	0X5iuVzcjjm6eTS0MwpjtW913b74NDbCKmdMsTdZtcRnZAld3OZ9H5IKVmr3EGtDtmQFTZK04TM
	WQ9dWilg47Kknh+QlWOO/lsbsr/Vsj6HXi149IwUN0JHYlHH/8lM80G0Hq+aP1oe1kWT1245EJJ
	qp+j8JVrfyB3DjBNwlZk2BYldMkaQX1jYcH0y2T+QtflpyKZjKhWvHfBqH+ijlbvR+ml9g0PaN3
	ovLV4TlC3shlrG/czRh1Jyl7PsdFnACgRluEfNu631TXHAnRNixz0OHn8+o9CdiAsw9maKMHFSU
	vdTOIWsYQ0ysGd2K6foR8K8/2a2P5ida+7hWl9QBBWCp2tvXVcN1Fhe0jQyj1ppbuJaf7eH9MCf
	rl5ntiurT8d37vh7gJVXucc7c4kKPG4qq58Ghp8HbHVRYUx9b72xrkWgEZ63olHCvn3J7WIC7nT
	eqkH0EW7xRgEgHIAANB4xC7Owutb2
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr20147370eaf.10.1788942657854;
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:37 -0600
Subject: [PATCH v3 04/15] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-4-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093100_270138_BBC68E28 
X-CRM114-Status: GOOD (  13.94  )
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
index af8ba2d9f7a0..1bc94565e9e8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1105,7 +1105,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
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
