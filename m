Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DA9C04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 11:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71237205C9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 11:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jRnqItM/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AyePq5Bh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71237205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YjBy9EQVzdM6BF2O9a5y4lTBKXFAqKS6yHSImPO0i/M=; b=jRnqItM/Z3uO3j
	Rcvn6cAnkxMT/32YIYsk3pkaQRAbzIu2GZibmdJmdgHIxXt6E3V8IVz5CGXS/UvnAU7Cvf2aCXeyU
	jooBPdWkMJ+UjEH8vmkXGm3A5gXYY0tpTPteN03uw2F9R9axizCrilorPR2/poAMcKh2R2OWQabm7
	IPX6c7LnNzMtoOaVh7Q9HIwA3Sht6Xrpfdg9aF8d51kg2zoUvEgbtSWRvEn7j/8vCeltG5u1MdJVx
	K5MEP3Xjj7vIjl0DBIYYJyRODqyhDNP+taZiNwfpPuZAfrCjeDRf7cF3QULdwjWXxud7CsRaEIb9x
	1EYXzi080C1Un3C/LKlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hREr9-0004hy-BM; Thu, 16 May 2019 11:47:27 +0000
Received: from mail-eopbgr150085.outbound.protection.outlook.com
 ([40.107.15.85] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hREqp-0004Jj-Gn; Thu, 16 May 2019 11:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzOIwmh2Z3i35IQzF5tBPO+2vDsk3n+TKO85pffU7cc=;
 b=AyePq5BhAgyoHVND7pxza29XwSRaRHpAtKG5BrUThhNblgMspA0coyGxGO1AUYdeFp3O2GF/4vZA+mHxEQTqM4xp429IDOQGPQ5ezTc/Q0tc0aOkcKUk0lPovN7U6Onx8Yq6KZLDWU029J8YBUaR3UDFLDqBgWze6UFHAZt9MF4=
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com (52.133.43.147) by
 AM0PR0402MB3793.eurprd04.prod.outlook.com (52.133.41.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Thu, 16 May 2019 11:47:04 +0000
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::f891:76d:8a6a:3dfd]) by AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::f891:76d:8a6a:3dfd%2]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:47:04 +0000
From: Kuldeep Singh <kuldeep.singh@nxp.com>
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] arm64: dts: ls1012a: Add QSPI support for ls1012a
Thread-Topic: [PATCH] arm64: dts: ls1012a: Add QSPI support for ls1012a
Thread-Index: AQHVC90UTCiz+BGzB0G+bjSJzqfmRA==
Date: Thu, 16 May 2019 11:47:04 +0000
Message-ID: <20190516114807.30817-1-kuldeep.singh@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR01CA0117.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::33)
 To AM0PR0402MB3556.eurprd04.prod.outlook.com
 (2603:10a6:208:17::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kuldeep.singh@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [92.120.1.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fe0daaf-8855-498e-089b-08d6d9f4372f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR0402MB3793; 
x-ms-traffictypediagnostic: AM0PR0402MB3793:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM0PR0402MB3793B05353A5DEB62647B9F8E00A0@AM0PR0402MB3793.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(53936002)(44832011)(476003)(2616005)(486006)(2501003)(6306002)(68736007)(3846002)(73956011)(71190400001)(6116002)(186003)(71200400001)(86362001)(4326008)(64756008)(66556008)(66446008)(66476007)(50226002)(6486002)(66946007)(7736002)(14444005)(6512007)(99286004)(305945005)(256004)(8936002)(36756003)(110136005)(81166006)(81156014)(478600001)(25786009)(1076003)(52116002)(26005)(66066001)(2201001)(8676002)(386003)(966005)(2906002)(102836004)(5660300002)(6506007)(14454004)(316002)(54906003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0402MB3793;
 H:AM0PR0402MB3556.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oSXXLbUM3Zyoh4b8rzH6oZlqmErH4f+SmKgOVbuUxXpzTGqOmlCkhvYfIhkyaoq9yOh1IqpcN7wPdc7CSkWa9XGMIli04DLDMxJvTI76zB4A7VSiRpTXkoVW/0DokRIffzU7/MCcPS9aQq5x+Z7FVEuu2RD/zmVwqGVXE5qA5REDoG7AZjaGHsnesfwGyseoWpk2F//x0mU7y1cAhs9QT9jB2HRQeOklvuALgPKBD2R92C6P8QBiLti07mk8HTN+2r4gYYw+VxPtQEhlNcjqlzH07OfqfeZUNcZr8t6L5fUErob5bnJuVloLEvvU0x7EeqNXgMQbd3CXV4WPIWSLyjXpZEoIjoGpXzmijtE85uV/KWptT6fI9zM6zcmTErypHD8eW5jXrNUrAGYDGzb2srIHMzYvkvzWkjBuNJB3/5Y=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe0daaf-8855-498e-089b-08d6d9f4372f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:47:04.2419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_044707_556874_C3F1CE02 
X-CRM114-Status: GOOD (  10.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QSPI support is added for kernel version greater than 5.0 and supports
quad mode defined by
TX-WIDTH = <4>, RX-WIDTH = <4>

RDB/QDS has one 64MB flash from SPANSION(s25fs512s)

Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
---
Dependency on https://patchwork.ozlabs.org/patch/1100471/
Dependency on https://patchwork.ozlabs.org/patch/1100472/

 .../arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 15 +++++++++++++++
 .../arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi    | 15 +++++++++++++++
 5 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
index f90c040fd5e8..8826278b37bf 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
@@ -61,6 +61,21 @@
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	qflash0: flash@0 {
+		compatible = "spansion,m25p80", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
index 8749634c55ee..0246e8c97628 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
@@ -20,6 +20,21 @@
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	qflash0: flash@0 {
+		compatible = "spansion,m25p80", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
index 2fb1cb1f7d8f..c304fa20c1c9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
@@ -90,6 +90,21 @@
 	};
 };
 
+&qspi {
+	status = "okay";
+
+	qflash0: flash@0 {
+		compatible = "spansion,m25p80", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+};
+
 &duart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
index 5edb1e137a52..6017e9cfe40a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
@@ -38,3 +38,18 @@
 &sata {
 	status = "okay";
 };
+
+&qspi {
+	status = "okay";
+
+	qflash0: flash@0  {
+		compatible = "spansion,m25p80", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index ec6257a5b251..268268c6a149 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -350,6 +350,21 @@
 			status = "disabled";
 		};
 
+		qspi: spi@1550000 {
+			compatible = "fsl,ls1021a-qspi", "fsl,ls1012a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+				<0x0 0x40000000 0x0 0x10000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
+			big-endian;
+			fsl,qspi-has-second-chip;
+			status = "disabled";
+		};
+
 		duart0: serial@21c0500 {
 			compatible = "fsl,ns16550", "ns16550a";
 			reg = <0x00 0x21c0500 0x0 0x100>;
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
