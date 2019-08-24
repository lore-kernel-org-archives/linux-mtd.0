Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6C5C3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A95121670
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WtUzKvjg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="W1MDJT78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A95121670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoOEK4WjwONg99qf3Y8QAnMau/0mneRhxfLd5j+oAU0=; b=WtUzKvjghEWQVB
	3JsbuhpiyUz9kO0bHW1AKfu8hdxSFeOS5HS9NCNCFuzE4JIcEN1rzlukDKnqAsjwgrAQVccv2R5B9
	aP0L2hisRZgkHhH11BHZDz59H/Dx67cDPVjMlfo4PAWFsNBkWMSG2gla47BL1elwbBHIXxUcWbp07
	BUpkB+5qcdrck9DXO/m/E1fgDUiqfM6wmNa2xSF3cgdCWaEUnLwefAsXKBETK9C9uS7+exhmbl3wE
	+hvwR4Wpt/9W/CSsOMsmzKMev2Jq7x4bdR1dsH2fAt4XTGdtRYyBJ1ExBHx5yJCKjtgu7hXNFfWFw
	5t9gDjCm7gyInR8wrJWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Uk2-0002Gy-T4; Sat, 24 Aug 2019 12:01:58 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Uiw-0000xe-CI
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 12:00:52 +0000
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
IronPort-SDR: c1Vdp0P3+EzbMWyzJMy80F4f8F6uwjf65nikUVdWWnWmy08sjT2JBQMAA6SF/79RxR5/tN3et3
 lkGZnyoVs33XWWc6FvHlGTpNdzNd4X2siiENyx6bKGUZTlfGvcIqpP7uqr7N8CuHDtoA/VeOsx
 mppiXDJE5v0pRhHdjH7xG5bX/8Rc8tcEB0wU4QTYxncArlAoSi8uUTdYtGTFgHN1mrwa/wkDwB
 GB+l7bbwj3LkruzgS64evsiRQssVGQkV3wQpZ20c6JDOq0cYehfMzDz+A3s6gMV2CYbh+WycEt
 qYg=
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="46392218"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Aug 2019 05:00:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 24 Aug 2019 05:00:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 24 Aug 2019 05:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9tsoGS9+hCgYg51FIoXbb2HVSlgBkP1M4bnM1QGi3D6glT0Tb1F6tGvqXgXr0eWkn6nXsCjJc4WUXojWyRJgGc2bTCa/b2Mgb1e6dDVSMtDoGMqjU1DZdbL35jFuZjVQniipvo3+BYHPfjw+hAR5xJSv28JQvMcoFYQU+xBF2WvtQf+SY2s1cTROkYxfLzqA1Wa3odqS2kRl894qGQMxIxaUzniPX38X1UZUytIM6ZQLQ5YRFupiOYJyBQUVJhaqLZrJxb1vQaHSf/R1bcvWit/AA2XoCAA9o8MOjrCj+hYlO2VcE3jwuBwpyEUCXQLf9DSHoYs4BmUtfiH0NSlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtejNZ5NRoErOrPtbNAaLcax9+0A/cP12e4n3qJdJc4=;
 b=ikJgNbRx5DmIUDDMEkPp8BE0cfJQZkE+Z1JoHfIH8rfmbohJRTHdeeWVpjHntRgJ0pSadQesAmXGgboMwCJJTX9lWWfUlZd/fCg/a5MlC0YGmc3J5/uDSd1N3IwExrKmHWm/PWyAL3lrsZP5ewhX+RFp8PF3gw8aUohO3WHONy0Omg0UoJKIyWgs3+Ic79h7LeCH6oRiKoOGUeuw93TXjNyI1/0B8otCisYLfQgmlLETuQT31lIWtMHlkxBKnIICKI4H78PBvt9IJYI0jZ5UIsfjjdQlPifVq+9FKJ+ADmygxxQyJ4usofSdk4wv3Rc0sn2iqFLb7YuZOUpGJYz6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtejNZ5NRoErOrPtbNAaLcax9+0A/cP12e4n3qJdJc4=;
 b=W1MDJT78Se3bnTzEF41IIaDa0mMU3U83Imht1FqdFJkDPcieePOG37nLRlRbqJNj4w5r2esXC+9GsBht740imMn3XMtRG3BKf4+juamXbH7JN1FQpzBRfa77/GSvFd+k/qR5ttjoqjVdewCaTW1xrtp0Vt9PNTrhlO8BUEnEnNM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3984.namprd11.prod.outlook.com (10.255.181.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 24 Aug 2019 12:00:47 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 12:00:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/7] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
Thread-Topic: [PATCH v2 6/7] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
Thread-Index: AQHVWnOQaAxxvWwKPEiv+nDPOfoC1A==
Date: Sat, 24 Aug 2019 12:00:47 +0000
Message-ID: <20190824120027.14452-7-tudor.ambarus@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190824120027.14452-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0194.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23043497-ab7d-4f15-3eb3-08d7288ab2fe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3984; 
x-ms-traffictypediagnostic: MN2PR11MB3984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3984BE77ECCF4A59FDA1C38BF0A70@MN2PR11MB3984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(396003)(366004)(39860400002)(199004)(189003)(110136005)(25786009)(26005)(446003)(4326008)(1076003)(256004)(316002)(386003)(2501003)(81156014)(6506007)(8936002)(14444005)(64756008)(66556008)(66476007)(66946007)(6436002)(81166006)(66446008)(8676002)(2201001)(54906003)(53936002)(76176011)(5660300002)(86362001)(6512007)(52116002)(71200400001)(14454004)(11346002)(66066001)(476003)(305945005)(6486002)(36756003)(7736002)(186003)(71190400001)(478600001)(2906002)(102836004)(99286004)(50226002)(6116002)(3846002)(107886003)(486006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3984;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v4inKM6fUs55tDQzLw5nVTNRACNO36e6sZn3KEd0NYKcTgBmI0x7TuzZXaVJZyjao9hk0p1nhY0aAzA44Cxefqj6TShsJHnuyn03mapePndl5Rk+fqRjP0rVoZ1rnLEhv41XbdnNss2Pbf7gmlcNbD433pzbSZaQCcSc/2VqULwPFc/hJ5u1ej+8Uqv0z5KcyzRKnoWwvUP6n1iQGdfyy57mqFuC3BkOvv43NCjDiEFvj6ACV3tI20io55XARWqf1iWxMnZZ/SxzA/sDgryFwc/LobrcDPC3jPToiJzgzdx0lwYt49gOWek4lfkFJivhcLHVMSu7P3USr9EXZieY2Etf0NXs42JWp4xSR/rB+/C7YQ2/YAiPqjEG87CIt0ZpI4IKrD64VZt1ff+qmVNDXCDqVZ83JkHODtB/CtNwwKs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23043497-ab7d-4f15-3eb3-08d7288ab2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 12:00:47.1398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lgw76DN/FILyuAAbLrxywKwCp8SWANGi9XE33EtVUNtA8Z3wQXT72FyGecBiRAmIswOLNuToM887hRLOgqxiC/FDGCjdWlKIRbMS9LFtny0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_050050_482848_00B3C1E9 
X-CRM114-Status: GOOD (  17.42  )
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
Cc: boris.brezillon@bootlin.com, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

Add the SNOR_F_HAS_LOCK flag and set it when SPI_NOR_HAS_LOCK is set
in the flash_info entry or when it's a Micron or ST flash.

Move the locking hooks in a separate struct so that we have just
one field to update when we change the locking implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
[tudor.ambarus@microchip.com: use ->default_init() hook, introduce
spi_nor_late_init_params(), set ops in nor->params]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 50 ++++++++++++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h   | 23 ++++++++++++++------
 2 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1629584be30e..fc9e14777212 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1598,6 +1598,12 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return stm_is_locked_sr(nor, ofs, len, status);
 }
 
+static const struct spi_nor_locking_ops stm_locking_ops = {
+	.lock = stm_lock,
+	.unlock = stm_unlock,
+	.is_locked = stm_is_locked,
+};
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
@@ -1607,7 +1613,7 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->flash_lock(nor, ofs, len);
+	ret = nor->params.locking_ops->lock(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_UNLOCK);
 	return ret;
@@ -1622,7 +1628,7 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->flash_unlock(nor, ofs, len);
+	ret = nor->params.locking_ops->unlock(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
 	return ret;
@@ -1637,7 +1643,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->flash_is_locked(nor, ofs, len);
+	ret = nor->params.locking_ops->is_locked(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
 	return ret;
@@ -4148,6 +4154,7 @@ static void macronix_set_default_init(struct spi_nor *nor)
 
 static void st_micron_set_default_init(struct spi_nor *nor)
 {
+	nor->flags = SNOR_F_HAS_LOCK;
 	nor->params.quad_enable = NULL;
 	nor->params.set_4byte = st_micron_set_4byte;
 }
@@ -4292,6 +4299,23 @@ static void spi_nor_legacy_init_params(struct spi_nor *nor)
 }
 
 /**
+ * spi_nor_late_init_params() - Late initialization of legacy flash parameters.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Used to set legacy flash parameters and settings when the ->default_init()
+ * hook or the SFDP parser let voids.
+ */
+static void spi_nor_late_init_params(struct spi_nor *nor)
+{
+	/*
+	 * NOR protection support. When locking_ops are not provided, we pick
+	 * the default ones.
+	 */
+	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params.locking_ops)
+		nor->params.locking_ops = &stm_locking_ops;
+}
+
+/**
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
  * @nor:	pointer to a 'struct spi-nor'.
  *
@@ -4316,6 +4340,10 @@ static void spi_nor_legacy_init_params(struct spi_nor *nor)
  *    Please not that there is a ->post_bfpt() fixup hook that can overwrite the
  *    flash parameters and settings imediately after parsing the Basic Flash
  *    Parameter Table.
+ *
+ * 4/ Late legacy flash parameters initialization, used when the
+ * ->default_init() hook or the SFDP parser do not set specific params.
+ *		spi_nor_late_init_params()
  */
 static void spi_nor_init_params(struct spi_nor *nor)
 {
@@ -4326,6 +4354,8 @@ static void spi_nor_init_params(struct spi_nor *nor)
 	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
+
+	spi_nor_late_init_params(nor);
 }
 
 static int spi_nor_select_read(struct spi_nor *nor,
@@ -4730,6 +4760,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_S3AN)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
+	if (info->flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
 	 * with the software protection bits set.
@@ -4754,16 +4787,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
 
-	/* NOR protection support for STmicro/Micron chips and similar */
-	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
-	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-	    info->flags & SPI_NOR_HAS_LOCK) {
-		nor->flash_lock = stm_lock;
-		nor->flash_unlock = stm_unlock;
-		nor->flash_is_locked = stm_is_locked;
-	}
-
-	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
+	if (nor->params.locking_ops) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
 		mtd->_is_locked = spi_nor_is_locked;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 012731ad339f..6c5eaf607b50 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -243,6 +243,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_4BAIT	= BIT(8),
+	SNOR_F_HAS_LOCK		= BIT(9),
 };
 
 /**
@@ -466,6 +467,18 @@ enum spi_nor_pp_command_index {
 struct spi_nor;
 
 /**
+ * struct spi_nor_locking_ops - SPI NOR locking methods
+ * @lock:	lock a region of the SPI NOR.
+ * @unlock:	unlock a region of the SPI NOR.
+ * @is_locked:	check if a region of the SPI NOR is completely locked
+ */
+struct spi_nor_locking_ops {
+	int (*lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+};
+
+/**
  * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
  * Includes legacy flash parameters and settings that can be overwritten
  * by the spi_nor_fixups hooks, or dynamically when parsing the JESD216
@@ -484,6 +497,7 @@ struct spi_nor;
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte:		puts the SPI NOR in 4 byte addressing mode.
  * @disable_block_protection: disables block protection during power-up.
+ * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
@@ -498,6 +512,8 @@ struct spi_nor_flash_parameter {
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
 	int (*disable_block_protection)(struct spi_nor *nor);
+
+	const struct spi_nor_locking_ops *locking_ops;
 };
 
 /**
@@ -538,10 +554,6 @@ struct flash_info;
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
  *			at the offset @offs; if not provided by the driver,
  *			spi-nor will send the erase opcode via write_reg()
- * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
- * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
- * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
- *			completely locked
  * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
  *                      The structure includes legacy flash parameters and
  *                      settings that can be overwritten by the spi_nor_fixups
@@ -579,9 +591,6 @@ struct spi_nor {
 			size_t len, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
-	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	struct spi_nor_flash_parameter params;
 
 	void *priv;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
