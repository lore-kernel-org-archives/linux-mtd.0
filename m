Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DD6CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ySY4cJ6k0xCnWxZeeztZdCgNhWOLgM3o/8/KCyPiCE8=; b=ykOiLrz5Vcrjr2
	+2akNjtTxlE0P0PELYNDfpu1N+f3MdZ6V8Tev7f+zAjjekTo1TGhL4/bTStbTCpYXMtX+hAyGrqgm
	sDsFLSXxexnmuGjKn1nN3L66rqJVyDLvhgnpUtfhEcFFhOqwgAGXEX9vCoXVy7QurcXexgFId8yBc
	5Bhf8N5VQKWknBt6hQMgkZf4ScyYJxl4fCWJ5p38UefpgHydYt9bb4TJwSBzl7bU3vvlirc74Drod
	3MDnl4m7cd0OL0Hy7Ppgv6GJqAFK0VJapNuMYbW70xNnARCxy8Ab9AnezmzjxV1Mb+CNWvEEmHbZn
	B/ca4cfGL6U3oTmsK3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsro-000epm-0V;
	Thu, 12 Oct 2023 10:24:32 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsrj-000eo6-21
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 10:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=36jk6
	CeO4wFJivet1w1wQFl1FwitYQOJSxAYUuV6ZJQ=; b=iD36WltUFX4fdaPMrnnV0
	V3daiykuiju6j12G6iz/3MWWpaMydLNm0N7qEHaDmmXwg0kQQWEtfnAP48N6jnBW
	fSwwLFzCKzd+B+lrd3CEoufplwMn0sdAv+PUGzrpBGIcxxsZV5U5J9xdqnqecLX3
	KiQF1puTCjxgddxloUI88M=
Received: from localhost.localdomain (unknown [119.123.76.99])
	by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wDHzzJOySdlnIxuAQ--.19284S4;
	Thu, 12 Oct 2023 18:24:15 +0800 (CST)
From: Bruce Suen <bruce_suen@163.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bruce.sun@xtxtech.com,
	Bruce Suen <bruce_suen@163.com>
Subject: [PATCH V2] mtd: spinand: Add support for XTX XT26xxxDxxxxx
Date: Thu, 12 Oct 2023 06:24:12 -0400
Message-Id: <20231012102412.10581-1-bruce_suen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDHzzJOySdlnIxuAQ--.19284S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw17Kry3Xr4rCrWxtF13Arb_yoWxJFW5p3
	s8tF98Gr48Ga1xu3WIqayDArn8Xwn2krW7uw1j9F1YvFyFk3sIvFW7Cry7Cr1DJ3y8Jayf
	Cw4UKry7Ww4YyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi_MaUUUUUU=
X-Originating-IP: [119.123.76.99]
X-CM-SenderInfo: 5euxuvpbvxv0i6rwjhhfrp/1tbiWRIHKFWB1KTtuwAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032428_073555_9AFD1B3C 
X-CRM114-Status: GOOD (  11.78  )
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

Add Support XTX Technology XT26G01DXXXXX, XT26G11DXXXXX, XT26Q01DXXXXX,
XT26G02DXXXXX, XT26G12DXXXXX, XT26Q02DXXXXX, XT26G04DXXXXX, and
XT26Q04DXXXXX SPI NAND.

These are 3V/1.8V 1G/2G/4Gbit serial SLC NAND flash device with on-die
ECC(8bit strength per 512bytes).

Datasheet Links:
- http://www.xtxtech.com/download/?AId=458
- http://www.xtxtech.com/download/?AId=495

Signed-off-by: Bruce Suen <bruce_suen@163.com>
---
v1->v2:
 - reserve 2 bytes for BBM
 - use FIELD_GET() nand macros to get ecc status
---
 drivers/mtd/nand/spi/xtx.c | 134 +++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index 3911520f7..702dd5ef8 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -4,6 +4,7 @@
  * Felix Matouschek <felix@matouschek.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
@@ -15,6 +16,12 @@
 #define XT26G0XA_STATUS_ECC_8_CORRECTED	(3 << 4)
 #define XT26G0XA_STATUS_ECC_UNCOR_ERROR	(2 << 4)
 
+#define XT26XXXD_STATUS_ECC3_ECC2_MASK	    GENMASK(7, 6)
+#define XT26XXXD_STATUS_ECC_NO_DETECTED     (0)
+#define XT26XXXD_STATUS_ECC_1_7_CORRECTED   (1)
+#define XT26XXXD_STATUS_ECC_8_CORRECTED     (3)
+#define XT26XXXD_STATUS_ECC_UNCOR_ERROR     (2)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -84,6 +91,53 @@ static int xt26g0xa_ecc_get_status(struct spinand_device *spinand,
 	return status >> 2;
 }
 
+static int xt26xxxd_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
+
+	return 0;
+}
+
+static int xt26xxxd_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 2;
+	region->length = mtd->oobsize / 2 - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops xt26xxxd_ooblayout = {
+	.ecc = xt26xxxd_ooblayout_ecc,
+	.free = xt26xxxd_ooblayout_free,
+};
+
+static int xt26xxxd_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	switch (FIELD_GET(STATUS_ECC_MASK, status)) {
+	case XT26XXXD_STATUS_ECC_NO_DETECTED:
+		return 0;
+	case XT26XXXD_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	case XT26XXXD_STATUS_ECC_1_7_CORRECTED:
+		return 4 + FIELD_GET(XT26XXXD_STATUS_ECC3_ECC2_MASK, status);
+	case XT26XXXD_STATUS_ECC_8_CORRECTED:
+		return 8;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
 static const struct spinand_info xtx_spinand_table[] = {
 	SPINAND_INFO("XT26G01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xE1),
@@ -115,6 +169,86 @@ static const struct spinand_info xtx_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&xt26g0xa_ooblayout,
 				     xt26g0xa_ecc_get_status)),
+	SPINAND_INFO("XT26G01D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x31),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26G11D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x34),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26Q01D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x51),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26G02D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x32),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26G12D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x35),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26Q02D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x52),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26G04D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x33),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26Q04D",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x53),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26xxxd_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops xtx_spinand_manuf_ops = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
