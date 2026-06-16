Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7D0CD98E1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NYhFf8yNBPUzuu6ye5+KjgFdvp8C6IYiw3sFmcyeK3Q=; b=bZQW5bl0kjvapa
	U6JfXekvyNDSjDo8N8+FC5y2v3/IOS7tGwdLKh+ln3ko0OY4mOSuFkZvaCjyS+g0yZF09/rCMZrHV
	rztR2HC1Y72CkR7vGUzSa+SHl/E+dIIL8ICSuXWJLQxJ7QDQ0P1it3a5FdnDbubiKt1o0KRjaQONS
	kdlWMG8+Fg7ig3lLx5A8gWq2Do6Av4iGvH6HpSXAYirHndOOTM20eyRWIHU7ntO4Z6RDJKNh1CDGY
	U1ZIpvl/7mRxam+xrDqx+wGGE6VWj1PpVlinNgalSqPR/maMnZ1SbeRXB23stGa/MxX7LY7D4VqlZ
	09SjRGsL9hVzuG8Ux55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTqk-0000000FqDP-2PvN;
	Tue, 16 Jun 2026 13:29:06 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTqf-0000000FqCc-14sX
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 13:29:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so5882632a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2026 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1781616539; x=1782221339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j04/SSL3KIyYOir0dqxM9ye8/QXWlIdbVpWZ7MGLWc0=;
        b=GQMBGGo39sGamkNJF6Ap+pK6bgnP3grN2nGeG9K/8KHSX2q0mHzYG7Y0Zxld+mM+KS
         3ObI/bVLuoSjUsRdHhKFEDYDikL5KhapRvnUWvsS2vMESZOAd/h70cofITafU5TqORAI
         jfVUzqlCSQ7uNJ2MPavq0NpzRg1n1Y7DlQq3l/yjm6nFKI7eyvG+a1kBBQ8A4bBnDx4p
         Zo06r+YrFjVmxddwHx2DNMRlKuIHBulujdjAn42q4WUwbjJL3JzqcSKXOsgpwBy4Uy5H
         xvD4+T4Lmvh3o5cOJGDOnDb3TZCVisSnN+6idul2bw/kcQitLe0xu0w7Y/F82USPylPz
         7bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616539; x=1782221339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j04/SSL3KIyYOir0dqxM9ye8/QXWlIdbVpWZ7MGLWc0=;
        b=Hppxfxu6DLR2NOgpVkZJtdbl4kybxOMdknjaiR3bItRt/scCbcmMmRDG2U8aEoK2I8
         qo058TwiOaTjjxyn622JDuu9ncwjbBxdbyg3p34vKLkNcMQ8xF4+uJsIbM6+KeehTWWY
         ZlK65HT6YrIPiZsbOZPu/lJEB8TcS9Zz17NOkn+7FLaNAa3eLI65jjTgzpAGRNnSjvky
         RTT2Id69EIbTT5p3QmGS9qS0tPggoX9UT9tWuNdl2UI+xavC3uIG3EyMyvsznAVpCk4T
         dDGSmnLBDs6eb/EPlPF1umOstizPiFdnGYXThHgw7t9OvNCLtNHgR/UdrYO6OOrxuolG
         Qztw==
X-Forwarded-Encrypted: i=1; AFNElJ96VrZH0kuPluyWQ0a8elObmncz2KXcKunyVCc9QDSuoAcjDenveycohC47nDDO1pQTsKidpDnmuiw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vmwWmtC4FUXwu5D2YOzzVhpaJxK1uug6S+XgJJZlksYBxMEE
	wcDfRk5jztjeKPUWA0i4MuHgC6MZP2R7EejKdRrOrIxpnf06edXvUTNAKU5HyF0XwjQ=
X-Gm-Gg: Acq92OGOdzMQ/188wMHO9qwBbuo33PONp7YWE/5Dv2Wlu2PTGfclhyn+oOY3nUl7pkH
	bWSCDRdo6fLFgFl+mSUaSkIMgmZE81kXn7ofBQg/14zXekxNayT8i4u04ky91lfxsA9S7tAuInw
	eZXu5tD5AS5kW2pqL0MFTIIFyCeswwYfzYvTzOtnKWhO9Bhk9eu41VzAm7w9sUbY/1Iu2L66OL9
	w/F2HdnmwXGfsa7wxdVOyR1d0bJGQ/fCgs0p1UNW+3xEMzuO+F/2MEUhJc5F0qHwI9ajeOn5zER
	+A1dudDVGFdp9nhRfPFukiOhaIz2ioPblqwU1YcALhs6/YE4uqeRS5HeXClXrEe8NDCjU7vbSTs
	0ruSfXwgCiThOHNVchWRypSjxiJHpSYbxxOx2PhjO2EO3cA2fFGjoK2Vkd5qxCBH4O7ysK+O42D
	vjQ3Tcg38BcOEwa8zeo+e8CssikXZYzfaK
X-Received: by 2002:a05:6402:3608:b0:691:b3b3:75a5 with SMTP id 4fb4d7f45d1cf-6950875ce91mr1934913a12.24.1781616538586;
        Tue, 16 Jun 2026 06:28:58 -0700 (PDT)
Received: from ownbook.home.lex.la ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693ab54e6e5sm4434112a12.1.2026.06.16.06.28.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 06:28:57 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	Maxim Anisimov <maxim.anisimov.ua@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH] mtd: spinand: add support for HeYangTek HYF1GQ4UDACAE
Date: Tue, 16 Jun 2026 16:28:44 +0300
Message-ID: <20260616132844.43994-1-f@lex.la>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_062901_361163_DB83BE8F 
X-CRM114-Status: GOOD (  25.63  )
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

The HeYangTek HYF1GQ4UDACAE is a 1 Gbit (128 MiB) SLC SPI-NAND with
2048 + 64 byte pages and on-die 4-bit / 512-byte ECC; its JEDEC
manufacturer ID is 0xc9. The die is GD5F1GQ4-compatible, so the OOB
layout is taken from the in-tree gd5fxgq4xa. The die exposes only a
coarse 2-bit ECC status with no fine-grained bitflip-count register, so
the status is decoded into a representative number of corrected bitflips.

It is found, among others, on some Keenetic KN-3411 (Buddy 6) units.

Datasheet:
https://www.heyangtek.cn/previewfile.jsp?file=ABUIABA9GAAgwsvRnwYo-eDpsgc

Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
This revives Maxim Anisimov's 2024 submission [1], which stalled on the
review feedback. Changes since then:

 - The OOB layout no longer leaves undefined bytes: it is taken verbatim
   from the in-tree gd5fxgq4xa, which the die is compatible with (BBM in
   byte 0, ECC parity in bytes 8..15 of each 16-byte section, the rest
   exposed as free).
 - The ECC status decoding is documented and uses '/' instead of a
   shift. The die exposes only the coarse 2-bit status with no register
   for the exact bitflip count, so the below-threshold code reports
   strength/2 and the refresh-recommended code reports the full strength.
 - The datasheet link is added to the commit message.

Tested on a Keenetic KN-3411 (Buddy 6): the chip is detected and a UBIFS
rootfs mounts and runs on it. nandbiterrs is not applicable here -- this
is an on-die-ECC part with NOP=1, so the in-place raw page reprogram that
nandbiterrs relies on corrupts the page independently of this driver.

[1] https://lore.kernel.org/linux-mtd/20240624061246.5292-1-maxim.anisimov.ua@gmail.com/

 drivers/mtd/nand/spi/Makefile    |   2 +-
 drivers/mtd/nand/spi/core.c      |   1 +
 drivers/mtd/nand/spi/heyangtek.c | 132 +++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h      |   1 +
 4 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/heyangtek.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index a47bd22cd..b5ccb4486 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o otp.o
-spinand-objs += alliancememory.o ato.o dosilicon.o esmt.o fmsh.o foresee.o gigadevice.o
+spinand-objs += alliancememory.o ato.o dosilicon.o esmt.o fmsh.o foresee.o gigadevice.o heyangtek.o
 spinand-objs += macronix.o micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 0b076790b..0cdd4a62e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1336,6 +1336,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&fmsh_spinand_manufacturer,
 	&foresee_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
+	&heyangtek_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/heyangtek.c b/drivers/mtd/nand/spi/heyangtek.c
new file mode 100644
index 000000000..7fc50fd3d
--- /dev/null
+++ b/drivers/mtd/nand/spi/heyangtek.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Authors:
+ *	Andrey Zolotarev <andrey.zolotarev@keenetic.com> - the main driver logic
+ *	Aleksei Sviridkin <f@lex.la> - adaptation to the mainline Linux kernel
+ *
+ * Based on:
+ *	https://github.com/keenetic/kernel-49/commit/bacade569fb12bc0ad31ba09bca9b890118fbca7
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_HEYANGTEK			0xc9
+
+#define HYF1GQ4_STATUS_ECC_LIMIT_BITFLIPS	(3 << 4)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
+
+/*
+ * HYF1GQ4UDACAE is a GD5F1GQ4-compatible die, so the OOB layout is taken
+ * from gd5fxgq4xa: the on-die ECC parity occupies bytes 8..15 of each
+ * 16-byte section, the bad block marker sits in byte 0 and the remaining
+ * bytes are exposed as free.
+ */
+static int hyf1gq4_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int hyf1gq4_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	if (section) {
+		region->offset = 16 * section;
+		region->length = 8;
+	} else {
+		/* section 0 has one byte reserved for the bad block marker */
+		region->offset = 1;
+		region->length = 7;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops hyf1gq4_ooblayout = {
+	.ecc = hyf1gq4_ooblayout_ecc,
+	.free = hyf1gq4_ooblayout_free,
+};
+
+static int hyf1gq4_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		/*
+		 * The die exposes only a coarse 2-bit ECC status and has no
+		 * register for the exact bitflip count. This code means
+		 * "corrected, below the refresh threshold", so report half of
+		 * the ECC strength as a representative value.
+		 */
+		return nanddev_get_ecc_conf(nand)->strength / 2;
+
+	case HYF1GQ4_STATUS_ECC_LIMIT_BITFLIPS:
+		/*
+		 * "Corrected, refresh recommended": report the full ECC
+		 * strength so the upper layers relocate the data.
+		 */
+		return nanddev_get_ecc_conf(nand)->strength;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info heyangtek_spinand_table[] = {
+	SPINAND_INFO("HYF1GQ4UDACAE",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x21),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&hyf1gq4_ooblayout,
+				     hyf1gq4_ecc_get_status)),
+};
+
+static const struct spinand_manufacturer_ops heyangtek_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer heyangtek_spinand_manufacturer = {
+	.id = SPINAND_MFR_HEYANGTEK,
+	.name = "HeYangTek",
+	.chips = heyangtek_spinand_table,
+	.nchips = ARRAY_SIZE(heyangtek_spinand_table),
+	.ops = &heyangtek_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 782984ba3..48357e6ff 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -437,6 +437,7 @@ extern const struct spinand_manufacturer esmt_c8_spinand_manufacturer;
 extern const struct spinand_manufacturer fmsh_spinand_manufacturer;
 extern const struct spinand_manufacturer foresee_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
+extern const struct spinand_manufacturer heyangtek_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
