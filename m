Return-Path: <SRS0=DY/e=VO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72FEC76192
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 08:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0BE217D9
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 08:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PU6WKm5V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Qf+tRX8/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C0BE217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDDE/vrAnOHidrUzdiUXjAdUJHvDGtmnbZgYW04NCXY=; b=PU6WKm5VagFu3q
	TYxNed9tYBWa6Tvtiy19Jeu5/Oeh4oTsTH6R9XK5E2acIf961SPVYNKtUBYpAa0xAKneU14RqknYJ
	6VFIxpX6xqWtDJhGWhu43h/DslglXzMWXcuf8tNC9pNQjieF5snpQnTuTzbsj1dB6tbUbLCdQgCBC
	p/AjGtGtJLJOKpYl2NDT1y/fL5VVPJvB8Lp4fBIrG4fLDJtoFmZvmg0qY70tZUC/+tMTwmd4LtdMV
	2fe8izhi7ZIN9NnoKzlP4OBABe8RWh2jsIlezMgg/nYi9vpAE07ZH9PNSvSrem99CmEiFGNfx7Wbg
	0p4xGugdjcHsAxJJHvtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnfd8-0007gY-CR; Wed, 17 Jul 2019 08:49:42 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnfbk-00055F-Ms
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2019 08:48:18 +0000
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
IronPort-SDR: KOBIHJBALm3Xq8KyzMzIPyLFrHAP4JANjJIdWRjfBDD3Kr6CY7ImtBI99FSWJeCZO1NyKgchXM
 IIYHX6dK65HqKkL6YQUxu9yTOmqiARTUKqz8kBT1tJaY9mEWaV2NxsrhrsSzIC9u3xUdJyymYu
 aJLqOjSUV3oJIRfQoP0yShUf8AB70Y0xEB2eeXwuQO6O6Hd/azptShoetDQoRmgXvlTBGbpVCg
 5x12FKOkR1eafcQut4WTI8Uj+3mqDMQQDTgpfh7Jdaffeomb5ctmwIGY/CG5laxyggVUdbpHmJ
 0/I=
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="40862884"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2019 01:48:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 01:48:15 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 17 Jul 2019 01:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHrkMvXZVj0MM+O5slKnRA+RDFfLLJstQRAsHQOuB4EMbOhGMoy77h2mRLX1F3w6+00lljDhHoVtk/By4h8enwzK0HaMet+64u4yrezd0Uuit7ICy58dkO6VOlLo8mkvu6GfcmnLaNuIEx+NsqaOcsUpxIFDd55IwLgpnudYhmd5VgLhTvrfghw2Xds9tzklv+MgkKHok3I6v0vNaBpIu+xn5Bv0VF3IqgQdmXxP8JPqRufPMqribPl1snpQwZ2XQw+hZV8FUuViQMpKDzQowY6FeHeJyPhtRw3fXeDI8YZuVX15qU3C788Acz/9iIpJIvdln4nPYZF5Rrroji75Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZBz6VUxxFW/YSX2R1lQo+OB/Pr8fL0yWuM0pVpTqHw=;
 b=oI6XpsTgTvAXCuT3rbZzG+aLvmevxnz92kYaKYyEIfto99gbc+CxYQIK8UKK2EBjHtS06gaqAjuJd14nzEQ56qYQyTMoC83CL+egwuCH9u9zvMX23dCD282jxmCB2oVJiC1wsV6fHKi4wvAPSZxtZaSwGykDn4eJHVDcRvT+30eMn20vMuL+zZsYdUEGdF0yzHNdn6hjpFUG2l29RLHeS19SI/utBcgvrWXDWh9aaLoRh2pDpL9ei/9YE23SWqAY/uQyqBQegxkLuz2qkL0Dfwu+yKo/kIvDupgvYvrWEdQFLYwXz7oAG0ymsUguIRPoXNFmKk948ORaSo34ryWFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZBz6VUxxFW/YSX2R1lQo+OB/Pr8fL0yWuM0pVpTqHw=;
 b=Qf+tRX8/JooqXYFrqXEdc4G24IZscdS4LZz85SG5+7FVjisjpaKS9fvA7tJKwH3f2J5kLktSRb9xaYVjM3Bo0rHrkk0ALSlVFcVeSJja05z7JhasmjsaRUCuDqYveaQSJEtSQLLeUj0q7DSMOxb9SdecPV/2IWj2jgfeSo8Zn9A=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6SPR00MB254.namprd11.prod.outlook.com (10.173.236.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 08:48:14 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102%12]) with mapi id 15.20.2073.012; Wed, 17 Jul
 2019 08:48:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <marek.vasut@gmail.com>
Subject: [PATCH 4/5] mtd: spi-nor: unlock global block protection on
 sst26vf064b
Thread-Topic: [PATCH 4/5] mtd: spi-nor: unlock global block protection on
 sst26vf064b
Thread-Index: AQHVPHxeihfxjuggyEqOfqXDefj3kw==
Date: Wed, 17 Jul 2019 08:48:13 +0000
Message-ID: <20190717084745.19322-5-tudor.ambarus@microchip.com>
References: <20190717084745.19322-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190717084745.19322-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d20c345-0228-41c6-69ca-08d70a9380e4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6SPR00MB254; 
x-ms-traffictypediagnostic: BN6SPR00MB254:
x-microsoft-antispam-prvs: <BN6SPR00MB254F107D8F5795CC99B4104F0C90@BN6SPR00MB254.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(376002)(366004)(346002)(189003)(199004)(66066001)(102836004)(186003)(4326008)(99286004)(52116002)(76176011)(2616005)(486006)(386003)(6436002)(446003)(256004)(26005)(476003)(86362001)(53936002)(107886003)(6506007)(6486002)(66446008)(11346002)(14454004)(14444005)(6512007)(71190400001)(64756008)(71200400001)(25786009)(81156014)(110136005)(2501003)(478600001)(305945005)(7736002)(54906003)(1076003)(2906002)(5660300002)(36756003)(66476007)(81166006)(66556008)(6116002)(8676002)(50226002)(8936002)(316002)(3846002)(66946007)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6SPR00MB254;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wHconHJMHrYiZDBDzlzQa4q3iBxJldEnvB5jEVLmLYfQXMcQdgUTaZitHGSuyNvYHvhEDGDKk172OXBL6EpTVKT2Zm7E8aJfgZT8R7Dtu4XVYP9AXXUOjgHsEB3ZOQRN6QStH7M94cIH/oFeNQCIHgXmxG2ctuagKOaD3Ifq4dteLj+PH24pzTjX+xaKdR0aUA0MM9SzWX6+LAwuQpSOJfWgMLvaheiWnPVN/ebTUxkw0dEkHJvIueHc/B0VXhZw+nX9RUYpsRUCep3aPIbfdFnM9Px/KeQjVtOHkE25ZTW+7VZT98FCCLWU9DvYjsv/HFH/gyAi7xPQFZt2/vVLWDtVOPJ6aLOyHHf2p0OHId5MR0MTIc/cNnocMjfSGgM4rWNBOkqm2En6HsmP8A7qVTjSn2qHmk4xFh8R7z3RsUU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d20c345-0228-41c6-69ca-08d70a9380e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 08:48:13.8606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6SPR00MB254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_014817_024293_0326B64E 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

To avoid inadvertent writes during power-up, sst26vf064b is
write-protected by default after a power-on reset cycle.
Unlock the serial flash memory by using the Global Block Protection
Unlock command - it offers a single command cycle that unlocks
the entire memory array.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 767e2e6eb1b8..ffb53740031c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2075,7 +2075,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      UNLOCK_GLOBAL_BLOCK) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
