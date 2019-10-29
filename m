Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8188DCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 08:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5349F20830
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 08:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmouXfWL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="SS4SxbKM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5349F20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JmY2D/jgF8fS/6f63Fw0PQG2NIAE4T2FNoyzxM+88nk=; b=YmouXfWL+CcMbw
	irYYox4sGHmEnDO8yNe4ebfXh73tAa1XEgsp6gDcWO8FN5WJbgGO1rVnZ7oWIxjfFKwwbAg6DAlgx
	pL8un2UeCyTICUfQhJQdhNnPYIVP1naDv6NWbgAqSaqMq0G/CsyJsffIvvZOFgFaUL7hcBxFI4c0/
	Z8Cv/RCiav3vBXJ+0/aDZEESWX+ZdkK7/qO/xxXtCvJ0U0YhgbF2oaxymxT/QdMU4s6Sx3s+BAcxA
	q+70FeAk8arvM1G3TolRNMgj+YiO49i4roYYp+YhPRfynqPIHaPwDUtOoPBm26dG3Wwbwa0qI2czi
	pFpcEhiiQgYdISZregzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPNL4-000124-Fv; Tue, 29 Oct 2019 08:58:54 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNL1-00010j-7o
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 08:58:52 +0000
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
IronPort-SDR: 81ce+5Q9txxaLOri13C3yRZZxtxve1f8A9TMVmhDJzAbF0ipsHLv1BcdcLWskHzsU+f0f5G2rR
 YU+5d3ZRsb+tY87XK0FnAxlH5lwmoFCXfFwnomRxOeeivVMEklAYHIvEYK8537KZnx4iUg2MbR
 xNLYbk/d5D//8LXg6ltovZsR7VuuR4EfoQfHVPW6osieEd8wQmTWmkLDGL/nBEbU6Kzgifp1Tx
 dAS7WNOr/4Z1LRynMFcK6VPX/KqUAy3GTWu0mHHfaB/oD5nzzo7Hd4sMH+o+0uqhYGtVzyfM2w
 J9g=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54406863"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 01:58:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 01:58:42 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 01:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUO1k4VWO45kYYdnSEP8TOTahCu9mryyV1wfUOsLeFKD64WcPAOmgjyF4P/f1dXwxQEF6XXRaIhiaSUxLoWVpQxflSpPoPLbQpdzTkWVtZR1BT3hbgePs/xVRKWqyKYDoIg4dJdxv0izqllyB+JWCxhURH/y3+kyARzu+CtECYt5Opv7WXP+FKUm6aP7NKsK1VcZqsKWb/aSxzR4zDfD1IETcI0PBRnFPH0KgeSQ9JB2YqNVprT+o8gLkjvUhwu++gTGWZowDE5ZoMRnwS7MsdYCd75l3JeLhReAuduGro30PwT3IVe8LRFbSDxVv2XEfGihCDuoTQQkSrWkwd2DXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5EQC0kotvCLQ59dyPsf+30HSjQIG+4qUQ+oiAoBVPM=;
 b=HaTKGutUVB6BdZaUy6S00Sc+hofOpNEzCx2ifNbJQsbtQJksImgcelWi9Mqdpk5vR5Q7qki0SDi2FSAKM3thIHsGaisFHVGp2n1s+SJ+X0QkUnebzPxLNtdA8ccTwQXJC5r5Mn5mSBCktJpJcIFs1T5WP5DS+bbgNLrBGOnLzA34Be8UstzZCvAYcAN62IPJXDDNNQoHQHLCngRKe1dAzytvENU93to+d96Bblthtk0JWsLpnYz+Gq8H2ue6Zi9twu4sb8+ZnKjJA+xF4H1enopo1WVuoTWKM0iv7Ebasu5W6kG7I2TePVSn4TZJMXsvyywqctHE2aIOHKDxOAumFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5EQC0kotvCLQ59dyPsf+30HSjQIG+4qUQ+oiAoBVPM=;
 b=SS4SxbKMZgS3fPb23aQ0h69IGdA9/DB/8kz78eT2GBn7eRCtm2tqKh2BJue9WDR5v/P3CUboWOZADPZh03QLmoQEx55+2F1tusxzXj6x6KdNwbhdfqNDHn8dlOc5Hj5NRz0f4G4UGOt0w5BNrUZjRSWfza1sVdAOr9zN7ukqOXY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3647.namprd11.prod.outlook.com (20.178.251.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 08:58:40 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 08:58:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: spi-nor: Enable Quad I/O and locking for w25q128
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Enable Quad I/O and locking for w25q128
Thread-Index: AQHVjjcOKrRqUy7rqkimJ/R/5NWxtQ==
Date: Tue, 29 Oct 2019 08:58:39 +0000
Message-ID: <20191029085816.22892-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f8f54e2-2123-42c3-64ec-08d75c4e30fc
x-ms-traffictypediagnostic: MN2PR11MB3647:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB36470F0219AB22E216DCB6E5F0610@MN2PR11MB3647.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(1076003)(110136005)(186003)(6506007)(99286004)(386003)(66066001)(102836004)(52116002)(5660300002)(26005)(86362001)(107886003)(8936002)(4326008)(14454004)(81156014)(81166006)(478600001)(50226002)(25786009)(66476007)(66556008)(66446008)(64756008)(66946007)(36756003)(8676002)(305945005)(7736002)(2906002)(486006)(6486002)(71190400001)(71200400001)(476003)(2616005)(6512007)(3846002)(2501003)(6116002)(6436002)(14444005)(256004)(316002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3647;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BeiS4oA9OvCHZmv9jCKb6OW0whdrVnQpJSc/FbrK8PypvgokvBrgrJVatN+wwxxi1NsYmSZcyB4Mq47P7bfLvEVeyx52cbhulhAAcVOVwjP8IjfgYW4jCJl/8JiC5xmpQE/yUZ9OuRn1ZihxfUoyXwtBsOznv4JpviSH/Kj6iSI36ejqkd3tePD/FAIjeCEXzSU4KNCvrmA0PSvHZyOaWMzVAAjHdbdQcyWM2QxNkd7iHDZHJGWGV1Dp4B1noQrsz6oLf6HEt/0BqI+tM+/AJDVuLycZH35lJ1/R+dFDoOIw6wbsFNr2gLYqU/xqFIBHlZRZpojftf85bPQsvpgTbYLK6xO40R/L1upjzcGruo2jtY9sELVceJGlcpeEQvUfIMFzOBUGUNaEjwKb8cBjFhjGmum6fAM3nnWwLcxMNCjUKB6wDWZOjYwX9Zs4sE3
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8f54e2-2123-42c3-64ec-08d75c4e30fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 08:58:39.9084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysAihN4NnzU5kY5rlLqhW9vywrqgjyff0r65UY0LjbTKb8LN6VJaiYGsYEub2IETfpnr4Zt0v8AHj+pDB36ccfIrqffJiWOgm3UBH+ST5YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_015851_310080_8A346985 
X-CRM114-Status: UNSURE (   8.77  )
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

w25q128 supports dual and quad I/O and locking via the BP bits
of the Status Register.

Tested with atmel-quadspi controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f6a58427cc26..c52ff1b8a1cf 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2634,7 +2634,9 @@ static const struct flash_info spi_nor_ids[] = {
 	},
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
+	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256,
+			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
