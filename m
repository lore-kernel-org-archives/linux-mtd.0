Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EF8CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C23EC20679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qw4Ivub1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KSNf8RYE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C23EC20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAm2z8Tftvq8hNVsxdGqzlRhazFytpWhzyEyjARdnnU=; b=qw4Ivub1tQIJ3U
	HhqEL2MUrH/nVkvOkenao9eBED3DR2taqH27RmPH5dnZM+z84AFdnZsSetpftXy0GrkE6Lwp/WJ//
	FcEWfO33zJYZMsOyD3QAZUh9fBn64ww2pDBArOg+w4TfJjyqcI1arqax27E2sDi3KHPCcUlsAkjGp
	mDhT+ACZmvRR1oqkHHuknRUyQ5hP1OIS3OFlOSKlP3Zd04LkCdDDBIGjcRL/DNwOe7A6jqHfKAm6k
	R8CzYn5jlPWLk9U9NSPiWrr0BGeHDKrWb14LduHFoheYFUCBgvV/0rdUVUzmylNpBFOO56TUmlG33
	d6JBQrIZw58tp5ceUx5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQrZX-0007GZ-MN; Sat, 02 Nov 2019 11:27:59 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQrVY-0002QO-Vv
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 11:23:54 +0000
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
IronPort-SDR: bNlqeY8+svd624CMZb2FNCmIfGPnlh2HcxSjcgsocTUL+B75wQOhzkVMtenvIBno8lFEGwUcSO
 5brPwMauor8YwcJOUYvuUjqlFlBD+pQiPZx7kjjaJ87JZ0WffvPOCIqH7FhtLS6zhww6Qe1c0c
 xv9GUyrZTYQ6aKsZ3Vir8dvc3w6P6bQtTGQasduPurTgnVlpsiFf+Us3nHxoUwP/FaeiNNeujh
 CILg7GEa0tzGY2JyQjUagwxLeKRXtkbzmZ6VdyWAdyx4QM45lwVyCIxEw4XHWaW8MWtKwSFa8J
 t8o=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53900887"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 04:23:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 04:23:52 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 04:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPD0nG60Z1Os5nzIlge5WpgdFU7Qjw2DHpteJ+a82i2TRZRz3zdVmLQtP4kKw2Zal4c/YwU9g/s9nxt2Ta5afGXayK0Ku+Bh2L5es6WXMRzoVhC7awhk7dOFK+7uDZNASjq26e6gXVpN8WP3To1TqjG/N/nhphc94aVhEr26gCxVqdkeQXKhyue9TJLEwc1rhe1aJUEoNOEizeer7BMu9DuHJjHJ+fiGmA3nlmReAIlXbW9aC+U1lDS5WMaPi+ttbWz+itFNZN1A9uwf7WgjYSFwp9yXXlemHIRe+eL6D00YfEkldNGx9RRR/k9U27T9jgDjcvIg7M33xmR4xHjzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voAuWLve2k5+v7MEc1jGJBgrKtUSFIXYy3UcsYC9Aak=;
 b=FH4yE1QmxqaYKs2Fw8xSrrf+OR3EvOfT+qvh4rFF5pAPevUVAh5PNbx/mCP7Flytoa/meJ0bBsZN83H+x/zprshFbn0kDQUMf0IrEmxlL0VvTYqmnInsLGLzVzMwVCweozeJUH556pLR+dkexkTWmOM/xF6yxeKWlQMmp6LRnIriM2fHmNOJd36E95A7ocAOBded+Jjp2f3h+OUtqnPSTyc0oBSRjuFx07/gXRLfd0anyrc2uCPM4nX/eWykX9GsYQlEwQnmraErPJ4UmZxHlHtwQLfMXQ0mdVCR1g/Nl1yud4H6XUOlSq75bd/PVXQt5aWKcbfPYo6lA9nQILw/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voAuWLve2k5+v7MEc1jGJBgrKtUSFIXYy3UcsYC9Aak=;
 b=KSNf8RYEqhPKa65LoYQ8XERPEoKzmy0PijWetI1rDtefmwRHoqbQW/ICu7Y1xUFCjORDUoaUhASfnIVCQM/f+b/TngK1OPxmz58zgmxfequFZSxZi7RZuOi7aEGYeLdD6P0isit32FIxzZAWYHEACmIjmCcc7jPb7eSFUaNzxzE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3711.namprd11.prod.outlook.com (20.178.254.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Sat, 2 Nov 2019 11:23:51 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 11:23:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: [PATCH v4 15/20] mtd: spi-nor: Extend the QE Read Back test to both
 SR1 and SR2
Thread-Topic: [PATCH v4 15/20] mtd: spi-nor: Extend the QE Read Back test to
 both SR1 and SR2
Thread-Index: AQHVkXAAobnx9/kxgESK6sIIzhHB/g==
Date: Sat, 2 Nov 2019 11:23:50 +0000
Message-ID: <20191102112316.20715-16-tudor.ambarus@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191102112316.20715-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0143.eurprd07.prod.outlook.com
 (2603:10a6:802:16::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e88365af-509a-4ba6-6082-08d75f8722f3
x-ms-traffictypediagnostic: MN2PR11MB3711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3711723279F3EF207A5E0B8DF07D0@MN2PR11MB3711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(346002)(376002)(396003)(189003)(199004)(64756008)(386003)(316002)(446003)(4326008)(5660300002)(81166006)(6506007)(2616005)(76176011)(81156014)(11346002)(110136005)(476003)(25786009)(54906003)(8936002)(86362001)(486006)(14454004)(8676002)(102836004)(26005)(66476007)(50226002)(2906002)(6116002)(1076003)(2501003)(7736002)(3846002)(99286004)(71200400001)(36756003)(71190400001)(66556008)(256004)(305945005)(6486002)(6436002)(66946007)(66066001)(6512007)(66446008)(478600001)(186003)(52116002)(14444005)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3711;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zIvi//GQK9ncSuczn2DCSdoeulw+397YglmpUG7eq6fF52K0oShCWUvqoCQRNCGQ240+XzLQ5POyeJhwXS/iXnySS9eKNNGAeYN9CuIMEcIsQWlfIiniarZ0ERWbGZIW8Z+hLOSxutOiqDgNGYgb2N7c56lIepmYqTPd8GO0ovRNRgvwEn7d1twE541/veVLjJpo3xmxr2h9n993YJgY0NvHeA6I9yxGTNScBSkA1PeS2cstqiApGfn9LDInrpEKSaUnlCpccggfIVb+72kkkPuj1dkaR3J+r27cNe+xw5XQshCQdkiMxj4WWyNhIMtmmAiXvQKqQ5pJzP54ZafN2ftkScUfQ7BSrwBK//rHYnhhb6oF16SBdcNILeEmo3iwjfWaqxKDr/L/5XXqyWa4gwNnqXkMramZcUP0uZdGpBHPOF4sgU3XKgVo4hSjkcbE
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e88365af-509a-4ba6-6082-08d75f8722f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 11:23:51.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72N3gKvGKGQjAw+oR9x9Ir7KE5ZSBV5T3LQ/swzxJrxVN+3CO6/1sBZmLV4IwNCnh+53ZJSbCmzqhodU9Ku0MjrcVPdKMNcahxTgx6tSv44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_042353_095786_5666C609 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: richard@nod.at, Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

In case of 16-bit Write Status Register, check that both SR1 and
SR2 were written correctly.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 08fd2c97897d..8f11c00e8ae5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2067,6 +2067,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr_cr = nor->bouncebuf;
 	int ret;
+	u8 sr_written;
 
 	/* Keep the current value of the Status Register. */
 	ret = spi_nor_read_sr(nor, sr_cr);
@@ -2075,7 +2076,22 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 
 	sr_cr[1] = CR_QUAD_EN_SPAN;
 
-	return spi_nor_write_sr(nor, sr_cr, 2);
+	ret = spi_nor_write_sr(nor, sr_cr, 2);
+	if (ret)
+		return ret;
+
+	sr_written = sr_cr[0];
+
+	ret = spi_nor_read_sr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	if (sr_cr[0] != sr_written) {
+		dev_err(nor->dev, "SR: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
 }
 
 /**
@@ -2116,6 +2132,17 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
+	sr_written = sr_cr[0];
+
+	ret = spi_nor_read_sr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	if (sr_written != sr_cr[0]) {
+		dev_err(nor->dev, "SR: Read back test failed\n");
+		return -EIO;
+	}
+
 	sr_written = sr_cr[1];
 
 	/* Read back and check it. */
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
