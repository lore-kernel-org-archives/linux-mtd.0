Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7960C7EE37
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pl3W381NBgdnbhstB+DSgadhp/EBtDUzLkp5Aw+7Vsc=; b=3x9uwRxXQipnT6
	i0xN0PSR0G/JKYCzCsBSg9Rz+yjaDL7LHZ+WjhqWb4+PnauRTuckaJUHk2TRdqv47JEwtLs+xokPz
	jTWtyMlu4IyIqvkna4nBPzR0g3g3aNSNvDJJMWWIKcDBfY/O62294aeSq890r/r8aO5Zhghsbska6
	iERjc0r+W9GcD1jSvpnOmU1gUNnyJT4CdHiAcQVzTGqOxj3GuGXF3lKJrGF1SoUcC6+KWHGGXr992
	4/7rVBFQFyb6aJCW/hofmeHmy0i6DnEtgQ30QGgM23SlYnt6yBe4bihvNkKkk4Q8fnXT8qNS3VOks
	9TD/+p2NS5qvPkHife0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cXf-002zzI-3A;
	Tue, 06 Jun 2023 19:40:31 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cXa-002zwq-1y;
	Tue, 06 Jun 2023 19:40:29 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5644C5FD04;
	Tue,  6 Jun 2023 22:40:18 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686080418;
	bh=/a/D+K5/RvpmyF70t6iC3BBkjuaMSTKw05HEPcEHC4s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U6ocXN1G6uTrfaWco6cAeZM97dFR7tz6TUPf7CeCu5CPDjXQU2dre7b8dh0i+JaAK
	 KqpPea98a9Weqoio4IuCXDQv2dpQGgtbwoSCvm8XjnJfQVFbqfnbB4D3Q5UBR9lyAK
	 8szkyAnbPVdaOpQoQfYawi3x2iLT6kpwIopS85LWSIYoDjNB0BB7k+60IAsnGgf+8z
	 bNbRpjqIPeL6L+yDyQHQh2QB+zV0GTUEPp/7KGC8Zo94TH+VJeICPdbEuqkkMAJvbn
	 HJalKIdx3G9HVCEMfKdfLC9dYslMShjC+j3ylvJiZCM5NcitWJhWFX/CXyqgChb047
	 Xga83sr0FzWCg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 22:40:16 +0300 (MSK)
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
Subject: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Date: Tue, 6 Jun 2023 22:35:07 +0300
Message-ID: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 14:43:00 #21444531
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_124027_990704_BA2F96D0 
X-CRM114-Status: UNSURE (   9.23  )
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
must be supported since the beginning. For this controller 'nand-rb' is
stored in the controller node (not in chip), because it has only single
r/b wire for all chips.

Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 28fb9a7dd70f..866edf800b81 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -37,6 +37,8 @@ properties:
       - const: core
       - const: device
 
+  nand-rb: true
+
 patternProperties:
   "^nand@[0-7]$":
     type: object
@@ -81,6 +83,7 @@ examples:
 
       pinctrl-0 = <&nand_pins>;
       pinctrl-names = "default";
+      nand-rb = "true";
 
       #address-cells = <1>;
       #size-cells = <0>;
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
