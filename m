Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BA4C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 18:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D791420842
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 18:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oIB/AfTR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Sgh4qz7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D791420842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss6cvG1sGkcUQXT8nwTcjwfes99di6dYsd7nFB2DiQs=; b=oIB/AfTRXvOMCF
	zp/12+M7q/bkJnXNqkkflT8Q3BTkGPvhd4dujCZng83o3jPfOqqD3/ryvdLk7+hGrpTzkOhBDUu7o
	moVBjxq0wYEE5M2m7gTrMUJjw5P9IWty5dwV6tiHjZR/8C4VWsPoqn+samG5q65xptr/uSNK2EKoV
	/whuodQrK5tDQxlz6U87EBX9QvDvANIdWTf5fSADaX4Cw9QE2oWVpIxutm+OEL7WdOjiKDgTO1sXQ
	6254r6OyUs1pEJQUHnHBgd0jFboIqdFtlEMsrnkMheJ33VYtkWFopBiJjo+iYPpJbeAr+aeP32ozD
	7/+Jf059l8lOBxPDW6Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8plG-0003ty-FQ; Mon, 02 Mar 2020 18:25:50 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8pii-0000Rk-60; Mon, 02 Mar 2020 18:23:14 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: iHax9lOS+j2KvM++ka04YnzeZ9GEGEmgnMi/W8kWiTZInjlpWWiAeDGomZVk2y0xnFpYjFjGZl
 qa+dng5mLd/0cVouTnn2jNtClXw5fgD0uRm9djmEa7Oxbf3WIs0Kjmb8F5HwKDsSLYh7ycWv9g
 nvMETogjFSBrKTrZRkJgW85yzhO40yG/XmNwruF+QL/qEurGRfkR0S+jdkm7KiXcu8HcUzQP/K
 +5btIbCc33yQtofSxUyAt4rJMJDnnbxERVEXsEUpo6AbDK2bKpvNOlXzW+oP2+qJHx+DfXy173
 c/g=
X-IronPort-AV: E=Sophos;i="5.70,507,1574146800"; d="scan'208";a="68553993"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Mar 2020 11:23:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Mar 2020 11:08:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Mar 2020 11:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAoZODSDBuP+ivE61/PPCuzFxlktquEuSsAhHeaY6tdwnfpivgVnomaf//kMWx9Dy2wtBDPeq4cOBpGxnZwFbD0rCWjJjxiEeEjFaaLwlE38baK44Zpgg/EdrYQG4nZ2nXHehrhO4iNc0hXMzxsb6FTBQYrh9m1vJVrbJg8M783BJAu32ulAzvBAzJuMxUmOtg5p0gMT1/sSs4clujfEyf3N19qog959GTCWW6kYFJDaz/Fdur4x/h1SmABx+37T420LEEZDmdFK5q8DGEcVAUMqX69MmdvoOVPhK54YiD301E0Cc504+lnCua5Jx5V/TrSLid48bqJRyEd8bu7fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFCC1DRnUDPtRiKBWXevUUTP1aVtqUjL3Jv4PCY/cwU=;
 b=C+OU/Q3OWRVyBgMqPfmWAYpWkQOLgrYQRlHtxn9+jP9m9JScb4k0YIgAokQrct0cFncnOYYUGqxa6BklfPme/Kf2SBfuF9aObQmXoatHANDw7OqtKV/7Hnod94Inx6jByghGld03OuiynIW4hYEAkT/ArQTc+niBxMGDIRsJs2zjOGWfLV48ZjEP0dWG+C4+Gv050F/wV+kgn989TJ31jGYd9n8j06KP78limrEmsv9ON+uiyf7G6OFelifyhEf1oa+DrxHzeUPh4ArW+W41WLg8LjjjGQj2GK3ueWO5t0h8bC6trbMDsDSnauh+k2ZIPMh1OP08kfVVVImwGgMYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFCC1DRnUDPtRiKBWXevUUTP1aVtqUjL3Jv4PCY/cwU=;
 b=Sgh4qz7HhnLDjr/Q3Gxijl5jYcW0WYLtOTLa8uu5UabYadCKz7Rn+eL0oIlXLDXOjd/4eHbUj43b+24ZH0wXrN+xSog90LwXvVQKPr3EqAUOscgszmRu/YEGvRKsUu4YocYl3agWAuTfi5CJzsC7D4P6AmAZy1YTLkAO2P0BcZw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB4142.namprd11.prod.outlook.com (2603:10b6:208:135::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Mon, 2 Mar
 2020 18:07:56 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 18:07:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bbrezillon@kernel.org>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/23] mtd: spi-nor: Move Catalyst bits out of core.c
Thread-Topic: [PATCH 19/23] mtd: spi-nor: Move Catalyst bits out of core.c
Thread-Index: AQHV8L1/5lsiU0YS/Ue8JxS5KyvDpg==
Date: Mon, 2 Mar 2020 18:07:55 +0000
Message-ID: <20200302180730.1886678-20-tudor.ambarus@microchip.com>
References: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 658dfca7-1d50-4ff4-8930-08d7bed4a25a
x-ms-traffictypediagnostic: MN2PR11MB4142:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB4142DC9B845E3D061680A85CF0E70@MN2PR11MB4142.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(39860400002)(136003)(396003)(376002)(189003)(199004)(36756003)(26005)(66446008)(107886003)(6486002)(186003)(2616005)(4326008)(478600001)(6512007)(91956017)(64756008)(66946007)(2906002)(71200400001)(76116006)(8936002)(316002)(86362001)(54906003)(6506007)(66556008)(5660300002)(66476007)(7406005)(1076003)(7416002)(81156014)(81166006)(110136005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4142;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: keFLp4Qah9RMAa+Hajd4QGG4d/BxueX6XlvXpXzSgr6oQNXgHyuMqJidjYU9+UNpS4/EsamflXM2CrTsHAlmcD1NAB1F4KF8Zp01lucPVQ6RZN08n3OUciKSboEIuvHwJNR6clWPsPMTdbgGnxnZV12JqKKh4rc1BKh7ZrHGUQGPDPXLqr/+VIZR5y7ukNpGsgNVj7VSWyXAFG1OJ1BqS/Wskw4wWdvXbreyge5qv4E6Ru5EL1voYZBbRSPbVSg5l5ZHgN64o8gKQgvWasjJJo21lqsqKxzXoOFOYYRLMv8tmD5sMIz4/bIIxG5nfPBC2yWmzl87BpBS6c919t8U+WdNJdpi6VIVr6JvyBBwF/Gdxktv7LCMqaEV4bu4PAt/+Xj+HdGdYeb5yvk1lmPf4gFJj/wV8BvF+nr8HEzjBa7oMeztsMsLrF1DfWaPmT+a
x-ms-exchange-antispam-messagedata: kBAR6smB5j+PGKvVESUUPByUdVq4KFl4Tjw75bMncmIIv0uOAUIChHBl5IBL4lw+GN3LSDbOoNqtCuUGgUD+5oU7iQbLm5vm7HE5C94EfT9aj9WNYhM6IgJx+hNc7Bk4kFuL6T4kxeNDs8rxhSO9YA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 658dfca7-1d50-4ff4-8930-08d7bed4a25a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 18:07:55.4026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YwiLGT9mmyFlUcQZRQXWkSjBWIgmKWpsNymZeqgkoevxUDaLNerBHRyMDEQ/oLNj3RB8mfaz0Z8CzVFNRDL2GUbxDmIB9qCmnBiP5ric17E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_102312_263636_68B32708 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: kstewart@linuxfoundation.org, alexandre.belloni@bootlin.com,
 linux-aspeed@lists.ozlabs.org, thor.thayer@linux.intel.com,
 jethro@fortanix.com, rfontana@redhat.com, miquel.raynal@bootlin.com,
 opensource@jilayne.com, richard@nod.at, michal.simek@xilinx.com,
 Ludovic.Desroches@microchip.com, joel@jms.id.au, nishkadg.linux@gmail.com,
 Tudor.Ambarus@microchip.com, john.garry@huawei.com, vz@mleia.com,
 alexander.sverdlin@nokia.com, matthias.bgg@gmail.com, tglx@linutronix.de,
 swboyd@chromium.org, mika.westerberg@linux.intel.com, allison@lohutok.net,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 michael@walle.cc, ludovic.barre@st.com, linux-mediatek@lists.infradead.org,
 info@metux.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

Create a SPI NOR manufacturer driver for Catalyst chips, and move the
Catalyst definitions outside of core.c.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/Makefile   |  1 +
 drivers/mtd/spi-nor/catalyst.c | 29 +++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c     |  8 +-------
 drivers/mtd/spi-nor/core.h     |  1 +
 4 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/catalyst.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 33b6f834a14f..cd8d95b727c9 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,6 +2,7 @@
 
 spi-nor-objs			:= core.o sfdp.o
 spi-nor-objs			+= atmel.o
+spi-nor-objs			+= catalyst.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
diff --git a/drivers/mtd/spi-nor/catalyst.c b/drivers/mtd/spi-nor/catalyst.c
new file mode 100644
index 000000000000..011b83e99e95
--- /dev/null
+++ b/drivers/mtd/spi-nor/catalyst.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info catalyst_parts[] = {
+	/* Catalyst / On Semiconductor -- non-JEDEC */
+	{ "cat25c11", CAT25_INFO(16, 8, 16, 1,
+				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c03", CAT25_INFO(32, 8, 16, 2,
+				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c09", CAT25_INFO(128, 8, 32, 2,
+				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c17", CAT25_INFO(256, 8, 32, 2,
+				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25128", CAT25_INFO(2048, 8, 64, 2,
+				 SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+};
+
+const struct spi_nor_manufacturer spi_nor_catalyst = {
+	.name = "catalyst",
+	.parts = catalyst_parts,
+	.nparts = ARRAY_SIZE(catalyst_parts),
+};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c99f063b0781..1776fb8eb66b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1985,13 +1985,6 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Catalyst / On Semiconductor -- non-JEDEC */
-	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-
 	/* Xilinx S3AN Internal Flash */
 	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
 	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
@@ -2007,6 +2000,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
+	&spi_nor_catalyst,
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 01e0b8e2b191..9eb46900bc72 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -168,6 +168,7 @@ struct spi_nor_manufacturer {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
+extern const struct spi_nor_manufacturer spi_nor_catalyst;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
