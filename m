Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C67C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:00:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578652070B
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XnxLimZw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Ax7PbIKM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 578652070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=347UlcewL/9g36A029q+972lKV6h8dsxSGSvqDP8iZ0=; b=XnxLimZwmEcviB
	PcVr+odvXSP3g1+ketBFLaeHdn9Y6zNknb/AFf25yd0pBtobOuHlwogUP7BEdDU2YSHGUZoMvLg06
	8grCV+9GYyUXxoni6PPRQw6YJTv9BbCgYGcxoJX5txFiBWZgRrX4cyeQuQ8fIzMltT43vAxdvn6U4
	twciU8g0IwbgX5CvogpIBnLsae2W5aAMY9qY+f55ZYPTlC9BHQ0b7vNra8I4r5SPqToQlV4tluUog
	7flrP/SjFUoaS+ONb4Cwp50bHvwGVXL6Ehatpp3MYiQBBI4yBFYOwTXtRRPIR5lz4tlcsoNePnZHB
	75a1ad/8bk37P9eFLXew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DfB-0003qr-AU; Mon, 26 Aug 2019 11:59:57 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DeC-0002bT-2d
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 11:58:57 +0000
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
IronPort-SDR: ui8CHeqcwF7FaPpq8Qm8FSpjXSXP4qRaKztIT5p2FGvBt3EHEcnP3VjAYVP8BsFxk/dykXbDGD
 UkWbvlfcs7BhF4I6NmKrITv18iuYJMBbOr6EjI530KGF9TOlaxrSVCkiMx3bjRzsrhntnTOouP
 dCxmWis/bcvMqc4DwmvZbp0PNWSxRgi24lri+DtydolhgO1GuY995gaEAImdSYYdaqkO3TVTOE
 Y3ivLfQXvjLSazpgI3MCIq77OO3XiE2RZqLkTrGxucDuXhKJLoAyao9QZ6nebynT6ByEml90A/
 qWE=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46586537"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 04:58:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 04:58:52 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 04:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkGHdGMHugpPc1eH4yhZUvt3scUqGH6ndfczDOqv/kzc4bBnpCF+08e9tY5GFz7/0fvCVq+I9c+JOkGOPzuJgH2RTDuGMml9eMCCS09TPGhtuooS9Si5kgJcHmnNBi5MfQKBwlbojkabBbXgmUsWuozVo8kutrmbKVNaVk+ZYb48y1Qmv51+01kS0jy2FO9vefGAl1VNdjaJ7wlZFv+aAMHXKp75aB7VrLKuh0TTMYq2Tdjr0RAulkGL/KAN/IFufG7ZE2Gm8XggMq03lTbTq7l8884W07uka9aVqCj6r96oDz2DRZnf015eLLdL6oNP8Sg6SHNVDiyH9k+09VG8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwKSHrY1sL5NFIU0YsLoNrhAdYjjSkmwTlWfEaXcz98=;
 b=WTR8iYFb9YUDJKuSemzz9Zb8bo0hvfhmpEILfpMQ9eyWnXxbjdylpPJKJ8qQ004CHxEYCISeeONWawNlwqr7I2MPOXk/cR3xoKBTu/rFQhn9DieHvhiJaHCyB4K3N1rwJXbv2MU10iGHZwyP1uQYrcSDDgBFFr0VeQdaFWTOh6CpsaHQxXfYdY2z6tbXol7uk8yKeOkPac37GlxyornyffzAy0LzhproX9/9/E2lmch311GCt5eV20Ef8FQNzajZM1inokbFH5z4/xI/bUw7PYrASydLAmWiOah2hv7Qe7EPMtsgPu9XtG+7jD5+XqDR1OoLttUyH4QcgkHBEstbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwKSHrY1sL5NFIU0YsLoNrhAdYjjSkmwTlWfEaXcz98=;
 b=Ax7PbIKMzifyJOyW6OaovV1PAFkcYni5JHTF9V7zGVLMafKl92GNZMidYkGIuDXQrXdqedgeezrgOayKNxY9AvjJ7DXpwwu4szVAUJ7mc4jMHxvbwxjwQu1nGkN3JwFF5Z9bzTO28LFW6l6VQYar1+bHi145OBVeZbTYhQTYueU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4350.namprd11.prod.outlook.com (52.135.39.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 11:58:51 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 11:58:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/20] mtd: spi-nor: Add default_init() hook to tweak flash
 parameters
Thread-Topic: [PATCH v3 05/20] mtd: spi-nor: Add default_init() hook to tweak
 flash parameters
Thread-Index: AQHVXAWgiVceGs+Wz0iN35bOjE2aMQ==
Date: Mon, 26 Aug 2019 11:58:51 +0000
Message-ID: <20190826115833.14913-6-tudor.ambarus@microchip.com>
References: <20190826115833.14913-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826115833.14913-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0095.eurprd09.prod.outlook.com
 (2603:10a6:803:78::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcc58d37-5f91-4bc3-e6d3-08d72a1cc2a4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4350; 
x-ms-traffictypediagnostic: MN2PR11MB4350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB43504F236285FF8BA587C52EF0A10@MN2PR11MB4350.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(376002)(366004)(39860400002)(189003)(199004)(386003)(66476007)(6506007)(66556008)(64756008)(81156014)(66446008)(66946007)(256004)(8676002)(81166006)(71200400001)(71190400001)(25786009)(6512007)(1076003)(6436002)(8936002)(107886003)(53936002)(36756003)(6486002)(5660300002)(4326008)(50226002)(486006)(86362001)(66066001)(2616005)(476003)(305945005)(3846002)(186003)(76176011)(52116002)(99286004)(6116002)(478600001)(2501003)(7736002)(446003)(11346002)(14454004)(2906002)(110136005)(2201001)(316002)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4350;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w06gz9kun33S+aoENW7xL00///4CYSstaRqr5ST/th+ueHn5Drm2Qzuz+6neG4W3D6Yj2+yFF2toXkAOP2UH2qtYiV0n6cdVmhURfEqhIM5f4PipLul9a36M0qYIMzP3v0NWol5IBExw4BeWmKnV0fh3lEvM+XX5Vl4vbuCPEaSxMNFASg3XIkAXtR4W8kYDTTREsy3zmAXPfn0QSG85vo+6VLNqcAxyhPIwwXBCPsMiMrZxh5Zpya09tia3sAdRaHDmiHkTaJ5P7E2LWj1W0cOcyumlWXc4yX+294M+dM5vPgjSSoa//BuhqWwehUpymXDojh723uk6ozcrI/GDqGX1/hUwwzk8+oQ4bY1lvwy53pAUU5aRI4vdrhTCSaXaKMMwxjULuItiJFNmoT85w7f093oU9nI2gtOGVsAW+zw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc58d37-5f91-4bc3-e6d3-08d72a1cc2a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 11:58:51.1520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFpXX4NewtXLq051D64jdH8F58pUGfsVQNZMjqYjw55fYBCykJQ/rLcUZvxsOctujl816RxvdncEMfSw+uLBcRoWg8iQ51/A79rcco7ZZsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_045856_338476_5B530361 
X-CRM114-Status: GOOD (  11.97  )
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

As of now, the flash parameters initialization logic is as following:

a/ default flash parameters init in spi_nor_init_params()
b/ manufacturer specific flash parameters updates, split across entire
   spi-nor core code
c/ flash parameters updates based on SFDP tables
d/ post BFPT flash parameter updates

In the quest of removing the manufacturer specific code from the spi-nor
core, we want to impose a timeline/priority on how the flash parameters
are updated. The following sequence of calls is pursued:

1/ spi-nor core parameters init based on 'flash_info' struct:
	spi_nor_info_init_params()

which can be overwritten by:
2/ MFR-based manufacturer flash parameters init:
	nor->manufacturer->fixups->default_init()

which can be overwritten by:
3/ specific flash_info tweeks done when decisions can not be done just on
   MFR:
	nor->info->fixups->default_init()

which can be overwritten by:
4/ SFDP tables flash parameters init - SFDP knows better:
	spi_nor_sfdp_init_params()

which can be overwritten by:
5/ post SFDP tables flash parameters updates - in case manufacturers get
   the serial flash tables wrong or incomplete.
	nor->info->fixups->post_sfdp()
   The later can be extended to nor->manufacturer->fixups->post_sfdp() if
   needed.

This patch opens doors for steps 2/ and 3/.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
v3: reword description

 drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9dd6cd8cd13c..8fd60e1eebd2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -154,12 +154,16 @@ struct sfdp_bfpt {
 
 /**
  * struct spi_nor_fixups - SPI NOR fixup hooks
+ * @default_init: called after default flash parameters init. Used to tweak
+ *                flash parameters when information provided by the flash_info
+ *                table is incomplete or wrong.
  * @post_bfpt: called after the BFPT table has been parsed
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
  */
 struct spi_nor_fixups {
+	void (*default_init)(struct spi_nor *nor);
 	int (*post_bfpt)(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt,
@@ -4133,6 +4137,17 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
+/**
+ * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
+ * settings based on ->default_init() hook.
+ * @nor:	pointer to a 'struct spi-nor'.
+ */
+static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
+{
+	if (nor->info->fixups && nor->info->fixups->default_init)
+		nor->info->fixups->default_init(nor);
+}
+
 static int spi_nor_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = &nor->params;
@@ -4233,6 +4248,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 			params->quad_enable = info->quad_enable;
 	}
 
+	spi_nor_manufacturer_init_params(nor);
+
 	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
 	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
 		struct spi_nor_flash_parameter sfdp_params;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
