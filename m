Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AABC3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC81217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPaSjedh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="I5XP+L2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC81217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zU8K0S6SWsoZzZC/7eB/0lT/ihiD3QlCZ0C5GtrrfQ8=; b=jPaSjedhWp33NY
	Xbj0sGX6Qbk4YlyKclwNAIP8f92BZQ7Xq4WlptydWGLHJVI9pKEg2tPOhyedp3fBNrYk7XR+kqe2V
	ZQ3HBkXHslkoJvcSLjzTFI3m5ICXAdAit6hAt567x3sw59wrkWYcqj7yu9Zccy+WTGrUFK+Cyrkyx
	Zo3yduixdNJClyANVM/FnzBMUBzn8Cs7N/2qfkSBbd5L/QijZ21udPo9IcCQYJt+LsFo0qlAGevnD
	KUMF3d7KFP13gcQkFeRroAk5LWWVNvYGwKzYk2FJHKBgqAP9bQsjMXoLBPlvnY7vM0Nn+Qw0+7Hpf
	n8fZj4jOjThGC+ahxxrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DpH-0005Bf-1b; Mon, 26 Aug 2019 12:10:23 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Dnz-0002cI-UD
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:09:05 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 1b23bYCo8oMGMPquIrYjlUvJ0y66Gm7Nf39v6h8iwVXzU2PTUysGsDX3zMuG8CUAu2KCtEf2zr
 7KZZzmQAeTaBgeRNvwVBi1Mjce6EuKTSbzB3doge2W5dtts0f/4Bv7lUiG9PW2mB0bkqw42K59
 K7iJJ0w4Q4uEzq6smrhWdpDiH1lSVgLqWtnobrqolJy40f77AqzGIhnbOlRrM1Rbgpg+SR2ZYB
 eVSLYJ8j4+FQvugJmQilEkbAwsKaCOFuWqjxJ+hDDmtO/jOfc1mpKwcB47jDCJRzBP95LWGnwE
 u4k=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46588846"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:09:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:09:01 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 05:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4alxsK2hZI2VGE18wsQPBn1jUG1Jwc6DB6+OpacNGaxmMLnMdcgm76BpoVohn0Flg3Lpef5m3fHRMw1wl+iriXuYN39ijVrgAlIljdMXG7hjd4ugnoVncS4yslYLm4xbnS/QrvveDjISIaZEYAtyuaYRPzqMMlbrUqiLmSoUmUxZQ/AgWGL5vbEUCyvhU2P7L39CkvIX1Ie5e6B6lBKXdyE1nYdzjMeuBrNRQUQUZL9oCJ7jWR64Ts6xXLxtdVvba4dG0M8MoPdQhcFFQrPH2mo1V5kv+d1uB/PCVkXRKYM6OoZYqx5AEtQi0D+OiDSpEFd0/LE1Sd9aQEXmPoEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpDlfTaWESJytOMjMrbaec6vmrndTL8P/WfJRbmZdk8=;
 b=VzCUudM8T2iYsZJfwiYmyFymULzrmzgRx0GB08esxryxhijHC9BKzML4OUpCEdoYLJ54xiJAKKdAL+4WueUFZTtzeYHh/4igK4JLh+N3gpy+T9h0rFQVKYRXM9zSjiXAQnFH6mLevNfKtR1ihf0HiYkxFWHPUHrkYkC0S0biHL6G/52PY2OED8Mp47PDvxcTUAKrCiNH0nhOPdVqgkVJyRzrqkeAbOJvxaAdHIiWLRJqSKXoYhFVA5mFH8bKmB+JjSTtGpg7x1ImWeGSkxTLagGUue2OWEEPfiq+DMApL1VYyuXQgdkp6GDhzW4QYrQOPb22Cj2bpVHyzP3b3aAqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpDlfTaWESJytOMjMrbaec6vmrndTL8P/WfJRbmZdk8=;
 b=I5XP+L2LS1cLvyEjl1YteLoGaJYKJLd5ddvvtncwXXca2duvBxqwzPLBK0eyfvKYAn/JUP7H0WAPwAeq32wfWTEd/w+g2vs60lmQ02cg2OPdE/9ZFxbHULoLZQadcvenna2oiYSBrojIoSMmpG1DxikkLJxWdL9BkquI7mPJSqE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3678.namprd11.prod.outlook.com (20.178.252.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:08:44 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:08:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v3 07/20] mtd: spi_nor: Move manufacturer quad_enable()
 in ->default_init()
Thread-Topic: [RESEND PATCH v3 07/20] mtd: spi_nor: Move manufacturer
 quad_enable() in ->default_init()
Thread-Index: AQHVXAcBVqSDVjwU4UmVniY3zigyJA==
Date: Mon, 26 Aug 2019 12:08:44 +0000
Message-ID: <20190826120821.16351-8-tudor.ambarus@microchip.com>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826120821.16351-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0046.eurprd09.prod.outlook.com
 (2603:10a6:802:28::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbd3d739-872a-4f40-fecb-08d72a1e241c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3678; 
x-ms-traffictypediagnostic: MN2PR11MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3678BAA4E524E6F3EFF8C26FF0A10@MN2PR11MB3678.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(486006)(2616005)(476003)(107886003)(316002)(14454004)(386003)(6506007)(76176011)(99286004)(52116002)(110136005)(478600001)(102836004)(4326008)(25786009)(36756003)(446003)(26005)(11346002)(50226002)(81156014)(66066001)(8676002)(53936002)(81166006)(8936002)(6512007)(6486002)(6436002)(3846002)(6116002)(186003)(86362001)(305945005)(2201001)(7736002)(2906002)(64756008)(66446008)(1076003)(71190400001)(5660300002)(71200400001)(256004)(66946007)(66556008)(66476007)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3678;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k9l89VAsgiq5Qy72JkMqb5wEzYejy7L551v7+2Vyt7IOy9MhLfHrZqs98nr4dL+LRXTx/J0XO19SIZKousqiV95o1B+gYwqRQBuIuMeeORGex+6H1jvU3n5QPxkU/2UWoIMS69Xk1klL03rCOdlgFQW2fBKxKYdUHARne1tWGkfevCQlCuusnVfASbB0ErJY+cOCU9ZyLxb3IZwFB47AhHBV5fPfGmmjX0khWuUJFUuXkX5rTIu791RE4tYzMYitqohjnSkm3TGv2NapMz1y6Q/fbuvRyiOGStcPwoWxzbusfntQ+JCWqF6yohWeMPd4c77q9nsIIsGBwMXl+psltJTHKgWyT6GKHYtL/T6jNiv1XKAm0wDcYFtVz4cPlpdj6ov7YEKYEtDwmOEvVuUdiEocy3UtYwznHbHArzzDjE4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd3d739-872a-4f40-fecb-08d72a1e241c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:08:44.1718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylhXu8uYq7o/Te42U9obuANzZaRpGq+yMvE8nfw2XyGDZp1yerIXXWOe4+eYgDP7u0Fei5JkOIjOGxeyDJ9M84wA3mEZtOiAJljNk5lwUQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050904_124009_FCEBF704 
X-CRM114-Status: UNSURE (   9.49  )
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

The goal is to move the quad_enable manufacturer specific init in the
nor->manufacturer->fixups->default_init()

The legacy quad_enable() implementation is spansion_quad_enable(),
select this method by default.

Set specific manufacturer fixups->default_init() hooks to overwrite
the default quad_enable() implementation when needed.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
v3: collect R-b

 drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3dbbfe34d1d2..2a239531704a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4150,13 +4150,38 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
+static void macronix_set_default_init(struct spi_nor *nor)
+{
+	nor->params.quad_enable = macronix_quad_enable;
+}
+
+static void st_micron_set_default_init(struct spi_nor *nor)
+{
+	nor->params.quad_enable = NULL;
+}
+
 /**
  * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
- * settings based on ->default_init() hook.
+ * settings based on MFR register and ->default_init() hook.
  * @nor:	pointer to a 'struct spi-nor'.
  */
 static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 {
+	/* Init flash parameters based on MFR */
+	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_MACRONIX:
+		macronix_set_default_init(nor);
+		break;
+
+	case SNOR_MFR_ST:
+	case SNOR_MFR_MICRON:
+		st_micron_set_default_init(nor);
+		break;
+
+	default:
+		break;
+	}
+
 	if (nor->info->fixups && nor->info->fixups->default_init)
 		nor->info->fixups->default_init(nor);
 }
@@ -4168,6 +4193,9 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	const struct flash_info *info = nor->info;
 	u8 i, erase_mask;
 
+	/* Initialize legacy flash parameters and settings. */
+	params->quad_enable = spansion_quad_enable;
+
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
@@ -4233,24 +4261,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 
-	/* Select the procedure to set the Quad Enable bit. */
-	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
-				   SNOR_HWCAPS_PP_QUAD)) {
-		switch (JEDEC_MFR(info)) {
-		case SNOR_MFR_MACRONIX:
-			params->quad_enable = macronix_quad_enable;
-			break;
-
-		case SNOR_MFR_ST:
-		case SNOR_MFR_MICRON:
-			break;
-
-		default:
-			/* Kept only for backward compatibility purpose. */
-			params->quad_enable = spansion_quad_enable;
-			break;
-		}
-	}
 
 	spi_nor_manufacturer_init_params(nor);
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
