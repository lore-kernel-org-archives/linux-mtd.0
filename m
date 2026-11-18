Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1060A2618
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1COUe42Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PUe9nC1p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XJLsq9tf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dA4hUJRCpaJAcJOhBoatEe2XSvD/x+UUkUvb0duMCZQ=; b=1COUe42Yhpg2qdNr2ubPp3+tgB
	X+eh6+A5qQVhaqd7Hs504aJuc5zBqKQ4urZ7oWD3yCDgVof3JONuUae19OkcpU0gVJVjbA82lxmHy
	0NS22mNkR4AKIgwZC/0/shnmjFWLbic2K8Du6p19AvqYjA+jDTmYqIA/EMRED3NtCkMYp2Un/eUS8
	ZxdNNJQX55iXkM2Yg6J60NojE4MTf+rpAcqM0nbfir/0mFIBk5u74PiGQSHmmbdT5mgFi8kncyNQB
	gJqtqhicCPZKfXDt54O7nLYU9EcYiw0R8sp+cCyj77BhfYpmFSO2H8cy33YHCH/zXYZjyrAxY497d
	vwEY5mNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9v-00000009ihn-01V3;
	Wed, 18 Nov 2026 17:09:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9r-00000009idO-0ZYz
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Nov 2026 17:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=e7P+FJnxya4pOGd5pTwD3sfIJZYBPzaG+u4emxUjteg=; b=PUe9nC1pOFgzvO7hP9VV9kL/oL
	sPNuLRu2ckKnDU1yjINnUlt+JUuHNdveQuw9X4ao9Jgl0mdQRI4K8p1+A7qTnmp+HPlz1QjUVGz+R
	rh789CKxjrWdr1vgzzO2s3NbedC9WhSu8+z+TTaBuE///US0laWFelDX/zN3O1GcoKY8csx2hUVkm
	tArI25MOek2NPkkDsHlXINGHIVOzFgsrM4ZaTRQkFJ8Ra/PnWDCRdS1TnrJaoQBldbHGcuSsOJE9d
	hkscc7RbvYXup2ugMrYg+vqIw/mKO3FCbsEeXE6JWe96RLE5ZoEV8K+DginRSLJESFc2yEtLLbSp8
	LTQ4YvLw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9n-0000000FPEf-2RO0
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:09:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3789C4F77E;
	Wed, 18 Nov 2026 17:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BA425FE9B;
	Wed, 18 Nov 2026 17:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64A4A11BC2A1B;
	Wed, 18 Nov 2026 18:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7P+FJnxya4pOGd5pTwD3sfIJZYBPzaG+u4emxUjteg=;
	b=XJLsq9tfUK5pU6Ulixfoq6TQKKBwsqdaJ6KUcBtEWEConL7FWobzTRnMXHkLjyC5k73/99
	rWsDE2znucz8bREPkFYm8M53FasWV459l2Eg5a5/sZJM/rAIV6MG8Xn/hQdmQa6PC3KXlD
	mTpi2gNQM+PCOIMmYdyIfMByZ2N+Dj4EU8JHF6cxmj0fLedt0TZHDmrbi2x+RgjQs3kjkx
	QrgaNmV3PAj9iSvG1NaVL5on0eXxVTt56ir934Sym+68Fjic/+N2eaCjjIGOsEitNTzrHt
	e5Lhprjwl3GTmks+BwY9W4JFmcaCMRxeIRH6J6liv9uvG1ufSABwBXxe5XS+eg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:30 +0100
Subject: [PATCH v2 13/13] mtd: spinand: winbond: Add continuous read
 support for W25N04LW
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-13-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_170915_679418_FCE92F28 
X-CRM114-Status: UNSURE (   9.03  )
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

LW chips follow the existing patterns, we can reuse the existing
set_cont_read() helper as well as the existing continuous read variants.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 22
success: verified 524288 bytes read in 405.770 ms (1261.80 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1230 KiB/s
2 page read speed is 1242 KiB/s
3 page read speed is 1247 KiB/s
4 page read speed is 1261 KiB/s
5 page read speed is 1263 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1266 KiB/s
8 page read speed is 1261 KiB/s
9 page read speed is 1272 KiB/s
10 page read speed is 1269 KiB/s
11 page read speed is 1271 KiB/s
12 page read speed is 1269 KiB/s
13 page read speed is 1268 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1273 KiB/s
32 page read speed is 1273 KiB/s
64 page read speed is 1261 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b5fc8106bdab..1f7f5c7c8224 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -895,11 +895,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
