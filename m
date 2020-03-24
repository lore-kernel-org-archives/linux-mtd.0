Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08654C2BAEE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7BE82074D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hywIn85Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Jzo5+p8/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7BE82074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcQ3zCb1lUZx/C+njGrjg2iXqZHSSaV6bGGAJFns3ek=; b=hywIn85ZAblbZz
	DQljuzfaW2k+nv+iV79QKzv25W0Sxm/YKp3MLe6K8QJrQHaiTjqzSO5FpoASDstrDwbvZpuc0agW2
	t/UEMSkkBEIqV32ve9S+MjTqBJT4l9ceF88MoTKzHaMoOa60xTl85TE+iF5ZUVKqgIE8QMO2njz8x
	dLFRaL6xPAk4xPLPeGB7vp+vaWwq+ZJGh6NArJv2YPDJIgnmPg7JAAKD1VtWpg3fvkxJ9U1vNVGPx
	gOMPdH0KMyHcrhjqZ6Cbjwl9/YUy2OWJCxfbXGhMEUCwyS7k0w1o/jQW/1YMghuZjbeLKMdDAYvEN
	I4S5tThwkZYuPdwiR2oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGce0-0006Ht-J6; Tue, 24 Mar 2020 06:02:32 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGcd9-0005KT-PM
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 06:01:41 +0000
IronPort-SDR: xOpmc9p0Lt7J29FiC7SG0O5m7Dme3w6RPFSCF4lVJp93kDBrtZNx9OQ43302b2IB5DZ6tVmZs0
 HSUPFNHyeSJYOyfgl7jEqw6t2MR0fs4FpQT6bjP3qr2fOvBbu/bK5HPzrqER9CJl9qtYyxMEHV
 7te2zAlPsCOAKxscCbkRb1MhBUjSQuBOeAUKwJM0XpThysxaLEVqu7yvmaBsmhYRwljI2sWrOs
 bGtfmQYysJqVVXCoDkaJ/5XXrZYiJwB1l22aQdKbBnqdagwdszGnxgx+ePTprCxZYvuiOTaj82
 N1Q=
X-IronPort-AV: E=Sophos;i="5.72,299,1580799600"; d="scan'208";a="73217568"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 23:01:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 23:01:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 23:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RG5XOW9SxAc2w/jS5/Ox/n4e1yKUjHYEs3k99l7UkAABusKXYSd9NscQ94vy0D5aDeZ0f/iRKfESVq/ATr+fpYs2pQxu6pRMvp000L6UHVnev4Wf/zF88RoxCcoT/zKUpwY0dT/17FYCif958nsgiZjZHeNJQun5NNPALQSvcPaBGmwwjAdN8Ku93inu1VLCx9xNtUSZtQi5zRQ/U+abdgfyBRqNYMqptHGz6V5P4B3bmAOgPHhqEbzpkmE//BkbnIT15ek3PBP01wKI1NCpaYTnn0+7Pe1bj0Nf5dUp2WA3H5dJcS1sSOVKraSzbqQK6EVDtPIN23RUZ4Y341hkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5/Bg42Q7CTZ42e6vfKWLQeqYA51N/fVruJNDk6YOc8=;
 b=OyZW3p/XZnsqTE0qK382WRC/S7pSw88vQs5AXN8NWIiv5mxnepiqW2wTcKMULuqPSppvgaBq3EF8IevhtSAnoMv0em52ki8kuuyA0LQYt/aYRYQNIX0uKFlYwIuI1g51asFYCvenEoDSfFtEvpQFiVOECxAIpoKVP85ea6gTRMLgA+dZrTlIA2iOoHHsnSxA8FQR2BLSejbNZgEgBIih7hitXzKjddH8CLeXT958MBZsfJdWOpB3vd4kejezMmAM6cRvEN6AFXkj5+Eo2hsoBcfrTVTys6qk/kpgEohvYcMCJO6BrWAyreP3gwgugVzmD+VGna9nFODCgjBITrkuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5/Bg42Q7CTZ42e6vfKWLQeqYA51N/fVruJNDk6YOc8=;
 b=Jzo5+p8/qGFmhwBBIHRvrevGRjmt8aZriqFW6JQSMSiCs0KfbGvNK4OKO857n+yP7HfKApQPUlMMx7dP1HB3HEtOlVRZ0CzEFYYOyfHAxIzDtS2k6MpPo0wTnWvC9o0AsqeM0VU8ASq46TppYa4XQBQppfjzgMv6Mx9o7vs9T5Y=
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
Subject: [PATCH v4 3/4] mtd: spi-nor: Add SR 4bit block protection support
Thread-Topic: [PATCH v4 3/4] mtd: spi-nor: Add SR 4bit block protection support
Thread-Index: AQHWAaGpBJ7550OWt0aHGx94KXjnyg==
Date: Tue, 24 Mar 2020 06:01:30 +0000
Message-ID: <20200324060123.1533917-4-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 14ba51a1-f59a-46fc-45c3-08d7cfb8cc57
x-ms-traffictypediagnostic: BY5PR11MB4184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41843270FFBEC43D994BB0B0F0F10@BY5PR11MB4184.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(136003)(346002)(366004)(396003)(6512007)(8936002)(86362001)(2906002)(71200400001)(316002)(478600001)(54906003)(110136005)(81166006)(186003)(26005)(2616005)(76116006)(91956017)(6506007)(66476007)(64756008)(66446008)(66556008)(36756003)(6486002)(5660300002)(1076003)(8676002)(81156014)(4326008)(107886003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4184;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9Q2dt/Hyyh8m5VE6soble++gqmDq3kZHc1NCg3FfxtV5BTrcJidVj/M46nU8pOgCE9nrqg73J1q+RQeks46IEjmLGx2NytQZud0I/dV5eN5g+7ub7VpZc7RqZ+AfC0fxuX6ENkeza5qkUDn1L/magV5BumXBs5DbxUTq52kP5W8k5IKkCAjwSoRfnrctRDk2I9S54Ha6taO9YoXDHvEA6goSmcc+Io1FdqstJo8qNAaA8VhXTHKbgJQlA2lx390GucMcatYtoLv6voDnTraXB5xMwfQ0EI1+yJ73GyRr/y/RbUygUPVfMLev4a/xUQewKdmpUJYGll3VVKq2tTuMOhDwvwDdZtTQLqBE/+j05wI+yxWDaon2xPplTKt9BIWMVqRXO5RodUd5ncGRmidZskB3GHHsWkxwS39pUpboEPSNo2EBi2AojEHcSmIEE1M
x-ms-exchange-antispam-messagedata: 1DVzzSKs9/lnbTdimFpA6ZZwjWfnvBQ5DzTBLIM3y7/u2GE5RoGePcl/HbYofzOKzUv5yQFjnr2bTlhzeDk6TkpkEj3vnOBFolggidMTa/glMueQ1/B/ebzW32m1Lb51y/DSAJtTzUADB7ezv74x1Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ba51a1-f59a-46fc-45c3-08d7cfb8cc57
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 06:01:30.4358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVlbS1jbHbzvhmFBfcegq7dMyl2pQ4Cl76xthXH4XjXAsB782R9IWD7HaXVY9BIREYjOkLnbpxke5QAOXdha/8QKwQANAMLs+Jea29j2TFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_230139_845073_7F1D6FC9 
X-CRM114-Status: GOOD (  16.03  )
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

Tested with a n25q512ax3 (bp0-3) and w25q128 (bp0-2).

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Tested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c  | 66 +++++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/core.h  | 10 ++++++
 include/linux/mtd/spi-nor.h |  2 ++
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8146d82afe61..cc68ea84318e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1536,13 +1536,34 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
@@ -1557,12 +1578,14 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
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
@@ -1620,7 +1643,8 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
- * Supports the block protection bits BP{0,1,2} in the status register
+ * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status
+ * register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
  *   - CMP: complement protect - only support CMP=0 (range is not complemented)
@@ -1655,8 +1679,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1693,9 +1717,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
-
 	if (lock_len == mtd->size) {
 		val = mask;
 	} else {
@@ -1703,6 +1724,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
 
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+			val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
 		if (val & ~mask)
 			return -EINVAL;
 
@@ -1740,8 +1764,8 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1778,9 +1802,6 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
-
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
@@ -1788,6 +1809,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
 
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+			val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
@@ -3147,6 +3171,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
