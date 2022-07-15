Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A8BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhiR+VNJp5zSo2B0hcp+PhpCkbmB85BmbCwU7KqIT7k=; b=nAU3v90sV7u2ir
	p0epEVnivquuENhNb1j1gfr4k804bSV4X+yDqdBxkDZ0ajbsgIkRmKMXyNSe8/M9c+bcrewlUmA/Y
	DMUN/VV/HdDm9oKTRqYtTNIgDVrZJZEDpWOyAgL3T1ukeQX5gDIK/Pqept2T+Qsv4zqSJzjn6v4z0
	tkwozOudf7OILYK2AdmgwfuPq1urF8joyBj/uBVM/9YOM5OHkPPIldv+PIOZsDdmN6u65aQCW1mNF
	iQzT7/lxrtaag4d793/81gpgBgBOSwJQTWFT8Hl8/bqjSdUXkjns/caKeTYrPLLnXMemoePwq/Eej
	WCWvCoDB3C4uPf2s54Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0w-006S3U-W7; Fri, 15 Jul 2022 10:57:43 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0l-006Ryr-CC
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 10:57:32 +0000
X-IronPort-AV: E=Sophos;i="5.92,273,1650898800"; 
   d="scan'208";a="126292367"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jul 2022 19:57:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 820E34251BF2;
	Fri, 15 Jul 2022 19:57:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
Date: Fri, 15 Jul 2022 11:57:15 +0100
Message-Id: <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_035731_553850_50028038 
X-CRM114-Status: UNSURE (   8.24  )
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

Add SNOR_ID3 macro to get chip info by parsing sfdp.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/mtd/spi-nor/core.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 61886868cd02..153c1a0b2eda 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -548,6 +548,15 @@ struct flash_info {
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
 
+#define SNOR_ID3(_jedec_id)						\
+	.id = {								\
+		((_jedec_id) >> 16) & 0xff,				\
+		((_jedec_id) >> 8) & 0xff,				\
+		(_jedec_id) & 0xff,					\
+	},								\
+	.id_len = 3,							\
+	.parse_sfdp = true,						\
+
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
