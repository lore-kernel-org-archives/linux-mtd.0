Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F98CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A591021734
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mRbq47qE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="N6ttz8EG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A591021734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CskKZGC4hHDkJCdUV9x1y1agySx7uLBJbp9SLO354K4=; b=mRbq47qENps/H+
	7PyjSo1dJS37xtU5yDjHh3akyDAobIMW8UHbBRiO8XsFSoWowWP+HJMzmU08VMKtEEnpaHlh4+l0+
	RXDQyo4w/gtInKQJKwYs8gnZjpTN8N+Ve/uHAtqOGPvHN6QJav6ZsdD16deBppNZpCGGnWwK2T0bP
	zvlT3Go95+6H/gxJJb0E3OogLC7nWxwZTETvx2dsj8yzBDEoaDlNWxaaQLghbVt8seBLULTNSgV3i
	wYqmMJUf7VlU2NAbs1NvlkfuP16p0KnoVfT/jqf99ArMh4iT3wRjjnMWUbmCzj6qI5ifgHnE502kC
	KB7o8Qf+ntZ3PijoRWQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPWJ-00047d-1k; Tue, 29 Oct 2019 11:18:39 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUm-0002a0-0f
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:06 +0000
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
IronPort-SDR: XrDFWWzYLZlMuIof6lM0OdWU/cW7/Dd6Qau76wZsDeNfJaxJsNlHVhtXwy1a0rbYRYucg0c5UV
 OJJM57GgTlK4/GragGmOwa0YFLiwpmwdyP+KvWft1M1gGV+glz8/lsmfgLLoU8cdzi/M55vyeJ
 Vg9ySqgEkB0YYt4sCpKG7xXuYTqHVPA0iqGza0BBoCC0bn2xUl74bBLWz7BJ+1CUt1hiQ0sVCu
 Nq4xlOd3LoNWeq086Gjrh2/Dqgpw7gncJyjvqvx+giN92vKtI+WwH9cArbKKcjYLkQ6DthjaPL
 0VY=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54794529"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:16:52 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 04:16:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr1Jzefz7GhsRC6c8hsWnQpDcy+sr8rjVVFj37XyIcyFVrqLE1bEY7FY/fCGa9vnPGtRCGxY3Ia/qVAD/pJGOBG+Z69xyNkEr2qCsr5+3biAai7n3Zo0byX5XR6BFhlWkK17h/PSDS1/2fiHyhfdj1/jFngCNH52/y9+ftfCudCri/D61niCdW3bG10r4ofqOtU58nbn8Iq2LM+SPdqijZ/HROLnOu0FayqoVAhL9OWKt7W/MRMWA39rFyXffOKg1IGd9yaTa6PsxgTJ7mo9Z2vZf64iPNInajIHU/MHmPHinXmMFmtRQRsY1FQTfudbYEEjPNuvAfa6sjMIl2ZfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HEY7yMvipP6mi5+nSS1L1201/WTyDTWAxgEiT6m0Fc=;
 b=MATBWZJqJ8DyMbpEntfaGYfF0rsBX+3BdXJSEGo8uFvi89mGnbpdDQPstpZuN7Dy1krMukIbZaB6oMlTo24ZHCLmj8mSaqF8A62qXH1RQHGLD89PXzXIjK9FL4YXAS7ag8AcTOwDw1R+YcUGG7NwPjxG1MJGqWb337k8VwnUOeiCrvv18ElF/kcD121veUetGOdPyrRq3N5oyaeUga89LASr3FvavNW7DSVFyzvmvBhreoAfFyb4pJJEn1+Ys9QZbJPM4VMn9O6jaUUIxBCovTD1/q5PEAmtRdQKRDuH5bpk8BsyY9zAVdZHyRYkxQa51wa/DJQCRnYUknTNftgKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HEY7yMvipP6mi5+nSS1L1201/WTyDTWAxgEiT6m0Fc=;
 b=N6ttz8EGpQgulSRDfNghTh17x6uRId3rQpJ3HN0+442leWGWXOJkkJiRhm4vDCFdaEq3W5v+Z+MgpP/zCVtFmYTf/yS58Z4TnEM7s8Ke3RiDHOuEAzA2Ju7DZaniXNF9p6uoDSy/+F3Mh5Ib8a3NRK+EoXbTrTlQ1YCxjN9nqy4=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3712.namprd11.prod.outlook.com (20.178.253.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:16:51 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:16:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 02/32] mtd: spi-nor: Drop duplicated new line
Thread-Topic: [PATCH v3 02/32] mtd: spi-nor: Drop duplicated new line
Thread-Index: AQHVjkpcVF6t47BCbkObuhpxXRw/NQ==
Date: Tue, 29 Oct 2019 11:16:50 +0000
Message-ID: <20191029111615.3706-3-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 4c3d5fb9-f139-4f1e-c7a2-08d75c617ee9
x-ms-traffictypediagnostic: MN2PR11MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB37126D968FBC6E22CDD8AC2EF0610@MN2PR11MB3712.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(107886003)(6512007)(316002)(110136005)(4326008)(2201001)(305945005)(6436002)(54906003)(7736002)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(6486002)(5660300002)(36756003)(86362001)(11346002)(446003)(8936002)(81156014)(81166006)(50226002)(2616005)(186003)(476003)(256004)(478600001)(8676002)(25786009)(14454004)(486006)(66066001)(2501003)(4744005)(26005)(99286004)(386003)(76176011)(52116002)(1076003)(102836004)(14444005)(71200400001)(71190400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3712;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p0v+By1ALJlnhk02UbTeRYZ2j7w07VT5w9jOexdYD6c55Eh1zKzpV2vrz9tUb7Fw1G+MNqdyzp6SW3M4ujGtTJQ9VnETVJq2OBCDCeVchuQgVHSRJVpwBtfy9Qo9XuXthRY/sJYACyoG5jLz/hRitQ4P8+646cOCwqgS4Va4/oHln7+TSXKTT016so8KqcXA06fUNGdQoaDVtk1vSdJ8d1tD5HBR1Rdg6AcaVQpYqGxklYc2idNZzE8knJ22ZpzMQ44w4jdLQwa3q60DEdq20i+QQ+4XQ2AXnrYNN5sfiIdeGV3zjHNpIBmYODdoQrCcQexRCbu/41Z6nPKS4Wv5oCG+G0dX6hMZ72Hq4sAsTFC14kyC/IkPMAkI61Jj4fUXOkmjiEBMkbMYWLyQELlV2oFRLVXWx/Pbik+UPRFyUfsgaZ5IoIvYjhEWCrHQjwBb
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3d5fb9-f139-4f1e-c7a2-08d75c617ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:16:50.9936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J38RvRqrWTmS1TPNLUWDHV6+/aS+IMrGMKjcaF3DdC9jw0CY5Jt0MHWkN7QJ0ZGEu4nFoz/B/o+x6ljp3kra64XSDvIQC6PpkV8H0sxDIVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041704_338755_FBBD771E 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Two new lines, one after another, drop one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index aca8245fb6c4..6e82df577eed 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -541,7 +541,6 @@ static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 	return mtd->priv;
 }
 
-
 static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2], size_t size)
 {
 	size_t i;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
