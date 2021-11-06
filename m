Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F9BC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 782D661360
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 782D661360
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFO3yF+GjI8apmA/b/a2+KnesPe25eWlR2jPDzaWMvM=; b=Gaeyhs+E7VxaHG
	AwOgV1KzBEo4XbgUGsevMiazXXBhSZcdxHr/2YIoQjEDEkehzt/PDe/1yWT5kMOiURU9nDZ6dvozC
	WpmTs0LowMAUlC2c0Lw/0zsN9y5sePpOzun4WK/Pcv7bYFoKQb37lHbLLWCz//vTM0Q/iP1atsV13
	aouP4Qt9+j7NMbZe56wvmbR2R6KFciy0JuTQKUTQh+A8/mGPS9+iSjqTKN6ILvEa6RvzSX6UGtowJ
	oLNPisFSqQ36l+W0n0TP6U3tL5dFg2ImloirCA5FU2/I4lYRA+2VI6ir2La/F1cDRW3jmUblMaZsp
	zg7u1uWMnP4HgtLMsncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPFy-00DGL1-JN; Sat, 06 Nov 2021 17:13:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOq0-00D8Rk-Qd; Sat, 06 Nov 2021 16:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217200; x=1667753200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z6soVn9xoeuYgr6zhzwFuyha5kHuGktTj62rC+ELlJo=;
 b=bh2Kgiente9d8CXxH+ArhMbvT5Q5CbX+W9c4ycry0Xrne37DHVVpVe4j
 n/NxY+w6Jv4WwsRJmytXcABIXAbl2btV66GlLc+1GnDrmaCqmnRfHj7qt
 VdfZ7TrJtZ5h4+wwYpj5BM6nOp68kKy+IQPe4M+rZC/0Ze5oZsjaMHLdW
 18WWKyaDy2wYki/FcX9OUUxJvjTDACthG7AfsfqEKGrIqqpDLI6+WcaGN
 jD+NzmMjPH/E0nMwzcCJKUFCmIQE1BYgNiyh2qyJTqmuhPqDLcVLe61gf
 LED0k5lEPi369t7EP4QTPKq2x3H09sZW1KozzhIHmmIs9UshKpuinco+D A==;
IronPort-SDR: nD2VmiKVKvukAoPFM3lRRvX7qlAVPt8qRa4ugcdlquXwCBk/BJh7oZhxa7RmJ2pjYsmB0JUJJ5
 ufsmBOaCumlAdpzzqDz2gxoEXG8p8TWfW9Azt3dIOE3w3f9xfQC0FIsOHD6s8DAoo0I9YcDuo9
 L7Pw76qmQrXb9BlnKi2MssP0GIJZp2mhOiAwYynUklkUPA+IWK9EncUqdasj4X1q4P4G00+OD8
 F5c1/3hWvamaTUb+muF87bMUY7ZRnplIa4rjLlIjdlMpjVq02gcSS4jrsoOGCGQtta20/8WI2g
 TppDfL5esbmkFFLxVEHZ/oZZ
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="142416176"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:32 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:37:27 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 6/6] mtd: spi-nor: manuf-id-collisions: Add support for
 xm25qh64c
Date: Sat, 6 Nov 2021 13:36:57 +0200
Message-ID: <20211106113657.172690-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106113657.172690-1-tudor.ambarus@microchip.com>
References: <20211106113657.172690-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094640_923319_C3B3F026 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Do not apply without:

# xxd -p /path/to/sfdp
# sha1sum /path/to/sfdp
# cat /path/to/jedec_id
# cat /path/to/partname
# cat /path/to/manufacturer 

Flash ignores the manufacturer continuation codes and is likely to
collide with other manufacturers flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/manuf-id-collisions.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index 7827cfc584df..0d0989dd25be 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -17,6 +17,15 @@ static const struct spi_nor_fixups boya_fixups = {
 	.late_init = boya_late_init,
 };
 
+static void xmc_late_init(struct spi_nor *nor)
+{
+	nor->manufacturer_name = "xmc";
+}
+
+static const struct spi_nor_fixups xmc_fixups = {
+	.late_init = xmc_late_init,
+};
+
 static void xtx_late_init(struct spi_nor *nor)
 {
 	nor->manufacturer_name = "xtx";
@@ -33,6 +42,10 @@ static const struct flash_info id_collision_parts[] = {
 			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		.fixups = &boya_fixups },
 
+	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
+	{ "xm25qh64c", INFO(0x204017, 0, 64 * 1024, 128, SPI_NOR_PARSE_SFDP)
+		.fixups = &xmc_fixups },
+
 	/* XTX (XTX Technology Limited) */
 	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP)
 		.fixups = &xtx_fixups },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
