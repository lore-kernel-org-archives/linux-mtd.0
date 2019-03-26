Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A20FC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 11:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECFF2084B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 11:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iW3I5kCV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="Odh3Kpa9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECFF2084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5MHgaSffB5qDQfuhEq7Qr4KYPROSn9O2Ivc4ftAml50=; b=iW3I5kCV5rOxwz
	USMh4gtynTWYQhiQmUgXKJVcfWoX1cUfa3899UNYlR8qQWiHkQotE3Z5MLveLh2XOe7i0qVPM9i2t
	va+ZyqtrT9IHzkUUAnxAxcYOBCCFE5hnzTQKDc4P7w1a8eOE4nD1oZ6d3YveBY9RsB2boaTY9dFkm
	ny+ePbAbbXoPxlQB2WlXrFWaK2QmNg6bkMok3ahmJHqNkjmwImtz71cPAPAzkeMFOoVOYwgAj/Tg2
	b+5x3S93ONuClFzCVD6EWGq5gmEY4KY3b2QPfmUH2J7bOFxDgMBZj8UuUUXC+b645kpVu6CHfqarn
	yq8ckw287yIBlIPJt+pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8jv5-0000w3-6t; Tue, 26 Mar 2019 11:07:03 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8jgs-0003bN-8W
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 10:52:34 +0000
Received: from mail.micron.com (bowex17d.micron.com [137.201.21.212])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x2QAqAUg001299;
 Tue, 26 Mar 2019 04:52:10 -0600
Received: from BOWEX17F.micron.com (137.201.21.111) by bowex17d.micron.com
 (137.201.21.212) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Mar
 2019 04:52:09 -0600
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (137.201.20.7) by
 BOWEX17F.micron.com (137.201.21.111) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 26 Mar 2019 04:52:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY5W18TZmkfJWr1lJ+HQyxCnp1aZ2XQ9rYPMi/gIFdg=;
 b=Odh3Kpa9hVB50ypNVdnNajVTJKd9jY7U0PDCxGSTJWvRW0kStSlta0aPjzsa3XYbxuWP82F0r5pUJd/HK7eYsLof/STvbXfX3021w6Q4y4Bi4TGiQDSmf0zM6Ouzq8hLCtjLAqOnfcYiRI0hgqXMbnW/7BqD2rS0GC3x4MiC9os=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5856.namprd08.prod.outlook.com (20.179.87.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Tue, 26 Mar 2019 10:52:04 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af%7]) with mapi id 15.20.1730.019; Tue, 26 Mar 2019
 10:52:04 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] mtd: spinand: micron: Support for new Micron SPI NAND
 flashes
Thread-Topic: [PATCH 4/4] mtd: spinand: micron: Support for new Micron SPI
 NAND flashes
Thread-Index: AdTjwXc8rC1wT/iQTKuIUBd0ae2YRg==
Date: Tue, 26 Mar 2019 10:52:04 +0000
Message-ID: <MN2PR08MB5951DEE6417F39426483CF45B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0981bff0-f0db-4445-94b8-08d6b1d91589
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR08MB5856; 
x-ms-traffictypediagnostic: MN2PR08MB5856:|MN2PR08MB5856:
x-microsoft-antispam-prvs: <MN2PR08MB5856C4074F69CC0FC4ECA449B85F0@MN2PR08MB5856.namprd08.prod.outlook.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(39860400002)(346002)(376002)(199004)(189003)(486006)(476003)(186003)(52536014)(5660300002)(2501003)(26005)(53936002)(25786009)(102836004)(55236004)(66066001)(6436002)(97736004)(9686003)(478600001)(55016002)(2201001)(33656002)(86362001)(14454004)(2906002)(6116002)(3846002)(14444005)(305945005)(99286004)(71190400001)(71200400001)(8676002)(105586002)(81156014)(81166006)(106356001)(7736002)(68736007)(316002)(256004)(7696005)(74316002)(110136005)(54906003)(6506007)(8936002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5856;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1MTM/ybiU+vbd8v7DKi3LOpAmbVyppR9mRz5+5I9yUG+eTwkBVjOteRxMrcgkQ6aiALGU16qcBEZgyKKjzJ8mJO9TXD/boEnm/0sgCyDm7KQ174EEjZZFUuSdeZmWoxVDsaNyHIS2ALc724R6j1sw+ZGB5HAe1kNOE9trxGOncjOgjP/A0s7XRtXZSUs+Huq3aBKBrJSbqZMcw39UWG+5Z/Zxq58+4L38u3Podglc+xO2sT/hmgi8Kt2QFx19zoZpXtYrN3Wc/USKuVoVsr0zGO1DGqfQwOIVNHLhn00f2OI1wsbfeJr8PXG9F/JUoBIGJec3Qe/z7OiWpIcHv4J/taKIu+N2TCMEJGLxJt1Ev+C1OM2zk/gWqR587nlSyQhtvtJirxv17N0N4l2KM6PF4YGzx0v9JDOLo4I65JBLa8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0981bff0-f0db-4445-94b8-08d6b1d91589
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 10:52:04.4770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5856
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24512.005
X-TM-AS-Result: No--7.629600-0.000000-31
X-TM-AS-MatchedID: 708060-105640-700038-188019-706290-702143-847298-701384-7
 00324-700057-105630-702033-708712-704473-703712-700398-702426-707663-700811
 -700264-702898-702609-709584-705694-704713-701698-703378-700251-148004-1480
 07-148020-148050-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_035222_748803_B4404DC6 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Marek
 Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver is redesigned using parameter page to support Micron SPI NAND
flashes.

Support for selecting die is enabled for multi-die flashes.
Turn OOB layout generic.

Fixup some of the parameter page data as per Micron datasheet.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 109 +++++++++++++++++++++++++---------
 1 file changed, 80 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 7d7b1f7fcf71..663bb2809036 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -14,7 +14,7 @@
 
 #define MICRON_STATUS_ECC_MASK		GENMASK(7, 4)
 #define MICRON_STATUS_ECC_NO_BITFLIPS	(0 << 4)
-#define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
+#define MICRON_STATUS_ECC_1TO3_BITFLIPS	BIT(4)
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
 #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
 
@@ -34,38 +34,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
-					struct mtd_oob_region *region)
+static int ooblayout_ecc(struct mtd_info *mtd, int section,
+			 struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
-	region->offset = 64;
-	region->length = 64;
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
 
 	return 0;
 }
 
-static int mt29f2g01abagd_ooblayout_free(struct mtd_info *mtd, int section,
-					 struct mtd_oob_region *region)
+static int ooblayout_free(struct mtd_info *mtd, int section,
+			  struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
 	/* Reserve 2 bytes for the BBM. */
 	region->offset = 2;
-	region->length = 62;
+	region->length = (mtd->oobsize / 2) - 2;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops mt29f2g01abagd_ooblayout = {
-	.ecc = mt29f2g01abagd_ooblayout_ecc,
-	.free = mt29f2g01abagd_ooblayout_free,
+static const struct mtd_ooblayout_ops ooblayout = {
+	.ecc = ooblayout_ecc,
+	.free = ooblayout_free,
 };
 
-static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
-					 u8 status)
+static int ecc_get_status(struct spinand_device *spinand,
+			  u8 status)
 {
 	switch (status & MICRON_STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -90,22 +90,23 @@ static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static const struct spinand_info micron_spinand_table[] = {
-	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
-				     mt29f2g01abagd_ecc_get_status)),
-};
+static int mt29f8g_select_target(struct spinand_device *spinand,
+				 unsigned int target)
+{
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(0xd0,
+							spinand->scratchbuf);
+
+	if (target == 1)
+		target = 0x40;
+
+	*spinand->scratchbuf = target;
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
 
 static int micron_spinand_detect(struct spinand_device *spinand)
 {
+	const struct spi_mem_op *op;
 	u8 *id = spinand->id.data;
-	int ret;
 
 	/*
 	 * Micron SPI NAND read ID need a dummy byte,
@@ -114,16 +115,66 @@ static int micron_spinand_detect(struct spinand_device *spinand)
 	if (id[1] != SPINAND_MFR_MICRON)
 		return 0;
 
-	ret = spinand_match_and_init(spinand, micron_spinand_table,
-				     ARRAY_SIZE(micron_spinand_table), id[2]);
-	if (ret)
-		return ret;
+	spinand->flags = 0;
+	spinand->eccinfo.get_status = ecc_get_status;
+	spinand->eccinfo.ooblayout = &ooblayout;
+	spinand->select_target = mt29f8g_select_target;
+
+	op = spinand_select_op_variant(spinand,
+				       &read_cache_variants);
+	if (!op)
+		return -ENOTSUPP;
+
+	spinand->op_templates.read_cache = op;
+
+	op = spinand_select_op_variant(spinand,
+				       &write_cache_variants);
+	if (!op)
+		return -ENOTSUPP;
+
+	spinand->op_templates.write_cache = op;
+
+	op = spinand_select_op_variant(spinand,
+				       &update_cache_variants);
+	spinand->op_templates.update_cache = op;
 
 	return 1;
 }
 
+static int micron_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * Some of the Micron flashes enable this BIT by default,
+	 * and there is a chance of read failure due to this.
+	 */
+	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE, 0);
+}
+
+static void micron_fixup_param_page(struct spinand_device *spinand,
+				    struct nand_onfi_params *p)
+{
+	/**
+	 * As per Micron datasheets vendor[88] is defined as
+	 * die_select_feature
+	 */
+	if (p->vendor[83] && !p->interleaved_bits)
+		spinand->base.memorg.planes_per_lun = 1 << p->vendor[0];
+
+	spinand->base.memorg.ntargets = p->lun_count;
+	spinand->base.memorg.luns_per_target = 1;
+
+	/**
+	 * As per Micron datasheets,
+	 * vendor[82] is ECC maximum correctability
+	 */
+	spinand->base.ecc.requirements.strength = p->vendor[82];
+	spinand->base.ecc.requirements.step_size = 512;
+}
+
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
 	.detect = micron_spinand_detect,
+	.init = micron_spinand_init,
+	.fixup_param_page = micron_fixup_param_page,
 };
 
 const struct spinand_manufacturer micron_spinand_manufacturer = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
