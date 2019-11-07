Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05F6C5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC9521D79
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uUZoxf6K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jhWSK8SM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC9521D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRyacPRQ8h1jx10B7zzdk4iUYAITTIR9o4heHm4VU/I=; b=uUZoxf6KPiHvUc
	Lc69hCAiP771/VjSdPTFFRExXSrsOSrc0leVbLDsXuQBQDMt9/7rzHxKMDlZVCImAc9biZYAhTDfK
	vVjjL+c1J/tWIXB00wMXOvzhkZPbEd2qrFcUyJ46n7Ex2Mef3MSR55X2GrDeBwER+0vnCA/ypRljS
	kl1qSMHlsYCOE//aQNnFoMifAq2aLLFw77dQL0rb/1ZwV2RsuAQw0EWlzdrWFcZPYdQf5evQXAYJZ
	Q8BAnVEJA1DGpdKKXmi5DWw8YhN2OuRep/hkX6ixyKSLkQvVmJg2PyhQY2d7pd5Cr+MFa8ay2+6UY
	6LnGWXJNFXhUOFMx/oXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdNv-0008Nn-Ic; Thu, 07 Nov 2019 08:43:19 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdMn-0007Da-PC
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 08:42:11 +0000
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
IronPort-SDR: vcORdMAPdjzkXQFfzy+++zkSN/REg6nvHjcEXC1PPjdltO3YothbwicKyVbL3hmwhffBH5j0Pi
 G0TYPGN//vk3+3qs4zjpfNjXBtFHAoGCqn0PS2tWlEIGTDtM33kQ27AtWJUefD0VJbo3z1NA3Z
 uRvn5d95TLMdMS6euaRbRjdvJWK60O5n+izTjnQwN2I6SUlDysNniY4rgavhbtk0SDwp7h6pSr
 Y9que6OX0DGrZl7ePjbnG7S5o+Ef3G02Qhq5gACBnvU3AOL3mzGxr2Xx8jVqgPxwmEf09+UQKg
 /f0=
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="54526227"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Nov 2019 01:42:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 7 Nov 2019 01:42:07 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 01:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUO4zpooOMofTG5i/c5wgKu5dSYy9Z68I4N6iitLI714dZE2CS2omhgT1yJu95yvhmJagtLl7aWbdsZz/cGVm00JBM+poSn44hEjF/lHi8E7nhQ6UxuWnTZ+/Q8e3ueRBXZP3Vx1zJok4pIBcT8yGq/6tokQXupBo6dawKqUSkZgVhY8Q/FNK6taEUgOpfe+FXzWiUvtJVsJbADIZppLR3Mvd2X8cpPy5S2pHtK2sQoTodhoeiPIEl0rnZPSHpjBSO6kj0k67WsWOAqFH6s5gd6RlbT8HYzxkrPAn4pYl6Dpx6uP7c23BdLSTOG163RCSaXKSgvnaHVN+OZgzzt3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYwjBi7l2bPwtbI0804Zdy6onuNY1w8nL0Tqt30cmsw=;
 b=BbElfXrsNRwFu1xBYJHaRdtmuX6Qenc3q7V+K+uvFFt2cxyy6up+aEEGkH6SirV5RZdWEjZmuL93GtTQpp3Eb5b5zr6CJ2BulZPYUW46QCuFzNc8lP4QxPeXwL7Z0VMN97IR1+8EQoxAsp2L1GI5yq84kjrZChaJVKIFeJ1X2RKoczpqdtY8RqB2aFeQjpBCsSgFG5NsUr98IoRk97C+dgsRBNt/oAtny+CNPM62IrtHGCYvHgrHQcf2Gzl1UHbNffmxtsD6xya+vLiMu57nNmm1fVOUPjKNAAalaoD4dorw8smqw4TGGZrhSitGd7uXzRyb1GAXSsiSpFmzMlC2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYwjBi7l2bPwtbI0804Zdy6onuNY1w8nL0Tqt30cmsw=;
 b=jhWSK8SM6+6pOlYqnbIrzJj3DdYf4HyYpHljMMa+Up7EXVpC5nv5oEUrLf7fxNO3ondCzuP2LLCqRpsEnxoXTFZYnsurEeAdLGXqCdMpyCdL07QrqAOAcI4sLzJzTM57o4yhF9Qmm7lmHqIxxnD7LnKas11mU6wv5w1whtbxy5A=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3824.namprd11.prod.outlook.com (20.178.253.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Thu, 7 Nov 2019 08:42:05 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.025; Thu, 7 Nov 2019
 08:42:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: [PATCH v5 5/6] mtd: spi-nor: Merge spansion Quad Enable methods
Thread-Topic: [PATCH v5 5/6] mtd: spi-nor: Merge spansion Quad Enable methods
Thread-Index: AQHVlUc7wKa9Qf0N4EaLGDzy7wccVQ==
Date: Thu, 7 Nov 2019 08:42:05 +0000
Message-ID: <20191107084135.22122-6-tudor.ambarus@microchip.com>
References: <20191107084135.22122-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191107084135.22122-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::40) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [109.166.128.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 994f7bc9-ca71-4627-eb75-08d7635e5d90
x-ms-traffictypediagnostic: MN2PR11MB3824:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3824EB74E3C02F1DB135A428F0780@MN2PR11MB3824.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(376002)(39860400002)(346002)(189003)(199004)(25786009)(6512007)(66476007)(6486002)(110136005)(66946007)(6116002)(66446008)(71200400001)(86362001)(54906003)(66556008)(64756008)(2906002)(6436002)(256004)(36756003)(478600001)(66066001)(14454004)(8936002)(186003)(76176011)(52116002)(316002)(2616005)(99286004)(102836004)(71190400001)(107886003)(81156014)(81166006)(4326008)(2501003)(26005)(1076003)(11346002)(305945005)(7736002)(446003)(6506007)(5660300002)(486006)(476003)(386003)(8676002)(3846002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3824;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ejq0f6wW+3NjzAKJmqnKdWkMcw2D5M3jkHhjQFbEpEkuSeoqqajrTmtz+v3kdGXq5AqM2y/spnqAKCzoY9NX+SAWwHqXAvu1sVYCaE3riLE9iPiJ0P2jSb+/fNT8kSBgtz7fRDung2KW+BnnIksXHiXy8Vp7spFERD3y/KT1bbWGa8QFq00Z6RZAuz30VhB/hXSPDVBOglQyYJBjcXpL/bPGBMXNo+Aad7NFCdnBKw9oZYGt7h8IWHmiXWKfD1zIcd+0IOFr4GVimWfmI+4bsPoe9ewR7jXEYOlE1/MfvQz19x19zxSOe79LwzLvM9fxOsQtVV4ohDlTSOY3wrjgaddi2E2WIM51a1mrPQAxba2002M8rfessIbjZc1CFe0GKFNIPch4h1c5qw7ymwzg4Urv2s7FezBXwO+5V5YR7oVYuebOhB2m8ID1ohQNfeNb
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 994f7bc9-ca71-4627-eb75-08d7635e5d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 08:42:05.2573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SoQIZwD1npVP6QP+06RXVZ5hgxALszqtFEbWwuTVbPfnmCWuri+hrLrt+7wlyBp/n4cBOZ121ywN/DuRQfVZo0gAVRqfH+PNv6Ch2BG0xVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_004209_850644_D7B64E39 
X-CRM114-Status: GOOD (  14.32  )
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
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 161 +++++++++++++++++-------------------------
 1 file changed, 66 insertions(+), 95 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8c59b5220e2a..16fb3c7d0daf 100644
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
@@ -3685,7 +3656,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 * supported.
 		 */
 		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
-		params->quad_enable = spansion_no_read_cr_quad_enable;
+		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR1_BIT6:
@@ -3707,7 +3678,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 */
 		nor->flags |= SNOR_F_HAS_16BIT_SR;
 
-		params->quad_enable = spansion_read_cr_quad_enable;
+		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 		break;
 
 	default:
@@ -4697,7 +4668,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	u8 i, erase_mask;
 
 	/* Initialize legacy flash parameters and settings. */
-	params->quad_enable = spansion_read_cr_quad_enable;
+	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte = spansion_set_4byte;
 	params->setup = spi_nor_default_setup;
 	/* Default to 16-bit Write Status (01h) Command */
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
