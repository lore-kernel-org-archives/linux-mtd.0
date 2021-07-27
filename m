Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FACC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E0461058
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3E0461058
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1x0YuOiS8kkxiBoGVg5ZagEM/XyZ3JtPiN2zF2IDWug=; b=eOFq07W9CEvWvK
	+NFlCM5s1481GOcv03Y3HivycOtzRsVU1V0TbnPU4x6nKndx4pTOzJLJHz0J2YxzvM5fIS4OEXnvu
	G+94SbkELholX71BBaMopKw7ZlHU9aqdpWQrfU1NCkY0uOFUnRFdMFnic+2be+i/J8+2AuDuhe7Ix
	3ZqT7kdNlxmftYmCfsDt/Frum5vM5OAo4Lz/FKR3VIP9+l/6NmW4cZ8Td7eGBiMUXVw2wFk+HnNsd
	+vA+dfvjHDmQskiLaEUUGLuSzNm78Z7dMv57+Dc4kOFCJkvyzuwZENmOCETSm/6xp1FRk8/q43N7X
	lmrd+1zgMhM33PoQavSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FAZ-00DJ5D-Nw; Tue, 27 Jul 2021 04:58:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5J-00DHRs-Bm; Tue, 27 Jul 2021 04:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361573; x=1658897573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Z23cobJ8rYXhcA546i8ItWOTGlv3l049QBpJBZN1Hk=;
 b=XYwbrY05kVtpB1zqI3lUMiX6oTGS5AoFbsmtQx5O/PhbG6GqWLgB1oit
 7dUdGH1PPKv9FxE2bo2EDTV2xFpuNNsHnuSbGRID4wRZujqkbqUR+RFLS
 DrLdIP4EUN3EiJ7aMc14QdyvAus3y838lN3rDCJoWMis5BKVnJJHK/NAq
 +/4m/YyixPG47dWvE+5Jk8yJIfPt1tjmSve0Djm6bLNXbt9O9fCbN/MrE
 1usj97SdYd9fAETA5bd748TJnu2TvN0a0nrn8O0o7xV6qiO0Py3hlhHDD
 C8AX68Crf4uSyYfI0oN2fwh/6FI2Yayjd/Pl0r184WMyDS926pGWXGhwa w==;
IronPort-SDR: a7vVkp7YHgCVq4BwWtzLfsJGCo3OIEYminI3RdwGkGX0GeO+pjG/U0fe41wRODVXMus1Wqmv/i
 N8TU1YjZTTTsH5QDTxsEg/xoQZ7JUtNTxNQLBLjCK8RGJhmE3rL+I2Kq886WedbarKRyka7hlS
 BiYFHcC22Zina7AGwmLu0MLzCpvSHDxIMEey6Ssx5Ojl2xyk3hkPnf5k1MF+3m8Us19tXmr3Du
 O3Qee+Im8J2zi2dareRG0mrdDWeQvsIrAo8kImjf2tEMk+tdKwkffyeKGddz/TNtWTaESzI2bd
 yUKwQqYCsijwF3kvrgW/9rjK
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="63689432"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:52:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:52:50 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:45 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 04/35] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Date: Tue, 27 Jul 2021 07:51:51 +0300
Message-ID: <20210727045222.905056-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215253_560241_88D1E936 
X-CRM114-Status: GOOD (  12.18  )
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

MX25L12835F define SFDP, while MX25L12805D does not.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Testd-by: Heiko Thiery <heiko.thiery@gmail.com>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---

# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
.0/spi-nor/sfdp | xxd -p
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279df9c06485cbffffffffffff

 drivers/mtd/spi-nor/macronix.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 68f6ac060bc6..fba85efafb47 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,24 @@
 
 #include "core.h"
 
+static int mx25l12835f_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
+	 * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = "mx25l12835f";
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx25l12835f_fixups = {
+	.post_bfpt = mx25l12835f_post_bfpt_fixups,
+};
+
 static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
 				const struct sfdp_parameter_header *bfpt_header,
 				const struct sfdp_bfpt *bfpt)
@@ -70,8 +88,10 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
+		/* ID collision with mx25l12835f. */
+		.fixups = &mx25l12835f_fixups },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
