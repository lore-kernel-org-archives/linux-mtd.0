Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13839C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46C72089E
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sBXSipbe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fk7ICYeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46C72089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2+Ogm/xVLH9VFUSsk9pFBHfpgUcSN3Y39873WZHB6c=; b=sBXSipbe5xSyv5
	xDO5A4+Q1XotqpmcMbQWMhMdPcyqPrb1/wM6PsSJKNu0wBN36xzm0mmbUG6LSGjNlVOGjaxStSDgz
	8OYhLlnlklzBpEjDQeE7bGXYB4NcGMno0Tl2cxxsfROpaNKOERfAS5I8gkMjFLXXpB6PCkK9jjAFN
	qAq0no0NGB+n8teBJDcvFlmZOBPxxNnnxve1P0HidWoyz3mqyFvcGAqd0kB0OazYBmYSh0feyRwbG
	3ST/5lPNfg0gRgf6GJ8H8vUBV9aPyLSjFBbFyI/Brzg+5DUsWduMtXlv5AoSqlWD9dK46yeAwQHAB
	EU8mVcMolkqbcC8wXVJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskl9-0007sx-4c; Wed, 31 Jul 2019 09:18:59 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hskky-0007h9-Ia
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 09:18:49 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: vRV3qlVTUzIg7UDNR7R+LDTFt5GwW/xDCA/U+ynz4HScSttvPsAqspiIFsKtRNM+FJx+XOr9HX
 tNwKjWt88O4BjXkhMe9hC2Gpc7I0xtbO7Ck4zYu9YV4ZcZNuQpc0S2msmtSIefIKjx9i1U8V57
 1ZMfJI08PruEG/7kJsjS59/0ZTWEzvB0dbowGT1XVnA4acuLk2KVHQmSgsPlahNRNKzdWXQAHP
 KcEaackc9Ah8shB5XXtWJBrzJcYgohlvohy33xfeON6X/Jjx59PheVMK0PyKDhPNY9lupc9D84
 hPQ=
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="41825820"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jul 2019 02:18:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 31 Jul 2019 02:18:47 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 31 Jul 2019 02:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfaVVi7OM5UkHZ3UsTEpLuzmidCHOEB8tc4fQBpSQ+eUUGHrLdFITUxiJQAkSyzQvZ2+JrJtnA2xlytvE7TlLKNQILdXsBSrrhS528H4+Mf6MTvHDLhkrv0eT4tIVJoU6ziZpHZUAwELf8jGYSy3XlXHGsAY4h0ZmDv2ACWXV4OrhQmaO6teCojM8nuUV4SVeHrkk+UWJixboTEpYouYBihbnNG3EPVAMWicGELZNwnVAlxNBu4dxNcCzJ17Vk+KCQqTT8pKaAz6hPoNyeT+VGK5MzYA8i/BHhgkJS006UECNW/QPYgF/Epee0ynmGr8ybqjDxjwdsDrrFC+DP5LoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gyffj4fsFZ3471YiK9psTW+dWxKYAY4RgVWWZGX8S8=;
 b=oUEh5m+WL0PiNg43OW3gqJxCDbZS69jO4BVhaLKnAw/CtoZPBrj6K8aICo7pSN2ZI3+CDKr9JPv/xk4cJOXNz/R9v1utci3MAPunz5wvi3Qq6pbdqS/6ADoa4VyeeUg2lXVWH0DtNIL/vz8ugOqOLbQXy+wFfz66RapI0Cyn/nhCDvkR1YwUZFhtxKNDgtVxEETftXqiRVIcbAiR8vvLScwfwDt3ZvnYtWhZjfxCMOoyRJGEuNtNffcdRq/kzS0s5OXE3NFnTPUwqrfprZOGBcz+LwT6ZrybRFFm1SVT4U3FDjwJcay60a+xtFnW8DVNfjE+OAvjbHxmkSmSKsYSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gyffj4fsFZ3471YiK9psTW+dWxKYAY4RgVWWZGX8S8=;
 b=fk7ICYeCna8TulsW9xaWQ+n/D8FzNd/+16hhbYNTmdn3zeu1gZ9m0c48YvQpJuPF6Wtc9GjWooapD0Pc/N4bFdvbgl76JCjfCO75CmvP4Otcsqhl6IzyU3CvLkiBfVAna6Gg7UXR9upiiAX4jcOf2NrWqjrzwgkn68UpoeOzHHg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3680.namprd11.prod.outlook.com (20.178.252.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 09:18:45 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 09:18:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>
Subject: [PATCH 1/3] mtd: spi-nor: Bring flash params init together
Thread-Topic: [PATCH 1/3] mtd: spi-nor: Bring flash params init together
Thread-Index: AQHVR4D0onSNS3eyzkyxh3XzGk3+Dg==
Date: Wed, 31 Jul 2019 09:18:45 +0000
Message-ID: <20190731091835.27766-2-tudor.ambarus@microchip.com>
References: <20190731091835.27766-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190731091835.27766-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:803:64::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 003d0bcd-050e-4a90-1e2c-08d7159816ab
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3680; 
x-ms-traffictypediagnostic: MN2PR11MB3680:
x-microsoft-antispam-prvs: <MN2PR11MB3680F2A5FBB821A86AC83EF0F0DF0@MN2PR11MB3680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(346002)(376002)(136003)(199004)(189003)(8676002)(81166006)(4326008)(81156014)(53936002)(7736002)(256004)(25786009)(68736007)(8936002)(50226002)(14444005)(478600001)(6486002)(11346002)(2906002)(107886003)(14454004)(2501003)(102836004)(86362001)(6436002)(71190400001)(71200400001)(476003)(1076003)(305945005)(5660300002)(66556008)(66476007)(64756008)(66946007)(2201001)(66446008)(36756003)(486006)(3846002)(99286004)(76176011)(6512007)(6506007)(66066001)(386003)(446003)(316002)(6116002)(26005)(54906003)(186003)(110136005)(52116002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3680;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LX+WHY3m0twh2xFpgxOWN+0cpJL+18n3Ie6nyUBHAn97d2FHZlJMlx8ZaoyM1RNBhYxr+nVtt8mcttImBI97jeCmvox/ITFfWq66nSPuHVtBudX8M5OBVtRWinx3B28EIos+qEo4Ka40zv9ekhPRi+5BWrqAm2u/4NBBMi8wd5RjFkVDmmtjKVfiDukcVhYjxwsnIzewZH/4ELo6aerEZJb75jS0Px+qr59GyGPOP8WNIBHR/jCj1wGZq76n8pXIP6tEYKCYIDZtHuMnRNIo0YQe0Ezlrkv5sRf/oMvREK8Y/e6rbeBnRY1rgHkmrE/raAgPALCNWyQY1rSq8Bw8wbPyG5C0aKYl8hWucKG7dKXX1LosaIvRrfd5hcxPvjvYjFbydnvaw2qR/usJ8vhgjrhSx9fqp5ua6ilp/4VC598=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 003d0bcd-050e-4a90-1e2c-08d7159816ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 09:18:45.6910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_021848_720995_771298B7 
X-CRM114-Status: UNSURE (   9.41  )
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
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Bring all flash parameters default initialization in
spi_nor_default_params_init().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 01be6d49ce3b..fba941a932cc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4319,6 +4319,7 @@ static void spi_nor_default_init_params(struct spi_nor *nor,
 {
 	struct spi_nor_erase_map *map = &nor->erase_map;
 	const struct flash_info *info = nor->info;
+	struct device_node *np = spi_nor_get_flash_node(nor);
 	u8 i, erase_mask;
 
 	/* Set legacy flash parameters as default. */
@@ -4328,18 +4329,25 @@ static void spi_nor_default_init_params(struct spi_nor *nor,
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
+	if (!(info->flags & SPI_NOR_NO_FR)) {
+		/* Default to Fast Read for DT and non-DT platform devices. */
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+
+		/* Mask out Fast Read if not requested at DT instantiation. */
+		if (np && !of_property_read_bool(np, "m25p,fast-read"))
+			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
+	}
+
 	/* (Fast) Read settings. */
 	params->hwcaps.mask |= SNOR_HWCAPS_READ;
 	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
 				  0, 0, SPINOR_OP_READ,
 				  SNOR_PROTO_1_1_1);
 
-	if (!(info->flags & SPI_NOR_NO_FR)) {
-		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
 					  0, 8, SPINOR_OP_READ_FAST,
 					  SNOR_PROTO_1_1_1);
-	}
 
 	if (info->flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
@@ -4876,24 +4884,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	nor->page_size = params.page_size;
 	mtd->writebufsize = nor->page_size;
 
-	if (np) {
-		/* If we were instantiated by DT, use it */
-		if (of_property_read_bool(np, "m25p,fast-read"))
-			params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
-		else
-			params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
-	} else {
-		/* If we weren't instantiated by DT, default to fast-read */
-		params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
-	}
-
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
 
-	/* Some devices cannot do fast-read, no matter what DT tells us */
-	if (info->flags & SPI_NOR_NO_FR)
-		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
-
 	if (nor->locking_ops) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
