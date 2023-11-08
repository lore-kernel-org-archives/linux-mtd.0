Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DA0C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 17:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+J3zFb+1pGZrd8E8BZb140TO045+o2/pB7UWmRGamfw=; b=hhvap1fWRJZ+h0
	D+kt6uEuPCA4l8xBXm/I4CthjiEKQ6S4FZw5KlMIsEWT2zzz0a8VQhS5ctVq+BgUZ9vLYJz198V7w
	xftxEE6YrC9h/eldgbKQvLo3nVWZ9Cf8bW3WasrJFOhjQaXTb7/rWltmO63uuvbeKCU3oG4jNupbI
	j3vVlIuIZZwXmmYKQ9nh/PcOkFVB/4N15C4BH6UULY4uY1W/7j5EKkoRFXVntrYveV7QD2SI2rggN
	TYpL1W8xYWnmiAdB8qvH4U9xqQmShJLDEOU8KzxM/kXpSUhJgy0rzN5awrgVRQkAK34/HAueG+TS2
	GpKLNgGKRc9ewmX5sN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m64-004NUG-2v;
	Wed, 08 Nov 2023 17:12:08 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m60-004NPE-13
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 17:12:06 +0000
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="182203715"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2023 02:12:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DA3F2402E576;
	Thu,  9 Nov 2023 02:11:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Michael Walle <michael@walle.cc>,
	Mark Brown <broonie@kernel.org>,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 2/4] mtd: spi-nor: Add post_sfdp() callback
Date: Wed,  8 Nov 2023 17:11:47 +0000
Message-Id: <20231108171149.258656-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_091204_478996_0993CBE4 
X-CRM114-Status: GOOD (  11.00  )
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

Some generic flash devices such as Renesas AT25QL128A serial nor
flash requires the IO pins must be in high-impedance before the
falling edge of the first data out clock for the Fast Read Quad
IO.

Add post_sfdp() callback for generic flash devices and then call
spi_mem_set_iofv() to configure IO fixed value to control the pin
state.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mtd/spi-nor/core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..eef3c286b174 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1997,6 +1997,21 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
+static int spi_nor_generic_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_device *spi = nor->spimem->spi;
+	const u8 *id = nor->id;
+
+	if (spi->mode & SPI_TX_QUAD && nor->spimem) {
+		const struct spi_nor_id *at25ql128a_id = SNOR_ID(0x1f, 0x42, 0x18);
+
+		if (!memcmp(id, at25ql128a_id->bytes, at25ql128a_id->len))
+			return spi_mem_set_iofv(nor->spimem, 0xff);
+	}
+
+	return 0;
+}
+
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
 	&spi_nor_eon,
@@ -2015,8 +2030,13 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_xmc,
 };
 
+static const struct spi_nor_fixups spi_nor_generic_fixups = {
+	.post_sfdp = spi_nor_generic_post_sfdp_fixup,
+};
+
 static const struct flash_info spi_nor_generic_flash = {
 	.name = "spi-nor-generic",
+	.fixups = &spi_nor_generic_fixups,
 };
 
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
