Return-Path: <SRS0=X2Oj=XT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD0FC432C2
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2019 07:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D42920673
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2019 07:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ornj+OGz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="roBPlY4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D42920673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB/acbAfrSN+V0OASKad8kICNrTKa4IpDdtL0j/GZ4M=; b=Ornj+OGz7D5iEp
	c9ePX7LEqYZ4hHQ44LL/SWkK0G1V5hKUHS8M/BP3bowcFLbvgiphqtpWEOA/3dEAPJws49TrOm+L6
	1f6sSCQPV3zC8qgy8xEktJoUNSlEwrsMY5orCrEf6zwjVdNcC+v0yGQcd6vvW7gVSpPFCZ5+JVEhx
	azsmLbbLDx/T2ltyGCtsHurR+mIuoOD6neuQmFiy6R1DsIhqO7d/K+Fx1x0P14r0EtaUPyJTPOVQF
	kH66d6HRrmVwFa34jGiHE2FCWMIDwGByqzZXX6/2TNXHkGlpVqQSKNYhDKBhPmENhSrK/H11PTYYI
	2TUqdI9q9WfycCpM3IAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCfYL-0005Ls-C7; Tue, 24 Sep 2019 07:48:05 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfWJ-0003mB-8n; Tue, 24 Sep 2019 07:46:04 +0000
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
IronPort-SDR: /xOFlMX1/v3DgyJAgzQJPGeJ0NsfBQC2oZ9Q+7YxSbOK+GfX8ND6PEq4bs30U02NAR6yQoVrY0
 K0exKHBBHrLfdLFy03im069FBHRuMOu5udlETrR+Yy/gD/NFCGdWEgS98VGajY4HxVQAq1TUEu
 eflnIOcAGDWl21078R2bns9kPAg87yOdu6OkcuGLmJSRaIww7XbeP6r7k50NAaFIlGEm8aMCrD
 Whf6lctUl5Q+Frr1GFeiDfbivqQHjLcHYJV0rnsLB7+XNnYpbEsVGbvGfCUw2gisEqO1mdRMuf
 mbw=
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="47374674"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Sep 2019 00:45:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Sep 2019 00:45:54 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 24 Sep 2019 00:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7YfLJusmfyIO6nKIGLriugBMRV/3aIUFIti+5U1xy58Cxv7RYTy8zTHFTa08vTyBsWeDFRZvw7cCSVjM0BhVhYIOV5QFLvYLwOcMm84o0AC3fIWYkw0ZoUwS2hrbFlEGCkbVTfal1J6Drfsai/nPWwhYnKmoSvACYKhlsBX1kJtv8crlJZwjGlbx4izRxQTTfHxd9aQxvZgeXi5CKo64zXq1UtEAOt71pqvhCwRxMiwNBVgaTHRS9U3gna6oOYSnBn08kGEjitoah3JM8H9EIK9cGFbUO2p2unMb8fPVkk5FwnClC3zdxlwyXGF0Or7Kb/KGQ0j2nulN+orBp3p9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX7QLQOz/p1Yx0WDeQlhyU6NDR1qB0ng5ZogcAsBO6w=;
 b=DlARDsgPLHOxR/zU3aRXguCI8In+8/bP1b+NMeU+tuHJmqK0dWfbTFroYpLR8SU5Y/wRMumAsSKN9GS+jWogkV05lANL1SsCFA32RCehJQt+nnYO4MjJZdodKqr1HRUwzbs3uRtDCv9NNPqeXkoZgdnRHfNWGA6oEbru0EwTOmBJI72anRhSFjqRUKMQQQW/68coXc6AMiOFDEbRyhaswkuiajdCuUj5xotwS8piD/pZKcithrLnKWhejKRB/JJ0UC0vE4N6+qw/1C98Y8FHuBLKGiEuKWOI8sIERTfGw0Nj8x8peoeQUeZyv4ury6OPdYTzeX61/IpLLGRNhoEpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX7QLQOz/p1Yx0WDeQlhyU6NDR1qB0ng5ZogcAsBO6w=;
 b=roBPlY4ShbES+a/Dr1jnWxACwFJsf0yId8ULJbrOrjVK6oSut/VUc7P6GrsZf1DNfA16X79wjSijerAVxWYrpJdXF1IcegEhTe4rthAI2NQ25cIgz2D0rV8kzjR3P5Nb6pSUKkp4vvAATUxqZkWYEU/LG8vO9NG7nfvb87VQTYg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4319.namprd11.prod.outlook.com (52.135.39.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 07:45:50 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:45:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>,
 <geert+renesas@glider.be>, <jonas@norrbonn.se>
Subject: [PATCH v2 01/22] mtd: spi-nor: hisi-sfc: Drop nor->erase NULL
 assignment
Thread-Topic: [PATCH v2 01/22] mtd: spi-nor: hisi-sfc: Drop nor->erase NULL
 assignment
Thread-Index: AQHVcqwVF5z/4vjY/Uups9rQY4HRbQ==
Date: Tue, 24 Sep 2019 07:45:50 +0000
Message-ID: <20190924074533.6618-2-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190924074533.6618-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::50) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1956a2e-7319-4dca-7862-08d740c337f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4319; 
x-ms-traffictypediagnostic: MN2PR11MB4319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB431965A99AF9AD3F03CD1324F0840@MN2PR11MB4319.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(14444005)(5660300002)(2201001)(6436002)(256004)(86362001)(11346002)(14454004)(476003)(2501003)(305945005)(186003)(2616005)(26005)(386003)(102836004)(6506007)(25786009)(6486002)(8936002)(81156014)(2906002)(3846002)(81166006)(107886003)(7736002)(8676002)(6512007)(486006)(36756003)(52116002)(71200400001)(71190400001)(50226002)(446003)(66446008)(76176011)(99286004)(66946007)(4326008)(66476007)(64756008)(66556008)(6116002)(54906003)(110136005)(66066001)(316002)(1076003)(4744005)(7416002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4319;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7dOVYYXbkrpZ+fHhcHHaTWbnTMJ87zrknlSxv7RTAtOCuDcixfpEKdcoKssqPZ95VWcxKyYHZRGc0ZKo6c5WL0ejIQ6tgHvKOwIJlz275JGdMuphSfBljHbw9I9Fs80ZU60tqSd8vyVJNZhg1ff6vmahW+ZsNjzhD6IZmwHdqh+LCcKLJzzthNXFGAq4yD02AUqW1T6pH1pPSA/Hi9f3fHecw2lLGyS2VCVFns8ZGQvXRQeay1WjxzNxR91+ZYeM/AL9LHnZQp0qvTJkOX6rPnGTkpMaHvEAWAkkzSeDk8BzZyIxIMe4FrWj5KP6amERPLyupUdZcCRDgQ8gds42X1Phf/p+81kbLwmoxQUezzx6ja+w2l60LzGCLIcq5HGLO/raXMQHPxooWEQg6GB4cBFSTiUdz2vRmok3glENJrU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f1956a2e-7319-4dca-7862-08d740c337f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:45:50.0843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVBzWiMz1WQk9Idl2mck2R9oKQyA267YSRp0DfgzoqensHokjUmuC2+5LyVk0uq2sqcgdN85bwCrhyPrMwO5KFVHFJgsAWwk98bUvBMRtEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_004559_414205_6B43076B 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: linux-aspeed@lists.ozlabs.org, Tudor.Ambarus@microchip.com, andrew@aj.id.au,
 richard@nod.at, linux-kernel@vger.kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, joel@jms.id.au, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
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
