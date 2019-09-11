Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A030C5ACAE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 09:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C5EC2067B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 09:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObzCfRZE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="BcBXwRNf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C5EC2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB/acbAfrSN+V0OASKad8kICNrTKa4IpDdtL0j/GZ4M=; b=ObzCfRZEqytG3C
	GNkE1mB8XwkzsbPan/gq6ZPMx5+L1nwMyQ4IqPSPTN8QNbSoAO+nu0CHWDrF5YPe8uuO2XXqXORVu
	+3igS/NKHIovQgJDDd/urn1S3AlrtP8puiz5wZrIp6+TvOQ+d02xxmWjT7lC2vuzZtJ/04oo8k9Eg
	uuc5wK4wO4eoDwD00T+wvMThKI+l5cS7eHkZ3AHE0dfgWajbP0jXADYqj0V+a8IaLZ42sTL5XW1if
	smQdJUXOx7lSb3CVLn7KxT1zRDHEjKmgoQYtDq0LQ1WKFaQX+BMWzXEJld7x85YbqL6x/Bw+7V+4e
	b4LK+fBFrjEzO33/1sPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7zAe-0004CB-27; Wed, 11 Sep 2019 09:44:16 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7z7g-0001h0-Ur; Wed, 11 Sep 2019 09:41:14 +0000
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
IronPort-SDR: 1/HjiawIzaowFkmwR2Lv4hciI+FzIcdUYFW/xSpPlGpbpD+aA58nTwt3nBQsGIrD5ta7BPgq6P
 5sNJrZwEd9A7ByD0wfdXuv36MUsP7n7yurjA6Y3bo2BcbbaguzVGLbnF5PSjcGbup28a4mQcEX
 jgsks8fd5vpCdVUUTaUwNDemFl9fDVWWZel7hg3ivHWneKDJ5ranKtElxrgoXXO16Fe3mM+ZR7
 bZSwHzQ0xhndCyqreziKdQrnE4GQoyAMs0MiUX+Eaaou/keGADyhIKKuBtop8RUreKIrcTGYwo
 00k=
X-IronPort-AV: E=Sophos;i="5.64,493,1559545200"; d="scan'208";a="47528388"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Sep 2019 02:40:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 02:40:47 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 02:40:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIP1FyEGld9er6XboQrBzmoPDnBNMFloeMTYboIQBytGSdiXzURnoLRsqCZyAAAdAYUQ/IoIezabMdk00v7ePSJi4cFaie9QQvJp5Z5qwalsrKzaQf0EOHBsZ5g6nyeaxUkcBG2FJhVHNyZyISTvyYMUzIk0mT0HDsfNmuCfsH69cBgVtscM/frd2trJr+ohVFMwHg6GpE6MHeTmM2+V0/3BfwA59g78jo+OgcfqUiZZ4ZRVeTl5LFz2bAx5Lm67XJwAdI/B/Ho5UnjimSDSLVYW0zb40Z9Ciad7r76TNddp2jyannvim3Ppkkikz4/aQ535yOZDZTTHd/bB6PZdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX7QLQOz/p1Yx0WDeQlhyU6NDR1qB0ng5ZogcAsBO6w=;
 b=MBxLd6zR97M5dsVdNsfidGnb+BPX1BAkKWFzgSoShoDa7gDKJloZ/28zdOomflXIOZLIxiANU/Qjr1AN2f6RX/886eUv73Kyr6uc7u4onXF3ySH92ADJ4wg7fzwFml5np20t8pymfFMPC7KAn7hd9H4G8STM7IEdafu/pWJhfpivr5KDBUIAckahrmCdNA20ZtTTEftLK1oCxyZv7qfOots1L7k/BX1qlz03Ri3JTl1WTThhx06BTMq3jKQKItdorytOwFYO1kmw4akRPR/Ri3jUekROrW4sIrdlTXi/UNeAc71MESRD1qaasjCW6zdD6Rt28kkZ9v/lZZCy0U02KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX7QLQOz/p1Yx0WDeQlhyU6NDR1qB0ng5ZogcAsBO6w=;
 b=BcBXwRNfZXl6EfkX1J0dlwKDmF9FNf2jWubhXzSQ9bGcs1yBDH1x1jRWRU2rWse0PoiMyR02jjP/kuWX2jA09PMsRaZSB4wfyuRrshRnFZYvBWeSe6Hd8yuxPbZwT+dJ7mYYTeLI/8JONpdDIsLmoWl/nqLnR+UrEFKEV+GmlZA=
Received: from BY5PR11MB4435.namprd11.prod.outlook.com (10.255.89.94) by
 BY5PR11MB4401.namprd11.prod.outlook.com (52.132.253.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 11 Sep 2019 09:40:46 +0000
Received: from BY5PR11MB4435.namprd11.prod.outlook.com
 ([fe80::4049:4ab3:1825:469b]) by BY5PR11MB4435.namprd11.prod.outlook.com
 ([fe80::4049:4ab3:1825:469b%3]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 09:40:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <matthias.bgg@gmail.com>, <vz@mleia.com>, <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 01/13] mtd: spi-nor: hisi-sfc: Drop nor->erase NULL asignment.
Thread-Topic: [PATCH 01/13] mtd: spi-nor: hisi-sfc: Drop nor->erase NULL
 asignment.
Thread-Index: AQHVaIT8+nLMefQYmEixeJ5LHyHcQg==
Date: Wed, 11 Sep 2019 09:40:46 +0000
Message-ID: <20190911094031.17615-2-tudor.ambarus@microchip.com>
References: <20190911094031.17615-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190911094031.17615-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To BY5PR11MB4435.namprd11.prod.outlook.com
 (2603:10b6:a03:1ce::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc88014d-1eea-4239-6c19-08d7369c1ee5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4401; 
x-ms-traffictypediagnostic: BY5PR11MB4401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4401809723FD74591EC970A9F0B10@BY5PR11MB4401.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(1076003)(53936002)(6512007)(102836004)(478600001)(14444005)(256004)(36756003)(26005)(25786009)(4326008)(4744005)(5660300002)(186003)(2616005)(476003)(11346002)(446003)(486006)(107886003)(2201001)(305945005)(3846002)(66066001)(71190400001)(14454004)(50226002)(76176011)(110136005)(66946007)(71200400001)(7736002)(66446008)(64756008)(316002)(66556008)(66476007)(99286004)(8676002)(52116002)(8936002)(6116002)(81166006)(7416002)(2501003)(6436002)(386003)(81156014)(6486002)(6506007)(2906002)(86362001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4401;
 H:BY5PR11MB4435.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ni8AfGHXbsDljMa01MJ2N62mN7hUFP+84N5eWb5r3kEp1H5W8hGkbWGMAqK0e+svVa6bgabe4dZL9bk1FG15L7EBs0ZLf6zVIkGb3B59aS1/Zb+KZJYORqpN00OUfhJwm7vseXe/k0BuBhtnMmQJIYg+rqOJV0y9QlKCnkF85c+flqiUGllfz7utGskcLCxn5zmsgSFLOMsrCSIyssEc5yJYkQ/v6igVlRpvoKRthlG59zCqrh+amCk1k56ecdgyRRDqh9ekRTfK8gd4ns8tybvlbcXhcC09WpXFuFEVNpGNtw5O/b+3T/6WTn6+Tv2C8106RJ/wWLNioeZou0sNylPiOn6xmnByAaUTfOJpyslEwUY5nl23gP4ervX2XpG/43OEbtyFG4Ic5NQo43yXwPe7Dk25QFuFzXRtS53g+3g=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc88014d-1eea-4239-6c19-08d7369c1ee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 09:40:46.1831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUCnHgXX2NuxgBwERMA8wn1/Y4lEIJzekd+YV4//tB51xUsvMK5cen1WlvrNF6FoPj537JkVosHqiBeZhS9jkeAAcrC3/EhtPAWeGu86jJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_024113_141399_FD740EA3 
X-CRM114-Status: UNSURE (   7.31  )
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

The pointer to 'struct spi_nor' is kzalloc'ed above in the code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/hisi-sfc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 6dac9dd8bf42..c99ed9cdbf9c 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -364,7 +364,6 @@ static int hisi_spi_nor_register(struct device_node *np,
 	nor->write_reg = hisi_spi_nor_write_reg;
 	nor->read = hisi_spi_nor_read;
 	nor->write = hisi_spi_nor_write;
-	nor->erase = NULL;
 	ret = spi_nor_scan(nor, NULL, &hwcaps);
 	if (ret)
 		return ret;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
