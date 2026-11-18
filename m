Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52C60A2615
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dU2pymx/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O4QWvleZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sv2vw0HxGvc29iBJToqjVnH2Z6UxlYKW7IHZahcq+wM=; b=dU2pymx/pSEXuLbowqDwRT/Wm3
	rMgYYK1Tk7lrSq5JuQyjmBBGKSX2GKuVqnLNsBeFqwUA8BpVBNTXkzt5al+mQBDoYTQUnDDeJKMVu
	d9L751StEhD6JSfiuT2cmkpIEvpCoMGDxF17a0LQGJeq7rX0fI2TVFj1UMP06/zVPegvb2dyo1/LP
	mOctrx+rcZW2YHkUgwx0PUoVzs1jFwRwrd8btg68tC+SuyIc6Xt+FLqMGuKYUCHWQW1NFeuZ7CR/V
	EcBAET3UjjwfCQqXIzuJ+Eg2URtvHo82lIcsj8v5tMi9fUqpHCmkFBH5azZ+BCWve5GRJN5Wc93Yp
	G8ssQDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9P-00000009i9K-2XtI;
	Wed, 18 Nov 2026 17:08:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9K-00000009i4N-2qBG
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 05EF71A16CB;
	Wed, 18 Nov 2026 17:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4A1F5FE9B;
	Wed, 18 Nov 2026 17:08:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7AA011BC2A08;
	Wed, 18 Nov 2026 18:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nIo1pAkIk8swxehsOJTufgrMJR12HIoBthNUBkOnOis=;
	b=O4QWvleZ9nJ3tN6xQFd0NOJm81A+AYhCzN0DRG18tOZGaLqwrAYGuR9T5/De4Bqb6WlbuH
	pjNxhwqAf8KZl/tNA4yCY21T0+zl5NkCDcl4TcInZKkNVHFuiy1QqQ88xtIEirkrNHknBY
	DRqVAXCbxSNVi7If97CCHz5+3VLW4q7YJSEgT9Gu/v4fAEfqsUfROHeNNiLvas9B64cZJi
	Q0uU7IFjJUatjFlChDvPSMMoAJq66f6KNrEtZxz4pox2zbSYFkpH9QKAYnwS7fkJR4RBjq
	Gy2EBNSemzIjnwbQUrDSuu91hM3eUz3SzPsvS/n1QcN+oXAg3OmK709RYod5uQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:20 +0100
Subject: [PATCH v2 03/13] mtd: spinand: winbond: Generalize the LW OOB
 layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-3-55956313d6cb@bootlin.com>
References: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
In-Reply-To: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_090846_868465_1119C635 
X-CRM114-Status: GOOD (  16.84  )
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

All W25NxxLV and W25NxxLW chips use the same OOB layout. Rename the
helpers and structures to make it more obvious, and improve the comment
to reflect this situation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 43 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index bf5696037b75..0288788ff0d0 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -339,6 +339,8 @@ static int w25nxxkv_kw_ooblayout_ecc(struct mtd_info *mtd, int section,
  * 12 ECC-protected "User Data I" bytes.
  *
  * This layout exposes both User Data I and II for backward compatibility.
+ * See w25nxxlv_lw_ooblayout_free() for a variant that only exposes the
+ * ECC-protected bytes.
  */
 static int w25nxxkv_kw_ooblayout_free(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *region)
@@ -364,37 +366,38 @@ static const struct mtd_ooblayout_ops w25nxxkv_kw_ooblayout = {
 	.free = w25nxxkv_kw_ooblayout_free,
 };
 
-static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *region)
+/*
+ * The second half of the OOB is not accessible when the on-die ECC
+ * engine is enabled. This prevents accessing the ECC bytes.
+ */
+static int w25nxxlv_lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
 {
-	/*
-	 * With ecc enabled the parity bits are not accessible. So we can
-	 * only see page + 128. Without ecc the full page + 256 is accessible.
-	 * To make it simple just return the area as not accessible.
-	 */
 	return -ERANGE;
 }
 
-static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *region)
+/*
+ * Same layout as w25nxxkv_kw_ooblayout_free(), except that only the
+ * ECC-protected "User Data I" bytes are exposed. The non ECC-protected
+ * "User Data II" bytes are not exposed.
+ */
+static int w25nxxlv_lw_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
 {
-	if (section > 7)
+	unsigned int num_sections = mtd->writesize / 512;
+
+	if (section >= num_sections)
 		return -ERANGE;
 
-	/*
-	 * Only expose the ECC protected "User Data I" bytes. The "User Data II"
-	 * bytes at offset + 2 are not covered by the on-die ECC engine, and the
-	 * first two bytes of the section hold the BBM.
-	 */
 	region->offset = (16 * section) + 4;
 	region->length = 12;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops w25n08lw_ooblayout = {
-	.ecc = w25n08lw_ooblayout_ecc,
-	.free = w25n08lw_ooblayout_free,
+static const struct mtd_ooblayout_ops w25nxxlv_lw_ooblayout = {
+	.ecc = w25nxxlv_lw_ooblayout_ecc,
+	.free = w25nxxlv_lw_ooblayout_free,
 };
 
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -828,7 +831,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
@@ -852,7 +855,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&update_cache_variants,
 							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
 		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 };
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
