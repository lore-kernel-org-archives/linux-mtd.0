Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EC6F55434
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 01:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ir5WetZuCiKXXQMq6cKAqEvX/En3vNj+0lXdCgF+wmo=; b=qTl2RkL6tnVdx5
	NCKyXxlFuiE6mtWqQZDP1kbAao785Cg5uEe08cYbwbephkc6N041ST3PntANkddNGV7K4g5kvDcc8
	0tXV3W6ZAstxDJ3qpqqeXpaCxZw8Ob0i40LLoI1+jnq2xFxi8rkJeW+nSwxr29bPK6wIm34ikgyzw
	E2jkTscM1D2GEmxT8hEGZ20wDl240wa/a70HYn5HRBt2h5BSqpu1XOd2fq98pqVSaONkzBf4fhHUG
	id0Z1+1z4sk8QB18anUcp5CXkJesoS6AosYHFe1nfSUfis4qIEe3UJ29LyX2dHkvQM4Ehx7o23acg
	sb+tZwTuMKJpaXhyOmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4BB-000000033oT-3haZ;
	Wed, 25 Feb 2026 01:59:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4B8-000000033mK-0GRl
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 01:59:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82310b74496so3196232b3a.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2026 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771984745; x=1772589545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zvwKD7V2YKpGMLkJEO1tU3ZqnJ4SfaB+coADDuVirU=;
        b=e3Adn69CkTR4rcYVBH3brqL0HJTtkHvu5VoJrKapAPiabQuqovQv9cHXzJqk2uoaAq
         awNf0imzDmTvG+OYG4fAmduiwAek4i2BmarVpj9gRYWirTpyaKPWEHO2dh+TFunGCyGV
         S7f0B1bEI+iPy9UFIcvl/fqdf5VKKzSeij4xMbhJDSuiQxhMiIDJL7RTya2boVbkViup
         eARMwyPynUMtTBy8jknKIu8EErM9C6yillDzP+DyyvjXmIMDrMOkGgjMTj5cGAzIHtIz
         0x//qzErTozX2LKyd/FpHDnHXvfkCuzdy1+IsBfAdyEOV6gBvR2BFGfxc++9NjHP7eqA
         Zbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771984745; x=1772589545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3zvwKD7V2YKpGMLkJEO1tU3ZqnJ4SfaB+coADDuVirU=;
        b=Oi0DcYXr17KxmMHey+WE/x7xFgxLKGKTujZWGNmomPHrfDzWmv4apqA7z2+OhxXEzJ
         q6dkrAJDX+bRaQXpeqv4qc1iUvWFcsv+1D46BRCgK9vHzCUpbd6hcblvbobqeMn2253v
         nIOUSEhZhZoEACKZWeN4v4gih+nIGxhNwEHAK5Anrnz8hMMdTvecgNkSNNd+jeQg3VoT
         kgwD+xyllnXcru+FwaIs0dv8/wh0VjS/mmv2ZU2isyfEPR5Yh3EwG/z2p7p+npifI+be
         XVuCjjkUJsH0V13IArefEh7bOajUifwfPvRzcCk1R/9AP27Rfby4Tnz8XiVrOWDcqhYW
         qwZg==
X-Forwarded-Encrypted: i=1; AJvYcCUnqIONpBkVZ7P7TvfMOLTEoez6KtxqFc8gIl+fezsCg3JKW24XJPHqEXuXHOkag1KKmCnPwvOdfz8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8hwjnlM0pF79oI4hsxLBlZCE9WHG6/cjSSUOZeZmo2q9yzQHn
	OjSp8Sdk02WNY2DlJHFTSsX6JlsZUdkSHS3D7rwULDvjqGOKzZnaIxrK
X-Gm-Gg: ATEYQzyj/Ddn6ianQ2PsnlVb5zQYs76UDIUExQTu8Q9t4Q2rJzLyosLKdxEsLfNMpVn
	Amy3cgx6oVsmh+BbHv4/pFduxuRD5SRTv+ULt4T8lH19qa7EvZWEYloxxzB6nvEfkRXkPl7yQRT
	mzIix2hPjSNZs3bhtWoUwVWU59AohMsGITdgYDC0EQp+OqfDWbmOpUpUjxiyZnqhffBiQ6Ix20n
	UY+KsJAlSpJZgbVoRydiL87+S1HJbq13yUnqBHJC7BUiG2++zcpaIBFo+o7w1xBngpw3onwFOHT
	QgncObprwpI2llUOxA+k8XjKeW/1DVJL9fsnY+jprfyX9yGXRA6Gb5/sVH3wz7QPyiQwO0TK0Pl
	25lXXYt4rSm417tmnXuOwj97ExlKXzG/YKb1oO0GIl7QW9uimftj44oUVghQ8+JMHMbQRYVBbIr
	qZHFOY87lSHSuO+EkLHcynTy3cg0xzmxfmKtFC9SELyIGqVQ==
X-Received: by 2002:a05:6a21:898b:b0:34f:ec81:bc3d with SMTP id adf61e73a8af0-39545f7a3bamr11523634637.44.1771984744888;
        Tue, 24 Feb 2026 17:59:04 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35900700e69sm1002312a91.0.2026.02.24.17.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:59:04 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 8DB204136074;
	Wed, 25 Feb 2026 09:59:02 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v7 1/3] dt-bindings: mtd: spinand: Add randomizer enable/disable properties
Date: Wed, 25 Feb 2026 09:57:03 +0800
Message-Id: <20260225015705.1113199-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225015705.1113199-1-linchengming884@gmail.com>
References: <20260225015705.1113199-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175906_125078_3DC012F9 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add "nand-randomizer-enable" and "nand-randomizer-disable" boolean
properties.

These properties allow enabling or disabling the randomizer feature
via the device tree.

According to JEDEC standard JESD22-A117E, no single data pattern
represents a universal worst-case for all NAND flash failure mechanisms.
Different patterns, such as fully programmed, checkerboard, or mostly
erased, can disproportionately stress specific cells (e.g., programmed,
erased, or those influenced by adjacent states).

Given that no fixed pattern can cover all scenarios, the use of a
randomized data pattern is a practical and effective mitigation strategy.
Our hardware implements a randomizer feature that scrambles user data
before it is written to the flash and restores the original data upon read.

This ensures the data stored on the media is more evenly distributed,
thus reducing pattern-dependent degradation. This is especially crucial
for preventing errors caused by unbalanced data (e.g., all zeros or
all ones) in blocks with high program/erase (P/E) cycle counts.
Ultimately, the randomizer improves the long-term reliability and
endurance of the flash device.

Please refer to the following link for randomizer feature:
Link: https://www.mxic.com.tw/Lists/ApplicationNote/Attachments/2151/AN1051V1-The%20Introduction%20of%20Randomizer%20Feature%20on%20MX30xFxG28AD_MX35xFxG24AD.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 .../devicetree/bindings/mtd/nand-chip.yaml     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 609d4a4ddd80..2559cd97ccc5 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -67,6 +67,24 @@ properties:
       the secure regions present.
     $ref: /schemas/types.yaml#/definitions/uint64-matrix
 
+  nand-randomizer-enable:
+    description:
+      Enable the randomizer feature. This property is mutually-exclusive
+      with nand-randomizer-disable.
+    type: boolean
+
+  nand-randomizer-disable:
+    description:
+      Disable the randomizer feature. This property is mutually-exclusive
+      with nand-randomizer-enable.
+    type: boolean
+
+dependencies:
+  nand-randomizer-enable:
+    not:
+      required:
+        - nand-randomizer-disable
+
 required:
   - reg
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
