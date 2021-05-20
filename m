Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB4AC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 01:44:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0192611AD
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 01:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0192611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rAlpJU+3RB0JByiyLQWYiEAZxiQr3KPtX+5PUDYLdHM=; b=J6dVoijsLh0/wrsZJsLFWXvPfL
	Rpz7/mQygDJJOfh/1PRyCqciVfsIjs5qbNUS3CXVsscOaHqowGxjELa1hSxejQqOA0JJIJ+O755JO
	VU+sU5qnSZ0YuZWKEqRdGwKHAfM8ZW0yfLjL9qCrZ4xd3mk+jKirSYu9dTKEJetinFuhixQQOcUTd
	KGVTMkflIhy71gNhlUCt28KXgn9W6cATH6xhfebTdkXVnidGz5+Wnw6r2Ty7//EalAepPS2zZrGbQ
	EEvhZ1uooE4NjOb0KRe4acX5lg7jdGh2m3DyK+KCQBBfOuEXeGsUDgN66fzbBMmhHxMPq6eiJAgKM
	YqQDF0aQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljXim-005aGh-Ig; Thu, 20 May 2021 01:43:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljXig-005aGN-W8
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 01:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9e86LseijqL9Da17wUglznxkt3jUBuUGN/RJ6v5wN8w=; b=MXn+XTQWeyKAHNfhamu9HjtGuh
 ZLG+n04p4CPHnDv2ajb/FpdqdWXovxBlt6q3jQ5bfWiDkztw+YQ4RX/GMMdkOFBrhMAVUcapMuVEQ
 HsBFafeOD2DsyPALWS0Spf2XPxhVnZ9VNbSLkCRJYFGpPGVtELJv6lDPmAmaXfGGRVokpwmRnh9RT
 6XNaNsZYzSev5mahf02+Zmz1OdiWd24iv3Fp/kZ1zmMeCkBtBw19whQaZ4g/sPVrn9Ygcd4MY5p0W
 1oWQ5roJ86O69GNgXOYEvzzDbrSah7czQXLIFJd0FlH217ALEffTZK7Tfr4qd+srCgXH1woZ8nq03
 Tt1vT1qA==;
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljXic-00Fsut-WC
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 01:43:24 +0000
Received: from localhost.localdomain ([172.17.195.97])
 by TWHMLLG3.macronix.com with ESMTP id 14K1h6xM006958;
 Thu, 20 May 2021 09:43:06 +0800 (GMT-8)
 (envelope-from jaimeliao@mxic.com.tw)
From: jaimeliao@mxic.com.tw
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, zhengxunli@mxic.com.tw, ycllin@mxic.com.tw,
 Jaime Liao <jaimeliao@mxic.com.tw>
Subject: [PATCH] mtd: spinand: macronix: Add support for serial NAND flash
Date: Thu, 20 May 2021 09:45:08 +0800
Message-Id: <1621475108-22523-1-git-send-email-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 14K1h6xM006958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_184323_330488_23C5FF50 
X-CRM114-Status: UNSURE (   7.96  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jaime Liao <jaimeliao@mxic.com.tw>

Macronix NAND Flash devices are available in different configurations
and densities.

MX"35" means SPI NAND
MX35"LF"/"UF" , LF means 3V and UF meands 1.8V
MX35LF"2G" , 2G means 2Gbits
MX35LF2G"E4"/"24"/"14",
E4 means internal ECC and Quad I/O(x4)
24 means 8-bit ecc requirement and Quad I/O(x4)
14 means 4-bit ecc requirement and Quad I/O(x4)

MX35LF2G14AC is 3V 2Gbit serial NAND flash device
(without on-die ECC)
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7926/MX35LF2G14AC,%203V,%202Gb,%20v1.1.pdf

MX35UF4G24AD is 1.8V 4Gbit serial NAND flash device
(without on-die ECC)
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7980/MX35UF4G24AD,%201.8V,%204Gb,%20v0.00.pdf

MX35UF4GE4AD/MX35UF2GE4AD are 1.8V 4G/2Gbit serial
NAND flash device with 8-bit on-die ECC
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7983/MX35UF4GE4AD,%201.8V,%204Gb,%20v0.00.pdf

MX35UF2GE4AC/MX35UF1GE4AC are 1.8V 2G/1Gbit serial
NAND flash device with 8-bit on-die ECC
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7974/MX35UF2GE4AC,%201.8V,%202Gb,%20v1.0.pdf

MX35UF2G14AC/MX35UF1G14AC are 1.8V 2G/1Gbit serial
NAND flash device (without on-die ECC)
https://www.mxic.com.tw/Lists/Datasheet/Attachments/7931/MX35UF2G14AC,%201.8V,%202Gb,%20v1.1.pdf

Validated via normal(default) and QUAD mode by read, erase, read back,
on Xilinx Zynq PicoZed FPGA board which included Macronix
SPI Host(drivers/spi/spi-mxic.c).

Signed-off-by: Jaime Liao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 112 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 6701aaa..a989035 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -186,6 +186,118 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 		     0 /*SPINAND_HAS_QE_BIT*/,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+
+	SPINAND_INFO("MX35LF2G14AC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x20),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF4G24AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb5),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF4GE4AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2G14AC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa0),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2G24AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa4),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2GE4AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2GE4AC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa2),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1G14AC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x90),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1G24AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x94),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1GE4AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1GE4AC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+
 };
 
 static const struct spinand_manufacturer_ops macronix_spinand_manuf_ops = {
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
