Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B3C41513
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/c33r+DhmtI5XdA6iX5NOeagliaa+hZQsDOL3/BJU8=; b=tiDuPHw6weinRY
	e4rAjTF7UrwnwdAGH6w8r51sKCQJbkzjkyGFlgWd/gybK9tk+JgAKFvkBAfDwXtdZwJuts67n9GXH
	31e01QXCPiIukr7KfkAVcoBZLvtvASyfXj0XJGFtt1yACOlPtIINffx+yapgy9+vDgwAz/JuDYnk1
	hks/lGiEKPwyPw6fTkkm4xTZAP0U+aunycOn5KzdL6yk1G4N9IBwbeFht9QIRttqx8Z2GNqgivPxA
	+JIPIZues652Gsz2P8u17ZjTDdh2CyfqNaa0f1+AFLFThv0vVn4kmCucsUF1NoUjbf34e9k0yeVZ6
	VLq1Y/xgcJdSaId1bj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwehy-0000000BX58-2s4P;
	Tue, 16 Apr 2024 09:02:30 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwehm-0000000BWzI-2gzQ;
	Tue, 16 Apr 2024 09:02:25 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 88D2A12000B;
	Tue, 16 Apr 2024 12:02:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 88D2A12000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713258121;
	bh=rluHIBDIccS9YPBslSv7pHWxp+FKIOUhEoqlducELkc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=HT0qzPCUqP2bxwQ5m63ucCHwozyQ6+uGG0DoetYHXjZFuwJijlUGI9X29YiWe4Cjj
	 xJeB87XJY9c8cPZn4TbMlwSy5VUGAp9ZBkTCt1IFbK+UzF2EyG4eTtVtWif0t8GdZT
	 72r64sS8GEQQXILAQIB0acbOhzMrcBRrATgv1UlTt03cHmIZsSUgebp7JS7fJ043vZ
	 jPQPFb36s2Ig4wnwaqx8iNsmFpg0mSGLBOEmHt6r2rV4R2wG4XoZcr+nWfKPyxrEGy
	 R4e1O34OFiWrlPRWID5ABqQZhorL7Nk6Hz2jyeJ4TZZUTapyzcbJQgizBNT6xGXwST
	 Cus1PAp9Sp5Sg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 16 Apr 2024 12:02:01 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Apr 2024 12:02:00 +0300
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
Subject: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
Date: Tue, 16 Apr 2024 11:51:00 +0300
Message-ID: <20240416085101.740458-2-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20240416085101.740458-1-avkrasnov@salutedevices.com>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184729 [Apr 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 17 0.3.17 f2153f38d75b12894d9cf445f96cd15c9ef63a9d, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/16 06:39:00 #24817376
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_020219_394370_FCF40548 
X-CRM114-Status: GOOD (  12.31  )
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
index 57b6957c8415..67b2f7c1259c 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -64,11 +64,25 @@ patternProperties:
         items:
           maximum: 0
 
+      amlogic,boot-pages:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of pages starting from 0, where special ECC
+          algorithm will be used by the driver.
+
+      amlogic,boot-page-step:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Interval between pages, read/written by the driver with
+          special ECC algorithm.
+
     unevaluatedProperties: false
 
     dependencies:
       nand-ecc-strength: [nand-ecc-step-size]
       nand-ecc-step-size: [nand-ecc-strength]
+      amlogic,boot-pages: [nand-is-boot-medium, "amlogic,boot-page-step"]
+      amlogic,boot-page-step: [nand-is-boot-medium, "amlogic,boot-pages"]
 
 
 required:
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
