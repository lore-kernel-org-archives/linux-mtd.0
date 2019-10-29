Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A00CCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06BF220663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QcDBEkfv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="HAIn1LhX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06BF220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iN8U2DF1at8hORizY5BMg/0PcOcbtPo5Y5R9cC6NFA=; b=QcDBEkfvJf+4SA
	UI9+BfV1ZiOhexvH8kcE4yyhGjKyqVs3FM7FCFXHo6pZpBYLXVeTNoT4muN2a1peCO7ntJoSCXaMP
	+6HRWkmAKXfi44PO28ItviCcvqWobvubSiNA0E+d6jo40GRfGOgHIrZR7u7wjga4WqlHK+3GOEdWE
	9NUYgk8OKgB7zuDXIB2Uy2cJiKNEpgjCYGtg6WUmiDmPH50Xl3EmWKfUa+Cklsiqk4D/XXMurWCp9
	kpOM/DMI4Cft1xVoMVaKkutLyHqSVRgMF6//pHcfR3BF0BZBA1ZGvCr8k54c9c+ojfFfZnDQtF/SR
	rL3u0YZg7bT31OGp32Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPY0-0006oi-Pd; Tue, 29 Oct 2019 11:20:24 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUs-0002h1-6s
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:12 +0000
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
IronPort-SDR: DISlY6m2kvLK+f24IbgFge7vN3F7Z11d1tVwTpDt7BoZrWF/n53A8pAMJsVVVVUdVf+MZ8qyki
 T+6cHakCGr4THGEcse+1fO0lZ8Lb3RH5h9/BdaZvuoFsExq5DtDkl6Qfb/gS1sdDLF5BuRB44C
 Jw3gcthvSuz9/zZecmL8Xc7ZfQHCeuMI4Bn4/3+dJm1u/zrghr6Uuu7UF44EBzaCbsJidcsZlq
 TZYRITFJ6IBoypMJGSbusXvOxITR2oUVh/THifBEEPOEBcuybPijpVGnIn6yaVb78iWtQrFzhO
 rRc=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54794558"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:07 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 04:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8QG8Cif0jB7p+L1FOR3xqGqVRp9fe+FIVV7FfxzhxXEUnWaO9tWUL1+OUgFrtTF8L3a3LGJtJGSgWECbFLjl5g1JY/9o5CwMXlnEi2TIeLUT5qmqhU9YPkMtZ8D9twbOJCW9K2I6hDkPohTzd3TYqAzfjC5TAaEBE0oYOBg2kGmWkdpKesh2GuEoqZBqkk4M1ytpmrHQDz7dEN5jtiq0bZN7poqQPHNVJJ6o2uZ+fbe28KTl3YAT74ucvhSEYA8Jzdn5gtsPIrbopLZAlLPI8e5FZK3SLosrpgw5+ars2bwd9LY4rBA9RYDMSKF/Ddbomh+pjblJXXxRYmNABvl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb9/f0DTQnUfsmphWgJ8rjD+7haO0npSYpXeNomgGTI=;
 b=NqHo0No0u+Da6DVb41ACcdqO6urGrS5FhKCGKk8S4O99ueaUOthOloI6YQiwTamSfmVayyV00gaUhktYHE/xewExhzS9PidSVfLYegIlSK2yV6KgT2cE28GeMgWX1IlRv9bm+JQP4HeAj6gKnHBL4DDV6Hzn3Tw7RGg1p+1NZUIgVu0fEi0D7KaF2Ks3281yMiloC2bzc2AqE5cPxk66RxB1vNDVJRgStYroWqMsvFfeHeFMNNR8BNY/LawxShiIIIqiZ9f7JshsPS4B2fYdIxex6997mW+E8e45udbCUM1n6aEO+LzyMgyszuDd1snKmCTlcUHC3Ytx08alVJTQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb9/f0DTQnUfsmphWgJ8rjD+7haO0npSYpXeNomgGTI=;
 b=HAIn1LhXUKXKHBz7JWO2uEiKUaVuuCWEYaGWz3D5LaFu5nvBxLc4sjj6AgbvzHlR6UwcJHfjylKHMm4lpJ7te52iq5073Ukio83BtL6flTxnYyTLOedcWenBPnozzpg3uu0cJjT6lp0RpL7OmyGPy+Ssx5tF+8B3eGw38gS5FJI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3823.namprd11.prod.outlook.com (20.178.254.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:17:06 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:17:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 11/32] mtd: spi-nor: Drop redundant error reports in Reg
 Ops callers
Thread-Topic: [PATCH v3 11/32] mtd: spi-nor: Drop redundant error reports in
 Reg Ops callers
Thread-Index: AQHVjkplMcJSJ7ucD0m8Dk/rmpqoYw==
Date: Tue, 29 Oct 2019 11:17:05 +0000
Message-ID: <20191029111615.3706-12-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 1fb8980d-adab-48b3-35e8-08d75c6187cf
x-ms-traffictypediagnostic: MN2PR11MB3823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB38239106B63FE887A3A50BFDF0610@MN2PR11MB3823.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
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
x-microsoft-antispam-message-info: Pcc/0L0YFD2koJaTi/jj34H+pSAheoCi98sH0zpUdBTjyaiFbWlLiNJPFbyvweAhXvgSb2RuvXMpToxwfA58UuYru8EB099vjWNV7MecoPX7L3bvSMG0/CSSu0h8Y3AgXk7IPVBtM+lKO2tgE9V0mks1U0fxSuoxBWmeaUz5Rxz3Qo1ZeGsuTY/p3oarcINT/LXvyynsBdx1ZIxKhGox8bW01STvQzU3c8lM5I4ZxqVGZnp5SHTfuN7GC9CGYhTohRGu6c2DyteQyc0Tzf1aUYYidGEZeltPN01bDTz6SKmbrdqVrIdiY6zPHIIWRp0JIeB7Sn9DdSQ+lBMUd7EGs/xt2iNoTqRZ2lzMGwTAsOWtVy/KZgeyaR8VR3T4CUuWWtKhDNK82ogpmsm9Bh0iM9ugdOZQVZwTrI5ZOgmL+QVJzY2gczRY05OcThnNxGgn
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb8980d-adab-48b3-35e8-08d75c6187cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:17:05.8340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39N0mRMXpldaXhZ4NrSklzUOo3Mv1cBElqcx8mCcxwIKuANIfu6spwbvvx113OrW8E52Xbmq3AbcsEn1V631VS83Wl5jVSY6iwVuDr21Lj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041710_456690_89B1A5EA 
X-CRM114-Status: GOOD (  12.14  )
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

Drop the error messages from the callers, since the callees
already print an error message in case of failure.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 50 +++++++++----------------------------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ec179eac2069..4a1ecf452a39 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -812,14 +812,7 @@ static int spi_nor_write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 		return -EINVAL;
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret) {
-		dev_err(nor->dev,
-			"timeout while writing configuration register\n");
-		return ret;
-	}
-
-	return 0;
+	return spi_nor_wait_till_ready(nor);
 }
 
 /* Write status register and ensure bits in mask match written values */
@@ -1853,10 +1846,8 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 
 	/* Keep the current value of the Status Register. */
 	ret = spi_nor_read_sr(nor, &sr_cr[0]);
-	if (ret) {
-		dev_err(nor->dev, "error while reading status register\n");
+	if (ret)
 		return ret;
-	}
 
 	sr_cr[1] = CR_QUAD_EN_SPAN;
 
@@ -1878,16 +1869,13 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
  */
 static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 {
-	struct device *dev = nor->dev;
 	u8 *sr_cr = nor->bouncebuf;
 	int ret;
 
 	/* Check current Quad Enable bit value. */
 	ret = spi_nor_read_cr(nor, &sr_cr[1]);
-	if (ret) {
-		dev_err(dev, "error while reading configuration register\n");
+	if (ret)
 		return ret;
-	}
 
 	if (sr_cr[1] & CR_QUAD_EN_SPAN)
 		return 0;
@@ -1896,10 +1884,8 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 
 	/* Keep the current value of the Status Register. */
 	ret = spi_nor_read_sr(nor, &sr_cr[0]);
-	if (ret) {
-		dev_err(dev, "error while reading status register\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = spi_nor_write_sr_cr(nor, sr_cr);
 	if (ret)
@@ -1954,10 +1940,8 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	}
 
 	ret = spi_nor_wait_till_ready(nor);
-	if (ret) {
-		dev_err(nor->dev, "timeout while writing status register 2\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Read back and check it. */
 	ret = spi_nor_read_sr2(nor, sr2);
@@ -1987,10 +1971,8 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 
 	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
-	if (ret) {
-		dev_err(nor->dev, "error while reading status register\n");
+	if (ret)
 		return ret;
-	}
 
 	spi_nor_write_enable(nor);
 
@@ -2000,10 +1982,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 		return ret;
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret)
-		dev_err(nor->dev, "timeout while writing status register\n");
-	return ret;
+	return spi_nor_wait_till_ready(nor);
 }
 
 /**
@@ -2027,11 +2006,8 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 
 	/* Check current Quad Enable bit value. */
 	ret = spi_nor_read_cr(nor, &sr_cr[1]);
-	if (ret) {
-		dev_err(nor->dev,
-			"error while reading configuration register\n");
+	if (ret)
 		return ret;
-	}
 
 	/*
 	 * When the configuration register Quad Enable bit is one, only the
@@ -2039,18 +2015,12 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 	 */
 	if (sr_cr[1] & CR_QUAD_EN_SPAN) {
 		ret = spi_nor_read_sr(nor, &sr_cr[0]);
-		if (ret) {
-			dev_err(nor->dev,
-				"error while reading status register\n");
+		if (ret)
 			return ret;
-		}
 
 		sr_cr[0] &= ~mask;
 
-		ret = spi_nor_write_sr_cr(nor, sr_cr);
-		if (ret)
-			dev_err(nor->dev, "16-bit write register failed\n");
-		return ret;
+		return spi_nor_write_sr_cr(nor, sr_cr);
 	}
 
 	/*
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
