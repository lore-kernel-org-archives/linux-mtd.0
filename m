Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33B606A325
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vh4ZhmX6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ERhDShHl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d2zIyG49yGSiI2yZiHb0qJkknBdXvzMokwLc2OSwkrM=; b=vh4ZhmX67lVkwNgPgVh6eGZ+0D
	9pW/ievhLnPWPn8sGox0EVbkLQpe3Zxcb8Z4m1xP684beSdvKQbyJjwUQ/TL8PlMYQksD4BV7T/j+
	KUeYcwBjq9VQuN43wFBQRdIwDdyQyQ5e5pxlWxsMRNYxECIJKmgKPFMAKv0bN7Y+7zcgavN2qvAvH
	soF007pS84PGtXWjaH0V/JUfvo8p/DtcSvou85VxZVMemzO4J85s7CNBw8D4VWXKsKzls5J+fownN
	6ZCatrgd1cVZXAZeO9O6b+Pc8yvGBWcOOX0HafxATdQByYiUcSBuBiio2Bg6y59mpgOnOWKjRx+qj
	5JZ94aAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9i-00000009iUl-13Ta;
	Wed, 18 Nov 2026 17:09:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9a-00000009iLE-3pw8
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:09:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E710BC4F77B;
	Wed, 18 Nov 2026 17:09:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 080E05FE9B;
	Wed, 18 Nov 2026 17:09:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D53D611BC2A1E;
	Wed, 18 Nov 2026 18:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sE/BWVUqMnWUOkIC1yLNFVdbReXab+OeO5XnDYHyTjw=;
	b=ERhDShHlfTTtU/hweuWnLDBcB9SYUGDtUrBH7lGGjka/bYCSaneG/v9BP+erFGX12ncmPw
	8TkKKBnDwnY4h/KrX2rXghtK+pp0KRtAMsccSqufEsjIzSzGFC9jYtk6u6l9yE/vhik7SO
	ThxfJw0hQZFbIIQc525WPUTD5jTjZiI1UlEsCa1rhnyE99IXieBC3GhWnY+GxpnbZ0M3hh
	70hkwmILZL4GgEM5pJ5JpOl9bEQk0rhoUe6q1FreSgFwemTQgllUp4501tpqeS+80CDk0T
	LX8nbb0djgb51qk4tixgYcfHAwT3s8htKCDpc9/mI3vRw2HkDKwhfCNawdUmcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:27 +0100
Subject: [PATCH v2 10/13] mtd: spinand: winbond: Add continuous read
 support for W25N02LV
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-10-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_090903_149177_395F1CC6 
X-CRM114-Status: UNSURE (   9.84  )
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

LV chips have DDR support, otherwise they support the same variants as
the other chips.

$ nandcontreadtest /dev/mtd0
testing 10 blocks from 0 to 9 (10 good), seed 27
success: verified 1310720 bytes read in 756.306 ms (1692.44 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1580 KiB/s
2 page read speed is 1580 KiB/s
3 page read speed is 1615 KiB/s
4 page read speed is 1641 KiB/s
5 page read speed is 1643 KiB/s
6 page read speed is 1643 KiB/s
7 page read speed is 1657 KiB/s
8 page read speed is 1662 KiB/s
9 page read speed is 1680 KiB/s
10 page read speed is 1666 KiB/s
11 page read speed is 1692 KiB/s
12 page read speed is 1690 KiB/s
13 page read speed is 1677 KiB/s
14 page read speed is 1696 KiB/s
15 page read speed is 1690 KiB/s
16 page read speed is 1684 KiB/s
32 page read speed is 1684 KiB/s
64 page read speed is 1706 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b7a31dc83327..cdfd5a5778c6 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -226,6 +226,17 @@ static SPINAND_OP_VARIANTS(w25nxxlv_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(w25nxxlv_cont_read_cache_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4D_4D_OP(11, NULL, 0, 66 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1D_4D_OP(5, NULL, 0, 66 * HZ_PER_MHZ),
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(3, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -819,11 +830,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8a, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&w25nxxlv_read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&w25nxxlv_cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N02LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
