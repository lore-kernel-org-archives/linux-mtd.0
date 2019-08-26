Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC59C41514
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1629F2184D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCCmf3H3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="H5DTQqYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1629F2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0vftubVtiibGLQsdwSFZSLNRR4+BAuAPbzURJdjbGQ=; b=FCCmf3H3XLhqmM
	6wixLBIIPW3n2f08Wv7ugi310n0bUSO8Oj0M57WybrlmEcZeLHXFqrgzQkFQbRqBAikFSnkn325bO
	alFZZb2EtDUDNr/vHrL4Tmj+rqhFkqgo8ctYYBlhnxHHZACYz9d9En8rec+crBnwf3EGebAfRwSNh
	UE8x9njgfgLpQURSjR9EdZyzrPtVYS0T/+KDIBND331nCKlfrqiQqReB6Ppa0LuFUn7m6vibJwYCV
	9STNubRRNpFoxhT2Ga9lUm1ngLNDHEXvOMsiSWIM1yAhdSZKihTVT4uhwC68EOTjKZX7J02cSmvOF
	s8VMdfWeGoCT0FKoe+Wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Dnz-0002cD-H3; Mon, 26 Aug 2019 12:09:03 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Dnc-00029I-Ea
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:08:42 +0000
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
IronPort-SDR: TsYjKBeBeh4rqCzYiEh4c0J1KvcXP9tj8yVHEpeBr6q3H8IjDT/asl/Z331WISGPo2/fGH2e4e
 ok3H+01MAjk+2KUMJfC4YXflAhMEZNVW6EOKeDSxKQ3mMi7Bynjgih/Zofai+wtT/oZtGuc2ob
 wBLLdjx91/U2DFJ8Ua4Sb5F1V4dpCFUZ4UEioTRts48KcFfSKly5uUgKPs4//kzxZoXsqzEpOc
 KmV5X6EkgHSc/TAd7LUbQ5kFN5AESvItu6k61P1W1umXv1hwrCSt7RuGF/0MoElUpNYyjfXZN7
 ZSw=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46588644"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:08:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:08:37 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 05:08:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxE7D1vDquQNjEcB4/BAQE7dyDsnGPCzynMzmUBWyY0HPbtmFakIIHFhesVKAXSLVfhCNhfQNcsF5JqU7NPbj/jL1sWzibnWlcrmc6RHyKLq/Tdob3uLZkABVpK+JpE34wqsdknSwHyBL95diP6bqdCPmApR3QksN0U/ZHPsdOgGlYlmDAutGk73MYTQk9r0JFmP7wnKT8sjr1GwIHKM90RaJWLXkjd5Kj3XN40kh88uO31dKoakLTy6F2gGmru96pmzkwCeMFQFMouzM5C3cV5tDnottGpRcOwiK1QYk4gRHB2KmLBd6iO023Sr/5gJ8vAi7Lt8Ecmz5D+MGuev7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dvCftPXVjqfCZG1RlwZNZbXeH+NyMUjdEv6mgeOqrA=;
 b=hAYWG+j5gLrJPf8+4Ylgua+R/2zjMtn1xK9J4JBDkLXnH9RX+rEe2AbHEa7CSOxzxpbXQ96zyli+BssWTLDvdN3PfesAri+73xtW2NwzgnF1hN4QXKBMzUsfrI+DVB0Q6U8YUWEEeHzzoKB1DgdqLRpZqOBYS3EjpKXg6jB87TW5DdsPZkPNCYXdddImZlJxS6baVuQKA/7Xe/GNh9fOdjb16fX1q2S8IImhzECCO9cGDSSz6qlMNHjPXxIriwMiePWiTWGqulxMDNY4us3qsb6/vIVcv3Pa54qFdF/iMPlsmwqWCwigyUjgaUm4cJ+VOITpySTC6bxi+gtCV179yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dvCftPXVjqfCZG1RlwZNZbXeH+NyMUjdEv6mgeOqrA=;
 b=H5DTQqYpGHmnHDuv4WN9ku7Jk7IwYWXd2WmxtHUzniQV2GTmTSlNU6JEnzudLdn202frifMpBN6M7wVYKrZDOqQZB9HPTDsc3/qmJicLRoxCGwVPFj2vp0oA82b4Bo9v5DD2YJ//KCj/I37O7W3s7BpAJhAiojXVNgTbOtOi/Jw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3776.namprd11.prod.outlook.com (20.178.251.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:08:36 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:08:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v3 03/20] mtd: spi-nor: Drop quad_enable() from 'struct
 spi-nor'
Thread-Topic: [RESEND PATCH v3 03/20] mtd: spi-nor: Drop quad_enable() from
 'struct spi-nor'
Thread-Index: AQHVXAb946wbKymnL0+71ryjF/dWPA==
Date: Mon, 26 Aug 2019 12:08:36 +0000
Message-ID: <20190826120821.16351-4-tudor.ambarus@microchip.com>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826120821.16351-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0046.eurprd09.prod.outlook.com
 (2603:10a6:802:28::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8f9bff4-6d76-4d0d-2a37-08d72a1e1f94
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3776; 
x-ms-traffictypediagnostic: MN2PR11MB3776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB37763F952E0C829C5D0A62BCF0A10@MN2PR11MB3776.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(81166006)(81156014)(8676002)(1076003)(2201001)(2501003)(14444005)(256004)(26005)(7736002)(99286004)(66066001)(2906002)(76176011)(52116002)(316002)(186003)(50226002)(8936002)(66476007)(66556008)(64756008)(66946007)(66446008)(110136005)(53936002)(2616005)(36756003)(25786009)(5660300002)(386003)(305945005)(6506007)(102836004)(3846002)(6116002)(446003)(11346002)(478600001)(4326008)(86362001)(6436002)(6486002)(6512007)(14454004)(71200400001)(71190400001)(107886003)(476003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3776;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mk2JiNYoxXXHsoCd/+IUauF/DqWWJhSg0/Wsx9iUxPdQEFTBT0c7gkas70YGze+mG6arsVEs0ULgR8fEJqLK0d+1uxOKO2w+TIoH/VJcfeF7+Xqr1gquJXwmoE8yYW6T8M36H69Jfk8GrFq0FqR8b+iQyWXe0MZ01yaGCPWJvzN+685WcBegtIP+k9lkZGNJliu6tnuVqd+D6tL5SnUM7uvjlXpm3nLnV1HeQkSly4CPvQJOLhmEKSBiZXqQT9GBqcDg7HgIUdbq+Ryeg88SHUwvwdMEi6+e++e+FeoH5POT6fc4BNU0ybx+lYWiS926VVubpq0I/R1ghG3JKr9iYZNfnWDGd6MQLj5EZ9iQ/O72uPQvOxVgLQyc+qMgHNyyHe8oZxRbx6I1BiC53SFS1PGiAW1ljMGaQR2V1qdCO9o=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f9bff4-6d76-4d0d-2a37-08d72a1e1f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:08:36.5522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4y8ohpSl/QG+TgHNSeml4eITBvOIe8VlUJaLokkwJzVTMccZlFveT1zDtd8mQGUK0a8WCvWs/LUUhzSP1ohRO4bcgdW954gtYEoKdsfjSi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050840_705412_C17317F7 
X-CRM114-Status: GOOD (  13.19  )
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
'struct spi_nor_flash_parameter'. Drop the local copy of
quad_enable() and use the one from 'struct spi_nor_flash_parameter'.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
v3: Collect R-b

 drivers/mtd/spi-nor/spi-nor.c | 40 +++++++++++++++++++++++-----------------
 include/linux/mtd/spi-nor.h   |  2 --
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e9b9cd70a999..effda372cb33 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4403,7 +4403,6 @@ static int spi_nor_setup(struct spi_nor *nor,
 {
 	struct spi_nor_flash_parameter *params = &nor->params;
 	u32 ignored_mask, shared_mask;
-	bool enable_quad_io;
 	int err;
 
 	/*
@@ -4457,23 +4456,33 @@ static int spi_nor_setup(struct spi_nor *nor,
 		return err;
 	}
 
-	/* Enable Quad I/O if needed. */
-	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
-			  spi_nor_get_protocol_width(nor->write_proto) == 4);
-	if (enable_quad_io && params->quad_enable)
-		nor->quad_enable = params->quad_enable;
-	else
-		nor->quad_enable = NULL;
-
 	return 0;
 }
 
+/**
+ * spi_nor_quad_enable() - enable Quad I/O if needed.
+ * @nor:                pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_quad_enable(struct spi_nor *nor)
+{
+	if (!nor->params.quad_enable)
+		return 0;
+
+	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+	      spi_nor_get_protocol_width(nor->write_proto) == 4))
+		return 0;
+
+	return nor->params.quad_enable(nor);
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
 	if (nor->clear_sr_bp) {
-		if (nor->quad_enable == spansion_quad_enable)
+		if (nor->params.quad_enable == spansion_quad_enable)
 			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
 
 		err = nor->clear_sr_bp(nor);
@@ -4484,12 +4493,10 @@ static int spi_nor_init(struct spi_nor *nor)
 		}
 	}
 
-	if (nor->quad_enable) {
-		err = nor->quad_enable(nor);
-		if (err) {
-			dev_err(nor->dev, "quad mode not supported\n");
-			return err;
-		}
+	err = spi_nor_quad_enable(nor);
+	if (err) {
+		dev_err(nor->dev, "quad mode not supported\n");
+		return err;
 	}
 
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
@@ -4706,7 +4713,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
-	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 77ba692d9348..17787238f0e9 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -535,7 +535,6 @@ struct flash_info;
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  *			completely locked
- * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
  *			the SPI NOR Status Register.
  * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
@@ -579,7 +578,6 @@ struct spi_nor {
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*quad_enable)(struct spi_nor *nor);
 	int (*clear_sr_bp)(struct spi_nor *nor);
 	struct spi_nor_flash_parameter params;
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
