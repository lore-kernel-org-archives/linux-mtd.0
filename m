Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC8CCA479
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGT5tdnysaCCfBgWLhQ6vCq5NnSuD7p9YxDU/E4UVds=; b=DjaJeSYo7ZGnxC
	PbA19c4rjrPhuRpQs7fpRt4D+ahd28CuDOtDEPlCR76KudP0mLyJXNFIGj2fHDCcpBlhE46i3k3Eo
	gTwRqGYbo/e8yhq4+rctKIP/FclHlGRk8l2abcNb0q1UHi6EX9WiQhkphQnCcVRBnWcH5ikSoOoFo
	plMAEfQriKukDhVbFKeqVJ/wszkFRAeyBJ5PTY70hVgk6WbgffFcmU4E1RSBCy5DxjCCFiCTHchLM
	f2hMA9f5/CDqUJXVvW/Vs2Y9COqWkMxhINiECG7NsGW7HZoYsKXhdCQkhEDghhC6Zxz0rrO9rX7g+
	iJ3N4gES0m7Ww91fNpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OB-005v52-TD; Tue, 28 Jun 2022 11:28:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69O8-005v2p-2p
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id e2so17127366edv.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+LlLZaDtYyevN2FUYLTzNmH0PwKbstBSDwmDMRaV6wQ=;
        b=n7pPSVPiiSJ1+gdboLLhYJ9f2hGhbzZRAJmZl5PEMUU87GpbDbIYORHNkubL6j125d
         U3G7vvwWc2C/l5ESEfNezHayvDrhVYJPeLDQPmHXW+nXcyqAGxVu4bEwZYSHgzynMaIg
         14hWsOCnf5YzkJE14RXt1lbyHOdu1yL0j4UtR90OXZj2wlpf8IIzBzcwVCXV0n2SqQJw
         ltnorUr4yOgaKyq1iTwP6B3n2r3Z285MWTN0W+q8iP46pBZnXLuKyRHqt88VjYRc2q1B
         5bE8LpsiIAXZAxIGYz+IVVuijgojfzTFg7gpPmURZO1JjWnKCsBbBlAFx6MuqC2eRuFm
         BCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+LlLZaDtYyevN2FUYLTzNmH0PwKbstBSDwmDMRaV6wQ=;
        b=Kl7+C2wUkhrb+cPaFz27HYwRgVtey226tIijHAL7FN3Dr3ozk0yhmw6H/i5mLqC/du
         92GcuJ6v/Xz+HXvCdKWQScghNeK0IAlatQ02HsP2rI4R72OkYwQ9jGMncWhVaiGIB3uN
         GvtC7oOeWi4NrEsYoO332ru6ybItswSVY8d057RwRBTQ/CsEI5/DqG/5yn3/rpmCcbgf
         lTZ0CKdjmrLBMvwsYRxbgy65+fSOa2nAnD0J1Wx8sf/uAE3sQd9SHPb8ZAZ/V7a5U0zm
         zMxu0wNPqok/LELcJ5L8Ya4lESYZxwuRZnjdTkYh8JHt2LlFu+xlLjkXkH0zfFqgEV67
         icDA==
X-Gm-Message-State: AJIora/MbbT456grZNv6sswSBtORQg3Mo0phYhvOtbVqnZ9f9jQFHUKo
	9jwrM18MA/PodVKl6rmACCrngLmHJDM=
X-Google-Smtp-Source: AGRyM1uhgE91nhjR/KZn+mG1jgfNS2BuoAiTS53aWpUhL4EPUwgHNPi54ElTY6ldhaT1A4HEavdEdQ==
X-Received: by 2002:aa7:d709:0:b0:435:6ae6:5fb8 with SMTP id t9-20020aa7d709000000b004356ae65fb8mr21875688edq.161.1656415688197;
        Tue, 28 Jun 2022 04:28:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:07 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible string
Date: Tue, 28 Jun 2022 13:27:24 +0200
Message-Id: <20220628112731.2041976-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042812_161560_498D7188 
X-CRM114-Status: GOOD (  12.19  )
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

The driver which was added at the same time as the dt-bindings uses the
compatible string "intel,lgm-ebunand". Use the same compatible string
also in the dt-bindings.

Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
index 30e0c66ab0eb..763ee3e1faf3 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
+$id: http://devicetree.org/schemas/mtd/intel,lgm-ebunand.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel LGM SoC NAND Controller Device Tree Bindings
@@ -14,7 +14,7 @@ maintainers:
 
 properties:
   compatible:
-    const: intel,lgm-nand
+    const: intel,lgm-ebunand
 
   reg:
     maxItems: 6
@@ -75,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     nand-controller@e0f00000 {
-      compatible = "intel,lgm-nand";
+      compatible = "intel,lgm-ebunand";
       reg = <0xe0f00000 0x100>,
             <0xe1000000 0x300>,
             <0xe1400000 0x8000>,
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
