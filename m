Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1724BC4332E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:25:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B2D2072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vf/RqzZB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="S45vMTZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B2D2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZRrftGfZZokjczF1A7jLRdb4j61+RvCXRfNscGki/8=; b=Vf/RqzZB9PqdNg
	QeMdvdRT3/NtuLavlOFuzvMCOY+DzaO/Z31RD3OBAOU7orjk+qPl7BUzIKVrqTbM5BI7p4BcMva94
	aCxh6bzvEupnuj9wYCOP7mQzOgaMURaV5oCwCK+gaqXaoa9S6fVAE6uh7Wyo0U5lHU5E3P7OB1blO
	HT9TCQeu7rGOeGhh3n6q7QAzwmY3huq8D2nYLeQUbRBkUtRXdJcJqqqPLA0FBZTTgjksMwIPypE/A
	bDUB/MYn1FRoOihbgFHN80IUIiyhkjJYGLRQBHQHCis0DkTJ8zhCDsg5JlsZ3h1PlFgDh7JMw8DBZ
	Je0azZP6tqitao0Dwecw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJKm-00057I-Qu; Mon, 23 Mar 2020 09:25:24 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJKA-0004UO-8W
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:24:47 +0000
IronPort-SDR: 5zAVq0gywvwEiaetYAV4jcfDPX7xTy2bcKSvAxYjp3E4+e0K6ad0kz9E2qnmNKBw2rquJxUTfK
 3gphB4lmLpogj5EPczdrzzu08dYB0wY9u7oDzulOhUL8d7MaWdAdlD77u2eWha7DtmpfRIwi8f
 r1aoamtGR0EwT3fhfTDDXkQywrW7IL6Y8pPfMOzV37hvavR2aZinfxPq8Qfge097Jw0QQRPdyn
 binWFjCm0IVQNQ3z9/+ZuuaF67eP4C1xyULy3fBjlfb2tIBAGgE2msfc24aqNeMozLOu5aA2rO
 oqY=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; 
   d="scan'208";a="6620296"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:24:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 02:24:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 02:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1IfeIEIy0Rlw3Ow4b/BMWCfvuNDE2KP2RRnkMfvpNkumalulkQVu7yF57QmggmlwG8iLISPMVtifzO6wUbrOEmG6KRbW0M/4fDM6yvlj+lfYXVec7kEyQrWKTsiHToqx3axw59n/PcF/jxoeValYA6RLrC3KKYTnbIvkxAVewXfBwVLGHPDvgaZaYOWaU19i5WOpLqFUigp+hIPzXHTrmWujKFfDoeQ8Yvz13g+bL4EJBoDqwZTtw56QXV5xK9n74wn5+iXv79bPG0B7NfG5OXBN4lTuopO+uk3ySWzLIOi8nHX9/dJC8Me5c7hg/xYd5bLyAyK5d4aecOmEpIyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=637C6BIZsGCX+1bzPDSmV4dAmf7p+4usskJryQKfk0Y=;
 b=mOe/KxYt42MMNvxRcMsGtGjOFtPyBGop4xmQZwIpRPjUeCBLdta8V4AWD7qJZOaXXdVpHU/hGNZKamvGyFQggxWjUCYYXt8sS3iYFfCXWRPfgo+mtVUggTVtRiOdvRxLWBGLHnQm1Nw5Btw3RwLFvoN9YBCH0mzuo+1ovUCJpkYeEJ2Dc785GsYjfWrPFz4V7mgMDqlSmWusSnDVNMgwTlxeDNrjEip7pXsze6yl7IhkgazUp5vcVXqbaIOd4wY1t5DDQS00fd3KYmar3y2NRDZk4XH9C0+z06k4bH4UtFHp4gvLsnfXnIcfsYDTizj1FQ3Ed3vS7Lw15Jpo9Xw/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=637C6BIZsGCX+1bzPDSmV4dAmf7p+4usskJryQKfk0Y=;
 b=S45vMTZf18hvxVkeGR0LberzWgtfebSiJwkjXgi0rXjg1zynN2a3k1I013WfvnZAkqIEUTTffMMaaFGgR2Avwcpx2wCGatBwiJcF8HNH/K2V69FcD6uMafvAn3jCofkvspHTWB/MQO3dnpNg/Vme7q1qgSK2xplKRHX2gXpTghs=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4449.namprd11.prod.outlook.com (2603:10b6:a03:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:24:36 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:24:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v3 5/5] mtd: spi-nor: Enable locking for n25q512ax3/n25q512a
Thread-Topic: [PATCH v3 5/5] mtd: spi-nor: Enable locking for
 n25q512ax3/n25q512a
Thread-Index: AQHWAPTeW9NARohhVUu+LhcnhrWR3Q==
Date: Mon, 23 Mar 2020 09:24:36 +0000
Message-ID: <20200323092430.1466234-7-tudor.ambarus@microchip.com>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fa25c6d-bbcc-4b89-cec3-08d7cf0c013f
x-ms-traffictypediagnostic: BY5PR11MB4449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4449807E496293E0C3C946CEF0F00@BY5PR11MB4449.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(8936002)(8676002)(81156014)(81166006)(36756003)(76116006)(91956017)(66946007)(54906003)(110136005)(316002)(2906002)(66476007)(64756008)(66446008)(66556008)(5660300002)(2616005)(107886003)(186003)(71200400001)(1076003)(86362001)(26005)(6512007)(6486002)(4326008)(6506007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4449;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9uzAK9/0wA2w7eZhStZYQt7ITbY4G6YYqnUIZqvseGpbvzudpow8SUBbnMi9K13SNJ/bfSWol25wopvUa7pBy2JNlEIE0MXrCCY39QjeD+EZ2WjpZctfxg2VOo3hXtlfSNRrZAl2IeZVt2Hhd/lBCeISXAl0TT+R4VDMOrG7105hpn9ckqFTYNJTV2TnaP3fEHSLjJdG5YfN9MTqoGblLJDhK459drqYW63hXdbIvEGc0SaERlvuhxnxNsGggzLW/fKx00ol54FZ42TRFz1bZoqgtmkMt3Y8KCx9f5oEXEZhcfZNwJcCEXazo9GamOKy1HYJpM8Wu3wTaSK9AT+Vl14/OIvT9Dch6yocgctVtnN957/R+P9h6oY3LHVVAEWn41Jupqf2w52+/YsyLcJcsGWQHnpeABhcoAS5t8cX+KkNOSjbZTge6Xsug05XE33s
x-ms-exchange-antispam-messagedata: x+RzSEEwzCQqscsQTyGpMFFfwI9rwJoMD9OTniaaFby4uWoNIujCWPyvVWad4OYdxLD271NRR66BrQn5TGH9ei9e1KoXIrccZjIyZCtux4peyVUj5gsi51yEYAGDClqyVfkS6Kurz/lteqBSraU9bg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa25c6d-bbcc-4b89-cec3-08d7cf0c013f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:24:36.2511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3wxy+T8M/Hx8RM8xkjnOa/rVb8/bJJlSKURTh3oGbBxLL3bV7oEj8qSgkeLjt+MZvGQ01uCNXW1IUyBO8FztUGwBD7/r8Mt6i0T8kpC9Lx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_022446_338631_01B4FD64 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jungseung Lee <js07.lee@samsung.com>

Some Micron models are known to have lock/unlock support,
and that also support 4bit block protection (BP0-3).

This patch support lock/unlock feature on the flashes.
Tested on n25q512ax3. The other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3874a62d8b47..6c034b9718e2 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -47,12 +47,16 @@ static const struct flash_info st_parts[] = {
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
