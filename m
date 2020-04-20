Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2569C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 17:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD2320857
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 17:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+/XSwzr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="prgN6BD8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YSw9O0Ng"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD2320857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hT7lNBMXSSryB7gw+MKmjpEB5jYypTCVRSt1GOAKtGA=; b=X+/XSwzr5NyHOU
	et7SwQ8p4KWqskbZ6WQKl73etf8TWsWjNtl/XS+XV27nCQjZVlM2k0FzMhddR6pD3MHN2Bbt5PTD8
	7IuXeoUoih5wrgUAS8vOZI+B3upjn7at5FQ28kkAMspswcpqfwoLCAEWi/fzPiocSiL9lN/VCK7N2
	lz/DgtUsscbUucrOKgpFnwx/JjQhYmekjJdQPsyqO5pq36xvSMs0ohjgdc8iZqCG6PlpyQj9r+YN7
	O8EiAvbmrTUEglUC2bP2xPol6D+3ZQN17+jHroXxeeWnkHWJKWsn7tcdrE7Ldrp9TNG/d9ysogr5/
	LUcbOA0YcoSQ3Tvu9EAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQaTY-0005Q5-3S; Mon, 20 Apr 2020 17:44:56 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQaTU-0005NS-Jy
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 17:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587404692; x=1618940692;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=xz/G968i9Ft8tlGkahABSKX/SaqtWDMWCQGDSaiayTU=;
 b=prgN6BD8MKA5Ez26Qd/SENUiIswUJ54AhlvXw7nPqmisgnEihTTfDFPf
 cOwLSf/ea7lYn7TBiuy16eHfGH52TqU2cC1+1c0GDe/+74gSVksv+lSox
 hnMcX7fBo2R9na1aMDSgxAqC6g/bLC4gnXL8kkM2fClEg8v4P+KmfHAdI
 8fv6gUHw9vZ0+y1jrQcrLAMMgIb25tOrafeRC9yNzgQ7FifQlDA1Quueq
 l4cZ0h77qyNmop7RtFXH6s8HwMO3YsK3kc/Nr001pVVKKsSpYPMqEyzOb
 A/Ax3aNi6Xmo3GbdUGg7/b6VSZUPnzNDxG4GkkZdVnHvG2Oak4GV0/PQ5 Q==;
IronPort-SDR: rhQHRjVyI54B3M1jHjqdVaNdvfgPpYe0mNHYjAHvDuqnk2+cjQjLlr2qkQCcLVspENp+2S+WFY
 zxv1jAdOXrXe1cMz0e6j/qy0jF7NTKnJtsjzJfvPp1RubCYVdMWUEa8pJQ3TYkGTieOT7F2fnd
 Y1ouVTGxo8jHRO9pw6DUj6ZtY2db+aePhbGQ5v1+08ijCcvzLSOwOs+o//x+Q6mj9bdduhU0f2
 3mfR66GqGEh15rIUI5bcVS73DwT6r4X7SDhXuNEXTewFO2MeTVnml7KKEJRsi/iYJBd9WABhX1
 Kxo=
X-IronPort-AV: E=Sophos;i="5.72,407,1580799600"; d="scan'208";a="70930328"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 10:44:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 10:44:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 10:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkDTfHc39SXiSnBGVB9LuCtW4Vqj/QJeypWzHVCq/CVYPvF0bsQTatljoc5fe1paPO6MJtN5ceJR3jeUIO7q32tVs3Z+If3MMNlaUcpNUtVeETgr2YAmGEaP35s0kNCthDzrp8TAWnFqQuMOgnPxxkDZNk5Winza7ZlsYs7taXJQSoBmTNjxDqgznoUgptLJYpQV+2hITJYDDyVZ2UvTOUZX0bhuBgmEvbtRispQQJkE7rAL+BUvzzAd6f+yaZmuFXGuK7z0gAAVt8AN5WQW920iUXyJFbHjBs6+uotbD//dAsidF8RlTMK+0v+iNCnIbEr/aYQIasLWu42z7tW+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM+OD9SLPgj+nntcs0xxyLam6q25vP7Lmm+zN/uFYCM=;
 b=esXDqqakaD4QkBxeqgpzERPywyA8pJTQitd+4wREtALtpMcN2BiAl+rnFuFvu9gjQ8OragYaL0nBPwBUPZE6CxJN2t7qNg5I9OpsBO6QS6pz8qLvo2nTABCh3cygSJSOPP2S1uLFbSsoBDD/ho9l1Lf836VQrQwJttcmP1g7DoatEJzu5U6hpiIJZbTVLM3Nk454GWDl/HwzGWpUJwH2dzNZzTrly2BTnbkK3ah5nILtf2pQjnc8gfSs6mVPs60lxfep0U+/oHSPhQxa6epoyBd6dBS9KWLOqI1TZEIS/NMe1rKeJ46tzIg6S8+46Km1QXBzWaJkL5z4scY3IZz0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM+OD9SLPgj+nntcs0xxyLam6q25vP7Lmm+zN/uFYCM=;
 b=YSw9O0NgtBoHc0YZCm0Ugbh7nhNWBtOkLpDijOxSyu0I3muDUBUI7S/BuJOChtyPb+o+eaUnsio0QMNkzNPd6YV/Mg2FucbXWPkEJGvieMz3MiZpemaHmPDy/2k7b08HYu3Ms8GU8+XxI/V+2kSOubdaZMX/1zm4h+N3bMbeXYU=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4037.namprd11.prod.outlook.com (2603:10b6:a03:188::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 17:44:47 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 17:44:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: Make spansion_set_4byte_addr_mode() private
Thread-Topic: [PATCH] mtd: spi-nor: Make spansion_set_4byte_addr_mode() private
Thread-Index: AQHWFztiKlfLjRbGuUCs6WnGY5Zt3w==
Date: Mon, 20 Apr 2020 17:44:47 +0000
Message-ID: <20200420174443.221527-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f76de20c-5dc3-4268-594b-08d7e55284b9
x-ms-traffictypediagnostic: BY5PR11MB4037:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB403781EFB458756430FC8A91F0D40@BY5PR11MB4037.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(396003)(366004)(39860400002)(376002)(346002)(136003)(107886003)(2906002)(66556008)(66476007)(5660300002)(478600001)(316002)(2616005)(66446008)(64756008)(66946007)(26005)(76116006)(91956017)(1076003)(6506007)(4326008)(6486002)(86362001)(8936002)(36756003)(186003)(81156014)(8676002)(71200400001)(6512007)(54906003)(6916009);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SprsINXnYIiNjJSWZHtPCuCqBmp8AjDUK5szqSADHbv1OGy9zCZN9nGJOrDerPT7ECedv1pDDl8mIQdzRErrnB5buif9IE2FHhMBHrL7B/pZm4x7OLcqDtm1cFO/ruzBVx/CLEXTWTngGsW/UDXF3KFdNfrByAM4Npeq7dvbHMdzW4sa2JsQI+k7m2JMhbsneemXBSEKPmNhHCqNGdEVqfjHkzfvhyeeF/MaLzRS/lpDmSSEaQToFd4npqrOPaEPoPvCePnppeosd1on874dJg9s3d7Pdv/nZnnLqp1a5JfW+o3YaDuWN0g+yp24Sxwd4VMG2MQXwR9tSk6A0BVqwgoiVbLYV37QITkyNSlcHZOJtJxpM7idYBuwv/vHAzgB7ZW0ZermVUrB9vpqrsM6LzhGOzhxFxed0rTxTHQ3shVJwZvBoa+IN0xWIUvnP3MU
x-ms-exchange-antispam-messagedata: HSfS9rXlPof3YC6VMXhU7QwL53Uskxr+V1PlCTNTxesA3Qs9xnbVTXtU0z41HTUy6ofQFMRsGiD/cw8JicZrvL+vHcIrG1NXYGla8RqbUcQN3UU9Ou5+7mUMg8Mzj5gGpGGA1mSAXseQq8ouCHj4Fw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f76de20c-5dc3-4268-594b-08d7e55284b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 17:44:47.1723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rl4PHjH2Mq044tY+yOqSsuZNI2P+iP8DrSfYV5yW+a0YqQH7C+BnFBPEWGPy1ECS3obURTgWRqoHhPDFPgkZdcQPnx8j0/GVgXE7m4SpolI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_104452_796722_0C51C20C 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

spansion_set_4byte_addr_mode() is used just by the spansion flashes,
make the method private.

Here is how the set_4byte_addr_mode() method is treated in SPI NOR:
- atmel, catalist, everspin, fujitsu, intel, sst, xilinx are too small
  for a set_4byte_addr_method.
- eon, gidadevice, issi, macronix, xmc use EN4B/EX4B.
- micron-st uses st_micron_set_4byte_addr_mode()
- winbond uses winbond_set_4byte_addr_mode().
- newer spansion have a 4BAM opcode (support not added). Older spansion
  flashes use the BRWR command (spansion_set_4byte_addr_mode())

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c     | 35 ----------------------------
 drivers/mtd/spi-nor/spansion.c | 42 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h    |  1 -
 3 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc68ea84318e..148cbf134bb9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -397,40 +397,6 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return ret;
 }
 
-/**
- * spansion_set_4byte_addr_mode() - Set 4-byte address mode for Spansion
- * flashes.
- * @nor:	pointer to 'struct spi_nor'.
- * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
- *		address mode.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
-{
-	int ret;
-
-	nor->bouncebuf[0] = enable << 7;
-
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 1),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
-						     nor->bouncebuf, 1);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
-
-	return ret;
-}
-
 /**
  * spi_nor_write_ear() - Write Extended Address Register.
  * @nor:	pointer to 'struct spi_nor'.
@@ -2724,7 +2690,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 
 	/* Initialize legacy flash parameters and settings. */
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
 	params->setup = spi_nor_default_setup;
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 88183eba8ac1..b95d00fb422b 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,8 @@
 
 #include "core.h"
 
+#define SPINOR_OP_BRWR		0x17	/* Bank register write */
+
 static const struct flash_info spansion_parts[] = {
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
@@ -74,6 +76,45 @@ static const struct flash_info spansion_parts[] = {
 			     SPI_NOR_4B_OPCODES) },
 };
 
+/**
+ * spansion_set_4byte_addr_mode() - Set 4-byte address mode for Spansion
+ * flashes.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
+ *		address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	nor->bouncebuf[0] = enable << 7;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
+						     nor->bouncebuf, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
+
+	return ret;
+}
+
+static void spansion_default_init(struct spi_nor *nor)
+{
+	nor->params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
+}
+
 static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 {
 	if (nor->params->size <= SZ_16M)
@@ -86,6 +127,7 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 }
 
 static const struct spi_nor_fixups spansion_fixups = {
+	.default_init = spansion_default_init,
 	.post_sfdp = spansion_post_sfdp_fixups,
 };
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 1cc8ed5d59ed..7373ba6fbb42 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -97,7 +97,6 @@
 #define SPINOR_OP_EX4B		0xe9	/* Exit 4-byte mode */
 
 /* Used for Spansion flashes only. */
-#define SPINOR_OP_BRWR		0x17	/* Bank register write */
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 
 /* Used for Micron flashes only. */
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
