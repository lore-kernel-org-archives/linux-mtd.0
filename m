Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DACD1292
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2024 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cj6EFG4akNMK+4efV9WAMV1DCPxlgxuTXa+aQsWCpPY=; b=dh2uVYT1Iz03iE
	XTnkXApnJ+NhTLTqq7VcbtjYzsiZu7tsKCY6LbxWnEmB8I4FbRe4lGpdHUtZSSRlUWQBIxB0ZV0WS
	phOJ1uAsEHBnaXSNShMWA/Ne36F1vtNkd8xIceedwnmyrNZBMF5ipMht6vxYBI5hXQLWGnbT0i4OP
	flu71hkmLWPXd1ikP7iDGk8WbLjQULOloEf2ozimMM3HkiW6srXdk5kJi2wLXpK6v9M/gupoki+nA
	POEPy2+WR2vBbd5GvDIegO4tSvgZUGkZcZE65D0IHgH5v9JteMmkWVm9cOyGgLP6ExFzVKJZF/hcd
	au09elKHZeg0JJqZ6msQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrktL-0000000CixY-07EN;
	Tue, 02 Apr 2024 20:37:59 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrktC-0000000Ciu5-0dHu;
	Tue, 02 Apr 2024 20:37:53 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 46DAD120004;
	Tue,  2 Apr 2024 23:37:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 46DAD120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712090263;
	bh=WmaHZl8EDgM7RdmbYhx5D6ei3ACHVss/dIDDZygqP6s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=qkB3U3gsXBQhDCYGf/2YXTpb4sq51Ozn8DbUYR18aXk0U0mNJX3k0lJWsCLJRsKjc
	 OogdUM2nAfQNaxIAFvdAetMLc6hpyo1u2sOrLNhtgqd4OSqAPJ7XlgRT4sfGApeH8c
	 aZEzd5IVYqBtuSOWsfRGP5X1+Zz9FgLbaHJYqhNbo0zp9g0etwHnsibNwZlnQ4GCeS
	 Bkow5kRpGmWWM6v7J1+1MZopbc8U2UwE7dl3juZFesBjpC8UsmKJWDmeQGllyxEkUX
	 K/P5amLrhqv+qBgPjTihTu26L7nfl9Rj5krnwo4ZQhZhUnpBMcdxPcFBV26L8/vmnG
	 8WRcntM6GjtYA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  2 Apr 2024 23:37:43 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Apr 2024 23:37:42 +0300
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
Subject: [PATCH v1 1/2] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
Date: Tue, 2 Apr 2024 23:27:04 +0300
Message-ID: <20240402202705.2355326-2-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20240402202705.2355326-1-avkrasnov@salutedevices.com>
References: <20240402202705.2355326-1-avkrasnov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184542 [Apr 02 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/02 18:05:00 #24580759
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_133750_916008_4BAAA936 
X-CRM114-Status: GOOD (  12.89  )
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
 .../bindings/mtd/amlogic,meson-nand.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 57b6957c8415..f49819ee76b8 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -64,11 +64,27 @@ patternProperties:
         items:
           maximum: 0
 
+      meson,boot-page-last:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          The NFC driver needs this information to select ECC
+          algorithms supported by the boot ROM.
+          Only used in combination with 'nand-is-boot-medium'.
+
+      meson,boot-page-step:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          The NFC driver needs this information to select ECC
+          algorithms supported by the boot ROM.
+          Only used in combination with 'nand-is-boot-medium'.
+
     unevaluatedProperties: false
 
     dependencies:
       nand-ecc-strength: [nand-ecc-step-size]
       nand-ecc-step-size: [nand-ecc-strength]
+      meson,boot-page-last: [nand-is-boot-medium]
+      meson,boot-page-step: [nand-is-boot-medium]
 
 
 required:
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
