Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2185BC3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:02:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15CD21670
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITQBbY4e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TO1nRY2n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15CD21670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hckhaK3+qyRzxL0yt3uqQD8cZ268tCHNtU9+twZyD4M=; b=ITQBbY4e8Le4PE
	HvMyUkZr/CgHqmwwDlxuKn+9AE8vdMNT8ZC9nVlcOFYTh5kELGVZ2s7x48PYuwCFN9JGKQ0vYcMw1
	To58n2rCCbGfljvI3eIil3Q4Vy9TtD8ttZuN2ZRaqsIJ6i/Qr1Qkzl1AEsfmnToid+OUhZfAKS/0z
	87Wj42cjUHAto07OxMXRi+6rZToR8jJcYFMdKwdAGXUO9JeQ5hLNyoRYIT5iqBW2cUNSq2QNG+q4t
	eoKL22NdwblbNUMK0l09SxBGHhhi3EUnQ/jx7f636BJeAp2OSxS2oF8959Q/5re3HGBPhMSeTdfrR
	khE9k3R/7eqVY3/4R94w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1UkB-0002TV-Dl; Sat, 24 Aug 2019 12:02:07 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Uix-0000v5-J2
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 12:00:53 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ZDazqu1cn9/PLmdST8CACwMISUzppuNbKwjeyEQ1LYF9TJlMG/kcTtOTdDx3R2MwtN3chNorS7
 bX0KzuUsk58kxuWT+xyS4Gc0gMIbg+LuOeBbCea8+pWbikF+TgMxIwwovFumFRy78tE23jvqEj
 Q05rUbJgKEyxXYWCWP/WLpKnesKDYoq/Xtf1GpWnvSnxgi0HLrEYDvQmZvo+3CYAZQ9d0CyA9O
 Yqyk5gwYZPePRzTvlYdfFseEziArIdry2NRBFM1S81IjSl9+5eY4YxAFFTsr6aLNezN6mBE6G9
 /FE=
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="43547627"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Aug 2019 05:00:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 24 Aug 2019 05:00:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 24 Aug 2019 05:00:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzpBDuY6oBmKKqFkA7OroU0XFdYn1EtZ/z4mLoah9yMC6yQ/dPptRHkD0bZqifa4lfAYt7Qb1OlCKhp3MCw8Q0KcIT+Zz+RXSVl6hQQubNpTShpHq6RXRWvNKqhGnIlhT9sv26HwFHvhLadpSI49kARGHzEzze0FUzRT7mPRiCa+YmBRMz2WvhHsiO2wrxyIlZdk8WolAsDz8YiS6kvE9HXUVBcu4acsgqVwqooB8eMjr8MQg/qSuZeTfzeREvVJ1FyrqhHhwv5nS9QLf5DIWegNE/YjLGcY8SxfjmCDbEwzXKBKwVdPiitcUuUlgHRKgLIvhouOCAEbKt/iv5+8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwG8nDWdqeIsHmQLulaNBjxRgPOgpI2Xy/tTYEDuHuc=;
 b=KQsFtZGUpI6UmfJJLWrZT0b4qYsH5ik0SvzUo1H1/qdRsQ+3ynGjbTg3J7a/XbxllRMk4zaysGa7Upu+fw8dUuAgkqlOqyvZt8QDNyprKc7boUZtNDui9Qk+oEnLNN6PDu9WXqSTHd8mYck93HTDtaGfTk1V7LIERo0TkhedcZZ4EIGD8hGrCZwUTnQCUrZfWxicE3Kr5hAVbiDW8S0OAozNfA/Vl7ogQFhSUM990UR/BMGqcSTKd2asFaEmVz5Hmx7Cas+Qt4VvaNLBrL1HuUxFdhpgXJMhg9QPeK/XKnurLcTsKYmxuCKfv3scH684qO7EpuCP9ud8VbKx6trYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwG8nDWdqeIsHmQLulaNBjxRgPOgpI2Xy/tTYEDuHuc=;
 b=TO1nRY2njBM6zY+zzfjZvZPRzAkMD49ie8YwqN72ysiZbHesxQGgtggXjGrefv/eGZi885lKp3CQgLnPrsXoCHeIvCiFEkdeYli/LGDZcoTnySnOsUjcRmm15l+aKM1Gu+N6RIrBzBgfnihP1OD2EzGvJusdPzxi+tNoKTQWy7M=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3984.namprd11.prod.outlook.com (10.255.181.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 24 Aug 2019 12:00:49 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 12:00:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 7/7] mtd: spi-nor: Rework the disabling of block write
 protection
Thread-Topic: [PATCH v2 7/7] mtd: spi-nor: Rework the disabling of block write
 protection
Thread-Index: AQHVWnORmecMuD4IS0mom6s4UeawIQ==
Date: Sat, 24 Aug 2019 12:00:48 +0000
Message-ID: <20190824120027.14452-8-tudor.ambarus@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190824120027.14452-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0194.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7dfcdc2-6d52-4a80-ad55-08d7288ab40f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3984; 
x-ms-traffictypediagnostic: MN2PR11MB3984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3984441B5CDF1278B5E5C51FF0A70@MN2PR11MB3984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:291;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(396003)(366004)(39860400002)(199004)(189003)(110136005)(25786009)(26005)(446003)(4326008)(1076003)(256004)(316002)(386003)(2501003)(81156014)(6506007)(8936002)(14444005)(64756008)(66556008)(66476007)(66946007)(6436002)(81166006)(66446008)(8676002)(2201001)(53936002)(76176011)(5660300002)(86362001)(6512007)(52116002)(71200400001)(14454004)(11346002)(66066001)(476003)(305945005)(6486002)(36756003)(7736002)(186003)(71190400001)(478600001)(2906002)(102836004)(99286004)(50226002)(6116002)(3846002)(107886003)(486006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3984;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +bHqPDeApMsLpEuCIYXFz4pLyOywZIMp6QSNfhZ3vLja0UuMz9vCuOhBFr2ceY8zItGwCE1+4QBV/3ZBU3Vg7nEMc++LDL8frZwehEeUnNBx8TAx6QMMjKfqwXxGQI4JbZHucTZDHgTU6x7oGqsq1xMstJs3/TwwnPjuIJaErq401QFRDepi/pxaB1iArX9OykCd28qWr0oL2MXSHY62EeqA+cjxiAeE6bgW3vdO4/KPdCLRAlFcogZdxVkR4iX+XVEdZ0uyYmmLaCScKlcCA3uBcF2U4qUabin8HT6L2/GVGbL3Wp4d58en37EaZET6k89vKv/K2rCtOVDWFCq2XAE93Ydxm7jhFQN+SBQsw0Jgu2zdC0FUuRYIG8hHBEaaL1bsmgrB1qGKMY3/ysrXZmy2rOpJYHkqskqxNsvAfgA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dfcdc2-6d52-4a80-ad55-08d7288ab40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 12:00:48.9897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwLUWq4dlTiw9UZOoHVzdpb4ZsiJTjoQZbdTWpYzULgB55/4Ke7ksk8Jdm965JOA/FqjcTg5rYelCjFColvoZwYDbtrbEP6fWquUqdNsJ9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_050051_694224_E45587AF 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Get rid of MFR handling and implement specific manufacturer
default_init() fixup hooks.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fc9e14777212..f4e9fcca619f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4146,6 +4146,16 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
+static void atmel_set_default_init(struct spi_nor *nor)
+{
+	nor->params.disable_block_protection = spi_nor_clear_sr_bp;
+}
+
+static void intel_set_default_init(struct spi_nor *nor)
+{
+	nor->params.disable_block_protection = spi_nor_clear_sr_bp;
+}
+
 static void macronix_set_default_init(struct spi_nor *nor)
 {
 	nor->params.quad_enable = macronix_quad_enable;
@@ -4173,6 +4183,14 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 {
 	/* Init flash parameters based on MFR */
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
@@ -4760,18 +4778,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_S3AN)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
-	if (info->flags & SPI_NOR_HAS_LOCK)
+	if (info->flags & SPI_NOR_HAS_LOCK) {
 		nor->flags |= SNOR_F_HAS_LOCK;
-
-	/*
-	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
-	 * with the software protection bits set.
-	 */
-	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
-	    nor->info->flags & SPI_NOR_HAS_LOCK)
 		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
+	}
 
 	/* Init flash parameters based on flash_info struct and SFDP */
 	spi_nor_init_params(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
