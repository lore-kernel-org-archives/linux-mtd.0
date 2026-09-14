Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBF8C88E73
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqZvmH6tUk8naS2iyB02Y2qRtGQiD258KYGAFVM1Z1c=; b=03zx6tGKYc2W1z
	Nf5Mk17JHHjFAasLYUjRwhnoHY4EN8c8fdESKtkGOdzzOm2DuxPMzizspQzUYqjvFQ4b/o6ogFeal
	BSLuN+wN2Oizs1c0vvi5PeimBf7uJToh7WTDBU0cvs94JyX64JUsffl8LkPo9D5aLwFiDAsnzQsum
	b4Ktyf9a+xh/M29wITEDgthmXYs6EgEZf+uADqQIi6QDJAZ+feOcCKAdezTwWPtIjKlPuHMRkwMht
	9mvL6W9Kg1oLrWrbF1hsEdcpPGTv1pR4xJRZPUcGeQpWeHaTiOfMIYenwqcTZriUuO9n+pQ/aGXUy
	homE8FLKEWb7NBh0GdKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dy1-00000004hJF-0YSx;
	Mon, 14 Sep 2026 21:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DxS-00000004h7t-3BXs
	for linux-mtd@bombadil.infradead.org;
	Mon, 14 Sep 2026 21:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=; b=nbStNO2rdwV1p1QQxJ9oR//Kcs
	AzSIROq0nVvjPx88PjmWgl0NlBTnVls1Fppj+LcrFMrNd5rLvS0IHnAPDIwSdtTXr6IRPOE2rprWZ
	k2/K2GZwo/qTe7GMNj0vOevcmBzpTHiZXFCqICqi/st2PsGBbb1/4YdlV1qtpEtubG5rFVIMt5wJw
	bOw0fhcGbZoJSoaqQw7cHiMDTCb7lUvXgMcg/76Ed3/2gqgRknwhSPr8iqXmoLwebhrhzWgGWyjLQ
	RUkkT0m3MVLZx9qGCmtIpadlfNoD4SC9IS/pt2LOgdY+V9mdnNRl4TUgnpAvU1/lL4SwIGe3AsWod
	mmSw1oOg==;
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DwR-000000061hZ-0OiI
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:11:02 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6bcc0c496d1so714777eaf.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420216; x=1790025016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=rgshnVV3xFVfNMCJ1m95uj7rviU61bqD2qT22al2JDEyrL7wQ0tH/RwUNMcT7I0bs0
         mHZpC+71UdktsexTJRAQWN27U7FfUtah7TaAwtcxP7I1a8E+wU7kf1bt4VAA2cL/2uLB
         rrPN6Jy7vPNeAWduGUzinLvJuragzmcX4D1yVtPOkiOyw5SjEv8BXSOLwgCNtroPXftX
         OprckQG8wiDcSS8FV3QVcbf1ueOK3aw2V8/ZW3A8AD727Y+OOF/1tmLMLZNhR9LgpBOV
         PJPv1QKNuvlBra5lo+Bap+cNSLiSfES0zs1WWf4H3VoED7ItFPStCb8kICOK1Q22m6wO
         9d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420216; x=1790025016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=AC/8pj9uOHCdHvAbucKD8mj2+XWYwl4sDawFvYCbPkR3gZxCuoPhSNRnllfrEoedJv
         Bc5P1taKJhN3MNFUTI3JA9idAaWjvc8CDq9Bb1YGU5QnUphiSD2m9PSCclIOIcKObYjT
         eOcAxbOLpubhTouyUoxDfYRSpbEUNW76Wn+jAXcsvidaXbWWJ9ecnFItdSWYNdX+9pzi
         Vs6wAcdBxKY4TuaHMYHuPaIcpWKJFVs0YHpvzUqjOLCSdnbBbqtoUgoWNwNIIMyACKEk
         5xwdd2rJLuuf99JWAdVyuMXtbYHGysPM5BC72/1028RORnKWkJ1YT43LzSps3MYaRC3Q
         NkMg==
X-Gm-Message-State: AFuF++nYD9jXmXgONTd8oBaH77gejljyPfh5JVjk2NxEATyax/EO1ion
	4g7QQ1WEP3MJHLzsBjLoCzyyLkGwPszxdskkciMURNd3pb/2CJK1qh+3
X-Gm-Gg: AYBFou0WJqNZGoq/5iQAnynS8KL6kA/0TZD62qP4ALgqNCAeqAHJRRVvi1IRrAANGDJ
	1l+z8rr+S/phIZ1kf4KZs4uC0Bpx1Z3eJAk1LIL6bapBUEuUiaFHOsXs+mUDWLzlWxUA4vO/dPE
	TnxRim04Ym0jvS32KgejYvBOCHRsG6V4kOss+i/4ND1TfT+aaia9h5MABVCWmvcMgvDyiBbPWoD
	Xgoz7Q/OAqMicevT8Qw4kX+0Yowlh7dnKwOEU2+XT29cS07ekWiedT0LSigLe+ygZd3XVfHj3d/
	4Heg3d+TPh4oijN62jw3euBOkPDZrHobQYH/UWE9ldaPLfJa6v85vRM7sl07NtxzyuFTjWBqdbr
	R+sJ1YgCnqjWUypX1nb82N0QIDL0axyiGE8aHhBFOudK3YEJBN5Ejzchr7jJKTiZXST1bVJF4u/
	TblIAPWPsxdhdL4d1REjzY3LFtuFZVrNHWX+VAZ+Hxv6OnqsFSGsdbfFsj89EQRTk/zSdl013Qd
	3UrBr7YXfJO007YpLeYChzNSr44XxcOF8MF9VLUOzf8MSdd28IR6zL2vqmC+JCXv4FiImBeco/X
	RvBOLrBNuwA1u9z30yS5BwT9Y7A5gHF9tc9X1U58epNx+0ZUqrnJpXffw8ZSdrKho23RQV0ntMs
	XPA2dCLAO1nZ1wQenqFjGXQ9spDIJPJf0FR+C+3o=
X-Received: by 2002:a05:6820:8c5:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6c53ba3546bmr2248641eaf.0.1789420215927;
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:01 -0600
Subject: [PATCH v6 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-15-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_221027_219253_C6E0F8F2 
X-CRM114-Status: GOOD (  16.60  )
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8b0d0620e1d9..f3234d2831ea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1435,14 +1435,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1453,10 +1467,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
