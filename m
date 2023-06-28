Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50ABEB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jun 2023 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9ZkcKk9uS2D1IWvjCBAXo++weWnrQYWmutlpnan1Qc=; b=CI2ybyEzwk8RmH
	QP8gLEdmEYQ6xsbqV/Qp7OcqhMquvTiZtMMmrMmLrjTGsSe5kJeSKYkzDVe9Z0pIYzVjjKnQff9Y1
	MJchNoE+iHRVZvrrDM2OJltsOf6hESqeiYXDMV5RCKf7KnTipG7HgpmVjMivU4rKt2VIQuUp6M93A
	93x4/DE5ziMbnVbHLg6uAViW0aNtHz732Gtf1mJOAtegNTiwQ6UdXy7Vbd+KMP5fXS1uXb3KQ0c9x
	wK9bk6nevIx3EsPLRi/XNUuOIw4b7CYwQBnaKDYPzkITOblRntCboc+VEaVLdykXrmXFE4BI5aErA
	ZCvvW3jKN8ZLpYwGONzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERa0-00FG2B-2I;
	Wed, 28 Jun 2023 09:35:16 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERZs-00FG06-0l;
	Wed, 28 Jun 2023 09:35:14 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E1AFF100008;
	Wed, 28 Jun 2023 12:34:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E1AFF100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687944895;
	bh=YWpvOe2q1AMTE1sllGg/LNi9S+Br6dLjsxHqUIOTn8c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=gpe9ie7Vz9TwKDqivSj8hCCJXesc8vTWwfL20YwI6ATxUYNLkg4sFLa1WGEVvByst
	 VJ2l1UMQU4HlpRAk4I8T1IQtKqU/s94PRm/gOWaS9X45NIz+ltFv76jQACLIcYdHdT
	 EnGgGlJEV+twVMSWFSViQg2IeyzCFhX6j9M3L1ippPT7BMtzXCu4JOv8rPjGL1wCDA
	 pggxIQyBV1mGl1/ySBE6wektxgabal9ZtLLbZnqnKviU83cvKPlLBkzcjuMZbOigb3
	 aYu/sQXaabW5szNot3VLN7ec5QlTzNr/SQNkW7Yhu6NDdE/AjsKyOMKftA78R4v1Xq
	 e+E4mn6qJ9oEg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 12:34:55 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 28 Jun 2023 12:33:59 +0300
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
Subject: [RFC PATCH v1 0/2] support 512B ECC step size for Meson NAND
Date: Wed, 28 Jun 2023 12:29:34 +0300
Message-ID: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
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
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 08:00:00 #21591748
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_023509_069056_B27196DE 
X-CRM114-Status: GOOD (  10.94  )
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
implementation only supports 1024B. There are two patches:

1) Update for device tree bindings to replace 'const' type of field
   'nand-ecc-step-size' with 'enum' which contains 512 and 1024. Example
   is also updated.

2) Update for Meson driver - new enum value for 512B ECC and reworked
   ECC capabilities structure to support both 512B and 1024B ECC. By
   default this driver uses 1024B ECC, 512B could be enabled in device
   tree.

Arseniy Krasnov (2):
  dt-bindings: nand: meson: support for 512B ECC step size
  mtd: rawnand: meson: support for 512B ECC step size

 .../bindings/mtd/amlogic,meson-nand.yaml      |  3 +-
 drivers/mtd/nand/raw/meson_nand.c             | 47 ++++++++++++++-----
 2 files changed, 37 insertions(+), 13 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
