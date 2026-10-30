Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B560A262A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oD831l3i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RxdX9r++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZvsKKqQdsXr5xrIrnif4H9UAPSzpL7d+N8/tzfplHto=; b=oD831l3i6Zp6IcPgH6tfgmcvoc
	Oqf+H9OlBCzLqJihQeXn3D8u0gZCgBYN2DBkWZhlXpqcDtEX8t+9It82A14pzUqlIPm/av9XkEEk4
	sdECOyloD5GkUGljPgKGQZJ0nPH+74bnM0PFu/gdHgaC3/gcLl0LnNOrkPXT/19TfU+3unGCbd7df
	wZhHpqARSc9NdrwCGoaIDIXFFAzXlYU7ni47O+mBecI6gMXNSdy14N4VHehuWYw5hfP0lnG/wmZBJ
	885cIZeccune27kjchpmNlWCpAzgQYFRLZtsbVNn4Ncub+/Ki4jDLAs6KoYW9o86MQInINSKjd5Qv
	DaWqSA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfg-0000000CHAf-2KTt;
	Fri, 30 Oct 2026 17:45:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfZ-0000000CH6d-3X5G
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E38A1A13D9;
	Fri, 30 Oct 2026 17:45:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7B53603C2;
	Fri, 30 Oct 2026 17:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C14FB103290EE;
	Fri, 30 Oct 2026 18:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R8JAceMMwHGuwqfi9fHes1au02XQEjVobeDAMWxCelg=;
	b=RxdX9r++HgNmEbEVDr69nkHvLnitlKNp4mEWJHe6/tiDnHohtkmPEsTOn9C0Vd+d33kuVi
	4YLiz4AgQoi8JkpqrJvJe2Ksif7zp5bsgI4Iyz2GqDg6SxH103wyJ6PR9q+s4aJwOk5wg3
	GRsxVKoeJ8MKNwnYtYTM9+Cp265kNEUCe1mvW29z0fJ/bxypY4XUa3CiEoTlmHpNNP+k55
	d/0nf1xvDiG0LGSvlOb5uWRm52ymdqQOQ1K3kwro7Ry+JHXcWYabxhj0zn1Aedctr+NhMf
	f8fLuo6XVN1fLkTLPbPnTCTyvWMQbfNGXcTzSQPSPr5Egd5HZoWd9HHz7mgWOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:26 +0100
Subject: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104538_180601_BAA3654E 
X-CRM114-Status: GOOD (  14.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All W25NxxKV and W25NxxKW chips use the same OOB layout. Rename the
helpers and structures to make it more obvious.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 54 ++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 49fa545a4113..4ef30f1a4aa8 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -318,16 +318,11 @@ static int w25n01kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *region)
+static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
 {
-	int num_sections = 4;
-	int offset = 64;
-
-	if (mtd->oobsize == 256) {
-		num_sections = 8;
-		offset = 128;
-	}
+	unsigned int offset = mtd->oobsize / 2;
+	unsigned int num_sections = mtd->writesize / 512;
 
 	if (section >= num_sections)
 		return -ERANGE;
@@ -338,24 +333,21 @@ static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *region)
+/*
+ * The OOB layout is the same for all the W25NxxKV/KW/LV/LW chips: each
+ * 16-byte section holds 4 unprotected "User Data II" bytes followed by
+ * 12 ECC-protected "User Data I" bytes.
+ *
+ * This layout exposes both User Data I and II for backward compatibility.
+ */
+static int w25nxxkv_kw_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
 {
-	int num_sections = 4;
-
-	if (mtd->oobsize == 256)
-		num_sections = 8;
+	unsigned int num_sections = mtd->writesize / 512;
 
 	if (section >= num_sections)
 		return -ERANGE;
 
-	/*
-	 * For at least W25N04KW and W25N04LW, this region is actually
-	 * split in two:
-	 * ECC-protected "User Data I" at + 4 offset, length 12
-	 * unprotected "User Data II" at + 2 offset, length 2
-	 * This returns the full region for backwards compatibility.
-	 */
 	region->offset = (16 * section) + 2;
 	region->length = 14;
 
@@ -364,12 +356,12 @@ static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
 
 static const struct mtd_ooblayout_ops w25n01kv_ooblayout = {
 	.ecc = w25n01kv_ooblayout_ecc,
-	.free = w25n02kv_ooblayout_free,
+	.free = w25nxxkv_kw_ooblayout_free,
 };
 
-static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
-	.ecc = w25n02kv_ooblayout_ecc,
-	.free = w25n02kv_ooblayout_free,
+static const struct mtd_ooblayout_ops w25nxxkv_kw_ooblayout = {
+	.ecc = w25nxxkv_kw_ooblayout_ecc,
+	.free = w25nxxkv_kw_ooblayout_free,
 };
 
 static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -786,7 +778,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -795,7 +787,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -818,7 +810,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -827,7 +819,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -836,7 +828,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
