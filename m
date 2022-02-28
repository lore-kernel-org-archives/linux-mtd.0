Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE78C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cHkiU2RFZMVuX57xEU0dhtQ+T7XusfjK7SU7Li8Uw+Y=; b=HPaP38ieXUimnl
	Fr+wHlDDU60MuzrgvIWA8GY5mzursJP9q1q3vW5ZVOwC50yBrJgiLcE+5gORfNpypuGVsIXeY3KLA
	JQD09CpnriAkemj5K/tUouDvlGUMCEsR2WRBQoJmRLBSkCvoqze4L16SbGWBa5E5CpxWwxeP2/hSj
	gjNclToaQtRhgfhs5P03XeWYCesHeC2+yHYbUYcnK1VKXp4ITix3G4fjT1nZy/PQVAoqt99s+CP7x
	c8nnlsqfczcuW09u4P+JGIiUiWbx33+Sm/mjpOuCA4yn0u+UFGRLLuHU25VHdvOova+97C5GQYtVk
	fP4xByclL/y9RzeoSlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgKy-00CeaW-Ay; Mon, 28 Feb 2022 13:45:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgKv-00Cea3-PF; Mon, 28 Feb 2022 13:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055913; x=1677591913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EtFiFcCF/Pmo5CHCOR90IWGS6JiiaZ3DPkFG0COOhBY=;
 b=S/G0KLlppKqSX2fJy6qCRBieB6bkRGXogN2D/FhdCeeVZ6o/iWjoVodb
 JiKZHqoPGYcbYOR1CFecnEZVcFnuTgLdCuPKNEUMESYnMMAjq/LL1g6PV
 OqnO131f/CDkeCek7TSMXg8JohdS8kXgZ+VBZ1/sKC/m7nUQG7fiGdyJi
 3+VYXeBZYSpM4rMPptr3cYy07fjMdsek+XmQnCt+pq0/yJ8IlxJ0woU4g
 9nwEpAcAulV8gixkhzv9uI0Zj1m+BR5DS5F/HGRGM7otX3knzKQDVgiyV
 V9HG2lvTWFdvNcizyp45pItvxSCiy/S1A/eooSbGwUeLWM3SWBJOR6OCE g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="163872923"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:11 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 0/6] mtd: spi-nor: Handle ID collisions
Date: Mon, 28 Feb 2022 15:44:59 +0200
Message-ID: <20220228134505.203270-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054513_876243_CED6680B 
X-CRM114-Status: UNSURE (   7.83  )
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

Tested with MX25L3233F. I need sysfs dumps where there aren't.

v4:
- adapt core to handle collisions between SFDP and non-SFDP flashes
- rebase on latest spi-nor/next

v3:
- report correct manufacturer name in ID collisions driver
- use fixup name of the first flash, not of the one that collide
- use xxd to dump sfdp (where I had the flash)
- drop locking support on xt25f128b
- constify flash_info fixups hook

Tudor Ambarus (6):
  mtd: spi-nor: core: Report correct name in case of ID collisions
  mtd: spi-nor: core: Handle ID collisions between SFDP & non-SFDP
    flashes
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L3233F and
    MX25L3205D
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L12805D and
    MX25L12835F
  mtd: spi-nor: Introduce Manufacturer ID collisions driver
  mtd: spi-nor: manuf-id-collisions: Add support for xt25f128b

 drivers/mtd/spi-nor/Makefile              |  1 +
 drivers/mtd/spi-nor/core.c                | 21 +++++++++--
 drivers/mtd/spi-nor/core.h                |  1 +
 drivers/mtd/spi-nor/macronix.c            | 46 ++++++++++++++++++++++-
 drivers/mtd/spi-nor/manuf-id-collisions.c | 46 +++++++++++++++++++++++
 drivers/mtd/spi-nor/sysfs.c               |  4 +-
 include/linux/mtd/spi-nor.h               |  6 +++
 7 files changed, 118 insertions(+), 7 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
