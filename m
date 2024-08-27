Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76300C54731
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2024 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EoL0py9jo7l5zwCDoG4YIIcJanoFhiDBZ6g17fv9n/s=; b=SwqFeIxSc+O2al
	xqK+ABHrmQSzZwbfpwr+yDB7hGf8KgvHGd7O42qPP5Pg7j91MDwGrYTv/uD3a0+OuRfL/8t+QLduK
	wHH1QitIAE3fa4+6Uqoczn7L+klwt6dtY6+Ey4RojvcjZm8WJoZVtQo5thJDPCu5RDgXbH+VkGMJS
	jc5jKoYuJK1YiwAv9a2AlJcN/CkzSr+ErnZSTj5Clvdcnswl7y9lWsmxxqn/HocB/UYvit4I7Qjp5
	OSynghbVKMGGHLph76gdRh/F5zDqAIUWyAU0Sms/YNQJyAeURpzwddkN2OU+N3FQA+7a78rGZB1g+
	2VeNeCtlgsmsg6u6SSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0KW-0000000CMiC-44bB;
	Tue, 27 Aug 2024 17:50:08 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0KE-0000000CMYu-2MoS
	for linux-mtd@lists.infradead.org;
	Tue, 27 Aug 2024 17:50:05 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 944B0100002;
	Tue, 27 Aug 2024 20:49:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 944B0100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1724780982;
	bh=/E3gedr2wgbmn/YfDZDCnVtSmImQ4g2OtUK6h494324=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MEw8vtAIPwO6rssy5kHuV1zimOL0g9NVwVDYUwhDCFfYcwTK8fcjVk+usRfTNnRBC
	 u4c56HbS82MclLGI5XlheK/758UrSLTbV00EIbk0NSFAS0q9auDDmkb96Kb2PwoF4U
	 FnqSixaPp3eCDl3aKleJBiDD3hz/pr/JAR27e6RBslCMkCO2SZjo6FtdVsk+c/m/Ip
	 EDKQj3cttJrPmWqeKeGBi4hbymC0KlEx8KKHr9wov7rQSS9L4WcaGEBq7oWwoZJMzi
	 a+w2rCoGmqSjmsWGiRIlsASzhNFLdUWWID+BGp9dexik+RG/V519q41cF95VexDeN3
	 DXCYo+k1WBIVw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 27 Aug 2024 20:49:42 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, "Mark
 Brown" <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, "Md
 Sadre Alam" <quic_mdalam@quicinc.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v2 0/5] mtd: spinand: add OTP support
Date: Tue, 27 Aug 2024 20:48:58 +0300
Message-ID: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Originating-IP: [172.28.129.118]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187372 [Aug 27 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/08/27 07:21:00
X-KSMG-LinksScanning: Clean, bases: 2024/08/27 07:12:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/27 16:21:00 #26445643
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_104951_521289_D05BAAB4 
X-CRM114-Status: UNSURE (   9.64  )
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

This patchset implements the SPI-NAND OTP functions to allow access to
the SPI-NAND OTP data.
Specific support is added for Micron MT29F2G01ABAGD and ESMT F50L1G41LB/
F50D1G41LB flash chips.

Changelog:
  v2 since v1 at [1]:
    - Make cosmetic changes (Miquel Raynal)

Links:
  [1] https://lore.kernel.org/all/20240617133504.179705-1-mmkurbanov@salutedevices.com/

Martin Kurbanov (5):
  mtd: spinand: make spinand_{read,write}_page global
  mtd: spinand: add OTP support
  mtd: spinand: make spinand_wait() global
  mtd: spinand: micron: OTP access for MT29F2G01ABAGD
  mtd: spinand: esmt: OTP access for F50{L,D}1G41LB

 drivers/mtd/nand/spi/Makefile |   3 +-
 drivers/mtd/nand/spi/core.c   |  45 +++++--
 drivers/mtd/nand/spi/esmt.c   |  69 +++++++++-
 drivers/mtd/nand/spi/micron.c | 117 ++++++++++++++++-
 drivers/mtd/nand/spi/otp.c    | 232 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  65 ++++++++++
 6 files changed, 519 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/otp.c

-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
