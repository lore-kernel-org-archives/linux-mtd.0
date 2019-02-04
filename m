Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E14C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 11:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32AC207E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 11:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MSXq4w++";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="Oi3C5Va6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32AC207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i46rT/pUTs8J9JXgE+p1srJDXU1KsmY+rdPU4q98syk=; b=MSXq4w++uHLmlL
	oMBi45uTrLUGvRowtH5dmcZy2awvPS0nA0cCyx6P20/sBd1ZdbDVxcA/umO5Jpcln+DG7hK+tguUM
	TnDcG8hVq8FVqr+6PEoakBUIOVTAc4Q46r5DsbGB12jSnIuo2bHjy6nJ1Z0X8j3Dl0E8nSxngJKYj
	NY5PvbwXv4H745LMBSmKsBv+FYDAF5KQrjZJsTjDexqIcgN45TGquueO2F6cvwOp6lBgf7g9DSndg
	2pfPHKLBTF/Wj9oKyfpsvm29ZEgJ1bbdHgRvE7WGDtTd8KdWTeaR0z1mCVvLTCDZ1NobqigdVbZXM
	HPXjtuWZj3D16JaMWO3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqcGs-0007De-Hd; Mon, 04 Feb 2019 11:18:38 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqcGS-0006qe-LN
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 11:18:16 +0000
Received: from mail.micron.com (bowex36h.micron.com [137.201.84.179])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x14BHr6f004598;
 Mon, 4 Feb 2019 04:17:53 -0700
Received: from BOWEX36F.micron.com (137.201.84.51) by BOWEX36H.micron.com
 (137.201.84.179) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 4 Feb
 2019 04:17:53 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (137.201.84.23)
 by BOWEX36F.micron.com (137.201.84.51) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Mon, 4 Feb 2019 04:17:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky75VbJnQBX3ezGtONQt0CgP9zPp+Xz0DYZ9gZY8KtA=;
 b=Oi3C5Va6qxwvvAn9n/HpK1w/KZUOVrxkUdWMMhqTupuLapES9+qdVASa47HUEYuAgyNR1hEt1MEyFEIEaQcMA/RxlGpi0Og9D8emWSQlqiFl5/fCTymX225DmN1Kw9KdshcprV7PZjgPWEdiGiDuv0XtO5L2kAYXaTZhMGhu3kc=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.98.155) by
 MN2PR08MB5870.namprd08.prod.outlook.com (20.179.87.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Mon, 4 Feb 2019 11:17:51 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::8cda:e314:bfb0:41fe]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::8cda:e314:bfb0:41fe%5]) with mapi id 15.20.1580.019; Mon, 4 Feb 2019
 11:17:51 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] mtd: spinand: micron: Support for all Micron SPI NAND
 flashes
Thread-Topic: [PATCH 2/2] mtd: spinand: micron: Support for all Micron SPI
 NAND flashes
Thread-Index: AdS8exJYD8uSWbLRR5WRv3oHfltCMQ==
Date: Mon, 4 Feb 2019 11:17:51 +0000
Message-ID: <MN2PR08MB5951FD3B8244ABBA72FF7430B86D0@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.44]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MN2PR08MB5870;
 6:sah+ykLBayd4pq8R5zAdLeDyqSvUHYxYUBX2QmKmUxt5kQPnQwO0GU9x12o4YrGPzf6cuB8JCRUsW32uvhpy3svxVwyLiuFYRcHqayLgI3VVj38kCQlt9DQgK5yJPN0lcrAZSOqbcZzC0WOqWxnF9WTyMpx4EJy7r2sNvLSx64oHETp1KkzUnPhB0ddg5sHX8oZfNWxgurtrqsFmuTkNACDoQzIo9fE1NSIVhMgDXWrNQKygL/Iigd62SgGUUNiBUWUpd23Z0hhklLWLkYvZS1fg5ZbADea9OQYxTpMPOad7//f/OxaUFm836C+JUQlr5J8pTE4wviEk8U5Klty/0UC+SqtPsH8XJLBvQwGmBhBv5X6/tAiNgABe8h6jOHYHJfB5h+4hhBlq0kg2rE7RXoCxtfhWxVphzDafBzSM2A3QEsfRZL6qMqXWDPMRrstOOkG13GoPNCtFP77mbtYAbg==;
 5:Sq0N3vGAkl/B39vZmauI5HerzgVdNDxjASQ4rX22+GQUtJzsj1H9batnYVGhovZZBcmDASnZC+5rGO+7INKdoS3y5uA0QxxdEQl6CcgTqYG68CaSDInpZFHoa6ra7d0JHnBcXohNZpiZ4Udc8dlW9+IwqjyXDQSlhLlDWlTqiYktx7flx+MfCRCctfwYRP4cki2VPNVIIN53BZpfB4EQFw==;
 7:cPWtVVlcdFZ15f9+BlOVx5DdF8pPrZIjQprS5CMk/ruRhWXPVIpOaYybN3zzXKe6pQonE6Si3g75oBsLYYBap7KrVXZ6ORfj1CUtSaavfsnuususSBscOiNKMSm6RnXC03BA9v2vJtq7Zkr5xoPNxg==
x-ms-office365-filtering-correlation-id: 8f3815d9-d1c4-4d6a-89f5-08d68a9266df
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR08MB5870; 
x-ms-traffictypediagnostic: MN2PR08MB5870:|MN2PR08MB5870:
x-microsoft-antispam-prvs: <MN2PR08MB58704D8F47DE37AFF9D89156B86D0@MN2PR08MB5870.namprd08.prod.outlook.com>
x-forefront-prvs: 0938781D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(39860400002)(376002)(189003)(199004)(186003)(54906003)(26005)(110136005)(2201001)(25786009)(9686003)(316002)(476003)(55016002)(7416002)(486006)(86362001)(66066001)(6436002)(14444005)(7696005)(14454004)(71200400001)(71190400001)(478600001)(97736004)(8676002)(256004)(305945005)(3846002)(7736002)(2501003)(6116002)(99286004)(53936002)(217873002)(74316002)(106356001)(8936002)(81156014)(81166006)(55236004)(105586002)(102836004)(68736007)(6506007)(2906002)(39060400002)(33656002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5870;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wdQSPVUiY0QDyrqLR1+vL+3E+9Br3jPW+OOjS+UyfFjiP9MaBUajPDtBlK/Ze5OYtjDy3CXbmMSjJ7IzImJaPlGwvIcUgJwcHoqPFAzEQjHXGYFdmnt8/Ei5JTwS97V+rrUODY/aDriGrJmLwAWS4hyDQOpFpi8awhMjzJt77MI0LdyJvgkT4BtlOZ19ofTMYjzkdaxX9LnuNIONLwiNY7xcO9lWn0sR3D+L9XHMTdcKUSLYunBLuf1vf9KBGoesQhNCV+45T+YDGIpG5t2coGorOCbPS1JfCHZVcLWTZYqccwE5Ynx8A026yLOW7hnzhAMktLsAICXnCpE9v/DpkwjvFBcbOcTRXA/WMpGwUwskFZM+3VlZjcz6v4GQqQciKsVEpKgN38HTiXiy8IqQpkHsyHijyNR+uvVbKAFL75E=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3815d9-d1c4-4d6a-89f5-08d68a9266df
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2019 11:17:51.4757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5870
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24408.005
X-TM-AS-Result: No--4.581000-0.000000-31
X-TM-AS-MatchedID: 708060-700038-708733-702198-701475-851106-700016-703529-1
 88019-700648-703523-706290-847298-700324-702143-701384-700057-105630-702033
 -708712-704473-703712-700398-700264-851458-188199-700059-700492-706771-7033
 99-702898-702609-709584-705694-704713-700251-704425-121336-702796-704407-12
 1169-702037-711109-701604-121119-113238-702091-701698-707663-708558-148004-
 148007-148020-148050-29997-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_031812_797053_3258073D 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.De>, Marek
 Vasut <marek.vasut@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver is redesigned using parameter page to support all the Micron
SPI NAND flashes.

Parameter page of Micron flashes is similar to ONFI parameter table and
functionality is same, so copied some of the common functions like crc16
and bit_wise_majority from nand_onfi.c.

This driver is tested using MT29F2G01ABXGD, MT29F4G01ABXFD, MT29F8G01ADXFD,
MT29F1G01ABXFD.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 172 +++++++++++++++++++++++++++-------
 drivers/mtd/nand/spi/micron.h |  83 ++++++++++++++++
 2 files changed, 221 insertions(+), 34 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/micron.h

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 9c4381d6847b..c9c53fd0aa01 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -10,13 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
-#define SPINAND_MFR_MICRON		0x2c
-
-#define MICRON_STATUS_ECC_MASK		GENMASK(7, 4)
-#define MICRON_STATUS_ECC_NO_BITFLIPS	(0 << 4)
-#define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
-#define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
-#define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
+#include "micron.h"
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
@@ -34,38 +28,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
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
@@ -90,22 +84,53 @@ static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static const struct spinand_info micron_spinand_table[] = {
-	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 2, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
-				     mt29f2g01abagd_ecc_get_status)),
-};
+static u16 spinand_crc16(u16 crc, u8 const *p, size_t len)
+{
+	int i;
+
+	while (len--) {
+		crc ^= *p++ << 8;
+		for (i = 0; i < 8; i++)
+			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+	}
+
+	return crc;
+}
+
+static void bit_wise_majority(const void **srcbufs,
+			      unsigned int nsrcbufs,
+				   void *dstbuf,
+				   unsigned int bufsize)
+{
+	int i, j, k;
+
+	for (i = 0; i < bufsize; i++) {
+		u8 val = 0;
+
+		for (j = 0; j < 8; j++) {
+			unsigned int cnt = 0;
+
+			for (k = 0; k < nsrcbufs; k++) {
+				const u8 *srcbuf = srcbufs[k];
+
+				if (srcbuf[i] & BIT(j))
+					cnt++;
+			}
+
+			if (cnt > nsrcbufs / 2)
+				val |= BIT(j);
+		}
+
+		((u8 *)dstbuf)[i] = val;
+	}
+}
 
 static int micron_spinand_detect(struct spinand_device *spinand)
 {
+	struct spinand_info deviceinfo;
+	struct micron_spinand_params *params;
 	u8 *id = spinand->id.data;
-	int ret;
+	int ret, i;
 
 	/*
 	 * Micron SPI NAND read ID need a dummy byte,
@@ -114,16 +139,95 @@ static int micron_spinand_detect(struct spinand_device *spinand)
 	if (id[1] != SPINAND_MFR_MICRON)
 		return 0;
 
-	ret = spinand_match_and_init(spinand, micron_spinand_table,
-				     ARRAY_SIZE(micron_spinand_table), id[2]);
+	params = kzalloc(sizeof(*params) * 3, GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
+
+	ret = spinand_parameter_page_read(spinand, PARAMETER_PAGE, params,
+					  sizeof(*params) * 3);
 	if (ret)
-		return ret;
+		goto free_params;
+
+	for (i = 0; i < 3; i++) {
+		if (spinand_crc16(0x4F4E, (u8 *)&params[i], 254) ==
+				le16_to_cpu(params->crc)) {
+			if (i)
+				memcpy(params, &params[i], sizeof(*params));
+			break;
+		}
+	}
+
+	if (i == 3) {
+		const void *srcbufs[3] = {params, params + 1, params + 2};
+
+		pr_warn("No valid parameter page, trying bit-wise majority to recover it\n");
+		bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), params,
+				  sizeof(*params));
+
+		if (spinand_crc16(0x4F4E, (u8 *)params, 254) !=
+				le16_to_cpu(params->crc)) {
+			pr_err("Parameter page recovery failed, aborting\n");
+			goto free_params;
+		}
+	}
+
+	params->model[sizeof(params->model) - 1] = 0;
+	strim(params->model);
+
+	deviceinfo.model = kstrdup(params->model, GFP_KERNEL);
+	if (!deviceinfo.model) {
+		ret = -ENOMEM;
+		goto free_params;
+	}
+
+	deviceinfo.devid = id[2];
+	deviceinfo.flags = 0;
+	deviceinfo.memorg.bits_per_cell = params->bits_per_cell;
+	deviceinfo.memorg.pagesize = params->byte_per_page;
+	deviceinfo.memorg.oobsize = params->spare_bytes_per_page;
+	deviceinfo.memorg.pages_per_eraseblock = params->pages_per_block;
+	deviceinfo.memorg.eraseblocks_per_lun =
+		params->blocks_per_lun * params->lun_count;
+	deviceinfo.memorg.planes_per_lun = params->lun_count;
+	deviceinfo.memorg.luns_per_target = 1;
+	deviceinfo.memorg.ntargets = 1;
+	deviceinfo.eccreq.strength = params->ecc_max_correct_ability;
+	deviceinfo.eccreq.step_size = 512;
+	deviceinfo.eccinfo.get_status = ecc_get_status;
+	deviceinfo.eccinfo.ooblayout = &ooblayout;
+	deviceinfo.op_variants.read_cache = &read_cache_variants;
+	deviceinfo.op_variants.write_cache = &write_cache_variants;
+	deviceinfo.op_variants.update_cache = &update_cache_variants;
+
+	ret = spinand_match_and_init(spinand, &deviceinfo,
+				     1, id[2]);
+	if (ret)
+		goto free_model;
+
+	kfree(params);
 
 	return 1;
+
+free_model:
+	kfree(deviceinfo.model);
+free_params:
+	kfree(params);
+
+	return ret;
+}
+
+static int micron_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * Some of the Micron flashes enable this BIT by default,
+	 * and there is a chance of read failure due to this.
+	 */
+	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE, 0);
 }
 
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
 	.detect = micron_spinand_detect,
+	.init = micron_spinand_init,
 };
 
 const struct spinand_manufacturer micron_spinand_manufacturer = {
diff --git a/drivers/mtd/nand/spi/micron.h b/drivers/mtd/nand/spi/micron.h
new file mode 100644
index 000000000000..c2cf3bee6f7e
--- /dev/null
+++ b/drivers/mtd/nand/spi/micron.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 Micron Technology, Inc.
+ *
+ * Authors:
+ *	Shivamurthy Shastri <sshivamurthy@micron.com>
+ */
+
+#ifndef __MICRON_H
+#define __MICRON_H
+
+#define SPINAND_MFR_MICRON		0x2c
+
+#define MICRON_STATUS_ECC_MASK		GENMASK(7, 4)
+#define MICRON_STATUS_ECC_NO_BITFLIPS	(0 << 4)
+#define MICRON_STATUS_ECC_1TO3_BITFLIPS	BIT(4)
+#define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
+#define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
+
+#define UNIQUE_ID_PAGE	0x00
+#define PARAMETER_PAGE	0x01
+
+/*
+ * Micron SPI NAND has parameter table similar to ONFI
+ */
+struct micron_spinand_params {
+	/* rev info and features block */
+	u8 sig[4];
+	__le16 revision;
+	__le16 features;
+	__le16 opt_cmd;
+	u8 reserved0[22];
+
+	/* manufacturer information block */
+	char manufacturer[12];
+	char model[20];
+	u8 manufact_id;
+	__le16 date_code;
+	u8 reserved1[13];
+
+	/* memory organization block */
+	__le32 byte_per_page;
+	__le16 spare_bytes_per_page;
+	__le32 data_bytes_per_ppage;
+	__le16 spare_bytes_per_ppage;
+	__le32 pages_per_block;
+	__le32 blocks_per_lun;
+	u8 lun_count;
+	u8 addr_cycles;
+	u8 bits_per_cell;
+	__le16 bb_per_lun;
+	__le16 block_endurance;
+	u8 guaranteed_good_blocks;
+	__le16 guaranteed_block_endurance;
+	u8 programs_per_page;
+	u8 ppage_attr;
+	u8 ecc_bits;
+	u8 interleaved_bits;
+	u8 interleaved_ops;
+	u8 reserved2[13];
+
+	/* electrical parameter block */
+	u8 io_pin_capacitance_max;
+	__le16 async_timing_mode;
+	__le16 program_cache_timing_mode;
+	__le16 t_prog;
+	__le16 t_bers;
+	__le16 t_r;
+	__le16 t_ccs;
+	u8 reserved3[23];
+
+	/* vendor */
+	__le16 vendor_revision;
+	u8 vendor_specific[14];
+	u8 reserved4[68];
+	u8 ecc_max_correct_ability;
+	u8 die_select_feature;
+	u8 reserved5[4];
+
+	__le16 crc;
+} __packed;
+
+#endif /* __MICRON_H */
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
