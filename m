Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691AEC3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B162184D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRQcr0j1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ufFHivwR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B162184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UZpr1cGqT/2QKMflt9a10CEvfeQh+gv1FC1yZkuKMYg=; b=ZRQcr0j1Nmr09R
	C7mRn2yUM1AWOcizVnlbfqwPMCoRvm/E2bvsw+R/RRtWm2NaYwZTi5lgEO7+/nzV8NnlOPBfOnpJT
	obEipjq0bV/v0BEkzwS85qgeFmh6lf8Vl05PxzFTQnJEKwaZ2nbCw2WhWCa96MVS98HZijDQbGhmY
	4WOr2FCFI4r4OqhOzzurCh/psJo41/FoVBZshzLfKK1RTHGt3Usf4zYIb0uNO3dV/goYZSFpJfejy
	6RpNOW/y1Y293xktELn8iDV1RpY9aFZcfQhQ+Eaps0qHAxF+EYCUOgwEwuInp55Vol/frSXNvJNIX
	gZuW4s4/c7rF6mxvWtCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Dhi-0007M7-9W; Mon, 26 Aug 2019 12:02:34 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Dha-0007BL-12
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:02:27 +0000
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
IronPort-SDR: hzrNZ8R1HHAJuBi/8L2Flpi+CPEHvrQEBeFCUHnJGFnAEjBSRJz5Xb4vO33RUXlu2r7Zp6Do+u
 +YdFS4j8iM4Pij9GQPl88eN57JdSjxmSfXjDp9OzEPg6z2u1VtT0hg6WpM7ZivGKkk4nz60ZPd
 lAxOhW9SnvYMuzL6b1UxQ7BeKwU/RHij2pj+heOjZx/i/ZppDUV0fnOh+Z2Rvobo+SsHT4tNFq
 ZCaLHr62jHt6WM2yLkcmV21OCvhBQEDibcN/zH7WOjnUpQ9e5ldYkAfgvfXmx2KdPTrD3bQZHH
 +Xs=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="44988401"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:02:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:02:16 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 05:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwZPhOa532XE5aS2GSklwgEKyxraWx9aJ4jHNyzA7lQeBm2HQcTYlApuNc+WUPoKa1vlvm4mvYvCH5i6N7vrn4/ETBlIBIIyeHlwc2niE96UO7pb5WCAGY1vscORNgOCsNQMLe1pSavtBKNyn06YZ8of5AlZ5XG635egepq7LKRxrn3TRtiyiwVjOlfx5Mk/tP9HvDL0ApsvlkuAokDS3AOE//6L2TiejFQNuTCS7ipi9Oc5miaTowaMm5OsrLDlYEk1v4rJS6k0NfaYJs0dktuuQMjtaeXWstcWeLVmaD6nMpL8fjLXPJteIUrcVAoJU3qDqTVPadWHrGhOcfVekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6T1YHZWV8TyZgRF10y/o+KIqRMw8GGpK0CyRZfHJ8aM=;
 b=XLuvRXOULe7l5EkWV0FhSHEanWVji9nyIr8zLPgafH1QBPDCm/mmgmiQNW+9o9gyCr7x5IGyYsoJ12rxkaXOINZ9mZ9boGxcmSBK3DoMKDIMDAFgeR2TunklzEbFDz0o6EALWVe8LCB0gzd6i1UV/Wan0/Bc/BLnFVAB9WpSdb34ZYbQiXeb6Y0YBCk8mstgnArFTeIPNU29aS9SXZO4AdXgWK9SFoNkTzijdKg5y1WmbOi0Sl0mXEI5Zn83Tm80PZ1xtT9G5ubWYVCF1SP8fM+Z/UVwZqaLLtlMUNjAxf2hA6UWLNMbdUED7UxCnQ95EUnV3RH+I45MbDaOsnzUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6T1YHZWV8TyZgRF10y/o+KIqRMw8GGpK0CyRZfHJ8aM=;
 b=ufFHivwReizYAOUm+LhkDAj3bKwngKYWvC08Lzk9qE24gFXCoXI4Q7grxDz1cCOT9Ke1Is+OYxTFIgDyX2OULdkljXqpvyLZRq1UaoH/ljrQGVeBJDe0eitb+IbO5xp1PARpONPqEVxG+Ni+cEQlpHApXFigH7CR7rRAJ9j8gGw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3776.namprd11.prod.outlook.com (20.178.251.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:02:15 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:02:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 10/20] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
Thread-Topic: [PATCH v3 10/20] mtd: spi-nor: Rework the SPI NOR lock/unlock
 logic
Thread-Index: AQHVXAYZKF+up2g7dEagJ1VovhwH3w==
Date: Mon, 26 Aug 2019 12:02:14 +0000
Message-ID: <20190826120206.15025-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0041.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f138044-f79d-42b8-c8c9-08d72a1d3c0e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3776; 
x-ms-traffictypediagnostic: MN2PR11MB3776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3776C7236A2FB4471818A222F0A10@MN2PR11MB3776.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(81166006)(81156014)(8676002)(1076003)(2201001)(2501003)(14444005)(256004)(26005)(7736002)(99286004)(66066001)(2906002)(54906003)(52116002)(316002)(186003)(50226002)(8936002)(66476007)(66556008)(64756008)(66946007)(66446008)(110136005)(53936002)(2616005)(36756003)(25786009)(5660300002)(386003)(305945005)(6506007)(102836004)(3846002)(6116002)(478600001)(4326008)(86362001)(6436002)(6486002)(6512007)(14454004)(71200400001)(71190400001)(107886003)(476003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3776;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KHTjf535K1+zdrP3GQnVp1tqhyBm75QgRrQm2tCprlsjxzi7SqRsBE5N1hdSRrVgmceOPSGyp8k1Orocs+a7AwH7cIUAqR7J3jbB6RfrfKcw5GKsbwjyrqgq0VNYpXv5zrftCDUUK4MVMEenJBXOnTN8D6V8tCguMfIOlWd4HhasuGB5vqC0+xbfO2vJR3AK97KRAm/v49G6ICIK+47hgfkv6k9uPACas0d6ZvcyvL2hhkhXtMvthcT2iEK9hIUO+gFrvBvQGNfioYxInvFh3Kwa9A+AnZE5949wqyAh80eDKfv9WZmiK3J8/iqQjeP79YTUVY5KSaZjiq3J37AIcMFPpiPGcyb4ICGtxRAaaFQ81t9Ux0d7Dp0t2o8+gJJgwAxDxeS4T3pfvd+wURLg3d8idD3Kwa522BJCAEbf7Tw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f138044-f79d-42b8-c8c9-08d72a1d3c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:02:14.8713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrSxCC7rN/oSSNETsr0qUNznXakielHUdBw/6E+AuHx6beGdKEHCPhDj/pwVm6qamViyjfRDU3xjB77/ZmB3qIcuMpCS4qHx8Jw+Rl0l0tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050226_264606_B022F765 
X-CRM114-Status: GOOD (  16.06  )
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
v3: no changes, clear_sr_bp() is handled in the last patch of the
series.

 drivers/mtd/spi-nor/spi-nor.c | 50 ++++++++++++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h   | 23 ++++++++++++++------
 2 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 235e82a121a1..3f997797fa9d 100644
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
@@ -4292,6 +4299,23 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 }
 
 /**
+ * spi_nor_late_init_params() - Late initialization of default flash parameters.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Used to set default flash parameters and settings when the ->default_init()
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
@@ -4316,6 +4340,10 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
  *    Please not that there is a ->post_bfpt() fixup hook that can overwrite the
  *    flash parameters and settings imediately after parsing the Basic Flash
  *    Parameter Table.
+ *
+ * 4/ Late default flash parameters initialization, used when the
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
@@ -4707,6 +4737,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_S3AN)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
+	if (info->flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
 	 * with the software protection bits set.
@@ -4731,16 +4764,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
index 7da89dd483cb..ea3bcac54dc2 100644
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
@@ -483,6 +496,7 @@ struct spi_nor;
  *                      Table.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte:		puts the SPI NOR in 4 byte addressing mode.
+ * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
@@ -496,6 +510,8 @@ struct spi_nor_flash_parameter {
 
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
+
+	const struct spi_nor_locking_ops *locking_ops;
 };
 
 /**
@@ -536,10 +552,6 @@ struct flash_info;
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
  *			at the offset @offs; if not provided by the driver,
  *			spi-nor will send the erase opcode via write_reg()
- * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
- * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
- * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
- *			completely locked
  * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
  *			the SPI NOR Status Register.
  * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
@@ -579,9 +591,6 @@ struct spi_nor {
 			size_t len, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
-	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*clear_sr_bp)(struct spi_nor *nor);
 	struct spi_nor_flash_parameter params;
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
