Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3602ECA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 17:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF4E20679
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 17:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rGCRYgH2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZHRJAZxf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCF4E20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SNphz1CnCk5zmfoUkRHX8Bc9iLOewLiwGljsK5QQNQ=; b=rGCRYgH2kQcylE
	r2SQsUYKBlJpSYjn/x3C+knJsE6zapjFFhenbKGzSPieq9hVXcAiALUYrjM1sB9qaI9vHZgPek1yO
	QWUKmepg6FOiVh4lD+3+rNv+GSuxe8ggswCZqN3qKPNx9/te8+q6QAk28MyYV57FJ0QzNNVylDuGZ
	9sp3P30U1hnKsDrXj+9/nMFfzsYo5yUDsvPns1W8tx1mKlAY/iebkn/vfKRdDSjdHUjUSGSIv+ekC
	h0hTyssXvufbA0wEej2rI7IQsKvnT9/s2x+j4vnUfnQR/sc23vMUTS62ByU0ezwj7AOsrM9uFsoFq
	rPuCATJfklR8WbyWZLiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMxrf-0000sx-WC; Tue, 22 Oct 2019 17:22:36 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMxrU-0000e1-Es
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2019 17:22:26 +0000
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
IronPort-SDR: 0RKxSv9E4PLQ8g31biF3y26A+QI8erBx3NtkTsp2Jr5yisKlte0o2nhjhuqVVNOw88zDOttTiz
 Xxy+QD5urb21/xUB/AB2ZleyOQsm8aSnHN1CKtSrWlLSay+Mm+bQ5SkotU80knc4kYxqfhxNEY
 01xcHWTKYX/MTg3Hc98H57/ifW0nkkuZq2/3hi8CrDlaX5cakotAS+zGGpH4WQ0RUjCcx6jTIE
 +0ic6tryx+ZXgz7Ib/WpfEaY0bvG9ymU6RxbjyDYFM56+j69HOD09ZFyoS+YzDUCHao6Nmv48I
 iNU=
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="53645336"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2019 10:22:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Oct 2019 10:22:22 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 22 Oct 2019 10:22:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ1m+RUclrDu222W1J3tsnD1D0DFbNx/LSiK0MM95opYovAYlYD2SWQqCw1d2t9oQ+DUlSph/9LqcR6cNTMjTCFD1Ls9sMhjgVVZI0lq3Bwacmwwjr36KkDDXcQp7GFMJYsH/s5JAXphDo2ptI70/KwYbK3LhX7SKei34tTF3BlQiPETZw0s2sEgxT/dkt42wJkOVTdALRhuIIicx3EBMZwZf3z8lfQcxxrI3paqMGT9SmvSXVZpQyCzdH7Qrp/L1fh1HeEwj7Lv1zqyKlgcYc1s0xI25n859P8vZ/xyz9AbXoLqGUah5TkYdyx9+DhJ1F8b/w+Ef5YQrFuCz8lfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WrB0UH9EmLIY29FFGUW3h3H8MicPjusy+mYTtVUwG0=;
 b=bPPJiRjAam0RL5bhEytiemwZw5UF1Zj8/IgFYYwxZRKK650fPckFo3xmnh7/ips6EhDuMJhykjk2c0C3Ifa0e38/t5C3itWlLML1vEwdQvVpniiECFEh7ZSvkaP13n0qzmcHLd8nYdaXeHQCZUc8WQ+zdWjn2+MDsnKnud2bxpsazN2MuPSIf/oQHTgokgMFrLmUZEeTRdbXJbzpSG0NHEhJdhR/TANRtQohSLoWl0N1+hBcRJg5Jziqq2WBY0dmHxEp9yRmvzvVE/9A/8HItSnsUNoZFRnlkZYbf2ZCu84cuy5dU1EW0mEZwe6wSoy9MfMlUqYIXqiCiEeVCK9vIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WrB0UH9EmLIY29FFGUW3h3H8MicPjusy+mYTtVUwG0=;
 b=ZHRJAZxfIhLRO2cCiaKDu70TmHfSyez2RH9007Myp3G6uBidrPTqHOuMTYijChQihoccgGAaudr6k5VmFBuIoQ+XEjKNrRE1gVMsNmkR+ZPFqLCB0YFLOp3LqPyfsGlxVyCDE4+95H1UIOrzTmaFVqnxp6uYUnFhTeHB6eE8pI4=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3855.namprd11.prod.outlook.com (20.178.253.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 17:22:19 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 17:22:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sagar.kadam@sifive.com>, <vigneshr@ti.com>
Subject: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for ISSI
 flashes
Thread-Topic: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for
 ISSI flashes
Thread-Index: AQHViP1Ciesy8UuDbU6ImldcZKusBg==
Date: Tue, 22 Oct 2019 17:22:19 +0000
Message-ID: <20191022172210.19865-2-tudor.ambarus@microchip.com>
References: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
 <20191022172210.19865-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191022172210.19865-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:802:2::40) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.183.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24877e9e-d3f1-4ce9-4046-08d75714646d
x-ms-traffictypediagnostic: MN2PR11MB3855:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3855F93094178A6922EA62CDF0680@MN2PR11MB3855.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(71200400001)(71190400001)(6306002)(6512007)(5660300002)(6436002)(446003)(102836004)(486006)(476003)(2616005)(186003)(256004)(66066001)(99286004)(1076003)(86362001)(6486002)(386003)(76176011)(6506007)(52116002)(110136005)(4326008)(11346002)(2906002)(26005)(14454004)(7736002)(966005)(6116002)(54906003)(305945005)(66446008)(66476007)(66556008)(64756008)(66946007)(107886003)(3846002)(36756003)(25786009)(478600001)(50226002)(81156014)(81166006)(8676002)(8936002)(316002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3855;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KX1EL6fwv6ztol+hdDsMHgZi0UQPiapxJv4uniwMUouS8LHyQUs5z44oNRjpqyLKXXzm8h7Jw9gARg9wAEnoonBVCB1icf0ji5RKM5VUUO/RefPwqmWdWVkTrgsjUpESyyhNCm6GX0HI8qWpbX2ImNKFT/2iCTmS4KOl1AUpdq6hA1/noy5u3nYH97x7hQeI1VhouSVTdcDwqKYvFrPSQzCu7j7F3vU8p9Ckrs42r003oZKrkBLtsukGMXbvvTXTIXJ3CrtPGN9GXC/0XuHu15AfS8qpSmOPwMOgrObtW1u03fqaQ0My4OhmpsuGmRoCWsgin3vseZMS6KeScex/C47Jl3q1CG6wXuF+kUUAyNryhY7wa81aet7QSYQIYZfUm3/wVMWOpkY4JlW6AUl+/jXVnLUVvU2C5DAQydET1kfmjekTV+n05CsRo55L2/IoB0cnTSeD8wVI+d/vNWGJqv/vP151DoTesiRcpH4/YK4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 24877e9e-d3f1-4ce9-4046-08d75714646d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:22:19.4287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AX3MM6SgwH8WojHye6GhOuOHFiJWSMsGOR0r6zlDEdnFdaxsbUc/isRQ5C2NnNHbJxoCgs5o2ZABOkDnebHiwZb+2Zqb8GC6PqUP+CtA0aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_102224_533532_F1995922 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Set the default Quad Enable method for ISSI flashes. Used for
ISSI flashes (IS25WP256D-JMLE) that do not support SFDP tables
and can not determine the Quad Enable method by parsing BFPT.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
[tudor.ambarus@microchip.com:
- rebase, split and adapt for v5.4-rc4,
- use PMC CFI ID for ISSI. According to JEP106BA, "Programmable Micro Corp"
  changed its name to Integrated Silicon Solution (ISSI)]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Sagar, this is needed just for the ISSI flashes that can't retrieve the
Quad Enable method from BFPT. It deserves a separate patch. Let me know
if you are ok with how I reorganized the patches.

 drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3fc1eb20dca5..122e5bedf4f2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4385,6 +4385,11 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return nor->params.setup(nor, hwcaps);
 }
 
+static void issi_set_default_init(struct spi_nor *nor)
+{
+	nor->params.quad_enable = macronix_quad_enable;
+}
+
 static void macronix_set_default_init(struct spi_nor *nor)
 {
 	nor->params.quad_enable = macronix_quad_enable;
@@ -4412,6 +4417,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 {
 	/* Init flash parameters based on MFR */
 	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_ISSI:
+		issi_set_default_init(nor);
+		break;
+
 	case SNOR_MFR_MACRONIX:
 		macronix_set_default_init(nor);
 		break;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fc0b4b19c900..b4636ff707ad 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -22,6 +22,7 @@
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
+#define SNOR_MFR_ISSI		CFI_MFR_PMC
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
 #define SNOR_MFR_SPANSION	CFI_MFR_AMD
 #define SNOR_MFR_SST		CFI_MFR_SST
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
