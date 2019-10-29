Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A76CA9EC5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB51820663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LMZ4wjRA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="bC9GWJlg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB51820663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0X6U3UtRqLiimgL+FXws4BIMBP8fftSpYLcDFV2fTc=; b=LMZ4wjRARHDvVr
	C2dVCAp0kejIgkdxtP4jSHUtDKfZ9YWtPjDrRHYdeLojoAyA+IJmlWg4hheKI/fpnauDlNhJEwtKX
	m8qs6LNpKBNBRgwCBA2SCJ4Mcdr1URMioUDtWKzLLQ88dZfVN3SgEdZbXAJd4QLWFZqiLHts0rbr1
	jDzD5yeupCHB4593nWpHx5IO9pwKufqrXcEk/vfT3+D96HfndBoOmfzSCQMbP963FsbwMbPN+gv8x
	l6z4ONMRG2S/P2dOMkWdWpec+4y2DsWqnd8ZwlPKz+1tZSlBc07hkFGRug9EWoLOYtQzaClFEsLtz
	LS4mzqh8t53+xkFGOj0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPZ6-0007xh-Bh; Tue, 29 Oct 2019 11:21:32 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUx-0002h1-8E
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:19 +0000
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
IronPort-SDR: palJFobaYFCGywSHXgRq/dmyEVmt9v8TrrzH3ciKJXgXVYgcOeWyXv3B7IUPHRe7cxJuT06XnU
 PrH/GH3cIM4o14NbZQVNZwsf2HSnSrczBPkAGxB36KOjs6IEz1vQnMSf0mZHC4yHSymSPaP9k0
 9GZJjTav29ygcmQhVlljX1f/HKKPgrvfcqP7H0o0ezVejPmlT9Ps8dR6NYMYPCiKui9dgVCrDy
 bWW0+ve3clD5ZqSkVMPiQtPYyqXPbTYcE95Xqv52j+IYaV3qBiffLfRcUbDdWJEu4+uZP84Z2h
 JRQ=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54794565"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:14 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 04:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko/vz5VO4UibvBMx4eLkEdJdYHuI4/ywPeM7m5G+eEs7lQTwlh2+drOnbEmyflKaba9cvYQXgwSR6xfVcJoOz99J4b9i30wo+8RIJnkFUZGd58Ts9j51UdZoM1m74ClDrU0B0V2/It+1P3BnD25UhrprUkgxCCvtCINO843Uwfq9gOoQa/ZllMxA/tViWQsyZNd6edVi2vdTgsOanUpZhiG0XrieIdVmTnYwnfZpVmGVj3utlffvSdgEU5EfUNqFHjsDNFSHUHBbRDHjlY84enZNNIaPtcYuzQIr50CBree/JWrt5BZRZYVerAw9wvVAKj3eZq6ya6KEj+OfDZTdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHm53Qai7uwQjlwVnFlTxqfyqu3ARXKyxlwZaaGPeAo=;
 b=TBHUzuu3lRsIFsR7DnC8M+T8f0NnFIQOgc7bcFxz3ki7uedDrWmrl7ixUt/KhbdZFiLPGljW6DR/kmUM+WB0uG1Fka4UL5VHnoVTMK070OpnS15c7m0SGGCnoXrK3XM7UUuDE20X3vX/65kqQO9vB8roWugNysvkfpTsGLuZ7hfU/k3A1KfMgP7kTgspjTzzt9ToIIEkc4ypnaopB12DZ97JofC46xVQX2NvKkvnHBCwCFilNEerQrtrxZNjR4MDScXaDKlGq7z1TyrSRbl9x5fgFwcqI7edNosvUbj//I+AvitOwixXTqKWA4kgJX1jQLFN518HNseJWwm3TyN6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHm53Qai7uwQjlwVnFlTxqfyqu3ARXKyxlwZaaGPeAo=;
 b=bC9GWJlgSvwG1iCtTDvP7ITgrt4KRiGT77hLXy7sJnAdHyXM9Fz/fbes9OzOqJSH8jVz94STjKO6sxOGyhlNNbdAuDl9Wk6wSTILMrUnbkZEN6rjd7p0fh8rflkt0U+aqs44K0FM3RWC+RMZ1fQfT8q3dynpjagOLweJHR+1D/o=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3712.namprd11.prod.outlook.com (20.178.253.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:17:12 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:17:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 15/32] mtd: spi-nor: Check for errors after each Register
 Operation
Thread-Topic: [PATCH v3 15/32] mtd: spi-nor: Check for errors after each
 Register Operation
Thread-Index: AQHVjkppKS3wm6HFREK56+6iD+phXA==
Date: Tue, 29 Oct 2019 11:17:12 +0000
Message-ID: <20191029111615.3706-16-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 128fcbb6-f510-4dcc-dc7f-08d75c618bbd
x-ms-traffictypediagnostic: MN2PR11MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3712D15102DFD89565A3DE8EF0610@MN2PR11MB3712.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(107886003)(6512007)(316002)(110136005)(4326008)(2201001)(305945005)(6436002)(54906003)(7736002)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(6486002)(5660300002)(36756003)(86362001)(11346002)(446003)(8936002)(81156014)(81166006)(50226002)(2616005)(186003)(476003)(256004)(478600001)(8676002)(25786009)(14454004)(486006)(66066001)(2501003)(26005)(99286004)(386003)(76176011)(52116002)(1076003)(102836004)(14444005)(71200400001)(71190400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3712;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tQYaguxHD+xE8MO49Lq7Nkg1upmTKRlHbrrnTKLvripYHuPulRMv7CNYIESI5rXmx+j4riOrprOF4B9aiRd5jynirnsiRF1zJB3GrhbP2Ms5dxk7yAsGapu7zfvT/bnL3U05yUl1T/qnd0JkNQfJK0I7jLeSJwqdHgzxR5FoHOpeXc2yl5A+RMFlHdbsEwNPKqQcY9AmT/yA9+hAH1usYfUdhMWIbh9Cl9DAPd3Chey+g0NAVIJkHd0yqlUvVeyz76PEEOktLrVjeQKkBNJD3EDPNY24ZMuPfFSH/8py5FRyjye1WyDa6qpYliXE0F4JKB7AY9gQOyqppKtoPbvGCCf/cOdy4qOfq7gSkSrwkelu/I4TiJjLixxBBLELra8jdvmUTFedBHxhsT3r4/TQF2fTX7LCD/1WzTA54IHlfgJ1/1Hp3uer2RYgzc4Rj0hi
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 128fcbb6-f510-4dcc-dc7f-08d75c618bbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:17:12.3932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMGVy/5jtDP53L/JHzDGjW4lJeFC4U5ktpRMhfwPGu9rwfSbk6hfyIiByifRJIBcQkOWdTKmhA7Fw0Mj1zsIKDrHyL66rryI6EbdB9dRC/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041715_406461_39104BD5 
X-CRM114-Status: GOOD (  11.45  )
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

Check for the return vales of each Register Operation.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 81 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 889fd77dbe96..21f01fdcfa16 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -595,11 +595,15 @@ static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	spi_nor_write_enable(nor);
+	ret == spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	ret = macronix_set_4byte(nor, enable);
-	spi_nor_write_disable(nor);
+	if (ret)
+		return ret;
 
-	return ret;
+	return spi_nor_write_disable(nor);
 }
 
 static int spansion_set_4byte(struct spi_nor *nor, bool enable)
@@ -665,11 +669,15 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 	 * Register to be set to 1, so all 3-byte-address reads come from the
 	 * second 16M. We must clear the register to enable normal behavior.
 	 */
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	ret = spi_nor_write_ear(nor, 0);
-	spi_nor_write_disable(nor);
+	if (ret)
+		return ret;
 
-	return ret;
+	return spi_nor_write_disable(nor);
 }
 
 static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
@@ -855,7 +863,9 @@ static int spi_nor_write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 {
 	int ret;
 
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -885,7 +895,10 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
 {
 	int ret;
 
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	ret = spi_nor_write_sr(nor, status_new);
 	if (ret)
 		return ret;
@@ -1393,7 +1406,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 	list_for_each_entry_safe(cmd, next, &erase_list, list) {
 		nor->erase_opcode = cmd->opcode;
 		while (cmd->count) {
-			spi_nor_write_enable(nor);
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto destroy_erase_cmd_list;
 
 			ret = spi_nor_erase_sector(nor, addr);
 			if (ret)
@@ -1448,7 +1463,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		unsigned long timeout;
 
-		spi_nor_write_enable(nor);
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			goto erase_err;
 
 		ret = spi_nor_erase_chip(nor);
 		if (ret)
@@ -1475,7 +1492,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else if (spi_nor_has_uniform_erase(nor)) {
 		while (len) {
-			spi_nor_write_enable(nor);
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto erase_err;
 
 			ret = spi_nor_erase_sector(nor, addr);
 			if (ret)
@@ -1496,7 +1515,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			goto erase_err;
 	}
 
-	spi_nor_write_disable(nor);
+	ret = spi_nor_write_disable(nor);
 
 erase_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
@@ -1845,9 +1864,13 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	if (nor->bouncebuf[0] & SR_QUAD_EN_MX)
 		return 0;
 
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
 
-	spi_nor_write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
+	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
+	if (ret)
+		return ret;
 
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
@@ -2018,7 +2041,9 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	/* Update the Quad Enable bit. */
 	*sr2 |= SR2_QUAD_EN_BIT7;
 
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
 
 	ret = spi_nor_write_sr2(nor, sr2);
 	if (ret)
@@ -2059,7 +2084,9 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
 
 	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] & ~mask);
 	if (ret)
@@ -2676,7 +2703,9 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	spi_nor_write_enable(nor);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		goto sst_write_err;
 
 	nor->sst_write_second = false;
 
@@ -2714,14 +2743,19 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 	nor->sst_write_second = false;
 
-	spi_nor_write_disable(nor);
+	ret = spi_nor_write_disable(nor);
+	if (ret)
+		goto sst_write_err;
+
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
 		goto sst_write_err;
 
 	/* Write out trailing byte if it exists. */
 	if (actual != len) {
-		spi_nor_write_enable(nor);
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			goto sst_write_err;
 
 		nor->program_opcode = SPINOR_OP_BP;
 		ret = spi_nor_write_data(nor, to, 1, buf + actual);
@@ -2731,8 +2765,10 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto sst_write_err;
-		spi_nor_write_disable(nor);
+
 		actual += 1;
+
+		ret = spi_nor_write_disable(nor);
 	}
 sst_write_err:
 	*retlen += actual;
@@ -2783,7 +2819,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
-		spi_nor_write_enable(nor);
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			goto write_err;
+
 		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
 		if (ret < 0)
 			goto write_err;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
