Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B78DC3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DD62070B
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oDDh1Qkq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OlAp+5Dk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DD62070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zU8K0S6SWsoZzZC/7eB/0lT/ihiD3QlCZ0C5GtrrfQ8=; b=oDDh1QkqxDdBnM
	oYlreX6YaSxCGkd/WeX30aIusRKZ2iemIsSCCpwAN8jAuBa9Nbw2XoQo5U/iNhiBIwp7MTwHt+ey3
	vFUxkrbWozkrmMbq2pnSOP2OG0btSjcsmZ4DKBVL3q7ayQOy+7IZnG4++rHDMB3KoH/A62RC8BxKn
	+SQBjTbx4bBMk7Hipv0+hg+kaMbh+96SZHsbNuC3Y9qw6gsbt2YN04lYrd/lMTl/s1QEdN3uvMxfj
	wxZvt6aMGwh731WijBr3mRZENaYQk6iN0Sq0ZGa5p4j4nM9oLSr7k7V3v0j9m9nVOQVVIzFqwCRec
	nzPvq7bep0e0/JUO9iLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DfR-0005Go-9k; Mon, 26 Aug 2019 12:00:13 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DeE-0002gZ-K4
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 11:59:00 +0000
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
IronPort-SDR: cZrCAp1Vn3kOvI/J80LNDHCXUHou7WErY2MzR/ITLkwV3KhDfZ91AwAI7nm0SJT7VJ7/3L3cMb
 8u7J6hJ0x81gmgtqcmG+M/UmnjFRSaQm1QUQIN8t4KhiD7e7LUEYRgAQNj/fL1UFyIPQq+op0c
 Ni/Xs5XCAYRcl/5yQJJWsEr1UypxrCHGJkB6tm1L2SqdAElP9Jwsw4uNB2YZ40+5Dbm2ESQGhh
 3lX/3vARlx9LCmTOJrMwVw4xLKBJ7OJnkp5kY58cPXIjcqD7OQ6K9ipSdYTKxgxBX38ox5Nh8z
 RR0=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46518717"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 04:58:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 04:58:56 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 04:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQUSWv4oyBgV1lZiYt7pMyFxSKdK71Uo4ghiXYljldq+jEKx8LqKjx4QYlQsKbJJShLUQAXLRL8Zsx8hd0kWtg84ITCQtjzcT1SzQ5uD4ewuaP8wNC5LaqS5/r1pQ6ml9jcSXY9PJQkOcQZ2DeUiKvsVbMxtivHVkzsXZwxuKiTiIUv1n8GXGdVgmHmN1Rx8b16Vt8M6kRkXt9Spl1OF82Oaqs357KwSR6j+dFsFGg/SbMOZu9f100NrhqU2kwsBitTDDqgqx6nfCwbsm6xUJ4V1EcWucPW+NRAzGqthdwB/svdm84xM28QFvMRVE4Fy618GInLCRiClo8aeTtXvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpDlfTaWESJytOMjMrbaec6vmrndTL8P/WfJRbmZdk8=;
 b=kKEa+7AdjJ/j5AUu236yabexpZDV3CY6dmzXkNWTJ2d7va1z9hu5x2ezmHPpqQhSm2pkZzNWjt0LanCdBE5YwdNVC/ifbLmCS6ZI/ns1MnEDr4bu1PINr/W7ui9kjddQk/07psoVGvTpOfmsxXaPBsjV8xBMw3CMOTAqIjHP25r7fHMMpCzM/gmYsnPew71B5q/VXWyDQgjYJAAegfBOjZybbR4CvvLGmvEvWqBaqoSQYjK2c4o/6ogu1HxlgldR7zeuq3CtGd24g7bujF8Lmk0b7Xr6+s+s7m1SFpvYUv1w7TpbCBiRBHz9v1h/+Hndd2JCT9DyBi1pg4CYPzvegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpDlfTaWESJytOMjMrbaec6vmrndTL8P/WfJRbmZdk8=;
 b=OlAp+5Dkb/3qr+dVPy64GdmSAtiIG5r0/3qFulRvPZ25zYi8R+83uDPK15QhOnCFfAEiB+poEaIcZAjmUwatX4YRHQCC2wcQC4axGkteOJjTrFeJUokavWZAuXK0Iuj6999XvlMT5i2AH59jGpn2BhAe3NB6VKF+1IX4ywZQruk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4350.namprd11.prod.outlook.com (52.135.39.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 11:58:55 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 11:58:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/20] mtd: spi_nor: Move manufacturer quad_enable() in
 ->default_init()
Thread-Topic: [PATCH v3 07/20] mtd: spi_nor: Move manufacturer quad_enable()
 in ->default_init()
Thread-Index: AQHVXAWiKjvzaMNARUywvCP+Mc/bvg==
Date: Mon, 26 Aug 2019 11:58:55 +0000
Message-ID: <20190826115833.14913-8-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 90546502-cf69-4c1b-5ff6-08d72a1cc505
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4350; 
x-ms-traffictypediagnostic: MN2PR11MB4350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB4350D6A7210A11989C7A20EBF0A10@MN2PR11MB4350.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(376002)(366004)(39860400002)(189003)(199004)(386003)(66476007)(6506007)(66556008)(64756008)(81156014)(66446008)(66946007)(256004)(8676002)(81166006)(71200400001)(71190400001)(25786009)(6512007)(1076003)(6436002)(8936002)(107886003)(53936002)(36756003)(6486002)(5660300002)(4326008)(50226002)(486006)(86362001)(66066001)(2616005)(476003)(305945005)(3846002)(186003)(76176011)(52116002)(99286004)(6116002)(478600001)(2501003)(7736002)(446003)(11346002)(14454004)(2906002)(110136005)(2201001)(316002)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4350;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: INNmD+pN9+8QI2SUcFpByjiVK4AASwEwD+GlPuX31DknZK7lLwULzEMjuTF+uzajcg4HXX5Gwsq0Ssp4CTEwPo4sAJNxyvXLDr5kuIMlib7YfexBl2tf06WYs2nrWQiamqD8sCYIE6/WHRmMWV8nTGlJ5yklfc8dq7mUvZlM6e4e+Av5nNqddFgi9pYNG5bSaargDwV/WjWKXhOXaNEttTroY3/Ft0J9maqkyIidfhzLGHZnUf5wl365gNqhI/HoJ3XRzNJ5WSLhDH9gAt68n3qn1hf2BP/xLKQPtjxBrBTKYDPxZCVoq2TUfOirVDbOl20PyJddj6pLq4KEuthiXfahg5OKeDgzkjEotaop0MBaaOkHun4SSQ+KYoZaZ2Gent3vOCvpGVxzTb5oiJlCASPgDwOn9CL3mVIB8W9qtvU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90546502-cf69-4c1b-5ff6-08d72a1cc505
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 11:58:55.1437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLI0MZbMT/TarmNY59cJc2rgCZ7GnF7nkEo6Gtq7MtAemkBMNpRtmVnmoMLoXGscez9oSoTkPfBGreFEJ0t4bCKhLpVT1J1NyK3B3znulBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_045858_743967_F3E39870 
X-CRM114-Status: UNSURE (   9.82  )
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
