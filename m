Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B29BCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1599D20663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rcn/fwaR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fUZGNXXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1599D20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlQE2TeN/GAC4nBIh6QWJm815557DDQzIjZTJ2ngnQo=; b=Rcn/fwaRdwGxVj
	C6P/L2+2kTjx+DcNG8kRjUnx+/sMg/WJW/nnMPENYjqEingie4AqumzWrivq95ivYiqGRd31TkPAi
	hRX8Bv0H/yCdDN2AgTOdFhCuXcq5HJfyYxjYAFqwHt0OrZECn4YOWsHnS1NIveOGtrBnsLQQ5h00L
	6ch5MxZ3BkGaW+BE3E7SiAZAOcq2vTIoW2DMCv1vbOqHmLqRk7O9Y/8gFO89WwD0eIVhCqgQGrAka
	lfcG89mXv+CmD1VykePZq7OqQ5N6eZmwKjXIDkJnXdAPX/Van5q4ZlOlNL6DdLy8/WVTE7tQBti8H
	krdTiPtqiT5P+Y4Bd41Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPb3-0001O9-C7; Tue, 29 Oct 2019 11:23:33 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPVD-0002w2-OS
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:34 +0000
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
IronPort-SDR: Tjb/FoD6c4ZPRESK8Rof18Dm7w6gH04532wkS70YfVaFganMBof1hPMwMy2Xs2n844+vAoRqMM
 vLFoEnbptpfCKTIqD+Q8eFAEQPWtshEZHQMCcvhAAEzle0e0dTzV7RKcksyf3SrOkGcvA8xLTv
 KOzNf3NeHEvUKlbXz1h1YD9dOZQ5H2Y3JQQf8l5wBNDswLihdFV+2gB4wHIeK4QQemDqRxrrgv
 FVICmMkRKh0Ur9n/3HKqQ/JPFH4Iubqpoqm09Rex17Uwho+iHfCL0jLYq5gNOS4lW1hFyBOiRF
 nn0=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="53292142"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:30 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 04:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgCeHgqZdzECQKriwUnk1sucvOnaPat7H4KplEe5Knhx89t6f2HHNNmROXSe28GPG0MYvKAe9ygxheA+OO74Qpg5oT0MMXCXeVrL/7yF/2PqlvDWGDY0OmXGix+/OJ4VXj4nrGzgqABD+kqgIGeAhv1HfN6YZxO/wYTR0GqDIt20GtEbCAqCvAgtzzwHLiUNw9L6xUm7thWbtq3+h7hoDXt8gRmzyzfr72QQV/d2BeQTFQ7b0aZntPAngHn9p+y8m2QmBZ5RbjThgiXDYmJ3ZLjKhJ+oRARsmymFMy3VGlXiSVpLXsjpxGMS/NPo6IEeaAOWazcBXXbkHrftizP35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI9mtIg/Z/U386pCDlsq62vc8X1AudU1ICUoD503yyo=;
 b=VMX2M+NBsCGdoZK9kkPeuXJL439LKWTdwJvhBJCqo2hdHqsGevrN9WtFhLTPl7Rnah9sji9OQetG1ex6OQT556cuUsoGCklaY5q6VnHps4MXMbXO251WJh/MgbGLwyZrbeAzEVrZ++BqUCykE+TJfO00PShCeiPEhFjV4dRdh6wnF4V+FBquj1BBSf5IlHkH/6Mee+J7G/gckge0ext6D7GqGKyPc2WydH4ezvfFdGxsKdOkh9uB5rRHRhIhKrtvFvSSW6ge3tlikItQZpQmsCkd2F/4mp3OYGKuFBpcOHvDl5JO7vGMFjBTfHWsfty6r4fZrHKEogKUpYt1QeyQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI9mtIg/Z/U386pCDlsq62vc8X1AudU1ICUoD503yyo=;
 b=fUZGNXXjKJRXlD3zxw7GsLrPpGYJeKE3LHNVtNL3t4ohkvNo7UEBjKwEKXkGlDaPXIij69FD3qoUwAndzj0fq5M3bg8AcOJ/7S0Bq6HSypzqMQd7UdRWsB5LLHPLhHmLXrCROfwD0EsHRdgfv3T9p5ukdGwT7SSeZttK6md8Egs=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3823.namprd11.prod.outlook.com (20.178.254.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:17:29 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:17:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 25/32] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
Thread-Topic: [PATCH v3 25/32] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
Thread-Index: AQHVjkpzVaAo2iWzaEu7RWOoAoBgGg==
Date: Tue, 29 Oct 2019 11:17:29 +0000
Message-ID: <20191029111615.3706-26-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 95e7d754-d3b1-458f-ea14-08d75c6195a7
x-ms-traffictypediagnostic: MN2PR11MB3823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB38231F3ECC4BC0928A4168ABF0610@MN2PR11MB3823.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(136003)(376002)(396003)(189003)(199004)(478600001)(8676002)(4326008)(8936002)(66066001)(14454004)(36756003)(6512007)(107886003)(86362001)(11346002)(2616005)(476003)(486006)(6436002)(1076003)(2201001)(71200400001)(71190400001)(446003)(81156014)(81166006)(6486002)(50226002)(99286004)(66946007)(386003)(316002)(52116002)(6506007)(102836004)(76176011)(26005)(2501003)(305945005)(186003)(6116002)(110136005)(25786009)(2906002)(14444005)(256004)(54906003)(3846002)(64756008)(66446008)(66556008)(66476007)(5660300002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3823;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Ru41agfV+yL7vCLAe2lAdu5QNaKun1FPzVd5xAYovQj0FsxdKkvO16fWp9fwjWaUNinvWt/3YtdpJbxlU6QiWFor0FsAcNtRsGnNB6oLXA9ZfNOgdiPcjmpVsFKt5WNO0nRJDYXKKNeorWqO0qOjSQMN15hwZZz3N/x/YTStHRqI635vowRiCaWIhHhnF9uiUWOV5zGkYO301YRIsGvBRD2YiEuWYgwZB6hNd7eLOVl48351kH9HBPc2WOMksxdMJlHJVJ8LI28lMnOy4LP3vYuVwulnf1ICxnKPtm7p+SSlQuoEP1MdrDZKeb+gF3dMe+RkLxzHMnDQLm8mTYfPFVin8a8afu4yOuQVSFbClxHPGBi4q58p6BOOWeFvp1FoIY8CL13Swwzw8xGIo3irMWJAYdRdA/lVr26nI2+odU83ECXv6UwpbcJYh+piJGd
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e7d754-d3b1-458f-ea14-08d75c6195a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:17:29.0166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mccgYFUytueDwu8YJ3GCWZn+nLI1gISdaOQxxGws1rOpy27oE1Ee+3K/gJVdWUKrS6BryswlKhNm6OxuEBnB3laj/fatspyH37PRn9RzFLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041731_894450_A9EB3507 
X-CRM114-Status: GOOD (  20.33  )
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

Make sure that when doing a lock() or an unlock() operation we don't clear
the QE bit from Status Register 2.

JESD216 revB or later offers information about the *default* Status
Register commands to use (see BFPT DWORDS[15], bits 22:20). In this
standard, Status Register 1 refers to the first data byte transferred on a
Read Status (05h) or Write Status (01h) command. Status register 2 refers
to the byte read using instruction 35h. Status register 2 is the second
byte transferred in a Write Status (01h) command.

Industry naming and definitions of these Status Registers may differ.
The definitions are described in JESD216B, BFPT DWORDS[15], bits 22:20.
There are cases in which writing only one byte to the Status Register 1
has the side-effect of clearing Status Register 2 and implicitly the Quad
Enable bit. This side-effect is hit just by the
BFPT_DWORD15_QER_SR2_BIT1_BUGGY and BFPT_DWORD15_QER_SR2_BIT1 cases.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 120 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h   |   3 ++
 2 files changed, 118 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 30ce83426266..0dcc4f12e4de 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -959,12 +959,19 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
 	return spi_nor_wait_till_ready(nor);
 }
 
-/* Write status register and ensure bits in mask match written values */
-static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new)
+/**
+ * spi_nor_write_sr1_and_check() - Write one byte to the Status Register 1 and
+ * ensure that the byte written match the received value.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @sr1:	byte value to be written to the Status Register.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_sr1_and_check(struct spi_nor *nor, u8 sr1)
 {
 	int ret;
 
-	nor->bouncebuf[0] = status_new;
+	nor->bouncebuf[0] = sr1;
 
 	ret = spi_nor_write_sr(nor, &nor->bouncebuf[0], 1);
 	if (ret)
@@ -974,8 +981,73 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new)
 	if (ret)
 		return ret;
 
-	if (nor->bouncebuf[0] != status_new) {
-		dev_err(nor->dev, "SR: read back test failed\n");
+	if (nor->bouncebuf[0] != sr1) {
+		dev_err(nor->dev, "SR1: read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * spi_nor_write_16bit_sr_and_check() - Write the Status Register 1 and the
+ * Status Register 2 in one shot. Ensure that the byte written in the Status
+ * Register 1 match the received value, and that the 16-bit Write did not
+ * affect what was already in the Status Register 2.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @sr1:	byte value to be written to the Status Register 1.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
+{
+	int ret;
+	u8 *sr_cr = nor->bouncebuf;
+	u8 cr_written;
+
+	/* Make sure we don't overwrite the contents of Status Register 2. */
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, &sr_cr[1]);
+		if (ret)
+			return ret;
+	} else if (nor->params.quad_enable) {
+		/*
+		 * If the Status Register 2 Read command (35h) is not
+		 * supported, we should at least be sure we don't
+		 * change the value of the SR2 Quad Enable bit.
+		 *
+		 * We can safely assume that when the Quad Enable method is
+		 * set, the value of the QE bit is one, as a consequence of the
+		 * nor->params.quad_enable() call.
+		 *
+		 * We can safely assume that the Quad Enable bit is present in
+		 * the Status Register 2 at BIT(1). According to the JESD216
+		 * revB standard, BFPT DWORDS[15], bits 22:20, the 16-bit
+		 * Write Status (01h) command is available just for the cases
+		 * in which the QE bit is described in SR2 at BIT(1).
+		 */
+		sr_cr[1] = CR_QUAD_EN_SPAN;
+	} else {
+		sr_cr[1] = 0;
+	}
+
+	sr_cr[0] = sr1;
+
+	ret = spi_nor_write_sr(nor, sr_cr, 2);
+	if (ret)
+		return ret;
+
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		return 0;
+
+	cr_written = sr_cr[1];
+
+	ret = spi_nor_read_cr(nor, &sr_cr[1]);
+	if (ret)
+		return ret;
+
+	if (cr_written != sr_cr[1]) {
+		dev_err(nor->dev, "CR: read back test failed\n");
 		return -EIO;
 	}
 
@@ -983,6 +1055,23 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new)
 }
 
 /**
+ * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure that
+ * the byte written match the received value without affecting other bits in the
+ * Status Register 1 and 2.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @sr1:	byte value to be written to the Status Register.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
+{
+	if (nor->flags & SNOR_F_HAS_16BIT_SR)
+		return spi_nor_write_16bit_sr_and_check(nor, sr1);
+
+	return spi_nor_write_sr1_and_check(nor, sr1);
+}
+
+/**
  * spi_nor_write_sr2() - Write the Status Register 2 using the
  * SPINOR_OP_WRSR2 (3eh) command.
  * @nor:	pointer to 'struct spi_nor'.
@@ -3634,19 +3723,38 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
+		/*
+		 * Writing only one byte to the Status Register has the
+		 * side-effect of clearing Status Register 2.
+		 */
 	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
+		/*
+		 * Read Configuration Register (35h) instruction is not
+		 * supported.
+		 */
+		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
 		params->quad_enable = spansion_no_read_cr_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR1_BIT6:
+		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 		params->quad_enable = macronix_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT7:
+		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 		params->quad_enable = sr2_bit7_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1:
+		/*
+		 * JESD216 rev B or later does not specify if writing only one
+		 * byte to the Status Register clears or not the Status
+		 * Register 2, so let's be cautious and keep the default
+		 * assumption of a 16-bit Write Status (01h) command.
+		 */
+		nor->flags |= SNOR_F_HAS_16BIT_SR;
+
 		params->quad_enable = spansion_read_cr_quad_enable;
 		break;
 
@@ -4613,6 +4721,8 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	params->quad_enable = spansion_read_cr_quad_enable;
 	params->set_4byte = spansion_set_4byte;
 	params->setup = spi_nor_default_setup;
+	/* Default to 16-bit Write Status (01h) Command */
+	nor->flags |= SNOR_F_HAS_16BIT_SR;
 
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d1d736d3c8ab..d6ec55cc6d97 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -243,6 +243,9 @@ enum spi_nor_option_flags {
 	SNOR_F_4B_OPCODES	= BIT(6),
 	SNOR_F_HAS_4BAIT	= BIT(7),
 	SNOR_F_HAS_LOCK		= BIT(8),
+	SNOR_F_HAS_16BIT_SR	= BIT(9),
+	SNOR_F_NO_READ_CR	= BIT(10),
+
 };
 
 /**
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
