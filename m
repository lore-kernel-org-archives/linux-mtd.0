Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E888DCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B548120663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJ/vtjt3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="sXOKFwlZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B548120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6uklMHkx9A8qpnAK7C685V3o3uPuA0WNg4EsM23Krs=; b=ZJ/vtjt34D/gF0
	dzVonnPUhouSX7dFRSAwLK39yo0hL41p6jCcL628XGjK28gRhnnXfRebWoz95+pQMZiGQuAzovhTR
	qFKQ5tSx7609eymCehPrOzE0YW19v9yJYsGInZTmbmZTBpDKl0D+0RQucugWtdAiRQzsNa3XEpqxZ
	92J105kmuIY/3A60qhIhq2I6lz8iuKlt84va8Ttp8GWGLyxcmc78Oaz6e3w4LNupBnv7rVQGmYj9K
	IVCFKUl26mn6z3tfcf0PrOfVfrJOF2k19Up2oSmJxTctH46cs51Ia5dBTlgNeyLC1igfx7jXkQqHO
	yd/PspRIPPWG98bzUkkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPbN-0001gX-Fw; Tue, 29 Oct 2019 11:23:53 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPVN-0003Fg-Kw
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:46 +0000
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
IronPort-SDR: 2z9OqLXT0YSa2fU93SbnaGC7nCg+YmcHEH2TTNyAVSp+74Uel8bSbaRczkweC3p39nKSRhVJIJ
 tjQw3bp390gS1YBrBcsKfr61VXN6R+xXkExboPyWL8HMvTCJEKuum+mUK4xlOg8OcmUhKzCjJq
 6OdG9PKK3idx1/E8kHKByYZVdLr1DUO+vA2QJhWW05PQh5m1ZNcCpUqUJcDXj8JsNBYKJnZA/h
 0TJ8v1j0qXxKTCVoPrdnHzAaOjdRYYfPHRNo3H755j/Bqn3/6+k0G41nQtzVcaTkPibvF40XHu
 ups=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="53323591"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:32 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 04:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2CqU6NB99yrLzDofMWYIbCI0H2ss8u6F5YuD/MFS02gTVhRH1lnvC8so0y4eohuqoN2v0TvAfV2AKc8vM88a9TiyqxUc7+WY2FSc5DS5KOWNXTo5XlAvWw3slDZX9MDbSliVjk96oGZdXl8jt0ThePgkiTBMYM/jds2TsK1MP8QFa5m4uvfC1sVoFZcxKBIMu3CRYVMA9cJXwn6tpbUXnjhNKEg3+ylEOUovt0nPvjTkG+2SvvU6xzBXP0dW6yo1XFo+W3Po+2CIdJQHQR/xJF1wHXGdPeW1gS3ctrgZNNbHUWABtZFr1ue4Vk4CfpQYKkJt9g36IDd3U1jUtONQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V+/zoDRJ9+xtfwWbUFydmgX3SsGOEQJvFPMaSr5pVo=;
 b=ArkNZGRp9WcxOMfG2vVRQhXLJtZFM5JvdOcsBewVV6q/hMdJdJJj4UjWqeeFyy50yB0XAp0vj4AkvRdwK3PVAZdIYdFzEyIF4e19JVRqrT/AN0mH7AKR1T64RgW/WbmqfIdl49vX1xRXXmUY5+gSiwVJeab/OeqQfA4Yqxlr+BtFbUvvNnS5Ce0Xnh+s1S/v2vLcmABfCBLsRL6bmSzgwYfn5IJlvC9IaVSn13GbyBE1wn3nF2SlRKodjICBv65a7fLP9pdDwMma7wy6HUZX28dbXJEMGyodYE1E10JzBWPeD/j6t3jfPY9djphS+1aQz8/RAqCmhSdvw0/9TYRJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V+/zoDRJ9+xtfwWbUFydmgX3SsGOEQJvFPMaSr5pVo=;
 b=sXOKFwlZB0cQ/yMzqYpT3j2abRNTit+B/GGTy+KLxAfE8WPpYN1Yl/TATa8tr7M5Y2MXPev1ffITr1Q6g9wYYvKKy1hkO6B7Mk9G6NHEvVqSTklFhVfXbhzOAyZelDVg/7kBQtNCCr8Er3b0onWCI1djUP56Rh2wqeR4I30xBoA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3712.namprd11.prod.outlook.com (20.178.253.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:17:30 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:17:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 26/32] mtd: spi-nor: Extend the QE Read Back test to the
 entire SR byte
Thread-Topic: [PATCH v3 26/32] mtd: spi-nor: Extend the QE Read Back test to
 the entire SR byte
Thread-Index: AQHVjkp0WBD2QOKkbEyTp5NSQta8qw==
Date: Tue, 29 Oct 2019 11:17:30 +0000
Message-ID: <20191029111615.3706-27-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c6a0f6d-9607-42c4-e102-08d75c61969f
x-ms-traffictypediagnostic: MN2PR11MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB371237754368BD442BC49019F0610@MN2PR11MB3712.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(107886003)(6512007)(316002)(110136005)(4326008)(2201001)(305945005)(6436002)(54906003)(7736002)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(6486002)(5660300002)(36756003)(86362001)(11346002)(446003)(8936002)(81156014)(81166006)(50226002)(2616005)(186003)(476003)(256004)(478600001)(8676002)(25786009)(14454004)(486006)(66066001)(2501003)(26005)(99286004)(386003)(76176011)(52116002)(1076003)(102836004)(71200400001)(71190400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3712;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lpWd1xcw8ZNymTJVTTQn8agCLGLKXng1oNUHz1VovtfW3cpNOTdUbAxSPjb527CwFvgYLXjQEKTPO1wmSuGRsJzu2BmYq2l0arss0jM787GiEFXHqksY1/ewidfUWDSmGmC16nEN63YSlCsIVwBIkCsUm66l9BL+qrmQOpvyriApFTgYvsKEzrmnqmyypF9+zHHTx6BbdcMdcBR852LgpEPMQxRBWiBgPyz8/5kunxj/EXejkeYewHKsC+FK3AKLcq1CrxbsE7qU/R/Kn8QdwdMtWt11t6ChUVBOJQSfo6mlNFaHeRpGQOe8NW5Z8XppSgDtm6F9Qrx0N4GHJ9JmLFKeqT+AcjpkpmrJYYZWhztOfFFYIkBI8b973Skd0fEVIIqWUDXpQ/CrO/RG7MBIf0FqVfqKmAzSxkLu/GWiBPGw8GUu0iKilo61TdBxNA3x
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6a0f6d-9607-42c4-e102-08d75c61969f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:17:30.6486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lvl/ml28slKjp1gAnMd9LdQTkFvZIfig98LSJLyNByN1XwsnMIwiLVoUhLJhWxOu4c3bvAD4iDc4G53Kdewj8P508d4Uu6cv3kjH/6/JXwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041741_745490_DA895C74 
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Extend the Quad Enable Read Back test to the entire Status
Register byte. Make sure that other bits were not changed.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0dcc4f12e4de..55a12a1d710e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2047,20 +2047,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	nor->bouncebuf[0] |= SR_QUAD_EN_MX;
 
-	ret = spi_nor_write_sr(nor, &nor->bouncebuf[0], 1);
-	if (ret)
-		return ret;
-
-	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
-	if (ret)
-		return ret;
-
-	if (!(nor->bouncebuf[0] & SR_QUAD_EN_MX)) {
-		dev_err(nor->dev, "Macronix Quad bit not set\n");
-		return -EIO;
-	}
-
-	return 0;
+	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
 }
 
 /**
@@ -2108,6 +2095,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr_cr = nor->bouncebuf;
 	int ret;
+	u8 sr_written;
 
 	/* Check current Quad Enable bit value. */
 	ret = spi_nor_read_cr(nor, &sr_cr[1]);
@@ -2128,13 +2116,15 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
+	sr_written = sr_cr[1];
+
 	/* Read back and check it. */
 	ret = spi_nor_read_cr(nor, &sr_cr[1]);
 	if (ret)
 		return ret;
 
-	if (!(sr_cr[1] & CR_QUAD_EN_SPAN)) {
-		dev_err(nor->dev, "Spansion Quad bit not set\n");
+	if (sr_cr[1] != sr_written) {
+		dev_err(nor->dev, "SR2: Read back test failed\n");
 		return -EIO;
 	}
 
@@ -2157,6 +2147,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr2 = nor->bouncebuf;
 	int ret;
+	u8 sr2_written;
 
 	/* Check current Quad Enable bit value. */
 	ret = spi_nor_read_sr2(nor, sr2);
@@ -2172,13 +2163,15 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
+	sr2_written = *sr2;
+
 	/* Read back and check it. */
 	ret = spi_nor_read_sr2(nor, sr2);
 	if (ret)
 		return ret;
 
-	if (!(*sr2 & SR2_QUAD_EN_BIT7)) {
-		dev_err(nor->dev, "SR2 Quad bit not set\n");
+	if (*sr2 != sr2_written) {
+		dev_err(nor->dev, "Read back test failed\n");
 		return -EIO;
 	}
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
