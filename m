Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32179E98DE7
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 06:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qthk3GG4AJopCiJI1AFYPS1DBUsPWLRFRtvadzmxioM=; b=sIrv2cgjeI5xhO
	lsmaE8lxdtbTfVAinleRC8yhTO9A5uS4a1qb6tQQmUAmuFtfcAoF5fudOlXlsvKDHjZv0vnYTSf5J
	JIaIKVEJmIp5B29I3gMg/Emoo/foYbtvkDp65qilNOF13Mx44TwyhLwOkbdUU4bj7R+mFWiv3yS99
	5L4ZEsxhZAYYMspjDaf3uhCeJjA5mDB/EApbao0idIo+uSli2CuJhlF6j6c0jgrocBRwHZ8wB3kGn
	0fNAkH8VNtBpqED2lC24q1RhR9GAt/V0N7r4li3yy9wgzvcWKyzEmCI35ZICccE2P+ShE0fC8Z55U
	DRVOcpGA6itNgkGby47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPIE-0000000HHvP-0cpX;
	Mon, 23 Feb 2026 06:19:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPIC-0000000HHt7-0Egt
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 06:19:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2aaf9191da3so25269245ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Feb 2026 22:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771827579; x=1772432379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7WrDyX53tBhhQs9DM7PCsQhtyvoI2GRXLB5HiWYUgc=;
        b=XuSaux7ze+jcKA/xMzV8PW9ACzofpy72ADJg7MN3TIb6sKvaIkxW7ORBzhNohmQRTJ
         txiYHd2knaAk30xpcL94vvVAd/c1mzKev7RmseBtjnQF7Pbgryjy4EZLLvj2R4c91dtT
         JoRMU13zLRA/orQXb/LUM/Eur8T9EChCaE/gjcDotLm97y48VL4MYs96dgHtACHqwF0J
         aPE0hEbdzv6wCKPqT4e7i6JYwUDXJlaOCmTViq18m7PvP63fIoLEN1kEIl4NSgwMinVR
         VQIn4XnKs7tV8ezGFkIS1Uya3lplimIjUID4ySSz1+3FeuywDSJPb+wNVR05zQ14TRxl
         o+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771827579; x=1772432379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7WrDyX53tBhhQs9DM7PCsQhtyvoI2GRXLB5HiWYUgc=;
        b=G9XYje553JxUjZHTQbZ0ef63jt4Pk4X59WcrI4FUH3zzGG53JNBJB82tYtmXdXDIMQ
         in3xfLk5LOCKIAXYLJOAa5Brj/xfvMA8EnHne09iS+vzUEmYcUsW8S4dQfKEKrPGtbvb
         j8pgV04myvFVT4sOumZ7eBOMj/NzCkKUJ64TSPk5yqhacBtml7BOvq8YpCBsj6b3PAAn
         IKCY3QLfNGxVebllbWSb0iNjKp+7NNWRIp6kaiRhrCVMb7QdqHXeGMBr3KUbN2mZukX1
         e9p9KHgL8wLxSWxGO/kgWa6npVC8b5o95Jmynf9uo2Zx6M28vUnf/TTyG8KfJlsHJsRG
         xspA==
X-Forwarded-Encrypted: i=1; AJvYcCWrrl7ub+fTDbUU2Er3VLBL9zXmmiRHE+ZRGys+bu+dHeubbyk+uQpbc+IiquI18UZH8zKBs0N+t5U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1BvK6l2Rzq+N/reSygLF+Cle4zcVP4b+P39VHPsGKTvTyLDk8
	afgE++k+QxCkACO72RYBAtIWvQglzYEt4qukt/OPhsed5GO7L4o/njin
X-Gm-Gg: ATEYQzxiLQ+SxeG5V2FxJZYNrVSJsdWnwLIhrdlLjPeShSoCWJXnL1tH9H5k1jZwnzb
	+rSarRcMPp75y9ELjg0OldinsnIxhOrBhxfH3D4Z2drraHI/924Qs8vAijuIwYcMyaLIOFOWjB4
	3UngbbmodfKP0g8dbS1GdyX717x3rS5VXrUbqtXjw0qvs9HpY9j6K7T96Y/q9FMb+M3o52R7CbP
	m5b/lnqagJgWQnFLTJWQ8HvAu5f47+Txx/dhVkVC6jkos2iYlhYMoyqjD9miHNz32N24MBf8ADy
	SjJOuzpLssO5bCfvXvPtEzjbHhC6no7DEYRH6P2/1SvjORGHsSpsfMFDDW+sjbcaW8zbWI5WYK/
	SO/qC+e5gFhKQbjsAHG94MjGu5a1m+ugv5VhopVZnYTyMNbO0VSqcdQi901iAzNkqGzn27M5Mak
	Ybi/JH55R0jjJAIVswuWLU1bdVRXOMGYpBc/7z2uVLuI2L0w==
X-Received: by 2002:a17:903:2b06:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2ad743e3e8emr61818115ad.12.1771827579002;
        Sun, 22 Feb 2026 22:19:39 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f4a4sm60191805ad.79.2026.02.22.22.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:19:38 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id D5AF64136074;
	Mon, 23 Feb 2026 14:19:36 +0800 (CST)
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
Subject: [PATCH v6 1/3] dt-bindings: mtd: spinand: Add randomizer enable/disable properties
Date: Mon, 23 Feb 2026 14:17:04 +0800
Message-Id: <20260223061706.1027986-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223061706.1027986-1-linchengming884@gmail.com>
References: <20260223061706.1027986-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_221940_136949_D55E0B17 
X-CRM114-Status: UNSURE (   9.18  )
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
index 609d4a4ddd80..09ed2f73ab5c 100644
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
