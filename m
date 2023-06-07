Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE6C7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+cC8DP52bXuRFFASkMYWjh0c9Nlv87ozw9KMlwUsV4=; b=j1g595WalTeBsd
	2oftlRLxclCwLUqyAHm1zG12Kpx5RUy2dnJ0/E/BZXnJDgKeUyEe1XXO2AePkZqumjuvou6Va5ryV
	D/FCgJpErbQcZY8pG25p4idQ89PFxNhQju4jNav3tcQPhqVyCE3jZjhQfkM16dOFGoRAKS54z8cE1
	4zxbGCJmzTwx11QtLEtFlm+OhCF3yTv41QntkfjnZ0ObiqTewCzfy+ft0nnZh6VeVnyAmAlksdu2k
	imazNuWZiyLT5VROKR1Gm/1UbVNo141y/c/AG0/e70Xr1jwIduM88w7zo6RiAOkRMuw+C8VLj0QlQ
	eEHS2d5sLtL7czg7CszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uZh-006JV5-2i;
	Wed, 07 Jun 2023 14:55:49 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uZa-006JQz-0Y;
	Wed, 07 Jun 2023 14:55:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 640A55FD6E;
	Wed,  7 Jun 2023 17:55:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686149734;
	bh=U9i2MpAofhmVrSts9crJe3nZM1goUPauyQ5gouoZzl0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=s57s5efWsk9NOiD+KAYDOXGF/q8x5aGCIG4ANI2YKDcKc9aY37flH2jkDLQtBR/Yu
	 p4zPuJvClZvGNS9ru9JeCrmYuBhMnbY5PGeMLI/0XSZBATat8nVZ/+aI/BHUFdHqof
	 sCVzZF96ymBUPZwD5N8YQkNtW5voC/h22vxdbQrca99sQr5SOjmuhiCBGWdtGaoN8x
	 m77doxwjX6CZJtdWd2qUjNzD+YtuBnrRq3g3DPVvE6Nr92Bs/V6t8Ny8IP0nsS5qT+
	 oW3urHSOxeT6XiwAiHKtnSFgh/RjuZWHwZSk4vzdu3115N4P0AWHn/ApVgzNLpZRDY
	 cw8lHjaZ61G/g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 17:55:34 +0300 (MSK)
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
Subject: [PATCH v1 1/2] dt-bindings: nand: meson: Fix 'nand-rb' property
Date: Wed, 7 Jun 2023 17:50:24 +0300
Message-ID: <20230607145026.2899547-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
References: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 09:39:00 #21450961
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075542_733287_908B343E 
X-CRM114-Status: UNSURE (   8.92  )
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
 .../devicetree/bindings/mtd/amlogic,meson-nand.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 28fb9a7dd70f..54208a4191af 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -58,6 +58,12 @@ patternProperties:
             meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
             meson-axg-nfc 8
 
+      nand-rb:
+        maxItems: 1
+        items:
+          minimum: 0
+          maximum: 0
+
 required:
   - compatible
   - reg
@@ -87,6 +93,7 @@ examples:
 
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
