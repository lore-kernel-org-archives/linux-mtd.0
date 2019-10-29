Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC09CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5D5214D9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C5h3s2Eg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OmnA+o7c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5D5214D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eY/Faafz3EcC7QFc1VUtc+m8H4MjkrPcdPt7B6P5Q3s=; b=C5h3s2EgMp174p
	tdOFrpIF6IUXyIIxdGk5dCm8emf2m7sqjLXsoGN4GMcAzkRhKN5NC2o1coD+joN3ZoyVfZ6ncGsPY
	cj/q0QQY/wXQJC9NmSC3kQuHteRCS3+NsgvTUKuHlmgLuSoxMGrCcsYM+rCt4xEDvYpenYTg/JCLl
	WQsxIicrGyL5qIiOLxXEpGBCJqVkBk9QAn6njVKca2Pg52J6BEFLr04l+8+a7UL+AYZFSQnGISBX4
	0qC65FR5Q313NrZRAgi+hjb/OgWItU6jwBPOspCKrNuRZIu+wmeXSvlB9JuAIhaS8CcnCL6Qbee9a
	f+ks3Eo2OIHqiqKjhSOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPVO-0003GX-Go; Tue, 29 Oct 2019 11:17:42 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUj-0002Xd-KC
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:03 +0000
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
IronPort-SDR: MWEPrm/UqFhzEqbp6J2az+JrEQ46Mmv1mi+QrEbD9Vspt93I6Ivn+DP2ZIooJ8c/7VZ1Viu3Jx
 ENwhSz83z1ofY2VxHQ0YcoldbAq2+kCzFu0VdX1xtJMUtssArzNCk7OG6TOyoec5q1VcAIsWa8
 iwClIAa74i//Rhx3FlDfVB0stCXxv+t1Ia5aTMDdT7dZ8DuVd28ZNL4/RU/LLAFSYVazLG/2dO
 /zGea7SdsLHFUkgH5vtOsNy7o4JsFllZzzLUVMuNrtMErSr33P/lajUAZFNk/AIu/ABH1HAkjM
 vRc=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="53291993"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:16:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:16:55 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 04:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpVyE7R5bogMY3RC6HfYz4SzDoNoIhSRaaQpPlcue8otj8D1xytXs3VKwR0KBFZYDtPUA38lVxfDRqS6EwMyM4aO5x3aDPNytjhl0X7r9Tf6l36+rSw2g6YzvumExDTaPCaBMauMqKCpT9hsmy69QNXXSN5Mk7mYYsdXNg+9rakOj8TlFFEwJzv2qmc8fh+/gdktDuUlXi5ZnFEdO+nOkpZmLFPnt2RyBipMMzTFgw2uBLtV7o0dUGiGigiUoXaz9dcT+8lFSKO7/RGHzG6jLKGqBIRYr4N5tw8LboI4zsfd1QAhxgZAS3qzP0+hyRZmm+CBEsNg7JSVzqbUYwzqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLo2uMbn6tXoPfBhuy/2TkOh1Ab9RDEoAl4+EI29vCg=;
 b=TbVQEiKj+9cpkUixVE/ZY22Wvzj9IeEomi8VvVkeEu+vxGSQIo5k3VFUrgC5VAGBrVF4/ZzmlwdhBBx345zYGAG+NCgqAYtckx9V+f04KhetwyiX6vSUMzVJqDIHM/NFao0nqdHbiL8LWSs6bcS0mOFcI7+ujQudouBKzF981nKh7++hQ+1jynSR3F0jRezrqHCROuqSOOWVKNO6GV+OvI5CrxvlcMbAf7DWFehlUVhmTgBYhnTGeXy6klFGsCjPHvtc7iV7SxVsiIyifyJnXI7K4Dq9cwkdObQqYw83TJVFw2JCxGIa1gVoQpMGpszmF24Jo7JeG5wS3Pfn87iB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLo2uMbn6tXoPfBhuy/2TkOh1Ab9RDEoAl4+EI29vCg=;
 b=OmnA+o7cAzPDugWbP/ziForO91voVAnR3Cylh6bnnyu4pNl0YnaBkUKcRrhCbEuqA7EKDc34jnUYFrpCp6aMGKCiQdPDZuRqVlwZVaB+vjY0dacImEXwj/5zKHJ8+jX971nMQUQQyThTaQVBpuLWGIA84kegE0oNw4GOOU8ho60=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3823.namprd11.prod.outlook.com (20.178.254.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:16:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:16:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 04/32] mtd: spi-nor: Stop compare with negative in Reg Ops
 methods
Thread-Topic: [PATCH v3 04/32] mtd: spi-nor: Stop compare with negative in Reg
 Ops methods
Thread-Index: AQHVjkpe3Aj10gNnVU2+wx1petwKoQ==
Date: Tue, 29 Oct 2019 11:16:54 +0000
Message-ID: <20191029111615.3706-5-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 78aa4825-a8f5-4721-d616-08d75c6180f6
x-ms-traffictypediagnostic: MN2PR11MB3823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3823A1F591FA9F5468C9A6FCF0610@MN2PR11MB3823.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(136003)(376002)(396003)(189003)(199004)(478600001)(8676002)(4326008)(8936002)(66066001)(14454004)(36756003)(6512007)(107886003)(86362001)(11346002)(2616005)(476003)(486006)(6436002)(1076003)(2201001)(71200400001)(71190400001)(446003)(81156014)(81166006)(6486002)(50226002)(99286004)(66946007)(386003)(316002)(52116002)(6506007)(102836004)(76176011)(26005)(2501003)(305945005)(186003)(6116002)(110136005)(25786009)(2906002)(256004)(54906003)(3846002)(64756008)(66446008)(66556008)(66476007)(5660300002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3823;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCwhXOxOd9KJA7fdHvl8jwapUxgjOpKTG4zwGeb+VcxYAAR6t3zsDxZnftU7AYeSAinEAfUdLUWFQ7aPNg+nvgYqq14RxCLUDwsSaGXV2N7mnnLa9huc/9uVFAy1pk6QHo37GVkujZop5GMMuFsZHJ/yY0VcTd9pQcTFmjtvqP1OYWl7KeJHByczi6cy/MAsTDSm0J4JELJHwaHu7Iy0A8DsNFWNyg7cSMa0G/NuL7gtqiLQbIiFpmTcTw8NAjgdPoPlTgMWTsBRA/3RTl2VT+eEGjtn92N4afRO4PpVOYwPJFUpysTVabZaKIuhwkK0E0Z6QRvtB1Og0yKVyY4dQJpPoQ6BkwNVaT2yYzHfe3KT6gEvoQ42rRGIDp1EYbJA71XbrkiGyftq9bIoY4FgkeIlJaNwFTEMpmaRHU/h6JvaV/hAXfMH5d+vCc4zh7FU
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78aa4825-a8f5-4721-d616-08d75c6180f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:16:54.3216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMrAPDHRxYCbRNdJy3258SQuIb928hFtyRNW1q7a9kk7IJz33PvFkZmZzHuuNtWvV1/2nFMEEC/lJ+010hoKceWvYsW7QQ/Yyk/2G8rd2WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041701_695896_13D098B6 
X-CRM114-Status: GOOD (  10.76  )
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

spi_mem_exec_op()
nor->controller_ops->write_reg()
nor->controller_ops->read_reg()
spi_nor_wait_till_ready()
Return 0 on success, -errno otherwise.

Stop compare with negative and compare with zero in all the register
operations methods.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 24378d65fa2e..4d3c37658ea5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -447,7 +447,7 @@ static int spi_nor_read_sr(struct spi_nor *nor)
 						    nor->bouncebuf, 1);
 	}
 
-	if (ret < 0) {
+	if (ret) {
 		pr_err("error %d reading SR\n", (int) ret);
 		return ret;
 	}
@@ -477,7 +477,7 @@ static int spi_nor_read_fsr(struct spi_nor *nor)
 						    nor->bouncebuf, 1);
 	}
 
-	if (ret < 0) {
+	if (ret) {
 		pr_err("error %d reading FSR\n", ret);
 		return ret;
 	}
@@ -507,7 +507,7 @@ static int spi_nor_read_cr(struct spi_nor *nor)
 						    nor->bouncebuf, 1);
 	}
 
-	if (ret < 0) {
+	if (ret) {
 		dev_err(nor->dev, "error %d reading CR\n", ret);
 		return ret;
 	}
@@ -643,7 +643,7 @@ static int s3an_sr_ready(struct spi_nor *nor)
 	int ret;
 
 	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
 		return ret;
 	}
@@ -800,7 +800,7 @@ static int spi_nor_write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 						     sr_cr, 2);
 	}
 
-	if (ret < 0) {
+	if (ret) {
 		dev_err(nor->dev,
 			"error while writing configuration register\n");
 		return -EINVAL;
@@ -1930,20 +1930,23 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	spi_nor_write_enable(nor);
 
 	ret = spi_nor_write_sr2(nor, sr2);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(nor->dev, "error while writing status register 2\n");
 		return -EINVAL;
 	}
 
 	ret = spi_nor_wait_till_ready(nor);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(nor->dev, "timeout while writing status register 2\n");
 		return ret;
 	}
 
 	/* Read back and check it. */
 	ret = spi_nor_read_sr2(nor, sr2);
-	if (!(ret > 0 && (*sr2 & SR2_QUAD_EN_BIT7))) {
+	if (ret)
+		return ret;
+
+	if (!(*sr2 & SR2_QUAD_EN_BIT7)) {
 		dev_err(nor->dev, "SR2 Quad bit not set\n");
 		return -EINVAL;
 	}
@@ -2534,7 +2537,7 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 		tmp = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
 						    SPI_NOR_MAX_ID_LEN);
 	}
-	if (tmp < 0) {
+	if (tmp) {
 		dev_err(nor->dev, "error %d reading JEDEC ID\n", tmp);
 		return ERR_PTR(tmp);
 	}
@@ -2751,7 +2754,7 @@ static int s3an_nor_setup(struct spi_nor *nor,
 	int ret;
 
 	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
 		return ret;
 	}
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
