Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62F60A5BC2
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oBpBggGD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yFgTK/0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DU6/UVWpTV+yWC5uj9glDP0xwJs8ABpyPjoSJ3ASTfA=; b=oBpBggGDmekk2YiE6JMr9a+5vN
	ncQrYgK6Q6EKLlrN9yiExUAjm92EtsdDwDy9/UF8EX536JA6PAlHw3uTgbbWeOyRFcSG5AoiZwCJS
	XoeLF6QsCyQJQV+DltJYqZ0wTRDnLWK8JXlSrJLMXgP6bZVLHotGXraNkj+HGGEW3/RItdSsEwIma
	I73QhVe9in2DyHss0vNfQgjmJViyx6KWkdowbDcs/t4Hkr8rjClmbPQTa2KnGdwUvTBt+eLYfSE5l
	2Q5vCEZw3PLakyp6kInkh9JT2uroXhJp+pkKv4N/O7CtG9c5PYVGWoqm9uWwwNBsWUuai+TuvAslg
	UOlQf5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9V-00000009iDw-06v3;
	Wed, 18 Nov 2026 17:08:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9P-00000009i8F-0Ctz
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33910C4F77B;
	Wed, 18 Nov 2026 17:08:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E79A5FE9B;
	Wed, 18 Nov 2026 17:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 480B211BC2A16;
	Wed, 18 Nov 2026 18:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RIDasA6Yo41X2XxZNHY5eia5WhYTwzwGV1LE+WbpzdM=;
	b=yFgTK/0snPLl/MHHufweKXDArDgT51/Uw8vZxy0jELUVs8HSnSdLLurj1ZToKnO8tqQsip
	W7evaKBQiY/9P0O84gZzeKd5tDBXuqSku+2Y5oGTgW6MhBPak1sqTRKkJ4sg51Rkur/z54
	pqJxXnz6ZrKDnTSSoRr5jd7ymtn/OsEv0a46brsSxLKcnpLawe5mbavt+dSQee7Qkr7JOA
	D0gU8Zpd4hqLAbVHCz+L+nQeFsT0lHj4Qqi2d4QwlkO3NabvUsFknOvklcJybnMCgFIE4D
	ADCupgSIcRZUCg2fJRmUv9BXMRYqU3aKSZYnPfWXEOuvP1ChtDNdWDr+2MVMfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:22 +0100
Subject: [PATCH v2 05/13] mtd: spinand: winbond: Rename the
 ->ecc_get_status() helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-5-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_090851_434426_ED4A2ED5 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Most W25N chips (KV, LV, KW, LW) seem to share the same helper.

Rename the helper to clarify its use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 95b6c3b80eea..e3cd6950e61e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -470,8 +470,8 @@ static const struct mtd_ooblayout_ops w35n01jw_ooblayout = {
 	.free = w35n01jw_ooblayout_free,
 };
 
-static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
-				   u8 status)
+static int w25nxxkv_kw_lv_lw_ecc_get_status(struct spinand_device *spinand,
+					    u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
@@ -735,7 +735,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N01JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
@@ -781,7 +781,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -790,7 +790,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -813,7 +813,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -822,7 +822,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -831,7 +831,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
@@ -855,7 +855,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&update_cache_variants,
 							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
 		     SPINAND_CONT_READ(w25n_set_cont_read)),
 };
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
