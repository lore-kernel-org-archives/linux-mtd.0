Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBA7CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:19:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7858320663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z8BsD22O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PpOgIdKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7858320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RW9ZKD3ZvbfBb61bayoIt/qnNDMsRsIk4fbpv4kV/yU=; b=Z8BsD22OUJDXap
	f/yfAkfTnim5P501isO5lLEwunUJLymk8i0tznsx887iHKa5EgAbzHVquyowOZczIJMwXDi9JTa4Y
	lENsJS55hPSSRxKukHLrvJyDvd/EJpMkyd9kr5EqemTbspW4ddMfRNw3oa1AoDCL1LeKT5x8sQQpP
	2bxXksoBrU1jbiJCtdav20urEeCWRQPGXL6OuqDzt3FD4QFZqO5HXPYJFw8ioiD4lkC233ZZ6S3JG
	rRj3IOSy9QjuxZofUZ3wd5ClVyyrM+RSYUdpuj4cjp/02jJv0GBNfGf8XlDcVfZYAaAvfr9WH3XLq
	WQQkriQ1bxx/ShWZaH0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPXM-00056u-Dd; Tue, 29 Oct 2019 11:19:44 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUo-0002dK-PB
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:08 +0000
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
IronPort-SDR: QISfS7EyB20QQWblJoxl3cexJZIxEcYNDFofgVzUKk+tr4V0NmQDsKfiCy+IMYK8na5ySIvRr5
 RsXPX1UzvjEDTbJ2Ty7Rwj4HSTslQaUF3N0rCsNrnrWl1Qu+DzF7P4RQKOkOpyJo2I9fLoP72m
 xIjXaD1oUQdWvBjD53TlbKlFj+xGTqQlRbAr+I3ryXTBoMQfB05yABOOBrh4t1Xgmi/kiGJC/a
 fc57pUoga+0A1eodTIsezn2vW/Kv1iQsCYt9qPPvGcxCIbOr9/+ITSUXkBBxBuiNB/k6JEKkHL
 NYo=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="53292019"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:03 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 04:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0rObFHcvlQXsA2Q9nSNCP4/SB2Zl+QI9nYyZTFIabhPFhW2QGb+QvoYYwL0G1GN12t1FngQNpPIyVYDZG2f+OsR6dJ9519OUL709MZIEeVB2T9HYUf7izaEvD826UiDDTh7cWncSoy5JNpoFLG/fRAL/Rsefeq2NR2AghvfDzO9kb4VCCNqVRD9hB3MNGC8tG7uHAh8cK0BiMQhmgiLJQuwbCe3H0XiweuNYuPtNWUngGzDAaWXcJyrsHaEMJxIWDkyTePnaVKeZsm5kQ3Je1K3RqytBJgpfBkteH4ir9FCFUQdq9kVkir4d+8M8ypIwI27v1IgMn7yK2wzOghzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Na2hcSIN/EfifZeVv/rJEDFq0lI1t9iM7LTcTfFCuyQ=;
 b=aFIfcRDiMAg9xGm6u1hTKZafXd9jH+N1te7FpkjbI7CYPr4yq/KrTcfYjEH6sR0q/Ci0flSnHSrdZ4b4KhQD4at1/aFVc8VSxj+RWE9FTqf4ae/i6qGr2LOlJ/2cEA9euo5Yl3Z30FP5xeZdSuN12vh7LWrofV6V806yKTIa1DIld8xClpvB7RmI8bc+SEogx0lYz2Se09PzvB7Oot05ZsBwKh6k0tBLUH1z62MGFq4SoYpu7qu6zLJi6dhOZeNb/MR78U4VJh0VQLS7rTfGp41vtx1HAlV/KIB61cHp32aDlZihoagvG0M5CH+jtOj+y4CrWdzQzE78uI2pkJHaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Na2hcSIN/EfifZeVv/rJEDFq0lI1t9iM7LTcTfFCuyQ=;
 b=PpOgIdKBwdCoU0l0IkBivHazQ9hZOdnoUrQYYUZohMiY174kLsuNGYD4DlK97fb2AzH6KZ5Ftcue7a4yTD59IEvQprincnrxkKBEiY1WjQMXN7qKBv6XYyaIU7ctWOfIG1j1LXWHyk4UUccUHGpChP31CQHD4dd9YRAbe5IBeBw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3823.namprd11.prod.outlook.com (20.178.254.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:17:02 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:17:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 09/32] mtd: spi-nor: Pointer parameter for FSR in
 spi_nor_read_fsr()
Thread-Topic: [PATCH v3 09/32] mtd: spi-nor: Pointer parameter for FSR in
 spi_nor_read_fsr()
Thread-Index: AQHVjkpjFsCVETDwxUiEqOeciq1trw==
Date: Tue, 29 Oct 2019 11:17:02 +0000
Message-ID: <20191029111615.3706-10-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 09c2226f-4b0a-4ed9-1439-08d75c6185dc
x-ms-traffictypediagnostic: MN2PR11MB3823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3823BEDE0CA9E8702530EEB6F0610@MN2PR11MB3823.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
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
x-microsoft-antispam-message-info: V4OYbXxlAQEpBZpN7ozxEGwzPIt4FR919ydzgkRu8EpAHK4GcbLajZy6uCplddoBzRkl7U1E1y6mjdjn383Pw2eUjqlUw1xgKqaQkHqYXAgQZhLXFH+K/WadWzre5hzxY453RkyOQLlHOkOrphnxUXuA3wIxk3W6WcouKLfI+d7JhvYxdRJaWqQisF8uk0FPsjnQ+znmAd/h8SJXyxlvavBCVZhwBu/Sen1e/onIbmkJcvk3Nn1CUyOdXtgJD69W/6HsmIXHP7ABslOr5RiXElLT/nmcNdqwl0E6Sh7wU2EUErqDwGMe2WhvX30WgKys667g6iUsCF4k1VQzFh6ugYEme7qheud73uNFZd9S/Cq0jbJ2s27CgM3CP3PgJxw495M9QXTqg9hnuNWkuL+DKNDay27TGxewzKqZ+BS4Vt/+cOJVm22cfeTdnkQ7PIxq
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c2226f-4b0a-4ed9-1439-08d75c6185dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:17:02.5389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbiMdQhLDLAh6mWYPD5ZN+LzpxtsQrEel03xreQjRhD4oNzcIkpbfPUsVFoF1gn0V7GTorFuKw+BHpZ3oZcRr4CIvJqSmYUHuKSSpEbl9PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041707_000496_EE76CDF1 
X-CRM114-Status: GOOD (  12.45  )
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

Let the callers pass the pointer to the DMA-able buffer where
the value of the Flag Status Register will be written. This way we
avoid the casts between int and u8, which can be confusing.

Caller stops compare the return value of spi_nor_read_fsr() with negative,
spi_nor_read_fsr() returns 0 on success and -errno otherwise.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dc44d1206f77..0d38aede4de7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -456,12 +456,15 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 	return ret;
 }
 
-/*
- * Read the flag status register, returning its value in the location
- * Return the status register value.
- * Returns negative if error occurred.
+/**
+ * spi_nor_read_fsr() - Read the Flag Status Register.
+ * @nor:	pointer to 'struct spi_nor'
+ * @fsr:	pointer to a DMA-able buffer where the value of the
+ *              Flag Status Register will be written.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_read_fsr(struct spi_nor *nor)
+static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 {
 	int ret;
 
@@ -470,20 +473,18 @@ static int spi_nor_read_fsr(struct spi_nor *nor)
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 1),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+				   SPI_MEM_OP_DATA_IN(1, fsr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
 		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDFSR,
-						    nor->bouncebuf, 1);
+						    fsr, 1);
 	}
 
-	if (ret) {
+	if (ret)
 		dev_err(nor->dev, "error %d reading FSR\n", ret);
-		return ret;
-	}
 
-	return nor->bouncebuf[0];
+	return ret;
 }
 
 /*
@@ -705,17 +706,18 @@ static int spi_nor_clear_fsr(struct spi_nor *nor)
 
 static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
-	int fsr = spi_nor_read_fsr(nor);
-	if (fsr < 0)
-		return fsr;
+	int ret = spi_nor_read_fsr(nor, &nor->bouncebuf[0]);
+
+	if (ret)
+		return ret;
 
-	if (fsr & (FSR_E_ERR | FSR_P_ERR)) {
-		if (fsr & FSR_E_ERR)
+	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
+		if (nor->bouncebuf[0] & FSR_E_ERR)
 			dev_err(nor->dev, "Erase operation failed.\n");
 		else
 			dev_err(nor->dev, "Program operation failed.\n");
 
-		if (fsr & FSR_PT_ERR)
+		if (nor->bouncebuf[0] & FSR_PT_ERR)
 			dev_err(nor->dev,
 			"Attempted to modify a protected sector.\n");
 
@@ -723,7 +725,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 		return -EIO;
 	}
 
-	return fsr & FSR_READY;
+	return nor->bouncebuf[0] & FSR_READY;
 }
 
 static int spi_nor_ready(struct spi_nor *nor)
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
