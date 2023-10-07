Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC57E95A60
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Oct 2023 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NP32iP7LRHy3Avf017BwjBxxd/mZhNayd6B1drJgV7U=; b=w4722EWOqRDKAc
	asj4zReEV+FAtVrVrRPbat7eD3q/K+mkgai67jrVoMiTb/UcJGi4toqj4J1jWmb7juTNnc0bI2/2W
	8/kU4f/x0/a4FZXXpftlylzSxNI2YA7QVlnDly8oM29hLmhtmJb8vUP5/trRB0fd8Gp0+foZ9XfVZ
	rPFa9mHs7nw+6XxZPBq9929CY5irjloOjwwEpj0fxZzR8hUpKSGTuKi8FpIK9V7NRy3TmxSsPJTig
	6NYHQiphDYT0chqhKzhJSkFuhnOa5bVH3tRuP7dtUBSCZKA1bJ/Fv7SxcpPyhAWigEgV5GyqmMx3/
	cLRqUcJxFuhE31bcFLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp3Kr-007EZ0-1t;
	Sat, 07 Oct 2023 09:10:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp3Kp-007EYo-1V
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Oct 2023 09:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V39CxiZSDUQf8e1uB9LQcv8M+pyKfwkDnQKzxEeeZMg=; b=QQNMSnENzpsiXLIN9fGjMd8huX
	7LptQRbBzjcr0gCJr4oGrvSxwr9++gHzomIkLwcfjN3NOr7mdx1sMQXWDH/voLXgZNuVRbY9pNZkk
	1eu4hkQzzsyTl1Gp6Xg7ms1YcV0oAlDrStr4+/HpT/x5I06AunBgMJU7KreAnqGUTq6o2gQRnj19b
	8VqWfDIL+dy1y6n78Y8PffwsIBqNlldgP97ptLZhPFIW6yP1W3fkeNZtTSeBvxvGf18S4FwSbPC4I
	Y7t6O5ZZ0PGCsaNJMT1gais3Vh9ZlVIegMnjU5uzp/BuESz8JzyxFG9IPNSwwF6g/+bq3sfpCXdis
	TY7hJlsg==;
Received: from m12.mail.163.com ([220.181.12.196])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp3Kg-00DXCx-0r
	for linux-mtd@lists.infradead.org;
	Sat, 07 Oct 2023 09:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=V39Cx
	iZSDUQf8e1uB9LQcv8M+pyKfwkDnQKzxEeeZMg=; b=DQLeVt6m2a5v2B9HnMlb+
	KgegLvkIBhH/xTxfnAr71ka1wJz6m1FTbXyyS6tpGy4NO8Ac2PS6wWDHxPDvhg1E
	qQbzQaKlFu7O7EUTI4tHs2XnL1j/6Z13bu94LDO5CQr4iYOebd/N5LH5hjEOOBEB
	IC0M7KV0v/ZJxvPIaVjrbc=
Received: from localhost.localdomain (unknown [119.123.76.99])
	by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wC374hnICFlcTVCEA--.51153S4;
	Sat, 07 Oct 2023 17:10:00 +0800 (CST)
From: Bruce Suen <bruce_suen@163.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Bruce Suen <bruce_suen@163.com>
Subject: [PATCH] mtd: spinand: Add support for XTX XT26xxxDxxxxx
Date: Sat,  7 Oct 2023 05:09:54 -0400
Message-Id: <20231007090954.4569-1-bruce_suen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wC374hnICFlcTVCEA--.51153S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3JF4UKryUurWxJw1fCw1xXwb_yoW7tFyfp3
	s0qF98Kr48Ga1xu3WIqayDJrn8Xwn2krW7uw12k3WYvFyFk39IvFW7Cry7Cr4DG3y8Jayf
	Cw4UKry7Ww4YyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piE4E_UUUUU=
X-Originating-IP: [119.123.76.99]
X-CM-SenderInfo: 5euxuvpbvxv0i6rwjhhfrp/xtbBFg0CKFgi7BTPMAAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_101049_978970_A666C661 
X-CRM114-Status: UNSURE (   9.96  )
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
 drivers/mtd/nand/spi/xtx.c | 135 +++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index 3911520f7..ddc69ef76 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -15,6 +15,13 @@
 #define XT26G0XA_STATUS_ECC_8_CORRECTED	(3 << 4)
 #define XT26G0XA_STATUS_ECC_UNCOR_ERROR	(2 << 4)
 
+#define XT26XXXD_STATUS_ECC_MASK	    GENMASK(7, 4)
+#define XT26XXXD_STATUS_ECC_NO_DETECTED     (0 << 4)
+#define XT26XXXD_STATUS_ECC_1_7_CORRECTED   (1 << 4)
+#define XT26XXXD_STATUS_ECC_8_CORRECTED     (3 << 4)
+#define XT26XXXD_STATUS_ECC_UNCOR_ERROR     (2 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -84,6 +91,54 @@ static int xt26g0xa_ecc_get_status(struct spinand_device *spinand,
 	return status >> 2;
 }
 
+
+static int xt26xxxd_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
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
+	region->offset = 1;
+	region->length = mtd->oobsize / 2 - 1;
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
+					 u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case XT26XXXD_STATUS_ECC_NO_DETECTED:
+		return 0;
+	case XT26XXXD_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	case XT26XXXD_STATUS_ECC_1_7_CORRECTED:
+		return 4+((status & XT26XXXD_STATUS_ECC_MASK) >> 6);
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
@@ -115,6 +170,86 @@ static const struct spinand_info xtx_spinand_table[] = {
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
+		     SPINAND_HAS_QE_BIT,
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
+		     SPINAND_HAS_QE_BIT,
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
