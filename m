Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE608C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Oct 2022 06:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKQzcWFiFFRZwqDvrx+QI67W+WHowxiWO3pYqaar3oM=; b=x1unjLOMu0BCTl
	rsovflqJKYYjSfDt4LZnjArSETDYMcQ8ibxWz3xFsgeiNcEmp+O+bG2eySFdF+9fNOS6rX1qd1wPv
	cNIXAg1uZEAL8DvhoTOQjFUqRaLb3VUJQdSWGC7ac1J1vL11GU4Wi/1ZgHz5pL/AR7Iqcryt/pK2w
	HHMpmUow9P6rxuzK0gpoQ3bewKLuuVprp7TGtBl+IP7ploIgvBxSA1w6008TGgHrIJiqwQE46lRfr
	dAHWBarNI2BulDFZUZ8odQ+YTEbuSWY7f3RkHnSq2918AAXUIAEwJZoW1AVyFTaSPa+4BKQ/tAPKc
	syKTDgTRHLK53yc2Uc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omU6A-00EWDR-BM; Sun, 23 Oct 2022 06:04:38 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omU65-00EWCY-FV
	for linux-mtd@lists.infradead.org; Sun, 23 Oct 2022 06:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666505073; x=1698041073;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=urzVgSnTrOa0Lulj3LDdQfuLpk5Eu8nvU+tXswVTwt0=;
  b=CxUyjetT569BJcUVOWAJ1ez5ZlW9EnFsDWhJpEllFY7ISvOCOFVnLL73
   vmFoNC1/dSA6SU1bPIIVpkd0HCwVnGXkOW68WMeeDHZuyUkMFm6AgUTLX
   1Q0KOJvjszgC5PcoGiDIuSWiToCJnoJPVLX+3chQFVayjQ6Nx1rDiqsmU
   lkdbz4J3V9wDSZSoD4X5Ro9mTAH/SqxW8OaMzr1Zf/XNmBezFRRZXFnp2
   24IlNaYyvW4kfi4+xf2cbepldKUFhjoXvW/g/Zqfhjcv/Mh+zrCDjtDXj
   5BH7BWC/7iFfxlnB4B9ovE2EzAwH/Sym98cv+QMkQtNznTVVrkAUAyVot
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="393548841"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="393548841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 23:04:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="960072350"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="960072350"
Received: from twinkler-lnx.jer.intel.com ([10.12.87.143])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 23:04:17 -0700
From: Tomas Winkler <tomas.winkler@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx77l51250f
Date: Sun, 23 Oct 2022 09:04:07 +0300
Message-Id: <20221023060407.1139129-1-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_230433_581439_961DE405 
X-CRM114-Status: UNSURE (   8.92  )
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

Add support for mx77l51250f spi-nor chips.

Datasheet: https://www.macronix.com/Lists/Datasheet/Attachments/8760/MX77L12850F,%203V,%20128Mb,%20v1.2.pdf

Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..ec7abb64e2bc 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -100,6 +100,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx77l51250f", INFO(0xc2751a, 0, 64 * 1024, 4096)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
