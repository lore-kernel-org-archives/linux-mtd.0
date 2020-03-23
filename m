Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869E2C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561EE2072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHQJdWmF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="CSD17xfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 561EE2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3ocJ+WZDDdCNuocd3QtYpOQy0ToAKppo3OZ5C+wVqw=; b=PHQJdWmFQoVvqa
	1FmoA1giGNyrAiTTAz4BO7wlrLuityrDzxXScLh+TRzX59TgdXdYxsjttvUiUgyU1ZMuM16ZdNkSQ
	uUHEbKJ6nzvy/fp+TPvi5YFjEA+uOIldlOZOJm6NCBLqfWe8TKOETAPr9kykLXZqigsqlS8s4hz3j
	7pVhTKm3QHAwyitMFK1TKBzBGWUCvDM8EqcZh+djvQiln8N2JAuVbEGt/ybzhsW1ENpXQ8EsB6fiM
	KLxRH3mU1dLPTxO4XSbU9AZ8dZ/2GbdfDqXSaLlnvXlbZLNZTRulYERK/Bn2WYK0Y0v1MpLrHL95I
	obdoi1SLy1GTD8+aO3ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJKb-0004uc-Rk; Mon, 23 Mar 2020 09:25:13 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJKA-0004TE-3j
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:24:47 +0000
IronPort-SDR: 1975KyWJM1JcTtVHzUqQp7cUeUx5tSXaSnX5qzP+AFe6vZHCipPAPGo6e31bIvM5Yg8/Pz0CzN
 3B1q27UmYJWYyWkiy9id1EYcJL5LMpGk9P0McSCiEsArDusFTb+q0REO1Fg+TxKVEuEuFX+wkc
 YxG3uqky+YTL5Cq1+Eo4MOU4gyQA/Pp+EueT6IalhC3qcsG3lVZBN1rNeXV4d/Js48cxMNyeNd
 ZF6+HQT9Iu/E9YZs7LXaOBfS9LnWCpOSlCuKFShbKpXEmGZLkm+WijuJkS6NVQtz9x6f5EkBEY
 uUI=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; 
   d="scan'208";a="6620294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:24:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 02:24:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 02:24:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXpgPHCr06KIOnqdmm5BVwKIGokkKRfGrggwSrrCtWgaDdB3SpOzfRD1hT4Fj8jStEjPzdTT3m8Z5jiOk3QC1yGPvVmkdcsMd0COHIyJEPFrdXuXUSRPgElix5lx65ji5jQDuJcvTXam02OfPgyKX1TsLtRgfK+IrJ5js8aKBoKfWSgpNkbhrtYZbEGATnKkrFm1sp8Dce5UIvwI6zOWJ28ziMeFUjmpaMKEaZNKe588/ntoHZPzctbZLQmL+BPTU0oyFX8btMYrhVN2TURZF01D/Ft12VJZ4v+0QOy0YOGS1kMkShSbhXFWxT4ofw8rc0KKg+rS9fN7kuzI31twCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDy68fF7bu+PCWO1ckygtvkIdKQ+P41BDlqmS0PJEGc=;
 b=gX7OqtQvbkBLITG96mTN+6RxiHchxw4xqoSX0mzxIlU5/tpxSgmD+MVuzDs1WUW4qOLCKdx1y5YV1BXihUhuJS83UHd0mGYa+wFhxDmN7TIt5qzM7K5K9z5JXrPNqEya0y1Etj8+VwoU6kOlSfEZj9W5idml64LVZjMIh4e6jvus3WxpYb0Q2DPV5gPJ5wmgHs6vkJ9jhQ627tAsXOd47Zo7SPAQN5eFY2Y5AWuOdlURCPRNhnpLzSW7tfYU01K/UTusKbbvetZBigiqFf96SEnkBMLqAoVdCFydU/pH8yoL+XFYdS+BxQ3VU/jJBK3FQAco/hDFgtziLoJYuXHaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDy68fF7bu+PCWO1ckygtvkIdKQ+P41BDlqmS0PJEGc=;
 b=CSD17xfQP2xbsH0OM1op/y7Zj4dUHxp0y1HPlU2SSvx5abU9LsIf53XvnHWpewf8epnRt36ISsxNLCSYyAGoz6foMCDGMUOh5LwR9M6SblW3lsy75c15GRveDL9IKAAuuHwwAio0eS6rGopuNPpj7LScapPV9ULUiNW7CUme094=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4449.namprd11.prod.outlook.com (2603:10b6:a03:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:24:35 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:24:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Topic: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Index: AQHWAPTegR7iigdWDECxp9El2paD9w==
Date: Mon, 23 Mar 2020 09:24:35 +0000
Message-ID: <20200323092430.1466234-6-tudor.ambarus@microchip.com>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd5820da-1952-4ce8-ca41-08d7cf0c0104
x-ms-traffictypediagnostic: BY5PR11MB4449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4449A39B2D85203FC51B3738F0F00@BY5PR11MB4449.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(8936002)(8676002)(81156014)(81166006)(36756003)(76116006)(91956017)(66946007)(54906003)(110136005)(316002)(2906002)(66476007)(64756008)(66446008)(66556008)(5660300002)(2616005)(107886003)(186003)(71200400001)(1076003)(86362001)(26005)(6512007)(6486002)(4326008)(6506007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4449;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0kVNhCQ3LfNeAius3uhrvpBLcgDZ2N/NqOjej687hKU3/IeeiQUwBBDCLdNWLn63+0Haeyvr4HnLjlcFlnwR+DgNyFZVw0AdFu48wvjmJcjJWF+19vzzQgMsPyw6lsWNU1eyZQsnmsuXMwdGy0gginbDdeLOA6y2hv8hkBx3VOw46odFNnvrnD3+k195CYi8uF4onzEj1WzjPSMAnTNgjHOHKqeRGd8EfXOLtOpGP2pTLGclqhXvpCJnnAjG4dRRBoQ6emFTTGby/1VrqUiVjmA4L0M00SxU2l5jgwM6exRhVRM3BZSYhp59WDa+LQtCK4W72tbwsBYFXTpVUQ5IzDgLCn3dsiPS4vhHbVyS/q7bYAv4gN7t8ZLl6cLELYgWIV4RZIsCiGLvhVs7CfmSs6UMvT+YD9OSqpeqDd2TBkbx5KrvPL5ujWcXoy3stfP8
x-ms-exchange-antispam-messagedata: rDFIa6Oua20f2mZFAQObGLY4o7/ruLIpuEzoOOyLPjykNdUtBzGnlbMci3MpvfBcNqoYaihjD5fj5gCDJ7YGjrKAvHO/so/hIcDpYAXU+4MY+ytQINNKaefHsQhHNvDp6ipt34rYNm1bStlZZYt1ZQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5820da-1952-4ce8-ca41-08d7cf0c0104
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:24:35.6714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9McpyNbSubDpKhnYHczkiUJ5FefbdxE5fP6Wkh2Q7h5gMdpBlUqNdFCQdMkA11SE6IQe2fGKRHjB0ypZw+i4aXRDSd/ZWdH7gXGA4Pxfrwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_022446_186799_5174187F 
X-CRM114-Status: GOOD (  15.73  )
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

Currently, we are supporting block protection only for flash chips with
3 block protection bits (BP0-2) in the SR register.

Enable block protection support for flashes with 4 block protection bits
(BP0-3).

Add a flash_info flag for flashes that describe 4 block protection bits.
Add another flash_info flag for flashes in which BP3 bit is not adjacent
to the BP0-2 bits.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Tested-by: Michael Walle <michael@walle.cc>
[ta:
- introduce spi_nor_get_sr_bp_mask(), spi_nor_get_sr_tb_mask()
- drop Micron n25q512ax3 / BP0-3) boilerplate description
- be explicit in spi_nor_get_locked_range_sr aboyt SR_BP3 as Michael
suggested,
- amend commit description]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c  | 66 +++++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/core.h  | 10 ++++++
 include/linux/mtd/spi-nor.h |  2 ++
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c0d186f417d8..b70c0b2e0958 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1514,13 +1514,34 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
+static u8 spi_nor_get_sr_bp_mask(struct spi_nor *nor)
+{
+	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+		return mask | SR_BP3_BIT6;
+
+	if (nor->flags & SNOR_F_HAS_4BIT_BP)
+		return mask | SR_BP3;
+
+	return mask;
+}
+
+static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
+{
+	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
+		return SR_TB_BIT6;
+	else
+		return SR_TB_BIT5;
+}
+
 static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask = spi_nor_get_sr_bp_mask(nor);
 
 	/* Reserved one for "protect none" and one for "protect all". */
-	bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
+	bp_slots = (1 << hweight8(mask)) - 2;
 	bp_slots_needed = ilog2(nor->info->n_sectors);
 
 	if (bp_slots_needed > bp_slots)
@@ -1535,12 +1556,14 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
-	u8 bp = (sr & mask) >> SR_BP_SHIFT;
+	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 bp, val = sr & mask;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
+	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
+		val = (val & ~SR_BP3_BIT6) | SR_BP3;
+
+	bp = val >> SR_BP_SHIFT;
 
 	if (!bp) {
 		/* No protection */
@@ -1598,7 +1621,8 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
- * Supports the block protection bits BP{0,1,2} in the status register
+ * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status
+ * register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
  *   - CMP: complement protect - only support CMP=0 (range is not complemented)
@@ -1633,8 +1657,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
 	int ret, status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
+	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1671,9 +1695,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
-
 	if (lock_len == mtd->size) {
 		val = mask;
 	} else {
@@ -1681,6 +1702,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
 
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+			val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
 		if (val & ~mask)
 			return -EINVAL;
 
@@ -1718,8 +1742,8 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
 	int ret, status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
+	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1756,9 +1780,6 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
-
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
@@ -1766,6 +1787,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
 
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+			val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
@@ -3125,6 +3149,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
 
+	if (info->flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (info->flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3ce826b35ad1..6f2f6b27173f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -24,6 +24,8 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_16BIT_SR	= BIT(9),
 	SNOR_F_NO_READ_CR	= BIT(10),
 	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
+	SNOR_F_HAS_4BIT_BP      = BIT(12),
+	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
 };
 
 struct spi_nor_read_command {
@@ -301,6 +303,14 @@ struct flash_info {
 					 * status register. Must be used with
 					 * SPI_NOR_HAS_TB.
 					 */
+#define SPI_NOR_4BIT_BP		BIT(17) /*
+					 * Flash SR has 4 bit fields (BP0-3)
+					 * for block protection.
+					 */
+#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
+					 * BP3 is bit 6 of status register.
+					 * Must be used with SPI_NOR_4BIT_BP.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e656858b50a5..1e2af0ec1f03 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -111,7 +111,9 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_BP3			BIT(5)	/* Block protect 3 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
