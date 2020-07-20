Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ACAC433E5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F563207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KKzP6zq+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fczVaHsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F563207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WwhyI+3OC7EUJFTaxGiX0m1+MbW79N3LwfJRJ7ttzDU=; b=KKzP6zq+vR+/SYfMp4L59slE6
	tNvNaqodM0IcjBs/ProLHQ8Zff083WfG25H2RZQftDZbx1lAMZ5SszjVfELaBgAbxPfiZg1MrmksX
	U/zt++s4fdlknOgEd1UZoYJquFPodeH4UvNKbO2LhMPYPhvvQfscCHx9bBQriVG3pB5RanHM3zJsX
	0i5WViY2BRk8WMa+PXNTkFhUvbjZZTYPaJheXaV6hP6txY9FbMxgb7ReGeJ0PYW10o33yfC2TXmFd
	8mhaFznrS25ogZzDA/4aNtefUc6uIANur/C6XFKyScY2s1QwCEXjhVM3vd7z/c9EH44IOG4PeiJOi
	K+U0gmRSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPU-0006Mf-QS; Mon, 20 Jul 2020 04:28:16 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPQ-0006KT-FJ
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219293; x=1626755293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zV3DB4Soo0AgTqcku8kWwzdbjk7AmRX4N9Biz2L78jw=;
 b=fczVaHsld91+nZGxO4aZxmDk/HFXFaTmZ0vyKlASjVgeze1jiuzWohbA
 XYe5qmHA+if9VArdAmS7sZY70eUcyvHk2sCYjKbZRHfCjMTcRnLBrSkvQ
 heSdatdjpqyEn1DzAiTbojGTe5yJJq4cK1rlBrXsZbHSw5QfYg5KMpYUI
 4hHFQnKuE10ND5/KDrYCrlHLj3GW1h/wj4cPgqIeT4zz8cUNoNbHqUkXV
 /X1cv1kValb/WD1TMT+hT4gTZTSleNCZ649XzXU6NnJwLGlTJefPLs4Yr
 pApCGJJtgraSMrDrtO/1ih6TkRwszjj4WUit9WJ3nxvhHEJ2KohiTtgA1 g==;
IronPort-SDR: veEyBfKF7RlnaSM+3mP5ziswc8hQfZ8PVp+Bj0bvJ3EjTyQP3YcJYu4J6sKeQlde/ANc3SNx5I
 6IwWLD+MQXZCwrFufdCu9Sbw491bCC94qoqNoQTmsrkxrmkNiw3682SCPYcfVgCDT24/tPQ9ff
 XUODqZsewz56yZ60eZbqmyemRAQB1w3y4/fVPCROAflmYjC4xL5ogL/s3yI2MVSJm8cFKJ0UlQ
 j8hbFCMIjkeRZfJoG5qTUlDdeJsHTm8hPBdI4c97cto8TCk3vQ69yJPm0Ic4aisiExndDGUxLn
 wX8=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="83812060"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:28:11 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:33 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 3/6] mtd: rawnand: atmel: Use nand_{write,read}_data_op()
Date: Mon, 20 Jul 2020 07:27:56 +0300
Message-ID: <20200720042759.1482341-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002812_894888_117B739F 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Use the nand_{write,read}_data_op() helpers instead of calling the
atmel_nand_{read,write}_buf() functions directly. This will ease the
transition to exec_op().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index f738c4bfbd77..a3f901e64bfb 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -833,7 +833,7 @@ static int atmel_nand_pmecc_write_pg(struct nand_chip *chip, const u8 *buf,
 	if (ret)
 		return ret;
 
-	atmel_nand_write_buf(chip, buf, mtd->writesize);
+	nand_write_data_op(chip, buf, mtd->writesize, false);
 
 	ret = atmel_nand_pmecc_generate_eccbytes(chip, raw);
 	if (ret) {
@@ -843,7 +843,7 @@ static int atmel_nand_pmecc_write_pg(struct nand_chip *chip, const u8 *buf,
 
 	atmel_nand_pmecc_disable(chip, raw);
 
-	atmel_nand_write_buf(chip, chip->oob_poi, mtd->oobsize);
+	nand_write_data_op(chip, chip->oob_poi, mtd->oobsize, false);
 
 	return nand_prog_page_end_op(chip);
 }
@@ -873,8 +873,8 @@ static int atmel_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 	if (ret)
 		return ret;
 
-	atmel_nand_read_buf(chip, buf, mtd->writesize);
-	atmel_nand_read_buf(chip, chip->oob_poi, mtd->oobsize);
+	nand_read_data_op(chip, buf, mtd->writesize, false, false);
+	nand_read_data_op(chip, chip->oob_poi, mtd->oobsize, false, false);
 
 	ret = atmel_nand_pmecc_correct_data(chip, buf, raw);
 
@@ -934,7 +934,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 	if (ret)
 		return ret;
 
-	atmel_nand_write_buf(chip, chip->oob_poi, mtd->oobsize);
+	nand_write_data_op(chip, chip->oob_poi, mtd->oobsize, false);
 
 	nc->op.cmds[0] = NAND_CMD_PAGEPROG;
 	nc->op.ncmds = 1;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
