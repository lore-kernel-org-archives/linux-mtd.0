Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914D360A262E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mK0Pnizm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l1CcjvtC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NupPLe7yNWffaf6jso8QbjM3izxYv90/elPrtSEFFXU=; b=mK0Pnizmho1mISxiG9n0I9CkFG
	7yLXkAYBi7KRAjFW3uLG76P7V3N8bfMPwQ9QeoFVY76vSyGzMcUSGP608Ksh51287g0supttEGLZk
	36DYaLIhoWGD7F/49ysbiJW0+hUcd9xv7b82NUliUKPpNWD+CVd8JCapvohy8+jE6ZbbA9dLz0Fie
	yE3tPmoD0H7UYwE8glO8Tm2BUwUGyVbSPqsMBwFOp5Sahm07oUBBY39FZiYP0tl/1ObNMtFgUGo5w
	DRVJfHxXsZEkPFwvgW5+FRbZvtHkHvLYdwWHRTuzVkBoVWZHqeD+Q7v2jABtdzcXLj4vAzDLX4cD0
	cfxTmZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfg-0000000CHAu-3eox;
	Fri, 30 Oct 2026 17:45:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfb-0000000CH79-1Io0
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7A65EC49F68;
	Fri, 30 Oct 2026 17:46:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A8A603C2;
	Fri, 30 Oct 2026 17:45:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 878C7103290F9;
	Fri, 30 Oct 2026 18:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jtSnfiKbZvkF3HLRucP99Ez9yPkR5XGBZ4TZYrbyCPI=;
	b=l1CcjvtC2KuIu1EX2mDlsJK5DGDg8K0EQme8pSbbEe5l5eNT1G5Lm+tg9b2e74M58lAmEs
	6VwS+mDk7/G/OlrFxv6xgcWD+LBmE7iUs+jl4Jzac7msEVQFMJeb13QVeXdZJT9rAVuMs0
	fkqlSBf2X8Q2PpqPrwjzHAtLlIe7NkITDCgQcz31OqqP3oOTzgdrzYNsVnp4DnWsAE/vh6
	los+n2Xm37qLIBN5zqylkiySYELchin5sPtuZdeu10yRQ/VlQ+62YX+dE60MoS2aVmRHeM
	7OjKAFkyGt5Yv7Uz1Se55upl8BPhdsj3SEGAhECZ9/0/wCCbJ32LU9qSUF2NnA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:27 +0100
Subject: [PATCH 03/13] mtd: spinand: winbond: Generalize the LW OOB layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-3-91f67407dc8b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261030_104539_680134_7CB342BC 
X-CRM114-Status: GOOD (  16.63  )
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
 drivers/mtd/nand/spi/winbond.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 4ef30f1a4aa8..e3be93690bb7 100644
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
