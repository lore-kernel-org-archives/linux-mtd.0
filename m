Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832ABCD129C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 18:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8wCXnQ/Mkxt194hFyqEWRBxlLk1EmdmSRP2U0oA20E=; b=TY7I7zD3Bfk+Fy
	lLShyauIOrQISWOGD16Ct3fPAdvvpuUTHXqzC0N0X4bXoBG2Y/yvyQMwhmZ4l/SG2rHtt+UmQNYHo
	sIIIV56e9yHBjDrpvAtgMVmB1e1NJkemHhBpbT2LwmQYLektZwFRKwv/Iy3d+EWpZQD8PGaCShNBF
	YZLdZ4a+xCQR/0K12XULpBD1CIPA4dNhiL3VIBF+Cez7TWUXmTazSu//tupSbrQ3KYyyJpSNfTZuX
	NOqTxCruY1Cd5WPIwa4D/8J16Uibz7hiAnHevpbboAKSYp4O2rpdiWEmluXNqqm1OkxovJDJxn6kh
	m4c8Ts0gJ2dGBcETJ2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruG62-00000003K22-0A1V;
	Tue, 09 Apr 2024 18:21:26 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruG5u-00000003Jyi-22FT;
	Tue, 09 Apr 2024 18:21:21 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6EF54120004;
	Tue,  9 Apr 2024 21:21:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6EF54120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712686873;
	bh=v9cv6tUi5qOqN4L1MlS+9E7ZRP0SM3g/SePwjM1FnQ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=o5S+a7w252TUya1XhwFlHDV4zGPXxrmlPCi5PmxU32HE+RdukWJHbANLIN/Pp43LU
	 lKtQJ+hF7105IGVQRrPBa+cWKCc07MtO9DNPaHn1hejlhj83Fdp4mHgq4a4NWCA0+o
	 VUIsjSNIpzu+3+MezcqrMPAvZk8kk3r4SEgf42yTl2EJE8wQFWvuKFwrrf2XkSr8GB
	 bAkzwo1DgYI+4r5HxXVzcQhlgQ5dbHOnmfRl3GE7EHl1yB7m7hxSM/qiWtVbRLNG+W
	 3vIGb5wzgV2VMWxPIcHP6Y87j5U0oWr2fIhsBQ+kEzPcFstDn6EK6W461A+mC12k2a
	 FVHPmJ0Yybe+g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  9 Apr 2024 21:21:13 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Apr 2024 21:21:12 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: [PATCH v3 1/2] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
Date: Tue, 9 Apr 2024 21:10:24 +0300
Message-ID: <20240409181025.55504-2-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20240409181025.55504-1-avkrasnov@salutedevices.com>
References: <20240409181025.55504-1-avkrasnov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184641 [Apr 09 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/09 14:21:00 #24719986
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_112119_285218_E6501569 
X-CRM114-Status: GOOD (  12.73  )
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

Boot ROM code on Meson requires that some pages on NAND must be written
in special mode: "short" ECC mode where each block is 384 bytes and
scrambling mode is on. Such pages located with the specified interval
within specified offset. Both interval and offset are located in the
device tree and used by driver if 'nand-is-boot-medium' is set for
NAND chip.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 .../bindings/mtd/amlogic,meson-nand.yaml           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 57b6957c8415..b86a1953056b 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -64,11 +64,25 @@ patternProperties:
         items:
           maximum: 0
 
+      amlogic,boot-page-last:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          The NFC driver needs this information to select ECC
+          algorithms supported by the boot ROM.
+
+      amlogic,boot-page-step:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          The NFC driver needs this information to select ECC
+          algorithms supported by the boot ROM (in pages).
+
     unevaluatedProperties: false
 
     dependencies:
       nand-ecc-strength: [nand-ecc-step-size]
       nand-ecc-step-size: [nand-ecc-strength]
+      amlogic,boot-page-last: [nand-is-boot-medium, "amlogic,boot-page-step"]
+      amlogic,boot-page-step: [nand-is-boot-medium, "amlogic,boot-page-last"]
 
 
 required:
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
