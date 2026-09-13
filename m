Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAAFC88E66
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et81aijQkxK0dg99vb01OlhV3IYam95blG9LM3y7A8g=; b=E2XcSS67YAw9t0
	Xaa3ZQP/zrf16KZ3YZFpZVgjaTYuxMn43+ihm8sI3bTEVEzMD03R0eS0afi+Nu8izUPVdOIWOkGMi
	c/oEanDpA5Og9Cw8k92uV35xII+yRQpuw4feIaZh/2GPLeVrWQNZLM8BElmfyV1cUb8CRsQ+hyIiB
	E60oK42kJsfQ79yVlOSrJKIeMg+Gi+vObTEkG8Qj1lwMPx6Catw2qbc0YeBrmYpmkNBZc6+Wm2/AV
	3I60I3BqvETALGeBiNAACyCacxe8VvWn5Qo+O82IFGnaxZAAdZJBSPA0yLy9LgXrKAl6xEQ5M+rHA
	h5m5nqz58VugDKPdcBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTc-00000001NAZ-1e1G;
	Sun, 13 Sep 2026 04:06:00 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT5-00000001MTw-1kPI
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:29 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4c3eeefdf2bso2093891b6e.1
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272326; x=1789877126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=d4sUDyhTAsiLWloRjIeuuIzfsVEWTkAUOsbN+8kU+ssoOgQ7acc9OVWXYKnK8sKeRx
         c8SGSiQRjX6O8BqJBwbXU4o4DiPH12ttG57MeZJoIYlOMFpfAJTOtCoh/LBx682wH0iL
         X2prvS+MghINNSQPhujWWAADGNB31rNvacfHtNKkRYChM4tNGUw9yhQ6QGssCqhLFjzq
         nzBN1fSDw4wSLwatw/u2VF2VnK3aZeG2txkvvNYawzTwCazzbIkBB6gyKOaEx2eVJRi9
         G+2pzds8O+OUgvChNDZ0DxpmpcoH/asW7FXVNt9oP9XHEBgV9mTULAMNCfvkQ0tz9aBC
         Ql/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272326; x=1789877126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=pEthdiLhFjAjqfDLwGhd3DL0J5jOtmScv5Hj2L8b6Onq8AzdTmObz8IIqnqpzrvlNY
         GW6MHt3AFqCf6ZzgRWRZTs5K+ypGZAFd0dEAKUAbAMGEnyiP2NJwlXljDc2bVLeXh7RY
         ZrAR7Z9vvbDoOu9iQH3sLtqydNzWduHKPaViq6DdKiJTIpr1TUrJx5jQFi4R6gU1PKaV
         Ie8jBWHojwzSkWt5QoKzSHJCyIkecGLqNDjHhD3fjqeajhpCnCucKVUL0j1NP/ip1CXq
         8t7oal+M16GlyLyJJnlr5196EqPeW0EeYCUWchvBhXQqKIrAB45JvtrJPKOk/LWk0AEf
         wo3A==
X-Gm-Message-State: AFuF++kcMBiBh2Y4nlSVm/xWmoqnQN68hEuiuEUbp230FPfM7uJMJFgh
	1HicMfV3JZZUC1l/NfoJyvKdTXnf+867LKQICFZ0gKojS2JrudItb1ZU
X-Gm-Gg: AYBFou3cERNXp9HSB23U18ULcVdWfZje3yE4YXH69y9dtOQ8nlzSnwo0lXKO3Gcd16s
	65LMn5cbQ/SnWvlZ5+AbN44VaVpMxDJxk6M+zdk0LqHW2Sdc8j0MCrOB+QeNi7ZBm2t39fnSQ1u
	QJDzfTam2Wl0De5cwkq84psn+chJD3r7kgK+DdLlbngP8HCr6EE2W7DOw3PyAEgWKUjrqTrmoWO
	EwRw40DOxB/ytYpoAK+I/pNMzo+GQgNR5GXBsRjmLFNJ5lnkmuOSXTCUQ/xycGLIg+PWUViEBPY
	pVe36/pMEkDl0vZClt1AnMY0RUSpU/YvNQ5npewuKm6Zj+v0RYsALsiplezpeg/Cuvty5GypPFF
	PLRrWsKh+3iLmvbfqRs8KEvWKqH74VFXiGPU9Dj+CHSSC39WzvKG4jSXcSiUfm2b6JYrU+zCHEO
	Qp1grLjmcC7lophLf5tQxaZqYajPTbIfh4pWzwl6Z1ZrTlPDGOF+y8y4AIwlH5G8C0tH4qRnw27
	sHBFgetaPt9ElD+3LartZynfybgMSWJb7RMcbZ7Zu24zYKQxBNrs00I2T2f/W3lB7DGx3VjVlzt
	GeitdrDktsiqr/bVr8VOKqIAI5Ew9QVggFa/2Nmb8iLb0pHcNUJi7GUuYXuw7c5+6Zum2ZPK1wv
	IuwqlrT+BMUfUqY47TTdYdsuj/DyD6g==
X-Received: by 2002:a05:6871:4082:b0:479:a30d:60e5 with SMTP id 586e51a60fabf-47deb6b21a2mr8028318fac.37.1789272326342;
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:04 -0600
Subject: [PATCH v4 13/17] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-13-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210527_879422_8D2BE99C 
X-CRM114-Status: GOOD (  16.34  )
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
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 97a4b4470dad..5fba3c111a4b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1424,15 +1424,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
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
@@ -1443,10 +1456,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
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
