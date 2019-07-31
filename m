Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0621DC32751
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:05:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCE420693
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GhQka49T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Wfp/+TxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCCE420693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5wC65oAkzI2UKg+mtNWUmcI3xJJU5mjtK5XOrIpigs=; b=GhQka49TkP4BOd
	mPNBrsBFKKpRc3+3Qvc2JDMvSFt21BZb9Qoj5uqc39xzcDAK7fNt2TZ4cUmoVjfvpqeA9Fqax6C69
	r1ppq6N+ZUnXOUcCgROt+cxpwBjhLfgA2dwEER4OmN3eD13R9QkLFho/Hnb8ZM5U4vEzqhyt3M3G4
	FV0VAQ0/suar3H2Telb7hkkdDO0JWDLPe37e8jrfdo8jDR4bfNrag663JrI3DTfcILGlnOg7mnvEi
	+bxI+XyN/rHFh5gtpcObw4xHl2wz7xrhTgHdqdftSr+oNnP5LexpaoKwsmS6mbMihroTd/1LE74iR
	CFrSLA75wYX3wn7WebFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskXc-0000GS-M8; Wed, 31 Jul 2019 09:05:00 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hskWO-0007cQ-AU
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 09:03:45 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 6Dj3Ss8rU/I/pX6L7LxZXU49cWJG0w9/OR2eZGKV8WRfGBnLc60Qhq8svgEjWue8wkf9FCq77c
 eP2L5LjgO5VvU5UF7JJCU5M4h0/Xjlw83+vV+JjWNTxCWJPXyhjs5q4K521+gjX9pxcfgWB255
 DpT9B6ZHKy1QHd9HSS5yDFBPR+OZPEnT/Fg308rKmPrgtuVSIilTazmvuig+3yIuRaFChyDc/4
 AniJdfpPKJqGbPlLDh6jXEc/lAs/97qGNzEmXMDfcGpbZrqgvXhTe/OOUuaufCUL6EDyd62Mq8
 T9w=
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="43382580"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jul 2019 02:03:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 31 Jul 2019 02:03:40 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 31 Jul 2019 02:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATE595jZ62Vc7tsz8GwXVVGYKKmPteg4U+yH870kQzLZBzVLy7br8n7GSaVRSzapJjWVaBWS+SX5oCSC0nObf8xcFP/Ix7iEqbmMidc7ubQCLQGHcwC4NIQNl3gqzPt+RgDlplHfNqXdg2L3Re6/CO0lUNJjaMRzuDjU+jsH0y8/Ty3lYGoZ2TquVQxvtgEOk8ktJRDHAJJPMQ5m5hPD4o+32FWcjddXuaOI0KDfjtjqNBz+yY8aQExsw1KumI72yvUY96uxEXCnFUCZ041hDz1dhj0VvvVfglJmBarizoBdbjKuYx/P1TGIxJqA9zvDCKsb/xwvjUwmr2liDD6N0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V47O5gjZfU/JeFyAZ2GqxPtC3Wh8uU9h7afHW4YCdII=;
 b=PCJaZeSpO6cMP0fsl0dpBFuVW//maUiulQRc/aOrhi8wJtou00Akg7THQCiEKyDoaQ2XI4ZnEgY+jlrgQyISyF0Of0JsAp3y9BLXLpmBYb5RW2jJ5jj1EqQ0E4JETUxXZzmc2cEqV0Xgj8LR0LHc07CvVpx7Z4IZel3U9kOoV3M3uUblrEpntsjwMlBKwb67FxGo0b3rjv6hCOD+dZZKxT3Y6ToLCYQvYbuV1k6kw3jYotkB3clfN+v+JGZSi8LmIFjGk70jFYxLVoZUYU/wrE+bvstfyB4xSGuYeiGTEXiUSRblF0442+5cpBj9xHOGnFRwH0Mzrs489ZntMjLPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V47O5gjZfU/JeFyAZ2GqxPtC3Wh8uU9h7afHW4YCdII=;
 b=Wfp/+TxEpe9A5z7zOYOoa6RJ2dH9qcGI/W5sYsmPBa2KdoF1PlR+EH/MDfIyQLWm4+SIqRhjountN22YUp21eaIzU0zxYP9xKrj0GUE7NJnvo+EHdXn1JBkmZGUmdrnUVvWD2paZQ9sprDRlSuchT/YfPuEFyzWplOGS/GSIGrU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4414.namprd11.prod.outlook.com (52.135.36.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 31 Jul 2019 09:03:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 09:03:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>
Subject: [PATCH 7/7] mtd: spi-nor: Rework the disabling of write protection at
 init
Thread-Topic: [PATCH 7/7] mtd: spi-nor: Rework the disabling of write
 protection at init
Thread-Index: AQHVR37Yvp7hepXqB0yqcAQODTAJbg==
Date: Wed, 31 Jul 2019 09:03:39 +0000
Message-ID: <20190731090315.26798-8-tudor.ambarus@microchip.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190731090315.26798-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:803:50::41) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f78f676-9b2e-43ae-dd06-08d71595fa93
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4414; 
x-ms-traffictypediagnostic: MN2PR11MB4414:
x-microsoft-antispam-prvs: <MN2PR11MB441438B3EAC92DECDB9B2E72F0DF0@MN2PR11MB4414.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(8936002)(256004)(6436002)(386003)(52116002)(71200400001)(86362001)(6486002)(478600001)(476003)(14444005)(186003)(71190400001)(66556008)(36756003)(99286004)(1076003)(66446008)(6506007)(8676002)(66476007)(11346002)(81156014)(316002)(54906003)(66946007)(4326008)(446003)(2616005)(64756008)(2906002)(5660300002)(76176011)(6512007)(25786009)(66066001)(2501003)(81166006)(14454004)(26005)(6116002)(50226002)(3846002)(305945005)(53936002)(68736007)(7736002)(486006)(107886003)(110136005)(2201001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4414;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dAQSLlrVwrpK22TFcc9QCe2zpPa6a/pr+A2wvo/c929GyuPOMCqZ/SR+lc6+2xCJ9dciNnafiUiDZXLEgpyJUt9irl0D3ryccyRWqFAD02XIWpNdYZ4uqxPRyzyIKArd8lmkOl+0bfWCebaVd4jB0JK/MkHPKJe7q9wnQpm/JFnqBitGNIJw+gmtq1GjRx2BJWawbM+KVWdy+koU2BWq7+5XBId3AUf+ewBMjFz2X+ULMjF9luRVgQYPrmtuWHGVqd4m43omz6QXfn5RvLN0zw/REHhccdIGApzag9MviyW0LNEfyDdpHvKfHI5JtMWd76sngkED/5QD5LGmE6iBPKK1ZnZXomrfrtE1ieCQIGElFkn4JPo+lpQIgkFU8Tsyv6x7q4Lxlz2lToNJcd1Gc2B7Vso1bCbAZKD4bbUcgEA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f78f676-9b2e-43ae-dd06-08d71595fa93
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 09:03:39.6130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_020344_457226_D0602F26 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Rename clear_sr_bp()/disable_write_protection() to better indicate
what the function does.

Get rid of MFR handling and implement specific manufacturer
default_init() fixup hooks.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 64 +++++++++++++++++++++++++++++--------------
 include/linux/mtd/spi-nor.h   |  6 ++--
 2 files changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 95ca5dd96403..9b9f9b530207 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4282,6 +4282,16 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
+static void atmel_set_default_init(struct spi_nor *nor)
+{
+	nor->disable_write_protection = spi_nor_clear_sr_bp;
+}
+
+static void intel_set_default_init(struct spi_nor *nor)
+{
+	nor->disable_write_protection = spi_nor_clear_sr_bp;
+}
+
 static void macronix_set_default_init(struct spi_nor *nor)
 {
 	nor->quad_enable = macronix_quad_enable;
@@ -4303,6 +4313,14 @@ static void spi_nor_mfr_init_params(struct spi_nor *nor,
 				    struct spi_nor_flash_parameter *params)
 {
 	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_ATMEL:
+		atmel_set_default_init(nor);
+		break;
+
+	case SNOR_MFR_INTEL:
+		intel_set_default_init(nor);
+		break;
+
 	case SNOR_MFR_MACRONIX:
 		macronix_set_default_init(nor);
 		break;
@@ -4649,6 +4667,23 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return err;
 }
 
+static int spi_nor_disable_write_protection(struct spi_nor *nor)
+{
+	if (!nor->disable_write_protection)
+		return 0;
+
+	/*
+	 * In case of the legacy quad enable requirements are set, if the
+	 * configuration register Quad Enable bit is one, only the the
+	 * Write Status (01h) command with two data bytes may be used to clear
+	 * the block protection bits.
+	 */
+	if (nor->quad_enable == spansion_quad_enable)
+		nor->disable_write_protection = spi_nor_spansion_clear_sr_bp;
+
+	return nor->disable_write_protection(nor);
+}
+
 static int spi_nor_quad_enable(struct spi_nor *nor)
 {
 	if (!nor->quad_enable)
@@ -4665,16 +4700,11 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
-	if (nor->clear_sr_bp) {
-		if (nor->quad_enable == spansion_quad_enable)
-			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
-
-		err = nor->clear_sr_bp(nor);
-		if (err) {
-			dev_err(nor->dev,
-				"fail to clear block protection bits\n");
-			return err;
-		}
+	err = spi_nor_disable_write_protection(nor);
+	if (err) {
+		dev_err(nor->dev,
+			"fail to unlock the flash at init (err = %d)\n", err);
+		return err;
 	}
 
 	err = spi_nor_quad_enable(nor);
@@ -4797,23 +4827,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_S3AN)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
-	/*
-	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
-	 * with the software protection bits set.
-	 */
-	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
-	    nor->info->flags & SPI_NOR_HAS_LOCK)
-		nor->clear_sr_bp = spi_nor_clear_sr_bp;
-
 	/* Kept only for backward compatibility purpose. */
 	nor->quad_enable = spansion_quad_enable;
 	nor->set_4byte = spansion_set_4byte;
 
 	/* Default locking operations. */
-	if (info->flags & SPI_NOR_HAS_LOCK)
+	if (info->flags & SPI_NOR_HAS_LOCK) {
 		nor->locking_ops = &stm_locking_ops;
+		nor->disable_write_protection = spi_nor_clear_sr_bp;
+	}
 
 	/* Init flash parameters based on flash_info struct and SFDP */
 	spi_nor_init_params(nor, &params);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index bd68ec5a10e7..185ca11bfb63 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -380,8 +380,8 @@ struct flash_info;
  * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  * @set_4byte:		[FLASH-SPECIFIC] puts the SPI NOR in 4 byte addressing
  *                      mode
- * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
- *			the SPI NOR Status Register.
+ * @disable_write_protection: [FLASH-SPECIFIC] disable write protection during
+ *                            power-up
  *			completely locked
  * @priv:		the private data
  */
@@ -423,7 +423,7 @@ struct spi_nor {
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
-	int (*clear_sr_bp)(struct spi_nor *nor);
+	int (*disable_write_protection)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
