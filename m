Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37376C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N4s1RghHHeYpdhfrhXkLOZuyKw6yrL0WiYO46JsQy14=; b=SznvB9duuKDZuT
	DifwcQh1iU/k4ONUDEJXt6v4Ud9Ts33yFJi9ZfCNJjsLF5Zp/Btct/wZkWi+FJi5yEDz+L1gTRx7v
	m1q2MEI06R4kSjTPwBj5VOLpQXIVe6DA2LtbYxDiBMNOxYA7G2HG3yswY63A8P0r2y5cF4m7jiii2
	teYpXyDSR4ltB/B8Q8VOewkAo6rwr0CRQ+pWglsbqNWYBvmLpo6PPVCGzIVTM/YYHuyKXg+P4Vwjf
	Ai43P8FIUGgarASE505auWOOSy85ythz1tDJTfh4Rt0nuKbRD1eQwfJqK7iz/+yqigTUc5SALCX6J
	2n7jHQ4CGJ5ZFbnRTHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUs6-000000008tF-2h8G;
	Mon, 10 Feb 2025 14:34:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUs2-000000008p4-1WWX
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 14:34:48 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4F6E710000D;
	Mon, 10 Feb 2025 17:34:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4F6E710000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739198080;
	bh=VIBk/bIEGoVw9/ZRg0E3oUUj8GEqsT4qLTRfIvmhKOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Qs6JuEPrR2d1Q5XARmVt3DJNBXejYuBvM49zYHYdyMxDpFh5Ut5J2oEzuOxkri226
	 HxyvWX9RUbRAeCJIoi5cu+IAexqEaZvjnRCy9vJc5y3W5sQHaQ0ASiCCSTJl0a2YDv
	 Umcd/MYPy7k8AEbh0eOT2s3Rte92Hpga0symu3zQl7eWHfwj1WlHh8iL6+3Y38C/Ae
	 iU2GEWIbTlZYTp1rnlmlniKxw8cf2OBIxIkrY0/0wL+b1CzPbZXsxIvpDOHmUiXdou
	 cfjsl7sle6BzZDaGWfb3pf/fIRjiJbsbSTbmU1obGD4ADoo+A44g0TmROZyWRcqj8N
	 sDjsSOkX9RIDA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Feb 2025 17:34:39 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v5 0/6] mtd: spinand: add OTP support
Date: Mon, 10 Feb 2025 17:34:12 +0300
Message-ID: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [172.28.130.205]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190904 [Feb 10 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/02/10 13:13:00
X-KSMG-LinksScanning: Clean, bases: 2025/02/10 11:09:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 08:53:00 #27153032
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063447_032543_A663B164 
X-CRM114-Status: GOOD (  10.69  )
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
  v5 since v4 at [1]:
    - Rebased to master

  v4 since v3 at [2]:
    - Support for factory OTP

  v3 since v2 at [3]:
    - Make cosmetic changes (Miquel Raynal)
    - Separate patch to introduce helper functions
    - Use dev_warn() instead of pr_warn()/WARN()
    - New patch for introducing the start_page field when defining OTP
    - Use mem_is_zero()

  v2 since v1 at [4]:
    - Make cosmetic changes (Miquel Raynal)

Links:
  [1] https://lore.kernel.org/all/20250127153848.199526-1-mmkurbanov@salutedevices.com/
  [2] https://lore.kernel.org/all/20241226135623.43098-1-mmkurbanov@salutedevices.com/
  [3] https://lore.kernel.org/all/20240827174920.316756-1-mmkurbanov@salutedevices.com/
  [4] https://lore.kernel.org/all/20240617133504.179705-1-mmkurbanov@salutedevices.com/

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
