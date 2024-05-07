Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E62C10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdAJ0rnNvLo/gIYdfuzsWG8ybTmvD4gwpzWxsuS4luY=; b=nzCs+sUSGQmMut
	BK95S7cnPcV7WCcDxpfo0ZZpJloK0bjzkM1yzZQzQ/QOUuWoLrSK3vMBmwlMdEZvqmWdRS25LBuzJ
	zMvD2Whl9pbifyYbAZijxlu74xBsIejUL6Tv+3k6RNC/bHXoOysjlkAacG9g7ynQQ8uIOHYV1sobG
	Ccth7zL/66WKbH0lW51pxn7wOG4ETILfAs7B29bDfMLO5G1XM82FqfDJ8mL8n6bP8lngfrJ7dhBXG
	8etr2Fy4fp6Eqfds5WZ5Ioz49DTUvnEyBqltPW5n9KoBCxqHxdc8HWRYQ+VuO3RiMi7j90gKIGx/v
	NZwwAGPYwdiwYIDOD60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4U6a-0000000DFHT-3iea;
	Tue, 07 May 2024 23:20:16 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4U6R-0000000DF8Z-2Owf;
	Tue, 07 May 2024 23:20:10 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4B723100002;
	Wed,  8 May 2024 02:20:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4B723100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715124001;
	bh=Sg2NSSWydrUfExA0STQZrax0QRiPJJZL+IsAQDgDZr4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=tV9RFvpe0KVjONwN3XoOres7K8W9UQQTfKCWASu0JlFMdcvlf0DgHwmDGhjzPyRTN
	 0vaAj39KBLLY+XxH/MdG2vvPChxSQdHpzj6/G5iCSOtwBxfJdZdoaiOQBBnKwAAeQH
	 AUKROv7sOZj3RjNpO6qLOtghHznPWkQ73uQv5yY8nnGK4VucvclgZVJ0W1weia7csj
	 B1HR/OKB8/Ahk8gyvviRF/WqAEwOdyePTcASVlECT5SpwUOKXJGkax6FoB2JM/Ude8
	 3G1lh2yp1qwvonJDSM6LKRqIhNNpkmGMC8S1Tl4kzIC33x4u4Lal+MCRwP/hHNw5hE
	 o7pFgWJM30wUQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 May 2024 02:20:01 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 8 May 2024 02:20:00 +0300
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
Subject: [PATCH v6 1/3] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
Date: Wed, 8 May 2024 02:09:01 +0300
Message-ID: <20240507230903.3399594-2-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
References: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185123 [May 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/07 17:58:00 #25118681
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_162008_435776_A9D1C5CB 
X-CRM114-Status: GOOD (  11.57  )
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
scrambling mode is on. Such pages are located on the chip in the
following way (for example):

[ p0 ][ p1 ][ p2 ][ p3 ][ p4 ][ p5 ][ p6 ][ p7 ] ... [ pN ]
  ^           ^           ^           ^

pX is page number "X". "^" means "special" page used by boot ROM - e.g.
every 2nd page in the range of [0, 7]. Step (2 in example is set by
'amlogic,boot-page-step' field. Last page in range (7 in example) is
set by 'amlogic,boot-pages' field.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 .../bindings/mtd/amlogic,meson-nand.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 57b6957c8415..284f0f882c32 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -64,11 +64,29 @@ patternProperties:
         items:
           maximum: 0
 
+      amlogic,boot-pages:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of pages starting from offset 0, where a special ECC
+          configuration must be used because it is accessed by the ROM
+          code. This ECC configuration uses 384 bytes data blocks.
+          Also scrambling mode is enabled for such pages.
+
+      amlogic,boot-page-step:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Interval between pages, accessed by the ROM code. For example
+          we have 8 pages [0, 7]. Pages 0,2,4,6 are accessed by the
+          ROM code, so this field will be 2 (e.g. every 2nd page). Rest
+          of pages - 1,3,5,7 are read/written without this mode.
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
