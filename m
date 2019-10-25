Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6C6CA9EBC
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 14:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F223420684
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 14:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LDylanEr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="XiqZZRaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F223420684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGg0b4eWi3G/BsPdA6IaMQ5QBwCBO+40Us9/E7kxtgU=; b=LDylanErp79s5a
	BqGGiHVGWJ8CtafKlKg8jXeDiefZ53NGPW4AJapeqACR20yIRrDiTcXb6qQBIIOcYNEHHNUqEUdMM
	XJ32Jf640qcG4n7YTdtlPYCmH++ozWcCbZIAu2r9ONshywpsMKrfw7MQZ7X90i6MMM+0g9ms7Pqgc
	Fd9HxDZ+uU1g3DFF2TptTOAJiNIsj9gm10Qw0wbq/pIfQ8oV5xbM62NuAiXN78ThVaCrRDWx5M9I/
	zNImG49UxOwSI5FUzOm8GoB2lzabi9XtobIb9t8JgNSFPVCeR+0EJUgMR2mhakxV6lz6jtQ+tUmFp
	tnE51Ea2AZr00Yt0wl6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO0aM-0000YA-Cm; Fri, 25 Oct 2019 14:29:02 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO0a3-0000IS-N8
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 14:28:45 +0000
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
IronPort-SDR: mvTacvrQeeAfeAFk8fotSMv7iB9wGpEvtq9mk+Is/NEbi2CZ3kH7FKr8nNjO4sUJana6Fr0mXv
 iDW87ve4BqTJZEHqySMViKcnJPC+lMip9G7QO2FWeL/+yTTtHJ5fkHTpNdsdPZp1INv/7V8i8Q
 H4zYpNICyVjTL1KZNxDK9rQi93o1aCmd4wN0u3fcmZPT0ALqHMg4mEGxnG/99nFrt5MapSuSjB
 t6ooAg74cZNa5NfiRoX32AwNRbT/nv23RnGOydRx8goKXxvnQ8B0hyIQfsgar+dFWFIOqxbNE+
 InE=
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="51567011"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Oct 2019 07:28:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 25 Oct 2019 07:28:39 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 25 Oct 2019 07:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRgaQRl4Ago1ThtKd0VmEw65DhJI5f/NQiNFtMlYfMammd4NoxJfcxpM/ykEz3IUVN2KA/2TnlFhvPtYCOnhftIN8dJuhtZ2qnEETkBf+Ozr0aEmYzdElzyQiAE/f2o6JBTdHnX8Oi2Ec1oVJnBI2bPYuMzPIep4Ot2ANvuqYKz2IP8BcoBZTlXORC0WMj2g4Cfz+dlQOdjJ4zkObC6Uho9E95RIJ5j4HpwO86S9tmehyhu6aH9MNTCOJbGBKqEmm39t/AWKcNM2nXSpO44Zale8dH1qaSXVyOX/IyOhT9Xf4X6dv02Ovb4S6mewvBlbIWK6AlN/LYGm3tcPMKxiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+84eZWd+IFDlAAbfx9ffpYFwYJYLJyu3rQyEW8eIQhg=;
 b=m00o5UFQ2eZv5NGB6My2rQWdWsDpKdFJ6nZc7Le8f8oQ4IY9pqnuE4hKsaZDxy6geV+EfiftLbMcLcCs6AwJBe1rmiwnn3PvLEtS+jkr/khHHbuDh+4HvAFvzdpokF7TLj4qHCXBDPJF1UMlXGzEf57VhnleHa16hqDgWGKmWHmaGp0O+Go2QEN5AT7ZSAY5JPfsiVh0ynQAVzaPvuTqwxdZuJjD79JzTm2QPFTW7W87uDLvpA3CQPjvR+JLBovMWgfYdMn+wJuEj8U06ukQQn7OXBLZJ6AVbUMKzthT2uK3Nm50YhpxB820ukK75lA/GiTifJ0rlvbzqmb3B4Z2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+84eZWd+IFDlAAbfx9ffpYFwYJYLJyu3rQyEW8eIQhg=;
 b=XiqZZRaGL7PhB4dbRO4EVz8gUrW3iBS9fH+uGukwc6rm9TxiRyXE6SUtbgXVpwXXwzdWi1QUo2OrdpDIgEqJvXnNw+FCb0Y/dkIFBxp9tqzYyPwHp/9BgGw2mx99qFycU46JxlHsitw0aZ21/ZFxz0EIhLbsu5GLDnZ4sW5wXMI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3741.namprd11.prod.outlook.com (20.178.254.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 14:28:36 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.030; Fri, 25 Oct 2019
 14:28:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/2] mtd: spi-nor: Move condition to avoid a NULL check
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Move condition to avoid a NULL check
Thread-Index: AQHVi0B8ZFvBMGy4IUWcxJaI+wCV6Q==
Date: Fri, 25 Oct 2019 14:28:36 +0000
Message-ID: <20191025142811.541-2-tudor.ambarus@microchip.com>
References: <20191025123217.12790-1-tudor.ambarus@microchip.com>
 <20191025142811.541-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191025142811.541-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad9e0387-c8d6-4499-a4a5-08d759579edf
x-ms-traffictypediagnostic: MN2PR11MB3741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3741368C05EF103B24A9D500F0650@MN2PR11MB3741.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(376002)(346002)(199004)(189003)(4326008)(107886003)(256004)(2501003)(14454004)(186003)(110136005)(316002)(14444005)(5660300002)(36756003)(26005)(305945005)(2906002)(71190400001)(66066001)(71200400001)(7736002)(446003)(6116002)(2616005)(3846002)(486006)(478600001)(76176011)(11346002)(1076003)(66556008)(66476007)(99286004)(8936002)(66446008)(64756008)(66946007)(50226002)(86362001)(8676002)(52116002)(81166006)(6512007)(25786009)(81156014)(6436002)(386003)(6506007)(102836004)(6486002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3741;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hbq8mI+8TjwXciVrh6IZesrRA6fiazKWyg/C7swtjp2OAaWeO23xHjVUf7NxHfGbii91JGoWqfwvWiqkfTdPItmABSLgoiTM8XnXIy0457GmI6+5UlW94dd1JJAhSVAFAdmh/6t1Joal+9PMOuHZTJ/Rfdn9xjirDGnYDEWyWkt+iUifjxHOuUG6dOXm9++xxWlJJUYJZV40NXbKobTttyO0wtFlxtFBI4m98Rj0P4zVfXQ2GsulJkMh2tpB4iXk3lq3kSUcv+OUUy+kwRJhnHW3WfCNwtPWNQtc+I+JGz/PtdAr3dvMNAUVH+PqaFWTvm1RHDz5F17pMbcsdUDKNZ7rh839KyLi+939iBy/aPIG/nfix0LVoMSF3XizNYr6toEZVr2AISCPIwKF+PStILu0G7afYrK3E0URvtMZJM1vjCyCpio7SYeNqv0rk10h
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9e0387-c8d6-4499-a4a5-08d759579edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 14:28:36.1206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4U3iFFbYP10rwbgPv3sGM6iszWxsrTVQvM11hxOMcV0v729LxazGbxMJagl08aQfoPSV0WE4DPg2e76uTJ5etp/sQdv4T/ZCe5j0MqHFtgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_072843_791285_A1524BA4 
X-CRM114-Status: UNSURE (   9.32  )
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

When the controller is not under the SPI-MEM interface it may implement
the optional controller_ops->erase() method.

nor->spimem and nor->controller_ops are mutual exclusive. Move the
nor->controller_ops->erase != NULL check as an 'else if' case to
nor->spimem, in order to avoid the nor->controller_ops != NULL
check.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: add Reported-by tag, amend commit description.

 drivers/mtd/spi-nor/spi-nor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b452d3d0de28..8eaf097098d9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -942,9 +942,6 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 
 	addr = spi_nor_convert_addr(nor, addr);
 
-	if (nor->controller_ops && nor->controller_ops->erase)
-		return nor->controller_ops->erase(nor, addr);
-
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
@@ -953,6 +950,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 				   SPI_MEM_OP_NO_DATA);
 
 		return spi_mem_exec_op(nor->spimem, &op);
+	} else if (nor->controller_ops->erase) {
+		return nor->controller_ops->erase(nor, addr);
 	}
 
 	/*
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
