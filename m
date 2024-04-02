Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651C4CD1296
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2024 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rVBvw5tpcWGAqDcCGaB4BDAZOdqJiaJ44B4cPdEoC3M=; b=q/sdxbABi2ZfmP
	sV5LAui8RbsKpYUHxkc8Y/njbS6sVopx/XeatjFOAd9sJHeUHSDV5f+WHxR7tPmxDXcJS4KIhPoPf
	qPijwnCptfFeD/fmJmQ5bjJjwYsI20nPHCexPSvIXTOoHfH5rhbxnZmZTml0JVD4S1yKPHSzJGOlI
	P09avyJcRTgGHTq9siU0nfMB5VV4h0KpaxgrVh+YC5XsFlb3b97kmy9rOth5MsTBEyJBoB8BAIxdc
	+IbRN9nNRKDbaS0SmzAXRQ7oZlW4c6YqRiI/Tn4hFWMwpI9EAmpmkiAGVuCx+m1jujQ/63BQHCnWv
	cuZiFQLynGjK5lzMfRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrktK-0000000Ciwb-1dNO;
	Tue, 02 Apr 2024 20:37:58 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrktC-0000000Citu-19iL;
	Tue, 02 Apr 2024 20:37:53 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 52E18100008;
	Tue,  2 Apr 2024 23:37:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 52E18100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712090260;
	bh=t2tHqsxYS8zoZJEGqRjan30QoziQPMtBbv04+Qu4qSI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oGeh1gvHQR6G1jzxf2b8eRj0ll8bP18T3CyiLJIbGlDemqYoaDd51wNgBUWu0AD3W
	 hwrHqWsNvrVuPECd8m/dsDTmK0WWx4j/G4lwF6ELkpMRl8bwPe1M0/vMvXpB+4FIZ2
	 w36oMAERlIA0NXoPvKnV5VTJ7Nknz7sdTnTs2DRwBqNG3CCxb3LLV9qJr1i23Y9LC1
	 GzXgRacp03u4jiQT4KlVBBJMexBC2VRmn3ikm6ikxNx4oDCRVMFAyda4miksJs69Iq
	 kmfBPiE1WJjzN/vc5KUu3qQVejmZZWI+DggEv/iOvFSsdvKN4Pfu/KyplkhOMKU7Wy
	 6I+Kx/aHFNmEw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  2 Apr 2024 23:37:40 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Apr 2024 23:37:39 +0300
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
Subject: [PATCH v1 0/2] Meson: R/W support for pages used by boot ROM
Date: Tue, 2 Apr 2024 23:27:03 +0300
Message-ID: <20240402202705.2355326-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
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
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/02 18:05:00 #24580759
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_133750_934763_62FFDA26 
X-CRM114-Status: GOOD (  11.84  )
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

Amlogic's boot ROM code needs that some pages on NAND must be written
in special "short" ECC mode with scrambling enabled. Such pages:
1) Contain some metadata about hardware.
2) Located with some interval starting from 0 offset, until some
   specified offset. Interval and second offset are set in the
   device tree.

This patchset adds R/W support for such pages. To enable it we can setup
it in dts:

    nand-is-boot-medium;
    meson,boot-page-last = <1024>;
    meson,boot-page-step = <128>;

It means that each 128th page in range 0 to 1024 pages will be accessed
in special mode ("short" ECC + scrambling). In practice this feature is
needed when we want to update first block of NAND - driver will enable
required mode by itself using value from device tree.

Arseniy Krasnov (2):
  dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
  mtd: rawnand: meson: support R/W mode for boot ROM

 .../bindings/mtd/amlogic,meson-nand.yaml      | 16 ++++
 drivers/mtd/nand/raw/meson_nand.c             | 88 +++++++++++++------
 2 files changed, 75 insertions(+), 29 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
