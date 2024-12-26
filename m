Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F380E7718E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ndtWuKqPr4giVb88y8ADsdUquvLSPNvz84F3MIpvoSA=; b=RZOjq5S3c1qJAn
	Bmsv8ePchxvtvS6RU1wpzzI8NCcT0/G5d64Xo9N/TTw70OS6StLk4LHDiSEJo68f8CDBTGxIKwuB4
	XNXVnNjIno79GXSmHYY7hcH2mQoHARVVC2MmUvf75VfEgfE8iHD5C84aitaV8G6tpZBATYK+BKybZ
	fndSNOsy/9TRoLejwn6DL58PKpMfs/VvFP1zXkMt0wBYJNVCYOwvUwAae6T0zGh88bf05I0WlEjz4
	XRqOXfxCydQ1oSLIcGAcF5Jpv3cOPB4ZRa+bfcCKXD4EnYm85KM+7FEI5DJIZW82GMkkRfyKUQsZb
	RknRdF3AyMvh/+yL//PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoN1-0000000FrbE-2Ikw;
	Thu, 26 Dec 2024 13:57:47 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoM2-0000000FrMm-3a5q
	for linux-mtd@lists.infradead.org;
	Thu, 26 Dec 2024 13:56:49 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 36281100006;
	Thu, 26 Dec 2024 16:56:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 36281100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735221395;
	bh=zJdm1v+I2mbLV0kOz7L74bj0/zCl708rX/04RpUoxD8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=pI3qZng9zqN8TtetXwWlMAN3kKAAP3VNJiTiSHZIJ34GEQknuF/hvpwWt7eW0rVMF
	 IeQc7kEKL0lKhV/vJZgLVmJeKB7enY/mKlVYqeHpZkf9AdAuFJaBkK91w9OWdvE+n6
	 yKWCupeo4INV1q7ydI4iTiwJcnP9bTBMqsyqWdAQMAXsXWEAnu24BHNOXOPFE495ck
	 4AGQlBzPqQa0LPzlCewzlECS1UDVlP3/Mzlc2FZJClrMDXuvt11q8erlCLlkm4dUXA
	 sbe/KL5sCCIdPQ3F2Zk8BxOkis4N8bncZLwVJa2nbcxlPpbzt7s7A8AxhW44y7QgNr
	 qvpa5Zjjo/AeQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 26 Dec 2024 16:56:34 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Alexey Romanov
	<avromanov@salutedevices.com>, Frieder Schrempf <frieder.schrempf@kontron.de>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v3 0/7] mtd: spinand: add OTP support
Date: Thu, 26 Dec 2024 16:55:45 +0300
Message-ID: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [172.28.224.140]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190075 [Dec 26 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/12/26 12:31:00
X-KSMG-LinksScanning: Clean, bases: 2024/12/26 12:31:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/26 12:50:00 #26919000
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_055647_658552_C61BA6D2 
X-CRM114-Status: GOOD (  10.27  )
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
  v3 since v2 at [1]:
    - Make cosmetic changes (Miquel Raynal)
    - Separate patch to introduce helper functions
    - Use dev_warn() instead of pr_warn()/WARN()
    - New patch for introducing the start_page field when defining OTP
    - Use mem_is_zero()

  v2 since v1 at [2]:
    - Make cosmetic changes (Miquel Raynal)

Links:
  [1] https://lore.kernel.org/all/20240827174920.316756-1-mmkurbanov@salutedevices.com/
  [2] https://lore.kernel.org/all/20240617133504.179705-1-mmkurbanov@salutedevices.com/

Martin Kurbanov (7):
  mtd: spinand: make spinand_{read,write}_page global
  mtd: spinand: add OTP support
  mtd: spinand: make spinand_{wait,otp_page_size} global
  mtd: spinand: add start_page to otp layout
  mtd: spinand: otp: add helpers functions
  mtd: spinand: micron: OTP access for MT29F2G01ABAGD
  mtd: spinand: esmt: OTP access for F50{L,D}1G41LB

 drivers/mtd/nand/spi/Makefile |   3 +-
 drivers/mtd/nand/spi/core.c   |  49 ++++++-
 drivers/mtd/nand/spi/esmt.c   |  70 ++++++++-
 drivers/mtd/nand/spi/micron.c | 113 +++++++++++++-
 drivers/mtd/nand/spi/otp.c    | 267 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  70 +++++++++
 6 files changed, 560 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/otp.c

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
