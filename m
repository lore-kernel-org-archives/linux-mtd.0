Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851C8CCA480
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WN3Y7EulrqNwkTbIbiif4Orf6PXGHwWhbvtwXBVodk=; b=w7gJt1n6onUNpb
	3aesNKe3VuJNV3Ydqqh3GH/IV8piEk0o4eLgjj8I/fEPyrMX+laRyoYW4mWFZGVZ2nEHeOj/JL3im
	wKXE7M83/DPrwMOxzNCCWPALrUAg21JzAY3OBRdzl0q7moyoeouRwq9Zi/ZN3QAB0hNPDIv29j7JP
	QqEO+Lc70yyuBkFck10I/IdTjYp8Sn6MtaMxdWyKwQUfobBlyZTgZnkPULCv5aW0hkVQYwcybATOH
	EO7myXz1IwpjMGkGSztIM4OiJMeMnW9bJZu3hI6EfpGhRqiMVLaeQ8+L7VapSJTP4b5v05Bo8tqYZ
	qTex2X7jdVt0gFjU71GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIC-00C93g-Ss; Sat, 02 Jul 2022 23:12:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mI7-00C8zH-C2
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id z19so7116210edb.11
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=id5EAPhh+vCKRnSjZnH7hfilYjwKLu84ggjPXCm1/G8=;
        b=nqQ/bOLiokYQHiRMikb/oKWZA7po0z9WQaPyd7gHXSxKhnxKZwj5pbqWmmi5WyvTWa
         JuR1x9lISJwH6sX5265PcrMon9Q3RYmteK+hoS7l1kUAEfRzgVSxDTv3/pOzIlBYSq7k
         PGHHW4RUdqtYE2ai9jd6BZDX/KqtibFqeoVQQKTgUwey/+YSzfCxmD6rin3sgPo96oIV
         HFx06479WhIXrdj5ca2y2fQigIs2mDzb9r7nrrdu6kY3UCYKgIkR6hWrMAjbBxkzg4Ea
         oKKliTVTmdIjEfJUHBXWXNOJce+hSmqEYLkX89cFmcbdHmjVZPAi6NYZALT4lpnRYp4Q
         rKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=id5EAPhh+vCKRnSjZnH7hfilYjwKLu84ggjPXCm1/G8=;
        b=hx8s0P3PnusGWREPz6JSAo0Ht3HwZ7nUTcquE0imIhyRB0RWElUgpjBfJ97Na90IUw
         tmzGhRlARtO36PWtaM7aKFNfvj3v+HubG6PtE5vNYdnvZoL+z3w+4qJ2K1LVAqtVoeD4
         tGe0wgNyRik3erNVUZKU1EUTzQlknBrUtw6+ja8nzd6oHVIOPRUFll3EEsoMq4z7/7lY
         zTHiGnyUdmHSycCSG/pfX+Hp5y7GTc9Cm7k0lW2oUF/YbWPU7DKaf8VpIoe7J/PKs/py
         pFB4TNNkwSsCkUy3PpvXwAJ4rpCSUaymc8tRzD5cnlc4iPaxSC0GUgVfHTbrGfMoAoaP
         sDNw==
X-Gm-Message-State: AJIora8ftZ/yjTDsxcxtStRJTxsT85FWrmDDbCY1U/XjzCI6C+h1O7Vj
	GoWOBCzCg1zxUuDsD9WgQFcevHfPlHA=
X-Google-Smtp-Source: AGRyM1s+PfHINkPK2o4Y9IrDNSoTxUsuRjB6Y56Vre6odL3SEEJp4RM55pYz5yPKUY9OP6eBFSY1pw==
X-Received: by 2002:a05:6402:1e88:b0:435:bf05:f0f with SMTP id f8-20020a0564021e8800b00435bf050f0fmr28367231edf.2.1656803561139;
        Sat, 02 Jul 2022 16:12:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:40 -0700 (PDT)
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
Subject: [PATCH v3 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible string
Date: Sun,  3 Jul 2022 01:12:20 +0200
Message-Id: <20220702231227.1579176-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161243_445345_304DDED9 
X-CRM114-Status: GOOD (  11.17  )
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
also in the dt-bindings and rename the bindings file accordingly.

Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../mtd/{intel,lgm-nand.yaml => intel,lgm-ebunand.yaml}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/mtd/{intel,lgm-nand.yaml => intel,lgm-ebunand.yaml} (92%)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
similarity index 92%
rename from Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
rename to Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 30e0c66ab0eb..763ee3e1faf3 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
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
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
