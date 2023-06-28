Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C03EB64DC
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jun 2023 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ep89q3JA5v/o2GooVxw8fOqNGQ+FHEfOV6kAPyQUdvc=; b=x5N6JRGoOauZAN
	mMomHU/+Yos7ejVRnTYLK5GdH4NBK0tF3VxpmmbsqDt+77H2BmiNnvugkIGETkQp7xIVoFFg6X+Wv
	yhpYPguodEacl/DztHUaiuDkqFf0JCfRWKECBkak3bNsyIkZLhhlGoSbGRT0SNJEj5n5EmWph0mi6
	A2Dc7z5iQdZXMjO1WnEbqDbQsHnRbB/32uLfiY//PAyulp26iGAIUyA9duJC6g6P2/gHgA+PfUTye
	q0idGFCDgQdg1Xv8xDQloGlZGdoG6u7uzA/T34/4yHtn29JM4h1ZBNeaiP9UEV/0CHPAwobAaBbb5
	TBd09GoVAFOkwIhPsrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERaR-00FGCp-2d;
	Wed, 28 Jun 2023 09:35:43 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERaN-00FG93-1m;
	Wed, 28 Jun 2023 09:35:41 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DE9F5120010;
	Wed, 28 Jun 2023 12:34:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DE9F5120010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687944898;
	bh=dOUQdfK74PQSGyCiBDX2998V8/GfU3xv1b3HjiouC2E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=aKBK/RpKxYyT8ThvGIbVURq4k4RHsVWZ0kSqR+I633ilDxvsfigYOqlCeeXw8bevB
	 x7Tx9/SoHG80nL5UfDA6HxNXcOzqcqc3MeeemF8NoTOKZxCnc58SIjfpLNZ7/gRf3G
	 jGs/m0p3v61hR82BHuqHHK6xnW6ArRbtfwzDhW4isS2qLK2g4n0k78EkK91EcZxrq6
	 jvaToz2zOnXeTdl1tQv525ciU0jF4KH4keoSwlFtqmNnLKsmfy/d8lE/HHiboZNS9+
	 3+8rtTj1gjQNn4iMw6BXtPeEbfXVGNBCpJT/f+Eg8pZM10s1/QLvoKZw/HYrApjek4
	 c9jMJUh7FYC0g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 12:34:57 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 28 Jun 2023 12:34:01 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 1/2] dt-bindings: nand: meson: support for 512B ECC step size
Date: Wed, 28 Jun 2023 12:29:35 +0300
Message-ID: <20230628092937.538683-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178300 [Jun 28 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 05:07:00 #21590415
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_023539_952089_1E6F1CE9 
X-CRM114-Status: GOOD (  12.21  )
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

Meson NAND supports both 512B and 1024B ECC step size, so replace
'const' for only 1024B step size with enum for both sizes.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 3bec8af91bbb..d42daa285d17 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -49,7 +49,7 @@ patternProperties:
         const: hw
 
       nand-ecc-step-size:
-        const: 1024
+        enum: [512, 1024]
 
       nand-ecc-strength:
         enum: [8, 16, 24, 30, 40, 50, 60]
@@ -93,6 +93,7 @@ examples:
       nand@0 {
         reg = <0>;
         nand-rb = <0>;
+        nand-ecc-step-size = <1024>;
       };
     };
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
