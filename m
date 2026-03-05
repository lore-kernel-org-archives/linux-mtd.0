Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FF2EEF312
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKwwWK9Wm1hIf3mkFnrpXFBO3ByJVGadPx0/Wb28Kus=; b=IqcS1u15eBqkKw
	lUNgdWCB4S0PCkWm0TO6rsyxvo07ZriF3VUYYzIvZo2nqQKfHeZqyVPWw/MvT8BstUkR7mfCcbC6r
	dKl3du7KSFtPqE4Xw8txwtGut4AD15OdRLWWPEZGNeNUpB7EVL3k9BCHezVqjoL7EHBTcffuIici6
	G031Fq+01Q2O1nCO8+tp3Lt8v+Fym+dEP03XU4ycvLX77hR5Er7Ti5be1ayPE/BTJCiJqWw3tWGRc
	ima3Aw64wOpEJLsktC0sIIb0u0NIzNWEWxmHiHtImkh3Y8dSeiFWDievtI0M4aK7T7vBzCTxG/0n4
	iwRtkaNbfUCauv4tK4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2tF-000000014Je-0wpb;
	Thu, 05 Mar 2026 07:12:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2tC-000000014Hl-2t8t
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 07:12:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ae46fc8ec1so29639405ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 23:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772694773; x=1773299573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajhw8hYpqHjqV3r6yWVus18nRMpwuD8YgLrA+5qE4SA=;
        b=djKOtg2SwrjQVy7p7qeTRwJpBHZJluA11t8QABJxNHcntm+E2zjU1pRTXG52eMxWyK
         XoGXKD93tFmQKMWI6MieNib/91l963dgY45WfzAv/6RhjQfBzyHEaB3U8sduMIsPL3j1
         coWNKxchuUGcrK8nY+yNGkKMiM8zkHSFJtMccYirZiTO+PUhcjZT+iOe2vvBKOQr70yD
         K02QkE20RGTPNNck72WmAlBoBCYOatPGwmjR8FePfI8LAyvUKR+TgtwRn23O2Bxv9GrL
         nbOwae7C44B3ouMkGzJbhSi9qEjVwYAg2pyu20GFjsfmlJOkwcTnGMicxyaD65tRz+Nq
         MbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772694773; x=1773299573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajhw8hYpqHjqV3r6yWVus18nRMpwuD8YgLrA+5qE4SA=;
        b=cASidZ0r+YM6dkSu/QEN0gPeuGhwXYjytE6gErnpUxXXKHANZVndIjIBZGUC7iwhz5
         zKT+9ILEVPimdyUmEDsUJO5r49+VaK0A1j+ptzAlLoaVcHQh5Y7XhQeT30VofWSI0yzG
         E/zpX+nuUvhm3tDMGjHYTgMZwaxyUI1tkEETu7eRvbtiCo81wBkSH3tNTb0+4kShNwSr
         yrTBjPUc7O6cYmiMp6dpS3mroQNOchuBr0m7HgQo1Txp0evBtnmU9x7p3YvHbyHzzYc9
         sWeByR56x0h3/Zau/HXheg1G+YUk28Q25shlrqIzYpedXBUA+8K7M+0sx/HJm9XyJ0MQ
         CVxw==
X-Forwarded-Encrypted: i=1; AJvYcCUgxIm2gB+PMz83pLf/s5NSllJdktWR0DW6EV2WcJRJoXsTO/+LlQBcfPvcps8D36z4fvsmdS9m+OU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9bgCpXH1iYRiJytDr884TU/U/OSPaFLEbe2aaBex4UwRN6XH8
	ZTn0mcF1BZ5NzceY5Ae/Y9ZuatKDE3Hw3fLfmn2pC2WJQHWkklEbVHjU
X-Gm-Gg: ATEYQzyfs0GodMxnBQQlNr8rWTkeAWs3o4rkIyKITZlUTi1CknY+Mp80mxcizdqLHbh
	3uLE1PZNUFiIjyL5x/zzFC+A88xwE592WMsqY+9UGYU1xR4PD7aiC2lPNFdAQjFr+Tl9Qkj0Rlq
	MFgP6PHkzXhzdszmqSoOQ2+mpWG5jiqMAMd2H/fWd5WOHj84todRbTNz+QNRlgcSn/AIU14rq8i
	7hw3PYwu9V+UnbRBBcfNFVnAwOQIW7RnPbUxu2ROvHVXWvyw0gt0PIwPYiU6COtehBBUkK/cCzl
	NX8vkuAgxoOf2bmFhgADn/sJAG7oC7CXRzBYheRdPHEs13wlJu1mkGd5a0sVjcZpIwREtxRKy5h
	Jielnkzqaj+iqYc7nowWtQ2pN7mpuSl6J6rcxgkQmoqjX+FRBXhyosmyESF+mdweE7b7bK+qWno
	8s6TMxrR7/bSmSkE61VvDY9DiqUtGjkKkurX3hFUlplRpgnw==
X-Received: by 2002:a17:902:c94a:b0:2ad:ca65:a398 with SMTP id d9443c01a7336-2ae6abe7cd8mr42850435ad.57.1772694773349;
        Wed, 04 Mar 2026 23:12:53 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a03fbsm283865575ad.43.2026.03.04.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 23:12:52 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B62F94163B6B;
	Thu,  5 Mar 2026 15:12:50 +0800 (CST)
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
Subject: [PATCH v8 1/3] dt-bindings: mtd: spinand: Add randomizer enable/disable properties
Date: Thu,  5 Mar 2026 15:10:40 +0800
Message-Id: <20260305071042.1193522-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260305071042.1193522-1-linchengming884@gmail.com>
References: <20260305071042.1193522-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231254_730173_08E9D4A2 
X-CRM114-Status: GOOD (  10.12  )
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
