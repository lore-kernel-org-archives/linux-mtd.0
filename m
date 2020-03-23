Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C152C4332E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:26:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C79E2072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HdvlQKv0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iF+g8pP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C79E2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njNGy/kyuK61XYPVmzbgEOkJUNTAZUYwbs1Gyg/eVpo=; b=HdvlQKv0qDp1BX
	l6O2gbEVB3CwaRWk/2ZRhWZjBdMj2rZAtfjUNY+TrvSo9AB+v9pMMr1yDWQL2dNrxhbm2Hv1OfIYn
	KLtXooyPJCyI3bmBoY1KF5v+Cbnb8QmJ/wWHLXqX39JkdH0o127BDRlCcMBJg5Ppqr5GAzm5RASDs
	tOgasUSDPSkAHosFV9d2NmLW/O0DjndJpRNP36jvu0PNR+z/A8CB8ylvNwEuZucCcg4SGWedJMhkL
	e9oC6yD4jupbPwbUGdnxD2yxCk6weCWeA9vIuAlCalEk20Kn8od/zmiY6IRM/p5bfrsOEOM6HERHP
	oISH83e/KK1t4z7LQ4NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJM6-0007Xe-5q; Mon, 23 Mar 2020 09:26:46 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJKE-0004TA-V1
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:24:52 +0000
IronPort-SDR: ae6iZ+AAWn3yYTu2DWwQ9IVCsLgqQXmdEa3NDfUrEShD5BVFncTC9Q8sjYtR779qrknUNZ/LNX
 O9sbz6x2O65h5GB81k8A5kX5ufI6ascFjQIGy2QqTa0Kkkygdrsva8tHiv2UgUkdbHyXB+6wVB
 sDUJd6mb2UOdQLHjQ0VtTAsX+WDL3Fbz8ECn10he4EdspYkqdxCTGWk/Kd48+LZbLyl4ervMxb
 nc4QA3s6JWgeSJjAhRJSpGyOLhXBCdkyGJ2FuxJaudM0g7GhYX93dhz5+1MwfC93RVmSUO773X
 q8Q=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; d="scan'208";a="73067124"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:24:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 02:24:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 02:24:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciarQWgh/pradRy5/0wR5t7tF9bQZJmbJ9ptDSKQtTlnJeBIz5fVDq6xNpbMz13FAOzTy/yl1ixDokFz9Q/6BxlKXfm19nm/SMqENRlp+V5pCHshGJvRABmaKMQLOrJJUFhC/4MCv81JOnAXAouSriGh9tP+eNHgnlXsZEAY0Wv2AihuFgG4PbjevONE2ovpPPLHCm08xgJMFWp/yeC7bwdlD1UcMEP0YeR1+UbyesbiVymfXnzAjpuA5adGYEDWZlvPmqESBPfq2ezT3iJRUmQ41wteZPwBbdAPP6sboVkY5/0aym+0hr4dT2b0eAIUoPeMRpGeEGKYpe+X7s60Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6iIQ4rU8Vsr2Y2/ntqOk02gigDe7EF/BdHuWaijq3k=;
 b=TKt4QXKDibVLpPWmBU4APPxjG5FYOZYA4CsJdW27hvwK6dQEzJrb9L17UYNm9PNnHFVbDc7UL7jL8jniJU6RpXdICJT5pMSvlpFze5lFVSWsBKnjHADWf3do4BzsUUjKFpjkWnN6vpmnzZE4OjM2aeZNRweKVgZp2ffyAU1sgAkY4XisLFHqbUL07Ioqm6azhHEdmkMlTJF6b0MLvDVoml9o3Xu47uNJKMvq5EQ/zDqDFGu5JChaAZLsBNBYOMEZSw8PVX7dH9UakiqKdnXd3iYyjgILwogYhDNyhHBSN1EmUawW8NSI8SkSqJ2KSDqkrL/tUmiHSXZC0SxC8S+/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6iIQ4rU8Vsr2Y2/ntqOk02gigDe7EF/BdHuWaijq3k=;
 b=iF+g8pP5kofJoXtQ/+APZHTaIQ0Jp+beFWBgrIz0Afy3Z0Q+5NjOEUF4ehCgBIDhQ6z2lJqTFyAoinDXaELGGfKgLODSV2AZoaujy+Jn04ek0XWD7MLvYDbRYNiSm9QhCUSyaXt+Ub8TaRt4RETofZhOi1vGldEKpU8TC3IqhvM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4449.namprd11.prod.outlook.com (2603:10b6:a03:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:24:34 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:24:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v3 3/5] mtd: spi-nor: Add new formula for SR block protection
 handling
Thread-Topic: [PATCH v3 3/5] mtd: spi-nor: Add new formula for SR block
 protection handling
Thread-Index: AQHWAPTd52zG839Gm0+JAaqFu95iGQ==
Date: Mon, 23 Mar 2020 09:24:34 +0000
Message-ID: <20200323092430.1466234-4-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: a1a51817-29d1-412a-3c22-08d7cf0c003e
x-ms-traffictypediagnostic: BY5PR11MB4449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB44493F85F446026546E7C9EFF0F00@BY5PR11MB4449.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(8936002)(8676002)(81156014)(81166006)(36756003)(76116006)(91956017)(66946007)(54906003)(110136005)(316002)(2906002)(66476007)(64756008)(66446008)(66556008)(5660300002)(2616005)(107886003)(186003)(71200400001)(1076003)(86362001)(26005)(6512007)(6486002)(4326008)(6506007)(966005)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4449;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaIS1k2PfvhDyyhz+Fi+/M+QiWRAD5/+iyWxHqrrtqOArm9+fyjNLfGxD5jREEq6M1ikP5p9Kvj8lt1XkL/ZMh2PMfxJEdsAjkr48Fjoo09UFG4M78znk/PwFzKi+UeVBgqQSFskTp/e0ZgJ7P5/Ou44b7nGiF33Ox+wW1IDVhYLrf8lZoynCKIdY/eQQC603WtifJSxhg3IALzBcI4qkHG+moGaXlEyR/oZ0zjRujNIiV7S8TSWTkZiOdrc1rAQlsS+BiXTeWXIVOH/XMpJXEp8Kj5+a8boC0AvPc/ddkdv2OzewWZrPh/QoeXmSjsr1nAcv2XlFOCLM01fskxqnQhoIVBQRQXXpY+j3m1kX1pNiLoO65Eg4gL1uku/1WaFH+vxIT+Hu1MVEAbvZ3TyP45DG4ILmkr/gJB164gkqE4zItY3BgL6uihXe02JZV/wFUz6ElL/THMIxzLRs9o8ls71clFHCL16xWnAcHrWGPEaN8Xlp2xQjzMcupVWpjca4LtrJcNZlvuhlfk/kAl6EQ==
x-ms-exchange-antispam-messagedata: 6RGYuD8/+MbHeXCy80WPwjQURrtbslK7/ZkpjsGVnT6JYLYIzSUxkXd3cfg/BzVSTpuSy0RuAjBMk97T0juPZTyau3n5oLqmfTMTz/s05sECd95U1BPlsZnp9Vos0e9nxGp4SDpSrjkNfRDuEj4IrQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a51817-29d1-412a-3c22-08d7cf0c003e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:24:34.5501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhoPutwzICYxmiBumHOCy6pepbb2nmsitAMGDQEXtRwGChkQk9diJpiFN3f718NHAl6u7508QTmyf6kvLYBem1WABnHzAMWS5UjGt7hXYpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_022451_020987_CC4CADCC 
X-CRM114-Status: GOOD (  12.98  )
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
to flashes that has 3 block protection bit and fixed locking ratio.

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
[ta: - drop spi_nor_get_bp_mask(), spi_nor_get_tb_mask()
- rename spi_nor_get_min_prot_length/spi_nor_get_min_prot_length_sr
- static u64 spi_nor_get_min_prot_length
- unsigned int bp_slots, bp_slots_needed;
- bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
- amend commit description]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 72 ++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3788a95c0a47..c0d186f417d8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1514,29 +1514,51 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
@@ -1609,6 +1631,7 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
+	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
@@ -1651,20 +1674,12 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
 
-	/*
-	 * Need smallest pow such that:
-	 *
-	 *   1 / ((2^pow) - 1) <= (len / size)
-	 *
-	 * so (assuming power-of-2 size) we do:
-	 *
-	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len)) + 1
-	 */
 	if (lock_len == mtd->size) {
 		val = mask;
 	} else {
-		pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
-		val = mask - (pow << SR_BP_SHIFT);
+		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
+		val = pow << SR_BP_SHIFT;
 
 		if (val & ~mask)
 			return -EINVAL;
@@ -1701,6 +1716,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
+	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
@@ -1742,20 +1758,14 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
-	/*
-	 * Need largest pow such that:
-	 *
-	 *   1 / ((2^pow) - 1) >= (len / size)
-	 *
-	 * so (assuming power-of-2 size) we do:
-	 *
-	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len)) + 1
-	 */
-	pow = ilog2(mtd->size) - order_base_2(lock_len) + 1;
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
