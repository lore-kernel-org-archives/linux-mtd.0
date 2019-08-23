Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D39C3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:54:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 616F12173E
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RS2eEPrB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tM6VU22n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 616F12173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx0ayn7WSYe/Uizk/BzI5N7eT0dy5upUqHZwejbh8V4=; b=RS2eEPrBlw4QfL
	Egsy3HWyIbfhpBYqzMXWFyfQK/r8gWCQ1/IK3ejjatZDz7IPTdk5IptUho7EDlEOe83E9/A+YN0Rq
	Icwf+L+M7As8kbbACdv0iBTMhcAPXE6AMahmG8RVigsnFK4A8zY4zzDQlFXWzVDfefw/XckUOnCc8
	WA07UqCPatxTHHX1H8a9DDZnlRzpXC1UROX/DSSUKF5oo2jpzSOF343qqAwdnqIAghOdsmHgd+rJ8
	JDTSG8D5oTlma0ugKixC0spNOLuCyCyZi4V+Ogvv7O3IQQ2E1pyJe2IidkETPG4+zNOkUjC20+7Zm
	0oqWviU06NjsxnXfLWKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1BtI-0002H8-2u; Fri, 23 Aug 2019 15:54:16 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Bsj-0001bB-UD
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2019 15:53:43 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: dwPQk0ezr+jXc4ahH1BZiW6WuelHyCZwi3WEG9OQWOiNqmM1GLgkqRzuDCqWmFRqGVWPuYovWT
 QUTv163TBZYjZOkUZ2FP+ieOhGnBNrysbhlH3sgRqp5iWOnKwlHR0OdRhZdDNHRe9Zm4gdxTwr
 QDi4QhzDppZd+gN3X2wYqEIW1cGtAVyMdMXXQMfYeaU3bm7mhcwFxfNvbQPLPS+v2KV5MHrUEY
 Yo1RziKEjmBuTrYszCdr9FQFItZ00rbV+LvuHZT+RtpUin3CZzGe+FhyzjemuPIlkIh3MPu4oK
 X8E=
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="45396968"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Aug 2019 08:53:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 08:53:40 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 08:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWhx/GjGtL0wm0kqT7lQWIxiryyb6n+dwIGM+ZVhTUhslvpN2MgKCOjb6ceB92sQvhnsJhn9W/JzeZntvg9zIaZKWpqjTJ/9s5/mM07B3EhHigpq6/uxw1U/G7vS5nBty3jChgpHa9PDeUu/7Sh4xsgFiQ7Tm9D046v7m0YEEEOH6jRNZ0dra+1Kmqn+yR3hq0Q+scMLCx1YZnwL6k6KqLPBWShE36ytyj7kKAVbhY+YWMq53E6RLTWFr3X2UsV63NN7KFqVmzJY5n5iitW2TH6tSiY8q9wPit4ej9BYEa74bdCOUJJ+EBJXVbrY9Jj925eH5iI+AtEZznvb3ehyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRlXiTajgX1dPn9fAmsRNaPLP7yXBiFvVruyqw3Fdqw=;
 b=JOh6YkIafwR15m/cTIue1shJkWkJ+34v9WQ15mhtcfzu2dFJBzEV6W1cHXtqeGc8rWkgnRy9xTm72Wfw3kAVHRFWFY0hgRNkWFcc2Txi7OL9sNSHeNRYdso3buSf7XyZbwhxNwXppggnjrJ0VBgJF+Y8TAeqIwktFhLRbN9/LtSuj2ofgiMO0uNaOAFpRfMu31HzitV12zXTnRV+b6gYmfzS34VObNkwECliLwIswDF0f4Sg4Wmr44JNsWKAfmD4FoTT2l5UZBAETmDYS2XVrAaHDW/R69VAXkcnEWBLKh8b/d/Jl7eUHefVULKlllNg/hwpieg0U/y51tL30Tvaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRlXiTajgX1dPn9fAmsRNaPLP7yXBiFvVruyqw3Fdqw=;
 b=tM6VU22ntol3tVigL91swwOJp78OvW5mKQ17LpDcHOwZAKWeEAD+vlRQnbrEXD+LA2G9J4yophff+pULv3eLFV1c3azzrDq+yV80PzDOdA2eKoX7HDh/Y/YWZ/U0jz+66zwbJBPenlWnYzh7/iV6KBq9lW0mx3M3BB0+/ZpyKI4=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3567.namprd11.prod.outlook.com (20.178.251.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 15:53:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:53:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] mtd: spi-nor: Drop quad_enable() from 'struct spi-nor'
Thread-Topic: [PATCH 3/5] mtd: spi-nor: Drop quad_enable() from 'struct
 spi-nor'
Thread-Index: AQHVWcruQ16jvs/h10KF8XG621V50w==
Date: Fri, 23 Aug 2019 15:53:39 +0000
Message-ID: <20190823155325.13459-4-tudor.ambarus@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190823155325.13459-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cb02013-ae34-442a-c1d7-08d727e210c2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3567; 
x-ms-traffictypediagnostic: MN2PR11MB3567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB35673A27A30B2CA83F14D488F0A40@MN2PR11MB3567.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(1076003)(102836004)(5660300002)(2616005)(476003)(71190400001)(71200400001)(6486002)(66066001)(256004)(386003)(486006)(53936002)(6436002)(446003)(2501003)(11346002)(36756003)(6506007)(76176011)(8936002)(86362001)(6116002)(4326008)(14444005)(3846002)(2201001)(6512007)(66946007)(26005)(186003)(25786009)(52116002)(99286004)(305945005)(81156014)(81166006)(7736002)(14454004)(66446008)(66476007)(316002)(107886003)(110136005)(2906002)(50226002)(8676002)(478600001)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3567;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VBNiSZIMuL9/knnk08x0BxxC8NFuNUX6v1bLjUUHpCYsv6Fjt80L27sme1+7c++7YL2C5jl8pxWvJ8iIInR+CcKrEqDGp/VdFvuNWmbtyTRuqMVziNSL5rNHQO8OpZw8sEZtb6SyFPtcX4iY2eRV/YUtk+3G3mbr3xOu3zSpgI5aE7d2tusWVMYVXJp6z5Uv6b52QRGkt9QCNkBJmFK+7nZNypy0gx1cGXV9opbetT2mYxgfESwXu70YaXxLatg4ziENc1rn7Z78q1JNhy5FxH4mzUs1wv24s4q+pBWRgDHxm+whs2eQhbbzHMLB2+twDDvGuzbeYPKrS91f50SIkrGdaxnUZqEsA4HZymCy6qv19P4qaN4vrJ4W+3fJsIMpzlC5+PqjAPBBHrpu6bifxEDVWsCMbiNy0zhf8kpVnLg=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb02013-ae34-442a-c1d7-08d727e210c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:53:39.5404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QyxmU3kEZi32QAVL3STpZlwAiYI4jAUYLiOXzx/mg2T92qKMwy+LY1wkO06jSaUF+LKS2WvQaHQLotNam+U1RCsc4CR2gwPXzy76VvOWuWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_085342_025985_8BF1DC77 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

All flash parameters and settings should reside inside
'struct spi_nor_flash_parameter'. Drop the local copy of
quad_enable() and use the one from 'struct spi_nor_flash_parameter'.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 38 ++++++++++++++++++++++----------------
 include/linux/mtd/spi-nor.h   |  2 --
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e9b9cd70a999..6bd104c29cd9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4403,7 +4403,6 @@ static int spi_nor_setup(struct spi_nor *nor,
 {
 	struct spi_nor_flash_parameter *params = &nor->params;
 	u32 ignored_mask, shared_mask;
-	bool enable_quad_io;
 	int err;
 
 	/*
@@ -4457,17 +4456,27 @@ static int spi_nor_setup(struct spi_nor *nor,
 		return err;
 	}
 
-	/* Enable Quad I/O if needed. */
-	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
-			  spi_nor_get_protocol_width(nor->write_proto) == 4);
-	if (enable_quad_io && params->quad_enable)
-		nor->quad_enable = params->quad_enable;
-	else
-		nor->quad_enable = NULL;
-
 	return 0;
 }
 
+/**
+ * spi_nor_quad_enable() - enable Quad I/O if needed.
+ * @nor:                pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_quad_enable(struct spi_nor *nor)
+{
+	if (!nor->params.quad_enable)
+		return 0;
+
+	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+	      spi_nor_get_protocol_width(nor->write_proto) == 4))
+		return 0;
+
+	return nor->params.quad_enable(nor);
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
@@ -4484,12 +4493,10 @@ static int spi_nor_init(struct spi_nor *nor)
 		}
 	}
 
-	if (nor->quad_enable) {
-		err = nor->quad_enable(nor);
-		if (err) {
-			dev_err(nor->dev, "quad mode not supported\n");
-			return err;
-		}
+	err = spi_nor_quad_enable(nor);
+	if (err) {
+		dev_err(nor->dev, "quad mode not supported\n");
+		return err;
 	}
 
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
@@ -4706,7 +4713,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
-	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 77ba692d9348..17787238f0e9 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -535,7 +535,6 @@ struct flash_info;
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  *			completely locked
- * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
  *			the SPI NOR Status Register.
  * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
@@ -579,7 +578,6 @@ struct spi_nor {
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*quad_enable)(struct spi_nor *nor);
 	int (*clear_sr_bp)(struct spi_nor *nor);
 	struct spi_nor_flash_parameter params;
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
