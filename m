Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F067C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOIbz6OMCVhsLFkT9dTtc6LjLxyTpTgoGEwowubu2p4=; b=mEDaojAhePmcBm
	Ujf781Fdq4bVPhVIhSuKA+1eUYBqEmq6ARTmJ400O7Hfk5uRhD4S2uFGOng3RugKzkSa3LfTBFmMD
	TLfpj5F7bD45S5Hwnyg3IG9rAax1BvH4KNgm1EL0GQXC0wKlETPnZbfHhRRdiXeLioo8rOZyouCOX
	u/zNVzzQd3E3ThLD/+GGM+TyYt/dhX7peOuR75pD+RG8dNYkfHeziGXpJoajDEx4CZy3pjF5Hp3np
	6V9LUFaVzzPHjYk5rydKcaECF7DVzsSkmFN69a5I8tOXAbOlxP+1x85QgWmDd/I5h5QMI8durobCO
	ZKWmlUXdbdhvrdIfrxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9pS-00GE6h-Bc; Fri, 03 Dec 2021 14:46:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Te-00G86k-T2; Fri, 03 Dec 2021 14:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541435; x=1670077435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVip7n7+IvSNBYXQtRjv8uiLQ+MDFL++mvxmwPscxsU=;
 b=IzUCMBCxPUHqCMDj1FLZmxuQgQzp/1c2vxQIBYg2g4tbpvMrwlEs56+8
 3nE3pS2flIagmPeKCi0MSwQKJQnC/9/bFhkC6HA0GkuR4inNkbV3qWGyA
 E+BeQXuxJSmaa1DHNJwZs1Z8AnaFvx7/Q2zN8Z+nDIdIy3H5bJ/zeXIc0
 S4CreAJm/arQf0xXVTqHZxa3vQ7TN7sM5lxM0xuHi2sHFiBsgP41CHKW6
 DsnGCc5jnpZeKeKxZoabavig8bWMcpMTigARD4PXj2iogcGLXrz6lGE2Z
 WdnyLHNsjTYomjGqBl9eACB510bdlZgucmEpcfgAqvOGAQShA2LhcL5ui w==;
IronPort-SDR: kIdepvyy+MOC9fmZq+V61F0kSKjf6qMJEKHaYAPPDt6HjD/nqsP0ukf/Jh1aarvBjxT72mfjmi
 kn0nKM5ykW1/Uy5im3E8GiqstDQgtWlgk/xwShEr3vNpBV8IK9u3MlbMfR/45iSHOiAnFjfMw0
 bPj2CpK901q8ymDPKJTl1QaT5P0noeb4jQlzKUKph162d5iGkFyKGH+DZCqtucwU2kCMmaHlOA
 cY42x8Vp2v1pITLZJNIvKrmzjQ7hXIC5N7KGIVGUVv9UmQforKt6rj+dfka8tLWnXZ3EQMBuKU
 80CABeLM/njamwbnv0jWzSlO
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141189577"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:53 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:49 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 11/14] mtd: spi-nor: winbond: w25q256jvm: Init flash based
 on SFDP
Date: Fri, 3 Dec 2021 16:22:53 +0200
Message-ID: <20211203142256.47370-12-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062355_035937_355064A4 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/winbond.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 421509406368..a7573df0a62d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -117,8 +117,7 @@ static const struct flash_info winbond_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		PARSE_SFDP },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
