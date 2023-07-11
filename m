Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCEEEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1i3xSExBMWdRvGT9fgUZkNcsXtnjyceo3qLx5ZdNWjg=; b=iXrb5Ahz7DocLQ
	Erw9nkPLSiu1dyFbjJQueg+Rxy975gsXH3d6GmfWHDZXbr2jm27i6Sc9UIP0BwfDUBCqGHi63Nqmn
	SfockUnm7D8Ks/0j4ZfBDX+8QHeVM2ixjGN6MtGUw/EUIZQzuV1ZMM/5httrR5AyicK8I0Kkt6FrT
	yDD9Kqp2HCDxTU4L1iMedzwrsPQPwoGYmpNhYbWBYkvRT+f52dnw6/WEp5vkTg1CNya31TbDlHNNG
	DF32INQRjb8UIj7uSzY9dhWUZMIAzRetTejSIjQPt+FeC+uWjRdKKKQsCgdH3evSVnoZTOV+7Q8RX
	KtoNZCd1PPlGB4d2i5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSk-00ErkH-1Y;
	Tue, 11 Jul 2023 12:27:26 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSX-00EreW-1p;
	Tue, 11 Jul 2023 12:27:17 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2C64712000D;
	Tue, 11 Jul 2023 15:27:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2C64712000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689078425;
	bh=0RlWKOR/GAk96AQ6p6TKSzddgB4PuxiFyJ9Yjhq0Qkw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=i8NEFFhZkJDUwVrsjgArIMZ5Av0C2NRujF8jSr3gjAwMg3WSgGJBY8Jzgbi17LtyP
	 8ZZ78CfeJ4PHzcffocaETgxR/xEH43HPYy7ND3XScELFCgdbWbusFj5abpXAZ+r4MU
	 qt3Wlp3e7RnVwpp+x0NUbTNkhBQN0lU6O5WAiBozJ+wsctajoPSD1b2F+nDmCnZ3z2
	 n/mZUzXr9YjAbThobX+F0GEZq0ChNp6gDfSe5o7gqWyhm1YKpH+py7xu3txBclJD86
	 2Kbj9baxeuaNyINt/S5Z7oH1PHQhghvupnoI79bWCN7xrvs4yiIwuEwkHEY/sgwhVZ
	 u5SMAv1CPyNmg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 11 Jul 2023 15:27:05 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 15:26:56 +0300
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
Subject: [RFC PATCH v3 0/3] support 512B ECC step size for Meson NAND
Date: Tue, 11 Jul 2023 15:21:26 +0300
Message-ID: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178543 [Jul 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/11 10:56:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/11 10:56:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/11 10:54:00 #21597245
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_052714_093003_0849BE82 
X-CRM114-Status: GOOD (  13.74  )
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

Hello,

this patchset adds support for 512B ECC step size for Meson NAND. Current
implementation only supports 1024B. There are three patches:

1) Update for device tree bindings to replace 'const' type of field
   'nand-ecc-step-size' with 'enum' which contains 512 and 1024.

2) Update for device tree bindings to add dependency between properties
   'nand-ecc-strength' and 'nand-ecc-step-size'.

3) Update for Meson driver - new enum value for 512B ECC and reworked
   ECC capabilities structure to support both 512B and 1024B ECC. By
   default this driver uses 1024B ECC, 512B could be enabled in device
   tree.

Changelog:
v1 -> v2:
 * Add default value of 1024 to the bindings patch (0001).
 * Remove "Acked-by: Rob Herring <robh@kernel.org>" from the bindings
   patch (0001) due to added default value.
 * Remove invalid calculation of OOB bytes, available for ECC engine
   from patch 0002. This logic is incorrect from the origins, so I don't
   touch it in this patchset. It will be fixed by another patch, as in
   fact, it doesn't affect this patchset.

v2 -> v3:
 * Add new patch which adds dependency between 'nand-ecc-strength' and
   'nand-ecc-step-size' (0002).
 * Return "Acked-by: Rob Herring <robh@kernel.org>" to 0001.
 * Remove "default" value from 0001, due to dependency patch.
 * Remove example value from 0001, due to dependency patch.

Links:
v1:
https://lore.kernel.org/linux-mtd/20230628092937.538683-1-AVKrasnov@sberdevices.ru/
v2:
https://lore.kernel.org/linux-mtd/20230705065434.297040-1-AVKrasnov@sberdevices.ru/

Arseniy Krasnov (3):
  dt-bindings: nand: meson: support for 512B ECC step size
  dt-bindings: nand: meson: make ECC properties dependent
  mtd: rawnand: meson: support for 512B ECC step size

 .../bindings/mtd/amlogic,meson-nand.yaml      |  6 ++-
 drivers/mtd/nand/raw/meson_nand.c             | 45 ++++++++++++++-----
 2 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
