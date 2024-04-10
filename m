Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E6CD128A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WpvU0vimu2AJTfGltXZRt5YKGy4uCE8fcVTruaaVQXI=; b=ov3GnscpD7UsFN
	z6v4zgEuVPEJXnaIAs0EcdIsw0AY8/1M1YzBlMOxH857n62i6kkBCnCKyjQ2ThGaROE3hUmx5PTOK
	RikdkSaMoRj0P/UOk7hBsuqDwzp7AG0jsso0jHwGMoP9RR0qqaLP/QGW69sBtABVIJ6kY1Ph9yppl
	MtqVFIiyQnVJIWkysezAwAtsKUjh1kJFV3fa2Y1Gapn/w9BwV+ThTFLIxNgEuLhJvBsC5HnOzkcfO
	dTvUyAQzzudhxvMtrdIyucJ0qO0y/sd45mtgpMKuaASzIHZCnboRa+U7kCLSPN+/rwWRwM2Te+Ywn
	QykEyhmMgb2Bc6woX3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudFw-00000008bdJ-2sD9;
	Wed, 10 Apr 2024 19:05:12 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudFo-00000008bY8-1KVY;
	Wed, 10 Apr 2024 19:05:07 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 513B5100078;
	Wed, 10 Apr 2024 22:04:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 513B5100078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712775898;
	bh=KPqzQ6GA9yQYv2FMku0FIiAMvpL81PJdS/5X+nH2yHU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Gom9vxDsOW2Yf1l9CBFAIIFxV+oNvW22YqNwSejJROBa5xSCAXF9ojfZRqBPuC7I5
	 mkhGonjHphVP5Ru+jzeoQ+wr2niVJw7ikYcjf90uhMg5udu0nqUKjJjV1TAkYxyg07
	 Hhs7CplwJTQR7sOowYz2lGqCpXaq5jP5jNPrY2UfrpHa9ZXY9c+ePS36+qNzcT//Os
	 CjEglogI3p52xUDplCV+uZLDqmq7HHHQFOy2INZ2oJAC4tqPA4eDvilIpsJjOFsyip
	 LjEAUC3me7KDY/z2nU9M3ZeZdDBQelQ8ZbMuY5JyI8YcBA93+ospgqH4wk3jWCmfII
	 mfx+OZhksQFEA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 22:04:58 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Apr 2024 22:04:57 +0300
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
Subject: [PATCH v4 0/2] Meson: R/W support for pages used by boot ROM
Date: Wed, 10 Apr 2024 21:54:07 +0300
Message-ID: <20240410185409.2635622-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184659 [Apr 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/10 15:26:00 #24739493
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_120505_067944_1EBF4B8E 
X-CRM114-Status: GOOD (  12.40  )
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
    amlogic,boot-page-last = <1024>;
    amlogic,boot-page-step = <128>;

It means that each 128th page in range 0 to 1024 pages will be accessed
in special mode ("short" ECC + scrambling). In practice this feature is
needed when we want to update first block of NAND - driver will enable
required mode by itself using value from device tree.

Changelog:
 v1 -> v2:
  * Rename 'meson,boot-page-XXX' -> 'amlogic,boot-page-XXX'.
  * Add words that 'amlogic,boot-page-step' is measured in pages.
  * Remove words that 'amlogic,boot-page-XXX' depends on 'nand-is-boot-medium'.
  * Make both 'amlogic,boot-page-XXX' depend on each other also, in
    addition to 'nand-is-boot-medium' dependency.
 v2 -> v3:
  * Add quotes to 0001 in dependencies. This fixes 'make dt_binding_check'
    warning.
 v3 -> v4:
  * Rename 'amlogic,boot-page-last' to 'amlogic,boot-pages'.

Arseniy Krasnov (2):
  dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
  mtd: rawnand: meson: support R/W mode for boot ROM

 .../bindings/mtd/amlogic,meson-nand.yaml      | 14 +++
 drivers/mtd/nand/raw/meson_nand.c             | 88 +++++++++++++------
 2 files changed, 73 insertions(+), 29 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
