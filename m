Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE889C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kNuTl/mBD7cHnfAVb29UY0DyfiEAgXJ2XwiJ7tg8ipw=; b=NbjNSuCk/5QYmL
	hidcpA+7bM+OjVJ8yqsltjt83Q6fufEr+DraJiXkZtSBuC+ttkqen69SOBSrDuwf8o72rqLKpxIi2
	BzhxXYI41VCnEsFkGLvKrgeZJ3LrWdhUYHrgEvE5dFhi/gOfTwHRav1aE0IXHhdc+7fvFuCUsrui8
	u87nN9TvYTbK1GYsctP0m8re3x6vBDznUR8c/y+BG5wYSarOq7sQDkygl8ksxMvBxgb6wo93M4Igc
	lF/mLzoL6Wrc6PR+xF70+FIdkfuRljnI7LUPJU/rjH/t6P1DZYf0zUVqL4s2IKdJZcee7EDGZZahs
	8YUMoCeM9mibTYmeR0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7fU-008cBM-C0; Wed, 20 Apr 2022 10:34:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fO-008c8K-U1
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450876; x=1681986876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hN+YFo8V3ZD60FPQlCtrm9OPlHU487xjyJBhUnbJURs=;
 b=pNfc4QIY0DHjheyXq7Q4DcYK3D/F1leMmhTO595ZJCDQ/xBBkzmMJLw+
 OFqvsL668Re+1lGMH18hxS/uipRkTLhvPyzmGLKV8ojjD7Wj6CST0l3ib
 LOSEHJjqmJ/GuvXRiRtzlYA4p+jF0r5ZiJYI0oNAzoZ8mXYt5VSd2UXtV
 rnd1BdzcMAAQA2QndMoDH0IsF/UjpV9TEi+GwNEhaWvnINmwEkZ8Korlm
 8KElCI8euOhewZutcXxUeny+UK0xW9Gs6mT0jdYDLPlrtePAFnYLTw0yn
 2vz5N5DAb8Y8QzmtxNQ6NlDoyuB1Q5uRax+FeoEEjHhTcMwIXuKhU6+ro A==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="153206876"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 00/11] mtd: spi-nor: Rework Octal DTR methods
Date: Wed, 20 Apr 2022 13:34:16 +0300
Message-ID: <20220420103427.47867-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033435_079009_BB3BAC87 
X-CRM114-Status: UNSURE (   6.95  )
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

v4:
- s/spi_nor_read_reg/spi_nor_read_any_reg and
s/spi_nor_write_reg/spi_nor_write_any_volatile_reg to comply with Micron
and Cypress's naming scheme. Update documentation description on
spi_nor_write_any_volatile_reg.
- 2 new patches, the last ones, where I remove status polling on write
volatile registers
- collect R-bs
v3:
- queue patch: "mtd: spi-nor: Introduce templates for SPI NOR operations"
from
https://lore.kernel.org/lkml/20220304093011.198173-1-tudor.ambarus@microchip.com/
The dependency chain between patches was too long and hard to follow.

- Rework patch "mtd: spi-nor: core: Use auto-detection only once"
according to Pratyush's and Michael's suggestions
- Remove dev_dbg messge from spi_nor_read_id() method and let the callers
use their own message (detection, octal dtr enable/disable)
- detailed version changes in each patch
 
v2:
- Fix bug on octal dtr disable, s/nor->reg_proto/SNOR_PROTO_1_1_1,
because after disable the nor->proto is not yet updated
- update function/macros names to comply with Michael's rename series.

Tudor Ambarus (11):
  mtd: spi-nor: Rename method, s/spi_nor_match_id/spi_nor_match_name
  mtd: spi-nor: Introduce spi_nor_match_id()
  mtd: spi-nor: core: Use auto-detection only once
  mtd: spi-nor: core: Introduce method for RDID op
  mtd: spi-nor: manufacturers: Use spi_nor_read_id() core method
  mtd: spi-nor: core: Add helpers to read/write any register
  mtd: spi-nor: micron-st: Rework spi_nor_micron_octal_dtr_enable()
  mtd: spi-nor: spansion: Rework spi_nor_cypress_octal_dtr_enable()
  mtd: spi-nor: Introduce templates for SPI NOR operations
  mtd: spi-nor: spansion: Remove status polling on volatile registers
    write
  mtd: spi-nor: micron-st: Remove status polling on volatile registers
    write

 drivers/mtd/spi-nor/core.c      | 254 ++++++++++++++++----------------
 drivers/mtd/spi-nor/core.h      | 115 +++++++++++++++
 drivers/mtd/spi-nor/micron-st.c | 139 ++++++++---------
 drivers/mtd/spi-nor/spansion.c  | 159 ++++++++++----------
 drivers/mtd/spi-nor/xilinx.c    |  12 +-
 5 files changed, 404 insertions(+), 275 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
