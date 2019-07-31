Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A60C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05DB420693
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cLWU/xzb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="0jbeVs4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05DB420693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oR5vL/ZupAiaCdxEaO0G8MLHiepo+rxS71mO0irlr5s=; b=cLWU/xzbpHB2CV
	IsU6BcR7kRYSKsq+KxSDcNieYnMSg7QnLgPNZmvK+bhjWvbawKxo99bZUPf6TOreMWh45+AHIOXu2
	+LVspJZVX1EcXvavT5Jfzg15sdUucsdgE/GYJmLouz+UBtMQTIxCTIKEKycTslteOi7ecTj2pSNHc
	0AXWGscGiyV31DanbJfGuiOzsRNPKBe6eg9kmgR/lrtY4T+7kDupMqDW50J0/TRl0cTuxp5SDrn1s
	IlZloM01Wtyl8ZD+iH7hkzOdN46S/yS9ABLN/1Cw6r9VRjcUwPZOvpg42dQpY4+GnbZLtDvMUTMtg
	1RIjNxtc0UhaQxM8CTSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskWy-0008CU-Jq; Wed, 31 Jul 2019 09:04:20 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hskWM-0007cQ-Dp
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 09:03:44 +0000
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
IronPort-SDR: NziBjMqNgZx4/WOPaty0WJhSAw6LYYpWeVXWg1BPOlze7JW0qx2qAkcukV7z1jE3WuILkzTija
 cB7rx1P0o9x+OV1MlWJF9BhifNnTArwAwi3F6gx2FXSZJJK9wqagvV1vdY7h80f/yj+G3aii9D
 sIVr8oQUHs+IDMr9aHaCsjs1yWfyRc9CWi/XHr8nOJeQyiPTIxrq2YBxATHA/zHpS8qi/juGv8
 8hveksnluuko76UFWR1FHiUmbl0g9jkdjk7yOJRWd5cvMS19DjLaVmeAK6dOK44XrOAhm0k1Cj
 +js=
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="43382571"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jul 2019 02:03:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 31 Jul 2019 02:03:38 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 31 Jul 2019 02:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h67NmcZ+MzS9b/ACiDorUbrX7yKSzILRxvhlLKdIff06kSpDRc/IxK81duSZBSHHk2wv2490tdBUYlaRWslfgwf9v+kXPgb8TmQo4PN5F7vGF6+pwbCm7LF4iNxYacyzIS6HFP0pf2LH3dOjSTqGg+MtxeQt+OtdbPo+cyJY+mDVoylhFIHkerBqqfVOKtKQCTEXg/jnlUPHJmnAmw7Sbx3AhweMV4a5iUV56cOcS0L8awuLybtViXbakJ+JvUZ7yqfTxG+HOu9mZPT1aAQUw/2LPXqbWutjRATLFyB/UAtADp+hTz+Gszd17QWkAROaVIBNGabMHSLOuY55IuFhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5cCPolmXgvGFmkQ0AA2m2XDnjaSw4DzepMc/tVjg+o=;
 b=YnxE0BijgpGnWfQM4ADUdGeqyrG9joAmy4ofMy3HWQvbY2aaIz3avJH+ldUWdfU5EzJ20p2sAR7q5pVpaG1Hhm63AL0Uy8LhXrMowkWGRc/s90uyZYaKW7QCPUEh+8NOlC1mWVvIdw8MshOIjTh2QQmqgU1xj2t1qB2hPpxCzfggG7YEtIBfrHfoIVvSVvVvoiUXy4Hup0F+YmMgN8tVtiN1sEfWXO2/K1PC16ivPs+0NEuln/1BqNhbsD2PdI4TdaUskL0OcXUoQ0C5L4INcC98F2TCjfAb1P3C8CxVA5pwVWYH8EmbNyzlsVP0kVr8aK0llSrKiQKf8sWfFvRhJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5cCPolmXgvGFmkQ0AA2m2XDnjaSw4DzepMc/tVjg+o=;
 b=0jbeVs4wqFXlwoz9OjgUZWgI90Sp/2+++05d6BScbuajrAOBDgLHeytl9WkKHob0G350o+uhIa50Hu6LWMDcLbOUa8YMw1E/iRpqUq7M71OpTXqMP8q5EAlOcJtGRbnvhHIpWqfZrFwoTd15Iw6ET0p5WCzXVXJIAgvHQmijOeE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2SPR01MB0050.namprd11.prod.outlook.com (10.255.239.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 09:03:35 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 09:03:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>
Subject: [PATCH 5/7] mtd: spi-nor: Create a ->set_4byte() method
Thread-Topic: [PATCH 5/7] mtd: spi-nor: Create a ->set_4byte() method
Thread-Index: AQHVR37V+qfQ27uWy0qv2gn21v57wg==
Date: Wed, 31 Jul 2019 09:03:35 +0000
Message-ID: <20190731090315.26798-6-tudor.ambarus@microchip.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190731090315.26798-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:803:50::41) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4b4fb4-7490-4de8-301b-08d71595f823
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0050; 
x-ms-traffictypediagnostic: MN2SPR01MB0050:
x-microsoft-antispam-prvs: <MN2SPR01MB005010571BAE71E19279C024F0DF0@MN2SPR01MB0050.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(346002)(396003)(136003)(189003)(199004)(6116002)(3846002)(50226002)(53936002)(36756003)(54906003)(7416002)(305945005)(8676002)(81166006)(107886003)(2906002)(81156014)(6436002)(316002)(26005)(66476007)(66946007)(64756008)(66446008)(66556008)(6486002)(68736007)(8936002)(6512007)(86362001)(5660300002)(25786009)(1076003)(110136005)(7736002)(186003)(4326008)(11346002)(446003)(102836004)(386003)(6506007)(256004)(2616005)(476003)(52116002)(99286004)(76176011)(478600001)(2501003)(66066001)(14454004)(14444005)(486006)(71190400001)(71200400001)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0050;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9PBj7OA0/JIfmBDUPeOrZyR0j1k1Nup/gm+bsswNmI+kM18H48HxsML+UzmHPXtORjaczA7ZZRWiyYxfu03/y+8hXXJAxelOMIF1fYF8A08PV8idPT0V5RJE26RwIYgpd3gYOFFHKPv9iJ6d9gMZs+IEG9XQb6DNWJun9VlmPc4Hn6sQbbBIV9LIk8D43CknkjW96nNAYgRpi7WDcmHjP78GLigVESeBJxm0RlFwPkhjTBi40asZcWK8PXhJMmuMqQc9D5mZPkvXGESfwbTuzvQlBx9ScGOWU7t4LMD1E1hDm1fOoaft1plsVTEv76ZjBeMIzLq17lo6dzvl950PS/Hixh8YwvGo+O+X5NVrYEG+goBC7yIMY2VHiCxUmGqr0N3h9W+/3aaBh7177KgcPpDDL9V//7R+tyYRLfAtBoo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4b4fb4-7490-4de8-301b-08d71595f823
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 09:03:35.5231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_020342_508344_C8A35305 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@bootlin.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

The procedure used to enable 4 byte addressing mode depends on the NOR
device, so let's provide a hook so that manufacturer specific handling
can be implemented in a sane way.

set_4byte methods can be amended when parsing BFPT.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 119 ++++++++++++++++++++++--------------------
 include/linux/mtd/spi-nor.h   |   3 ++
 2 files changed, 64 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b2e72668e7ab..e35aae88d38b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -758,6 +758,21 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	}
 }
 
+static int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
+{
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREAR, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(0, NULL, 1));
+
+		return spi_nor_data_op(nor, &op, &ear, 1);
+	}
+
+	return nor->write_reg(nor, SPINOR_OP_WREAR, &ear, 1);
+}
+
 static int macronix_set_4byte(struct spi_nor *nor, bool enable)
 {
 	if (nor->spimem) {
@@ -777,6 +792,39 @@ static int macronix_set_4byte(struct spi_nor *nor, bool enable)
 			      NULL, 0);
 }
 
+static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	write_enable(nor);
+	ret = macronix_set_4byte(nor, enable);
+	write_disable(nor);
+
+	return ret;
+}
+
+static int winbond_set_4byte(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = macronix_set_4byte(nor, enable);
+	if (ret || enable)
+		return ret;
+
+	/*
+	 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
+	 * Register to be set to 1, so all 3-byte-address reads come from the
+	 * second 16M.
+	 * We must clear the register to enable normal behavior.
+	 */
+	write_enable(nor);
+	nor->cmd_buf[0] = 0;
+	ret = spi_nor_write_ear(nor, nor->cmd_buf[0]);
+	write_disable(nor);
+
+	return ret;
+}
+
 static int spansion_set_4byte(struct spi_nor *nor, bool enable)
 {
 	u8 quad_en = enable << 7;
@@ -794,62 +842,6 @@ static int spansion_set_4byte(struct spi_nor *nor, bool enable)
 	return nor->write_reg(nor, SPINOR_OP_BRWR, &quad_en, 1);
 }
 
-static int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
-{
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREAR, 1),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(0, NULL, 1));
-
-		return spi_nor_data_op(nor, &op, &ear, 1);
-	}
-
-	return nor->write_reg(nor, SPINOR_OP_WREAR, &ear, 1);
-}
-
-/* Enable/disable 4-byte addressing mode. */
-static int set_4byte(struct spi_nor *nor, bool enable)
-{
-	int status;
-	bool need_wren = false;
-
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_ST:
-	case SNOR_MFR_MICRON:
-		/* Some Micron need WREN command; all will accept it */
-		need_wren = true;
-		/* fall through */
-	case SNOR_MFR_MACRONIX:
-	case SNOR_MFR_WINBOND:
-		if (need_wren)
-			write_enable(nor);
-
-		status = macronix_set_4byte(nor, enable);
-		if (need_wren)
-			write_disable(nor);
-
-		if (!status && !enable &&
-		    JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND) {
-			/*
-			 * On Winbond W25Q256FV, leaving 4byte mode causes
-			 * the Extended Address Register to be set to 1, so all
-			 * 3-byte-address reads come from the second 16M.
-			 * We must clear the register to enable normal behavior.
-			 */
-			write_enable(nor);
-			spi_nor_write_ear(nor, 0);
-			write_disable(nor);
-		}
-
-		return status;
-	default:
-		/* Spansion style */
-		return spansion_set_4byte(nor, enable);
-	}
-}
-
 static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 {
 	if (nor->spimem) {
@@ -4287,11 +4279,18 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 static void macronix_set_default_init(struct spi_nor *nor)
 {
 	nor->quad_enable = macronix_quad_enable;
+	nor->set_4byte = macronix_set_4byte;
 }
 
 static void st_micron_set_default_init(struct spi_nor *nor)
 {
 	nor->quad_enable = NULL;
+	nor->set_4byte = st_micron_set_4byte;
+}
+
+static void winbond_set_default_init(struct spi_nor *nor)
+{
+	nor->set_4byte = winbond_set_4byte;
 }
 
 static void spi_nor_mfr_init_params(struct spi_nor *nor,
@@ -4307,6 +4306,9 @@ static void spi_nor_mfr_init_params(struct spi_nor *nor,
 		st_micron_set_default_init(nor);
 		break;
 
+	case SNOR_MFR_WINBOND:
+		winbond_set_default_init(nor);
+		break;
 	default:
 		break;
 	}
@@ -4685,7 +4687,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		set_4byte(nor, true);
+		nor->set_4byte(nor, true);
 	}
 
 	return 0;
@@ -4709,7 +4711,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
-		set_4byte(nor, false);
+		nor->set_4byte(nor, false);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
@@ -4801,6 +4803,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	/* Kept only for backward compatibility purpose. */
 	nor->quad_enable = spansion_quad_enable;
+	nor->set_4byte = spansion_set_4byte;
 
 	/* Init flash parameters based on flash_info struct and SFDP */
 	spi_nor_init_params(nor, &params);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4521a38452d6..a434ab7a53e6 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -378,6 +378,8 @@ struct flash_info;
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
+ * @set_4byte:		[FLASH-SPECIFIC] puts the SPI NOR in 4 byte addressing
+ *                      mode
  * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
  *			the SPI NOR Status Register.
  *			completely locked
@@ -420,6 +422,7 @@ struct spi_nor {
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*quad_enable)(struct spi_nor *nor);
+	int (*set_4byte)(struct spi_nor *nor, bool enable);
 	int (*clear_sr_bp)(struct spi_nor *nor);
 
 	void *priv;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
