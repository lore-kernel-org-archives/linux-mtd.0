Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C8C0218A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sEDCnGd3YeAUgrHzPSNH+V+0K5SzCS4ATHe2htuZN3c=; b=oA4QxCt4IJVxHL
	IdBegdvQ8PFcHrqqUJR4Gdl49C238CMD1PNNxWjnKHrbzCormqUrUPRxoqJrHlaKsjCNvIMWlZOd7
	kJ/jMHxEdpRcJ6ep6el7hITNBwiRlktid2cWZStPTEhHkJFVuuRQ3izram7Dv8GTvbXn+gXtWia96
	6xgzme2z/euHZuPAvma6fpa0trD0ltuM/Zks2XX0FNYec5y1cf8gUWpPB0Gg5itKgRwVgeMflNpp/
	V64WvJx3rN9yHU3SXq1SRF+RG4qsJHmsaxiKh1cHKolsS1IBSkvQZJ+oXF8ix6vUXvePmPOOWE83m
	U9nbqyDjEjdnZIePE2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRCy-00000002cZG-0rFX;
	Mon, 27 Jan 2025 15:39:28 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRCt-00000002cWq-3ham
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 15:39:26 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C829C120003;
	Mon, 27 Jan 2025 18:39:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C829C120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737992353;
	bh=NGkFeqba4Lh5EiReJJ12cHWSQsPBx3Hd6/AA7gtkqks=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=l0zXGTdWQC4dZulRwqdAedhcDA93hnkfEHxGeoP4K7LFeFH+FK7zWLgbXdR8jruQQ
	 oWLUiNKTNlvKurHDuB8zeSQ7FoUZA211BwZWa+CVpwp36guLaH8DO4qW+ccc1frXKy
	 1YfoTrgdGHkW+jC7wVRtpOL3w98mxRUmOBG5SeceS6W2NkCb5uZsTPfdSsVq6KAW2E
	 TB0M9Mo3luiHTRb9yqXeZ/9lpuxSGxlVv/G6F2YuLHH2zjsCc2Omid6HDasCq2/I0s
	 mKRfpxirnOhd+w7Tll6cb9WoyeFFZrUioWrXgXFJJ/4VBbOMEZeT6D4r9UX7c/1D/W
	 mED4PJxTcEOgQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 27 Jan 2025 18:39:13 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v4 0/6] mtd: spinand: add OTP support
Date: Mon, 27 Jan 2025 18:38:18 +0300
Message-ID: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [172.28.160.199]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190599 [Jan 27 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/01/27 13:46:00
X-KSMG-LinksScanning: Clean, bases: 2025/01/27 15:14:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/27 13:50:00 #27131010
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_073924_600518_206AD4F8 
X-CRM114-Status: GOOD (  10.57  )
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
  v4 since v3 at [1]:
    - Support for factory OTP

  v3 since v2 at [2]:
    - Make cosmetic changes (Miquel Raynal)
    - Separate patch to introduce helper functions
    - Use dev_warn() instead of pr_warn()/WARN()
    - New patch for introducing the start_page field when defining OTP
    - Use mem_is_zero()

  v2 since v1 at [3]:
    - Make cosmetic changes (Miquel Raynal)

Links:
  [1] https://lore.kernel.org/all/20241226135623.43098-1-mmkurbanov@salutedevices.com/
  [2] https://lore.kernel.org/all/20240827174920.316756-1-mmkurbanov@salutedevices.com/
  [3] https://lore.kernel.org/all/20240617133504.179705-1-mmkurbanov@salutedevices.com/

Martin Kurbanov (6):
  mtd: spinand: make spinand_{read,write}_page global
  mtd: spinand: add OTP support
  mtd: spinand: make spinand_{wait,otp_page_size} global
  mtd: spinand: otp: add helpers functions
  mtd: spinand: micron: OTP access for MT29F2G01ABAGD
  mtd: spinand: esmt: OTP access for F50{L,D}1G41LB

 drivers/mtd/nand/spi/Makefile |   3 +-
 drivers/mtd/nand/spi/core.c   |  50 ++++-
 drivers/mtd/nand/spi/esmt.c   |  90 ++++++++-
 drivers/mtd/nand/spi/micron.c | 135 ++++++++++++-
 drivers/mtd/nand/spi/otp.c    | 362 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   | 110 +++++++++++
 6 files changed, 738 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/otp.c

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
