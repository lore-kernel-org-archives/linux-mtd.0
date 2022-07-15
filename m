Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81BFC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoX9Pz2uoLoa14saQNefz5m3Y5ySa8Wf8Cn2YN7fTnc=; b=vsjErTxMLxN0m8
	RPGK4dK4bSkBQ2XaS+y6/viNuPH3nmKJ804VIupa4TqSz2UGSFLoNgrabKxvtw7Rap3tcigEnyRTt
	aiTvE1cuYzNRozcfSFQjI4/DLuUWBHRFhhtawWA2eHWFOuuyHRPi0eAAc/PLkapWT/Pp13bkEbkPA
	v/SxN/ERvfHo3IvNkIbRI3pdGB3PoWKRoj7JwwmtbxDyOa0l3nSYbd6CaaDPvM1Jd0oYLUg1EU6rY
	pJULnpTCJxNEc3FRZAtC6PBxg2SG57z/Q456ghtxXvFhGCimC0blQ6ogW5qChBDUY6SXGeeSsatvn
	bCohKBJvKhC/nTWVMWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ16-006S6z-K0; Fri, 15 Jul 2022 10:57:52 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0o-006Ry8-G1; Fri, 15 Jul 2022 10:57:36 +0000
X-IronPort-AV: E=Sophos;i="5.92,273,1650898800"; 
   d="scan'208";a="127981317"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jul 2022 19:57:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 003B14251BF2;
	Fri, 15 Jul 2022 19:57:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Michael Walle <michael@walle.cc>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date: Fri, 15 Jul 2022 11:57:16 +0100
Message-Id: <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_035734_668700_F2DA53BA 
X-CRM114-Status: UNSURE (   8.94  )
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

Add support for Renesas AT25QL128A serial nor flash.
Details of flash chip can be found here [1]

[1] https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
$ xxd -p sfdp 
53464450060101ff00060110300000ff1f00010280000001ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
ffffffffffffffff501650190000ffff

$ md5sum /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
23e3ec56b5b8f986d0488ba4727239dd  /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
$ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
1f4218
$ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
at25ql128a
$ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
atmel
v2->v1:
 * Added flash definitions into Atmel table.
RFC->v1:
 * Moved the flash definitions to atmel.c
 * Remove macro related to locking as it is untested.
 * Replaced INFO macro with SNOR_ID3
 
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/
---
 drivers/mtd/spi-nor/atmel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..80c24d138b27 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -186,6 +186,7 @@ static const struct flash_info atmel_nor_parts[] = {
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "at25ql128a", SNOR_ID3(0x1f4218) },
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
