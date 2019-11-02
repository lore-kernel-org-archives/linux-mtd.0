Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5953CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F75020679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RY61Pws6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iYr3gTuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F75020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI2iqG5DFdLGoeyPeYpdtfsHCmlCfvd4fYg2vl3skMk=; b=RY61Pws6WJTTne
	Riz2j8s6vb02GYTjGrWlXxaYOtiM8xs3ey5YW1c4trAXKaKExsMyqrHFZq/m4QERuNS4kwKwETc8z
	WpmZZ3fWLKLMaxAqKKRjV0u1WGyurXaJ3QbSEI3wEVAom6S3gaqBBIpmkZC+GSgbZoOYrsxkES8xW
	UJSX7oYZKqFdxL1Jez+SqcjxYRKdhngLy/266qigZldmUO+YSKnJSOBQmf9720wXpOPa8KEp06ggl
	icZdGXZ4bBhsiUAFKrzGviNav+RCT5/4gIrqxex2unGvAzKqEl8OovHcEtzPUTDhzGkh7t38QVygo
	zvWnvQ9TlRHCFYQsHKFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQra2-0007nX-4t; Sat, 02 Nov 2019 11:28:30 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQrVd-0002YJ-Er
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 11:24:00 +0000
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
IronPort-SDR: cWVlK//kQ86lr+/QX8hysRjZGjUEWMH6NKYLbGYlsEvz02gU91tvhJHkaS+TB+OQks7POYBfol
 o0hsWLR0yzx1IbwWt+okexYO13IcQsEKEsqny95K9Ev8HrsMYSijckIxuUeRqSmHbVXrQSzx7T
 c/dD+47DRtUnqBzcNb0Xbj23MPC3RHLrP/K26EfxtpAQTRmjC7isiRmpyncz3mO1Rv5dOd1Qew
 jqvMrFHQzPCFt5z1jI3HJWOR4iVU+K5SIW0GgWUWwpcR/+2V1TT6aII59la5DkA7st8k1taFpn
 3MA=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53900891"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 04:23:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 04:23:56 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 04:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNkCG0nD5aZQ4+vlom/TrxqgaFOmsa2fd8zhNe3kAAQ+v6m1lOIO7uQxwIl8ghMNUXm6/R7YyOl0fhiEQXnW0sp3+yzD9rLDtDMEo1uy7Q3gMmVOZvFXs7bL98NlT+/tKgDx7tBEg2gAjnHmivGYl34NAFd23PLPjhLa0f4cCnTjnGQx5ESbxnOblBcT0kimn9vQMFf5XGMfxMnhUcP1lrz8wV1rtvPK841+SzChb8ms+CTnEGIpWKbbAmgYRXZmjxXd7ihGR0sGl/xh73ejO9sX+OvDdBUTiuvk12990X46pAldz9YJfp7y8dyA9VaH1CfQi5isZ20JA9d1R1kQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FutNHQjF4tSCBMj20zYxp3vWi23tw/cA0qFlThPV5AM=;
 b=Daww6mCeKzwZeeiC3sm8yUwNypQITSE1bEl5LhB6pFunyxbg8GqyePjfV2dzGNRYOxWyBY/qPEYmSLCdYzhvvUzzv/yq0yZcHWBs/KeZ2Dbj5aTCp5IhVEO8eVvK+o+ADAdev+GHuzlHq0kAM0NziNDw3FZ7yn7Z3wLsQ7ifTKKmCkUVSKNLTYUBzCPyQhBkDFfPzNelu1duw1FetFThfWih1ZO09OhmnMQWXmeT2rthz6NybEQKH60ePiM9WT4ENpcg+omWcYPCLzosvA+hKMYm1WsjirABteH7tsBDsgXkY4CSUIM/ia4tjhxj81mt4AFllXAspAZL+OfGe/OT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FutNHQjF4tSCBMj20zYxp3vWi23tw/cA0qFlThPV5AM=;
 b=iYr3gTuOo7uqSYrL66+1JxQ14+q+pd8PLP0Pdl4RSOrMo9r3PKLuDVz7aC13Y1A9MgegFq35SvEQcAixWLEeTmBk0X5Bsz8ROL7srBRuP557efAmRIKCdIaHS66biQloWFFxBVKt4+LfZHtKhoEFLZ3FIYZ/ChI0Z1bXAjRcLyk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3711.namprd11.prod.outlook.com (20.178.254.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Sat, 2 Nov 2019 11:23:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 11:23:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: [PATCH v4 17/20] mtd: spi-nor: Merge spansion Quad Enable methods
Thread-Topic: [PATCH v4 17/20] mtd: spi-nor: Merge spansion Quad Enable methods
Thread-Index: AQHVkXACeUCnTgcovkmkK3mT3pOVhg==
Date: Sat, 2 Nov 2019 11:23:54 +0000
Message-ID: <20191102112316.20715-18-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 743deab5-efa9-42a0-8272-08d75f872523
x-ms-traffictypediagnostic: MN2PR11MB3711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3711B024DDF15D5DAA2CDF89F07D0@MN2PR11MB3711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(366004)(136003)(39860400002)(346002)(376002)(396003)(189003)(199004)(64756008)(386003)(316002)(446003)(4326008)(5660300002)(81166006)(6506007)(2616005)(76176011)(81156014)(11346002)(110136005)(476003)(25786009)(54906003)(8936002)(86362001)(486006)(14454004)(8676002)(102836004)(26005)(66476007)(50226002)(2906002)(6116002)(1076003)(2501003)(7736002)(3846002)(99286004)(71200400001)(36756003)(71190400001)(66556008)(256004)(305945005)(6486002)(6436002)(66946007)(66066001)(6512007)(66446008)(478600001)(186003)(52116002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3711;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7IC1P3RYNn8Th9UK32W3ybxMvc1Jf8v1zF3uPfOI6gs9dgpMOhBlrmpqJsdH3a2c1XBvzvsEF7W7ji1jSF5MtB60Oml0ycHDhAY1fw6Y/QaF9bJn6rFNrk/9v4rjXftWGhG75ZwllwHyEHM5v/2xFnRyS5Gbp1MM6LbtNWgsyBlvL1r8Xv0IviHy5iyE4ZY3qqohG4ExWPhVRnAV9YoQIVLgjHuqqiUOaUc0S4ryJwVcUfSSVz+a3qbKAmVZy7lwiojigZwL+SY6Wy1HKQ9zzl+KLmuwucEPPQT94F6hdRTVLm2Y3iNNLz556LmSr/t4M9UmFz0LILFrsOz5UGo7212dQVXxao3l47b7V48Zu1FhlUI/OQCoUzx08q/ss5OQ2uMk+8CRMIC0OlosJ6BtcJ1TqBvE0Nd2FVccaxIUu+VgxUwAA4YFg9Gmd0XHSAu
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 743deab5-efa9-42a0-8272-08d75f872523
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 11:23:54.7100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7illOSVfRZF7IzPiguOX2frRgp5tOYKOie+L5VEMX29AMIi7zO2zNNw1U3QAzX376OWi9C8vneM9DbEJ225IUModGB2vcaBJXeuh0Mr4t0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_042357_686936_D13F25AF 
X-CRM114-Status: GOOD (  14.98  )
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

Merge
    spansion_no_read_cr_quad_enable()
    spansion_read_cr_quad_enable()
into
    spi_nor_sr2_bit1_quad_enable().

Reduce code duplication by introducing spi_nor_write_16bit_cr_and_check().
The Configuration Register contains bits that can be updated in future:
FREEZE, CMP. Provide a generic method that allows updating all bits
of the Configuration Register.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 165 +++++++++++++++++-------------------------
 1 file changed, 68 insertions(+), 97 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e367a4862ec1..8bc29cc073a0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1055,6 +1055,59 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 }
 
 /**
+ * spi_nor_write_16bit_cr_and_check() - Write the Status Register 1 and the
+ * Configuration Register in one shot. Ensure that the byte written in the
+ * Configuration Register match the received value, and that the 16-bit Write
+ * did not affect what was already in the Status Register 1.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @cr:		byte value to be written to the Configuration Register.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
+{
+	int ret;
+	u8 *sr_cr = nor->bouncebuf;
+	u8 sr_written;
+
+	/* Keep the current value of the Status Register 1. */
+	ret = spi_nor_read_sr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	sr_cr[1] = cr;
+
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
+	if (sr_written != sr_cr[0]) {
+		dev_dbg(nor->dev, "SR: Read back test failed\n");
+		return -EIO;
+	}
+
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		return 0;
+
+	ret = spi_nor_read_cr(nor, &sr_cr[1]);
+	if (ret)
+		return ret;
+
+	if (cr != sr_cr[1]) {
+		dev_dbg(nor->dev, "CR: read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
  * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure that
  * the byte written match the received value without affecting other bits in the
  * Status Register 1 and 2.
@@ -2051,111 +2104,29 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
- * @nor:	pointer to a 'struct spi_nor'
+ * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
+ * Register 2.
+ * @nor:       pointer to a 'struct spi_nor'.
  *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function should be used with QSPI memories not supporting the Read
- * Configuration Register (35h) instruction.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
- * memories.
+ * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
+static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
 {
-	u8 *sr_cr = nor->bouncebuf;
 	int ret;
-	u8 sr_written;
-
-	/* Keep the current value of the Status Register. */
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	sr_cr[1] = SR2_QUAD_EN_BIT1;
-
-	ret = spi_nor_write_sr(nor, sr_cr, 2);
-	if (ret)
-		return ret;
 
-	sr_written = sr_cr[0];
-
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	if (sr_cr[0] != sr_written) {
-		dev_err(nor->dev, "SR: Read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/**
- * spansion_read_cr_quad_enable() - set QE bit in Configuration Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function should be used with QSPI memories supporting the Read
- * Configuration Register (35h) instruction.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
- * memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_read_cr_quad_enable(struct spi_nor *nor)
-{
-	u8 *sr_cr = nor->bouncebuf;
-	int ret;
-	u8 sr_written;
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
 
-	/* Check current Quad Enable bit value. */
-	ret = spi_nor_read_cr(nor, &sr_cr[1]);
+	ret = spi_nor_read_cr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-	if (sr_cr[1] & SR2_QUAD_EN_BIT1)
+	if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
 		return 0;
 
-	sr_cr[1] |= SR2_QUAD_EN_BIT1;
-
-	/* Keep the current value of the Status Register. */
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	ret = spi_nor_write_sr(nor, sr_cr, 2);
-	if (ret)
-		return ret;
-
-	sr_written = sr_cr[0];
-
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	if (sr_written != sr_cr[0]) {
-		dev_err(nor->dev, "SR: Read back test failed\n");
-		return -EIO;
-	}
-
-	sr_written = sr_cr[1];
-
-	/* Read back and check it. */
-	ret = spi_nor_read_cr(nor, &sr_cr[1]);
-	if (ret)
-		return ret;
-
-	if (sr_cr[1] != sr_written) {
-		dev_dbg(nor->dev, "CR: Read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
+	return spi_nor_write_16bit_cr_and_check(nor, nor->bouncebuf[0]);
 }
 
 /**
@@ -2235,7 +2206,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
  *
  * Read-modify-write function that clears the Block Protection bits from the
  * Status Register without affecting other bits. The function is tightly
- * coupled with the spansion_read_cr_quad_enable() function. Both assume that
+ * coupled with the spi_nor_sr2_bit1_quad_enable() function. Both assume that
  * the Write Register with 16 bits, together with the Read Configuration
  * Register (35h) instructions are supported.
  *
@@ -3753,7 +3724,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 * supported.
 		 */
 		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
-		params->quad_enable = spansion_no_read_cr_quad_enable;
+		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR1_BIT6:
@@ -3775,7 +3746,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 */
 		nor->flags |= SNOR_F_HAS_16BIT_SR;
 
-		params->quad_enable = spansion_read_cr_quad_enable;
+		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 		break;
 
 	default:
@@ -4738,7 +4709,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	u8 i, erase_mask;
 
 	/* Initialize legacy flash parameters and settings. */
-	params->quad_enable = spansion_read_cr_quad_enable;
+	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte = spansion_set_4byte;
 	params->setup = spi_nor_default_setup;
 	/* Default to 16-bit Write Status (01h) Command */
@@ -4955,7 +4926,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	int err;
 
 	if (nor->clear_sr_bp) {
-		if (nor->params.quad_enable == spansion_read_cr_quad_enable)
+		if (nor->params.quad_enable == spi_nor_sr2_bit1_quad_enable)
 			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
 
 		err = nor->clear_sr_bp(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
