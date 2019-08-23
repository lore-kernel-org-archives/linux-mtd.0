Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9EAC3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3457206E0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gsPM/HsR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="h54C5DJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3457206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gbjg30EyDkB5whgQ+U8Dc7mtRbXVjmAVoIjNasbxu8=; b=gsPM/HsRGygAx2
	f38ldeQirtvY9NwyGbCDwbLW+QxvGTChsse+T34XuML0j1dpiKBnph/LEGc7fcG06z+vLpz1VS2C1
	CDnwwRhNGxNrKCggiUjyKs9whnfhCsgOYmCiKCmI1RrwwObOt0qzLkEgRRCLSCq431ufvj1HuPb6H
	ywsgZlEZzM6cpxxdL7ci30tmexniYV6XzPZGum7kbTjzrEipLIm0MMPdb4B2NDJLQj6/sf3BsMHb8
	Uyj/v/7vBbLPtE5W/IJWvOyqi2fifrA0Zgw39FacH5ma9H3oT4Jgy4lHPcjQ/MI0GSUQAWMy1O52p
	snhWlPU48w4y5G5HIFKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1BtR-0002Va-KZ; Fri, 23 Aug 2019 15:54:25 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Bso-0001ha-Cw
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2019 15:53:48 +0000
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
IronPort-SDR: 7iJFScB31LJEYzlPggiHfV0kHJtE06gPMDerCML/LZESKjntqIL1pmAhN9XyHPtnNowo8ewEHP
 oSDQBysNFMfmBdeFacajn/r2I9T3ZgV2eCCB1uv8om3DnY/Cu0i826x3u8EjcTOftlINZkeDWH
 cm+Hr6nrD+XnDQWl6wVlqFhN2aAkA0nCpQW97FpCi59nrK2kAGPTfXFp1tYIXku9MyNGFo2tGZ
 832trfXxynkjTBTN9bifdbHC8gvyouzr7qIGdUPHuJ7wAmoCi8+s7x+uJmrExsb2erUmb14Byw
 qv8=
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="43468374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Aug 2019 08:53:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 08:53:42 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 08:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLhQS1bukMVqRmbF2lxmXgBKTcKDxOfilRS1GF8HS6RAgUAuszi+/2W0/bjpkib7Eyy1SxEx45AHenl2vkIIQvVCgX2nAGLxBkXYLeiQGMQeboDha2+ORJyKxb7kRwqjo4ziN7Fqm1dmD4mECOQxX/EHlYlG9oNU7vv/7l0QaZSRKbji/CKpx+D/VP8WKBPdQsDC+uq4b6bnEn3uGAsUX32V39G0rdZ2ec0t1kz7rbsrh/3Y4n7kpLfxCjwpIxuiot0qRPN1SODlPTQ/PNmsV+FxER579U3ht4NTjRmrMr17XFuhmgG5BAtBMiir8kCKjb0YKAv4/BZRndICk+BN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Eaeyro4qtw1x4VgNOjA83qPF2plieLNXUgqEYl3HaQ=;
 b=DJTA+E+T6c5N+Kj/ikRLeJYLcEvCXoKvck7hFbtlLhIZm7cqsCedM3tF3fmm6r2wHHZ/8avGdWuHi0u3KZYsUrKvfl4fWdjskDG73WvHB4h1Jg+tA8lq7dITsCTDPQ0KdDSGKAMhEnt/G080xXhwbFiEdcd2GyNfN8P3qF8CoE7f5t60DTU+76fOXCO6Eek9srVKzxd0PS3it8PBvNylRyJHiq9fKZjxBoYjcKO38ezzPHyURY+nmph7wRVL78WHE5N0GP/OIYyhdXDCVCHd8/MeZiEX9Z9xSXEL8PGmmiwj6iTFPYyICLi8w5Q/dRzket0EM05ns6d+61rIIqRsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Eaeyro4qtw1x4VgNOjA83qPF2plieLNXUgqEYl3HaQ=;
 b=h54C5DJelS6Lb4tqW7nHxj3CQYmhlp0H+SLHb4QpFKjnxRkw9zByHxuPwMjCWzSA1Q4VtCI680lL8DnRzQSmpBhNjgFT1mnuz9eMybsiPb4lFEDSSFd0/B+lFlmmhu9H1guWjX6+zUB5e3I90N5GhJxhSFRgg+/kuprOvYuqcuA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3567.namprd11.prod.outlook.com (20.178.251.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 15:53:41 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:53:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] mtd: spi-nor: Move clear_sr_bp() to 'struct
 spi_nor_flash_parameter'
Thread-Topic: [PATCH 4/5] mtd: spi-nor: Move clear_sr_bp() to 'struct
 spi_nor_flash_parameter'
Thread-Index: AQHVWcrvkrm6wR4a/Ey8Wo3jUNa/Dw==
Date: Fri, 23 Aug 2019 15:53:41 +0000
Message-ID: <20190823155325.13459-5-tudor.ambarus@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190823155325.13459-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f24a2e33-ad4a-467c-6504-08d727e211ce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3567; 
x-ms-traffictypediagnostic: MN2PR11MB3567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3567A29F2E507C7BAE6B99B8F0A40@MN2PR11MB3567.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(1076003)(102836004)(5660300002)(2616005)(476003)(71190400001)(71200400001)(6486002)(66066001)(256004)(386003)(486006)(53936002)(6436002)(446003)(2501003)(11346002)(36756003)(6506007)(76176011)(8936002)(86362001)(6116002)(4326008)(14444005)(3846002)(2201001)(6512007)(66946007)(26005)(186003)(25786009)(52116002)(99286004)(305945005)(81156014)(81166006)(7736002)(14454004)(66446008)(66476007)(316002)(107886003)(110136005)(2906002)(50226002)(8676002)(478600001)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3567;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: upN39s/Uoqf1hvVLEH8grBi1TP7/8/kdgzODVBhqPkVhOg0A5q9BLlvwYNAHzTGW9IUMn7fdSqO7Q1F0ePEIIVjctYfkmXvV39Vu7WzzcZd0FEiNjZXlMAq6ra4h961WzLiy1B0wYQ3jIMGb9YavqCHHFUIXuUDLFHtGqVSzkQMS13AINicDhv0jtsz6TyFpSNVZ8ba2nkV7Azkr+krOzKEqg9q25o6uu4zKIGFVYTIgBQZUtRIfwFwUlC8+78Lo1RVrp3W20M95iP2JyPU705/4MkcDf138cdRUx/4WXEe/syotM9zrfX3qKAyzxnVeD6PNpdBQ8D4GY/KoD1yXSzfI+9vq1ewVMr5xSUJsv0/5cIuguNVd44IyG3Ak/w0hnfzMqHLG583S9mxqZ49PzJORqoo9u31znG3nKGmD4mE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f24a2e33-ad4a-467c-6504-08d727e211ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:53:41.3214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eIxDnFgkB/igWqIr1daV274XeYYQsWBRv+X1i9WI2av40eSnMf/38ALWvXKRAIhV9NMUcEROzzOGvCDXnmeqqjwq1fOfzUzPLlRTo7AURng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_085346_489813_E440CCF0 
X-CRM114-Status: GOOD (  12.49  )
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

All flash parameters and settings should reside inside
'struct spi_nor_flash_parameter'. Move clear_sr_bp() from
'struct spi_nor' to 'struct spi_nor_flash_parameter'.

Rename clear_sr_bp()/disable_block_protection() to better indicate
what the function does.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 47 +++++++++++++++++++++++++++++++++----------
 include/linux/mtd/spi-nor.h   |  5 ++---
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6bd104c29cd9..15b0b1148bf3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4477,20 +4477,45 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params.quad_enable(nor);
 }
 
+/**
+ * spi_nor_disable_block_protection() - Disable the write block protection
+ * during power-up.
+ * @nor:                pointer to a 'struct spi_nor'
+ *
+ * Some spi-nor flashes are write protected by default after a power-on reset
+ * cycle, in order to avoid inadvertend writes during power-up. Backward
+ * compatibility imposes to disable the write block protection at power-up
+ * by default.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_disable_block_protection(struct spi_nor *nor)
+{
+	if (!nor->params.disable_block_protection)
+		return 0;
+
+	/*
+	 * In case of the legacy quad enable requirements are set, if the
+	 * configuration register Quad Enable bit is one, only the the
+	 * Write Status (01h) command with two data bytes may be used to clear
+	 * the block protection bits.
+	 */
+	if (nor->params.quad_enable == spansion_quad_enable)
+		nor->params.disable_block_protection =
+			spi_nor_spansion_clear_sr_bp;
+
+	return nor->params.disable_block_protection(nor);
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
-	if (nor->clear_sr_bp) {
-		if (nor->quad_enable == spansion_quad_enable)
-			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
-
-		err = nor->clear_sr_bp(nor);
-		if (err) {
-			dev_err(nor->dev,
-				"fail to clear block protection bits\n");
-			return err;
-		}
+	err = spi_nor_disable_block_protection(nor);
+	if (err) {
+		dev_err(nor->dev,
+			"fail to unlock the flash at init (err = %d)\n", err);
+		return err;
 	}
 
 	err = spi_nor_quad_enable(nor);
@@ -4635,7 +4660,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
 	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
 	    nor->info->flags & SPI_NOR_HAS_LOCK)
-		nor->clear_sr_bp = spi_nor_clear_sr_bp;
+		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
 
 	/* Parse the Serial Flash Discoverable Parameters table. */
 	ret = spi_nor_init_params(nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 17787238f0e9..399ac34a529d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -480,6 +480,7 @@ struct spi_nor;
  * @page_programs:	page program capabilities ordered by priority: the
  *                      higher index in the array, the higher priority.
  * @quad_enable:	enables SPI NOR quad mode.
+ * @disable_block_protection: disables block protection during power-up.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
@@ -490,6 +491,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
 
 	int (*quad_enable)(struct spi_nor *nor);
+	int (*disable_block_protection)(struct spi_nor *nor);
 };
 
 /**
@@ -535,8 +537,6 @@ struct flash_info;
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  *			completely locked
- * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
- *			the SPI NOR Status Register.
  * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
  *                      The structure includes legacy flash parameters and
  *                      settings that can be overwritten by the spi_nor_fixups
@@ -578,7 +578,6 @@ struct spi_nor {
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*clear_sr_bp)(struct spi_nor *nor);
 	struct spi_nor_flash_parameter params;
 
 	void *priv;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
