Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D520EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8lw9kgA7tjVgmZcjw5OZ5PEVqOIdljgXS9kLhxzVhAc=; b=upnry3eilLaTlm
	z1blfiafbymg3leO1pk1hczA+TLSuUP03bzETbXtB91R6AMgNEXpFIEPzK/tMWF+hmG7wSIvKa5rs
	Lpv10dawKrcCsSkNoJwIL/z73sfN0tRggSrpIqdz3sV+BR1ZGwmSwuLBfMJ5mtwGGwk6a7g6i3ugU
	ggLAHTrJY/7OlXBaR2+n4H+D+lxOAn4riEpiWY/baad04UhHEXbBWPp7t8zn/zh7GIs7qAi8oBfLU
	bS+J59mrsILJcZfXkWDd9JdPgSiY61YmS7jVfTCFEjhoDMiHBFH2EkTIIbEeBxODmsbC9hgEFYzYX
	88AC3mJf1lyu2eAwkVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlbDq-002Hy0-4z; Mon, 02 May 2022 18:56:38 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlbDd-002Hw1-FU; Mon, 02 May 2022 18:56:28 +0000
X-IronPort-AV: E=Sophos;i="5.91,192,1647270000"; d="scan'208";a="119809059"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 03 May 2022 03:56:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1E0A940CB0B7;
 Tue,  3 May 2022 03:56:15 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Michael Walle <michael@walle.cc>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date: Mon,  2 May 2022 19:56:13 +0100
Message-Id: <20220502185613.83483-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_115625_667964_E3473C55 
X-CRM114-Status: GOOD (  14.03  )
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
$  xxd -p sfdp 
53464450060101ff00060110300000ff1f00010280000001ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
ffffffffffffffff501650190000ffff

:~# md5sum /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
23e3ec56b5b8f986d0488ba4727239dd

~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
1f4218

~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
at25ql128a

~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
renesas

RFC->v1:
 * Moved the flash definitions to atmel.c
 * Remove macro related to locking as it is untested.
 * Replaced INFO macro with SNOR_ID3
 
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/
---
 drivers/mtd/spi-nor/atmel.c | 55 +++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c  |  1 +
 drivers/mtd/spi-nor/core.h  |  1 +
 3 files changed, 57 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..61cff6de7db2 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -10,6 +10,15 @@
 
 #define ATMEL_SR_GLOBAL_PROTECT_MASK GENMASK(5, 2)
 
+#define SNOR_ID3(_jedec_id) \
+	.id = { \
+		((_jedec_id) >> 16) & 0xff, \
+		((_jedec_id) >> 8) & 0xff, \
+		(_jedec_id) & 0xff, \
+	}, \
+	.id_len = 3, \
+	.parse_sfdp = true
+
 /*
  * The Atmel AT25FS010/AT25FS040 parts have some weird configuration for the
  * block protection bits. We don't support them. But legacy behavior in linux
@@ -204,6 +213,52 @@ static const struct flash_info atmel_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K) },
 };
 
+static const struct flash_info renesas_nor_parts[] = {
+	{ "at25ql128a", SNOR_ID3(0x1f4218) },
+};
+
+/**
+ * renesas_nor_set_4byte_addr_mode() - Set 4-byte address mode for Renesas
+ * flashes.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
+ *		address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int renesas_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	if (ret)
+		return ret;
+
+	return spi_nor_write_disable(nor);
+}
+
+static void renesas_nor_default_init(struct spi_nor *nor)
+{
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->quad_enable = NULL;
+	nor->params->set_4byte_addr_mode = renesas_nor_set_4byte_addr_mode;
+}
+
+static const struct spi_nor_fixups renesas_nor_fixups = {
+	.default_init = renesas_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_renesas = {
+	.name = "renesas",
+	.parts = renesas_nor_parts,
+	.nparts = ARRAY_SIZE(renesas_nor_parts),
+	.fixups = &renesas_nor_fixups,
+};
+
 const struct spi_nor_manufacturer spi_nor_atmel = {
 	.name = "atmel",
 	.parts = atmel_nor_parts,
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b4f141ad9c9c..ba9f222da00b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1621,6 +1621,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_issi,
 	&spi_nor_macronix,
 	&spi_nor_micron,
+	&spi_nor_renesas,
 	&spi_nor_st,
 	&spi_nor_spansion,
 	&spi_nor_sst,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b7fd760e3b47..3d2e39329079 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -511,6 +511,7 @@ extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
+extern const struct spi_nor_manufacturer spi_nor_renesas;
 extern const struct spi_nor_manufacturer spi_nor_st;
 extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
