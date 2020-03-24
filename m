Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F80C2BAEE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E1120719
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qf0O3WGp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nXYbMqxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E1120719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPW8rSEONSB7fGoCVoKp/Qt58Lg8YjNSqVCgMpwOJSs=; b=qf0O3WGpMkCh9n
	XQ7PXTzfDU1Y+33Bep1cV4LfLsxk8YdBpyuLX/nrTareVCGFMuRmT03xzLz4OwwCEowA60PtmwuL6
	Rmpx4WEw65xWeKZqCOPPNe12TpaXN3jE4K3Saq1wxP1xDn5c71gRSiTwVdQVhoL9qM2Tr6AuIQETY
	972g+r1+nveFzSMigSUEeAOYso5nEkvrYPvGoOusYFQgBK/X3It3Wl8bHtB8VO4Fij0jHoKs5nrO3
	5CW8zkbMhwpvjYwgpLRpDB3okDnmaEsyjOBmio0h5LR9roibZzzR6c8lCTHc1LrxU8i+1GIOUwihM
	OHx6PpnDvuqopMw3CDHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGcdE-0005TX-JI; Tue, 24 Mar 2020 06:01:44 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGcd3-0005J9-4z
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 06:01:35 +0000
IronPort-SDR: 9JQ3VY/2E/4cQapFIOSR6OkrdYl+nx4fRITMeqk5Bdy0Sc+BEMp/v6Z1nuLjNsbtnqv3CGq/7n
 ghQ5QHmm5KaLjst4CanNKs5B21eJTmXkwNZbAGtTlOvcDyZ/m+0UHM0TkYvjulZjSJLfkoOyuV
 GT8JpfHlxT2w/CNnJANTcPD9N+h770ZxBEkiAJZF4wGjFpRKBV9w6bSX8QggJ7bNDtstgxNgxL
 FF5valeu3EA6+GI1zlaRDvfnfqNaoskcZ7Yv0mCiEdGxPB1ezG5XUBFgoNdbW0hpbL4cLiwFX5
 jyM=
X-IronPort-AV: E=Sophos;i="5.72,299,1580799600"; 
   d="scan'208";a="6755192"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 23:01:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 23:01:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 23:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxwpKOQLtdZNYl0+1iu8oT5gQWPkc0My1egsWub7jeI1bHQNztDnYJ7kfMuA6d+kh9OmyyYRalVRaTSV4sUKbkhTZoeyLB1X0ImTJxczxYNtOBKY/FH8QHElamrLxNY362QrYCRmdl1MwuTBLUjmdezOL7kJYEfPgcIumZqd6Jofazc6xlbHiZP9Rsoef9v6yOUklGYso1+3xHClzOMMijMoGhK1R6aUAOkdvxXBb5U+8/H1QmNro+DIvYv5r1bZWXLu8AGCZoBC+NG7VigkgmjHarNNUCKM/PXrMiZGgrBNnNU6jXpxQun6iWbojQ6DZikEn61I7PsNhegUIAo28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUIoh7cvDzuHuYoCdn51wLxE1RGb1dI95R9ga94BlM4=;
 b=A+Rhb3QbWL024pZ+h3Lcs1w4hjm8I2kTJlCT28zOGbAK6+EpHPChB6jECoFC0w+Vm6xo77P/bTiBXknu++Co30SKfaf/EUbAqgkdA/WQn2xJFcE2uycrKsmp76VPv2yeFvxMr8vMjfXiQeVuQ2HdUDd2RUFMcnNc17xBZwZBw4PPEDVSdeoMHTYnL3uk6fF5T60nQK1IhL9Hhb1nW2fT752jii5T0Jg5tp8/nevYLxIeh+YbnVQ4Y/2da4xy+ETYGG9ANREqEzjIeudlVVxU0JRo+P6RHPYdJCzWtMiKlY1NgsZOeSKPzQ0+vLMSrBx6vg0F57gd8ED6apgopQ1xzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUIoh7cvDzuHuYoCdn51wLxE1RGb1dI95R9ga94BlM4=;
 b=nXYbMqxe0Ocj70BTF2C0kpp+IrXas80UlRzt+kFV5ak2QQi9Qk+e4mB9dqdMmWyMfSwIoSvTHtwns+FAXm2Yo5FCP7UQOUiUho6dT3C0lRKwH+rlt/LVC0UUgEE5l2Mu1mEa//sOMhSQ+wmXj/IFqCE5MUucmhKk4wJLCKhuw/4=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 06:01:30 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 06:01:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v4 2/4] mtd: spi-nor: Add new formula for SR block protection
 handling
Thread-Topic: [PATCH v4 2/4] mtd: spi-nor: Add new formula for SR block
 protection handling
Thread-Index: AQHWAaGpM1gEXm7TOkOqJ+H2wZ5+cA==
Date: Tue, 24 Mar 2020 06:01:29 +0000
Message-ID: <20200324060123.1533917-3-tudor.ambarus@microchip.com>
References: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94efe077-36bc-4e8d-e782-08d7cfb8cc06
x-ms-traffictypediagnostic: BY5PR11MB4184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4184C4DC6EDB4FA067EDACF2F0F10@BY5PR11MB4184.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(136003)(346002)(366004)(396003)(6512007)(8936002)(86362001)(2906002)(71200400001)(316002)(478600001)(54906003)(110136005)(81166006)(966005)(186003)(26005)(2616005)(76116006)(91956017)(6506007)(66476007)(64756008)(66446008)(66556008)(36756003)(6486002)(5660300002)(1076003)(8676002)(81156014)(4326008)(107886003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4184;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w6JO3F6f4LtpsjzhFvDkHJ712qo9b8PMpKH/sn7gp/xWYpDLwm8rV9ys8wRtWCBsO/WD5PlOjPW1uFy1fR3yZL4NgW5adCxxsHUPAC3t2gfvhavPIYuTTviNaj2xi9h7vpddNQ9DjlOlQWmee1+A6Jcqx51UOMDtEHnPXgiyxUdnebuzHupMmGzOsO4x0yMbGOBp2bge6b8KDF1xw6WI/nfFb64GsE8wPmYuiKJl0zdCr50Me1lqVx8noLGx15ADVGzFFzQnTBkPN+pojysHYxTDjSFT7a1uPX3DkuQDld41X0BWt85VSs1AYLe6AMCl5zZd1/4Ii8NoprYHDPIlyfmBbYbfLLtK8nF4yq4a42XAWLp16RUyQ5qJwTgGFQqcisZRZwQj12cXHqCkKLFmvu4eaC16hJD7+TnoL7jV/8G8sxSImUTlOEU5bnEsfPCJm9gkkajRR02P6wuYIAkDX2R9KDy59Vj0/opBdJ9iA3XAnft5Y63sg+n4rGZBi03+gVWxDsyAkH+tD1KJuXX4nA==
x-ms-exchange-antispam-messagedata: 7MbnnlILdOhr00efZLcjWPdaMgNplWaLQf5cm6MBl8dc1ITe2lIFS8lOdn/Np4BUvNN61T1FY01Vh/O98/HSmRHljxcfXczhraFAWIOopB1lpn37nM66CjAabGMbClrSlCh+rzD4xcPKJ6ai3O4SvQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 94efe077-36bc-4e8d-e782-08d7cfb8cc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 06:01:29.9081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52xp/Yolgb8f4GnHjnnagP+DTElxf6JotNZcJ+Tnny7iF7WrTZVmXITBzCPlId3Gg27v+jAvxytRebciw4Fa9xxCWKHY1hsAcSJ8zjfnK2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_230133_264441_2D489494 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jungseung Lee <js07.lee@samsung.com>

The current mainline locking was restricted and could only be applied
to flashes that have 3 block protection bits and fixed locking ratio.

A new method of normalization was reached at the end of the discussion [1].

    (1) - if bp slot is insufficient.
    (2) - if bp slot is sufficient.

    if (bp_slots_needed > bp_slots)    // (1)
        min_prot_length = sector_size << (bp_slots_needed - bp_slots);
    else                               // (2)
        min_prot_length = sector_size;

This patch changes logic to handle block protection based on min_prot_length.
It is suitable for the overall flashes with exception of some corner cases
(see EON and catalyst) and easy to extend and apply for the case of 2bit or
4bit block protection.

[1] http://lists.infradead.org/pipermail/linux-mtd/2020-February/093934.html

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Tested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 72 ++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bc57b1b5ec62..8146d82afe61 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1536,29 +1536,51 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
+static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
+{
+	unsigned int bp_slots, bp_slots_needed;
+	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	/* Reserved one for "protect none" and one for "protect all". */
+	bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
+	bp_slots_needed = ilog2(nor->info->n_sectors);
+
+	if (bp_slots_needed > bp_slots)
+		return nor->info->sector_size <<
+			(bp_slots_needed - bp_slots);
+	else
+		return nor->info->sector_size;
+}
+
 static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 					uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
+	u64 min_prot_len;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
-	int pow;
+	u8 bp = (sr & mask) >> SR_BP_SHIFT;
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
 
-	if (!(sr & mask)) {
+	if (!bp) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
-	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
-			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
+		return;
 	}
+
+	min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	*len = min_prot_len << (bp - 1);
+
+	if (*len > mtd->size)
+		*len = mtd->size;
+
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -1631,6 +1653,7 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
+	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
@@ -1673,20 +1696,12 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
 
-	/*
-	 * Need smallest pow such that:
-	 *
-	 *   1 / (2^pow) <= (len / size)
-	 *
-	 * so (assuming power-of-2 size) we do:
-	 *
-	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
-	 */
 	if (lock_len == mtd->size) {
 		val = mask;
 	} else {
-		pow = ilog2(mtd->size) - ilog2(lock_len);
-		val = mask - (pow << SR_BP_SHIFT);
+		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
+		val = pow << SR_BP_SHIFT;
 
 		if (val & ~mask)
 			return -EINVAL;
@@ -1723,6 +1738,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
+	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
@@ -1764,20 +1780,14 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
-	/*
-	 * Need largest pow such that:
-	 *
-	 *   1 / (2^pow) >= (len / size)
-	 *
-	 * so (assuming power-of-2 size) we do:
-	 *
-	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
-	 */
-	pow = ilog2(mtd->size) - order_base_2(lock_len);
+
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-		val = mask - (pow << SR_BP_SHIFT);
+		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
+		val = pow << SR_BP_SHIFT;
+
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
