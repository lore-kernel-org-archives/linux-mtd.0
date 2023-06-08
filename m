Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9AFC7EE2E
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 04:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFHD6bDm7X/++VPjwjRmAo+qlSDCR5K6x03FgybJ0ds=; b=yMO0KCOiBF5mlC
	kdPr0USI3QdigfhC+mzYPKuQBiq8aUputQ35oyN1pHCV4p89tf7rTZWB+9AkbqrkBdfk+hQYs041F
	hxm5qafnMK+G/nO7xh3l0KyJTT/XVuvj381n6WJsnS0lB0S71ZVdpLMKimv9pzAAJapYld5B/dhj5
	VdpAMesPYGYiSFG0nB8eqWHgl0DDThPgcFcEOPxjAlhi6nhvgvzD7Gvu3s164EuMsBF4TTKTdCyXy
	M+zm9dFyXEdy2I1ung9RbmbeU3eCQgkebkNEwdg8m1rz0imEWGDwNBJLkhlsJF4/9Y59erNYeW/7E
	kVnib8hdUCk7w3twMw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q77db-0085JB-2K;
	Thu, 08 Jun 2023 04:52:43 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q77dX-0085HR-0O;
	Thu, 08 Jun 2023 04:52:40 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5F0725FD73;
	Thu,  8 Jun 2023 07:52:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686199957;
	bh=+mk6QMFbQKxezimmeq2ZZmLw+GO6C96cbN+kUV6t/iE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YgQjyRS76ZvjsOutPDtCaVhfE20Wr3qL3BNEzD1ncTvBXGTbDVLzVbm0rlq/EqmOw
	 Qkv1p95hubLVjGWdw3LVIJMgGNzI36/xIRs8nXJHLiJz4CVtY6d9CjGu2qMj69Nsfu
	 bSVh6LA8jKd1lgLawpY1hS0BuW3g2nq7tmnAyamx+3IPDFKksquaHZKRutcOUE3sNQ
	 yzLa+SCOhmrER4HDGl9lntE8ePandm4RAvEKgKRXgiFTpygkxsDZTAgnYrHh9twYXZ
	 J6gA+vutkYarf2moNAQAQ4riNC7myuYqUUygDNf1aVudvxsbV8VAEGbX8DTNFbsa4a
	 2hH8pI3YUggqA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 07:52:37 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: nand: meson: Fix 'nand-rb' property
Date: Thu, 8 Jun 2023 07:47:27 +0300
Message-ID: <20230608044728.1328506-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
References: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 00:23:00 #21457426
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_215239_360536_00CB070B 
X-CRM114-Status: UNSURE (   8.54  )
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

Add description of 'nand-rb' property. Use "Fixes" because this property
must be supported since the beginning.

Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 .../devicetree/bindings/mtd/amlogic,meson-nand.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 28fb9a7dd70f..3bec8af91bbb 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -58,6 +58,11 @@ patternProperties:
             meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
             meson-axg-nfc 8
 
+      nand-rb:
+        maxItems: 1
+        items:
+          maximum: 0
+
 required:
   - compatible
   - reg
@@ -87,6 +92,7 @@ examples:
 
       nand@0 {
         reg = <0>;
+        nand-rb = <0>;
       };
     };
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
