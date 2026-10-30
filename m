Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC9F606A324
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DALN+2/h;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tQ0I6/7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4JnmjVrmMKSmNVMbvCTRGprp39VQsEvYvj+YzN7vTxA=; b=DALN+2/hqFzeU/td2M4QINEo13
	XKDwQih8LI+VFdapmSkvXCuyH9h1beMBvlrWnhsZOyduJ8nKJgoP20YQbbAj6NUHzgd+xuxY/9tGH
	Fw6Uvn6tVbY8GkVAGZ/8JvhHjG0Gg1VxO03nCd7aipZA9vAvI2Ig6B7xFc1mM6ZGY3j9hNrPuRXEC
	PqEiRc50o6WRMzsIPhVpsIZiDeQ3Q6WdqBMZwsJrVAyXVNUxV18hmz1W+OIIObf6nRJ8xQ7wUK3JA
	57t9BRcFXcnm+UI+WZ5zvNlI2OgAYOYfseWO2CStSNe5BnzF2p7UDh+pZcxwDE2pz4fNUE75JWA+j
	aHBi4Bgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfu-0000000CHXF-4BLK;
	Fri, 30 Oct 2026 17:45:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfs-0000000CHRW-0jS5
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B18F81A13C4;
	Fri, 30 Oct 2026 17:45:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B671603C2;
	Fri, 30 Oct 2026 17:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0E44103290F9;
	Fri, 30 Oct 2026 18:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n7sInAa+9PlXGWZCJzzo904kubVPq+QghlWscMX+YQo=;
	b=tQ0I6/7yp25kvnoexTrIi6k8S8WWsSiP/U66GKPUAw1uqcMqlFpP8+zP1objSXB4t0AmrI
	y7kvtjcDf//xqwygwUUFycuAaDwIzRsrQtWIJhEUE/nTa5IenNHzyyO0Bh5yHitVskWzBf
	D0w3vJN/boO6h6EEA3cDLZhT4UgOAF+8f/akOntNnxUQaQM0Gc7LgbAqTa2SAVNPnAEXYu
	E+v/PC0/w5BoFoH1snv0h9jqNJJGbBC7UG4tWRTnHOkiAeFwcaxstjO7gMtoHNmTxUFnuj
	3tfBGHDIef0dKoBkyO+FF5n4GwMeqdFaSTQZzvQdaiKqssI5avVSpEfDtspstw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:36 +0100
Subject: [PATCH 12/13] mtd: spinand: winbond: Add continuous read support
 for W25N02LW
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-12-91f67407dc8b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261030_104556_366832_32AB3753 
X-CRM114-Status: UNSURE (   8.72  )
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
success: verified 262144 bytes read in 202.780 ms (1262.45 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1185 KiB/s
2 page read speed is 1207 KiB/s
3 page read speed is 1223 KiB/s
4 page read speed is 1242 KiB/s
5 page read speed is 1250 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1260 KiB/s
8 page read speed is 1267 KiB/s
9 page read speed is 1260 KiB/s
10 page read speed is 1263 KiB/s
11 page read speed is 1264 KiB/s
12 page read speed is 1263 KiB/s
13 page read speed is 1253 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1267 KiB/s
32 page read speed is 1280 KiB/s
64 page read speed is 1280 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6dd3341c6dd7..17147444f8cb 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -841,11 +841,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
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
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
