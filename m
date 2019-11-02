Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731F2CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:24:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BFE21906
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gkn01PTQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jl7TZ8+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BFE21906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErCmbOpkX4FeZ1uMJz3CkB4qtX+7tZHmytwU9AWrE/U=; b=gkn01PTQa9lv3s
	7kPA5dH3cxmP4yMzX9rNKDes38fRhvKpF2kofmkW3JOk0h/DcUoI5upjAoLRMcSLCrP1UiaCk1D93
	vMDnLbpy+a+r2zewDAYKQ+V590+Ez0yuGzpXIb5lEq9p61NSH696/vl638l1y/TDK7FtNE+ErABg9
	gY2iCWHYWeeV/TE+422Wa2cVU1VnVCbYMQ0fbnLOBkpwY68oqH4+JuhwydDEwmnuU82aa4QTep/Y5
	jGGvmt8OEwbJiYsykAtXSEFV0WkdgrEOLABIuue9EmYeYvYZoVS7utXQY3QumXY2IdrxuAu5RiIFg
	Dl85ec7Wvuf/9ei4+8yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQrVj-0002eF-1U; Sat, 02 Nov 2019 11:24:03 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQrVB-000273-Ig
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 11:23:31 +0000
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
IronPort-SDR: qDLzD/KfHprHlMDSNF2ywSCxOMRAb1xFd43jBlgOiImc5y5Nh+LP8A1VM+0HIYpoqtqyyQSDIE
 W0R9RqVWbaB+js+0A4uZ+Y4V6HGpsTM6UhHCA2XHyV8tnZIJWy0LCno3fQkLjo58WC3AsWxwTR
 w3sWqY8hZhOmC4x6IjBsomYyTbAy0DMIsAGW+SeQiNLOgVXHF6s+1R9s3BY8x59OWEc+mYFYUS
 uxXzlAKP96JnlteaoDWf7Ats1kBXRhi9niIWtN5LPEReSzlM2BHbwDrEVNGVijlB3G3vRAUf9/
 ceA=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53870298"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 04:23:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 04:23:28 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 04:23:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqDUsnfZ2Fny4SB8Yhk0z64tnTVK8S2eRNBTJYSPQaA+v0BHWY+1h9938vCXucuDPlzFFqTmea87fQBpiqcmvunVgDRmEUMAfDeaHoeZCtxcXlX9AU+UZJgxoI9WoQ7Alk80osQlxYsqAFnNhqlDymicvfBqYRzOWsJUdUmDCCDob+CJCtPHfyxUpbWuIPSCtXEARCeSUcvAmodE38mfuGWW3koEexLOYH+hjnr6sG2JetuOB2PHvfIi/b3MVG+oUQ9cbfG18KIMUihoDHD/7jJ6QEdDdR2Q4iD6ejRBlZDr4kzzsdoVQwZxRS5zHboAIp7IKSabW0yvSUYgvpMeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mchB9NvNsd08k9DZZpK5AL1eZJBxc7TyVha8KADn/ac=;
 b=WHg6IYTEMwOi8qRzQRD6O4g80HLu5DrdHRrciouFHbI95uhWuPsdudZHTo+hvmioqIrxosXGyG+1KE2FV0yi/rVXlRT4cyHP1bfSj4gzvhBYXsX2aXluR0Wfx0xA1uAU6Gx02ccXLMxAzZX7PebiMKtAeX6ry2oRQoBvARnsQTBBJsZEXXD1QyuHtkZ/y9lWPXZiy5ccIItGKXE/fsZZG5H3ts63dyPuj1qLG9GuH5zSTcJTqzpqvp/wWpBPWmX2u+/e+13Bf0+YMJ+PBZAzgoOMQmlLcZH0YhKDjTz7q013PoyAWdrhvUnEsJADO7ny/Qr6KRndwJ49Godp1tjGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mchB9NvNsd08k9DZZpK5AL1eZJBxc7TyVha8KADn/ac=;
 b=jl7TZ8+kEuDR+MQVKX0UtiHktJHMI075ic1m25sIEB2lJkmVkunAcHTq2F5xOpWebFov6gPjxNB2IHe8QHmaN59JCMeZ3NTVYsXxwwyprGCf6+njqKsmU03RVXMoSYB/SQ0E+49MOri2tRh4lIjdM53It6BiumObOMcr5WbFZBQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3711.namprd11.prod.outlook.com (20.178.254.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Sat, 2 Nov 2019 11:23:27 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 11:23:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: [PATCH v4 02/20] mtd: spi-nor: Print debug info inside Reg Ops methods
Thread-Topic: [PATCH v4 02/20] mtd: spi-nor: Print debug info inside Reg Ops
 methods
Thread-Index: AQHVkW/yKhSneiiRq0eaAq+0GWESnA==
Date: Sat, 2 Nov 2019 11:23:27 +0000
Message-ID: <20191102112316.20715-3-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 3dae966d-8cb5-42ec-0ddd-08d75f8714a9
x-ms-traffictypediagnostic: MN2PR11MB3711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3711C9CC3E8295B7B70ADFFAF07D0@MN2PR11MB3711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(376002)(396003)(39850400004)(189003)(199004)(64756008)(386003)(316002)(446003)(4326008)(5660300002)(81166006)(6506007)(2616005)(76176011)(81156014)(11346002)(110136005)(476003)(25786009)(54906003)(8936002)(86362001)(486006)(14454004)(8676002)(102836004)(26005)(66476007)(50226002)(2906002)(6116002)(1076003)(2501003)(7736002)(3846002)(99286004)(71200400001)(36756003)(71190400001)(66556008)(256004)(305945005)(6486002)(6436002)(66946007)(66066001)(6512007)(66446008)(478600001)(186003)(52116002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3711;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJhKeekVfYLu8HgKemQKJbpTbbeViMMvRxX8XmM22Qd1alWhCk3bs2uS8vyR2+qS3Hlb7kAbeYZ+9V/hgPtu/VbnVFxYtePcG9JDcXVsYWq6+vu22leHhLkkz39vvxD4/Nlpe+/CttiZ4qoaWxXfBPATmj9L3Zp4hDi7KjwkQSD1jfMKreQDYa7hp8g3dgD6NDOPssSTFa/tVxrVM92MCLb0eVwv1orQMrnXTfAINVt0fYtI94o+A5Cv35NhongI5UISU66bmaGVPKSmNRtExbgO3GuPNnYIFubYAEKHElu+66jpd7rFpXAmzuKXIEcuE9mC5smtG6fKzjWxlipZ3tPe1Al2hDfBns+QDdZ79iROordbdAyv+7ATzsmuJLirjtFEPAOphfzlk05M9sigIUAWAYsJ+paamre0Q7+rSDJsS5k9dgMMprrc5x6wcmFk
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dae966d-8cb5-42ec-0ddd-08d75f8714a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 11:23:27.1539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5nFjzCfMiFKWTIEmjIJmNh12xR8ccWCkKB9tqZZ9XPi4f0JJFYRV+xr6qyE0o4wHMyIS1koqT9hEn1TqxSXMZU6//4wWliOYs14NwdWXMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_042329_657142_C1CD9721 
X-CRM114-Status: UNSURE (   8.95  )
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

Spare the callers of printing debug messages by themselves.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 169 +++++++++++++++++++++++++++++++-----------
 1 file changed, 127 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index eca6bce7c336..0cb3122e74ad 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -394,6 +394,8 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
  */
 static int spi_nor_write_enable(struct spi_nor *nor)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
@@ -401,10 +403,16 @@ static int spi_nor_write_enable(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN,
+						     NULL, 0);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
+	if (ret)
+		dev_dbg(nor->dev, "error %d on Write Enable\n", ret);
+
+	return ret;
 }
 
 /*
@@ -412,6 +420,8 @@ static int spi_nor_write_enable(struct spi_nor *nor)
  */
 static int spi_nor_write_disable(struct spi_nor *nor)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 1),
@@ -419,10 +429,16 @@ static int spi_nor_write_disable(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI,
+						     NULL, 0);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
+	if (ret)
+		dev_dbg(nor->dev, "error %d on Write Disable\n", ret);
+
+	return ret;
 }
 
 /**
@@ -524,6 +540,8 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
  */
 static int spi_nor_write_sr(struct spi_nor *nor, u8 val)
 {
+	int ret;
+
 	nor->bouncebuf[0] = val;
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -532,15 +550,23 @@ static int spi_nor_write_sr(struct spi_nor *nor, u8 val)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
+						     nor->bouncebuf, 1);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
-					      nor->bouncebuf, 1);
+	if (ret)
+		dev_dbg(nor->dev, "error %d writing SR\n", ret);
+
+	return ret;
+
 }
 
 static int macronix_set_4byte(struct spi_nor *nor, bool enable)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(enable ?
@@ -551,12 +577,18 @@ static int macronix_set_4byte(struct spi_nor *nor, bool enable)
 				  SPI_MEM_OP_NO_DUMMY,
 				  SPI_MEM_OP_NO_DATA);
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor,
+						     enable ? SPINOR_OP_EN4B :
+							      SPINOR_OP_EX4B,
+						     NULL, 0);
 	}
 
-	return nor->controller_ops->write_reg(nor, enable ? SPINOR_OP_EN4B :
-							    SPINOR_OP_EX4B,
-					      NULL, 0);
+	if (ret)
+		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
+
+	return ret;
 }
 
 static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
@@ -572,6 +604,8 @@ static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
 
 static int spansion_set_4byte(struct spi_nor *nor, bool enable)
 {
+	int ret;
+
 	nor->bouncebuf[0] = enable << 7;
 
 	if (nor->spimem) {
@@ -581,15 +615,22 @@ static int spansion_set_4byte(struct spi_nor *nor, bool enable)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
+						     nor->bouncebuf, 1);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
-					      nor->bouncebuf, 1);
+	if (ret)
+		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
+
+	return ret;
 }
 
 static int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 {
+	int ret;
+
 	nor->bouncebuf[0] = ear;
 
 	if (nor->spimem) {
@@ -599,11 +640,16 @@ static int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREAR,
+						     nor->bouncebuf, 1);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WREAR,
-					      nor->bouncebuf, 1);
+	if (ret)
+		dev_dbg(nor->dev, "error %d writing EAR\n", ret);
+
+	return ret;
 }
 
 static int winbond_set_4byte(struct spi_nor *nor, bool enable)
@@ -628,6 +674,8 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 
 static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 1),
@@ -635,10 +683,16 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, sr, 1));
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_XRDSR,
+						    sr, 1);
 	}
 
-	return nor->controller_ops->read_reg(nor, SPINOR_OP_XRDSR, sr, 1);
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
+
+	return ret;
 }
 
 static int s3an_sr_ready(struct spi_nor *nor)
@@ -646,16 +700,16 @@ static int s3an_sr_ready(struct spi_nor *nor)
 	int ret;
 
 	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
-	if (ret) {
-		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return !!(nor->bouncebuf[0] & XSR_RDY);
 }
 
 static int spi_nor_clear_sr(struct spi_nor *nor)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 1),
@@ -663,10 +717,16 @@ static int spi_nor_clear_sr(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLSR,
+						     NULL, 0);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_CLSR, NULL, 0);
+	if (ret)
+		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+
+	return ret;
 }
 
 static int spi_nor_sr_ready(struct spi_nor *nor)
@@ -692,6 +752,8 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 
 static int spi_nor_clear_fsr(struct spi_nor *nor)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 1),
@@ -699,10 +761,16 @@ static int spi_nor_clear_fsr(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLFSR,
+						     NULL, 0);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_CLFSR, NULL, 0);
+	if (ret)
+		dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
+
+	return ret;
 }
 
 static int spi_nor_fsr_ready(struct spi_nor *nor)
@@ -839,6 +907,8 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
 
 static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 1),
@@ -846,14 +916,22 @@ static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_OUT(1, sr2, 1));
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2,
+						     sr2, 1);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2, sr2, 1);
+	if (ret)
+		dev_dbg(nor->dev, "error %d writing SR2\n", ret);
+
+	return ret;
 }
 
 static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 {
+	int ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 1),
@@ -861,10 +939,16 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2,
+						    sr2, 1);
 	}
 
-	return nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
+
+	return ret;
 }
 
 /*
@@ -874,6 +958,8 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
  */
 static int spi_nor_erase_chip(struct spi_nor *nor)
 {
+	int ret;
+
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
 	if (nor->spimem) {
@@ -883,11 +969,16 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		return spi_mem_exec_op(nor->spimem, &op);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CHIP_ERASE,
+						     NULL, 0);
 	}
 
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_CHIP_ERASE,
-					      NULL, 0);
+	if (ret)
+		dev_dbg(nor->dev, "error %d erasing chip\n", ret);
+
+	return ret;
 }
 
 static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
@@ -1934,10 +2025,8 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	spi_nor_write_enable(nor);
 
 	ret = spi_nor_write_sr2(nor, sr2);
-	if (ret) {
-		dev_dbg(nor->dev, "error while writing status register 2\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
@@ -1977,10 +2066,8 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 	spi_nor_write_enable(nor);
 
 	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] & ~mask);
-	if (ret) {
-		dev_dbg(nor->dev, "write to status register failed\n");
+	if (ret)
 		return ret;
-	}
 
 	return spi_nor_wait_till_ready(nor);
 }
@@ -2739,10 +2826,8 @@ static int s3an_nor_setup(struct spi_nor *nor,
 	int ret;
 
 	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
-	if (ret) {
-		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	nor->erase_opcode = SPINOR_OP_XSE;
 	nor->program_opcode = SPINOR_OP_XPP;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
