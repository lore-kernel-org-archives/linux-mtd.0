Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98430F45A08
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eufVR6d6NvSiVS6u/rFutXjMzlW9ElOCL1G7pNH2UZQ=; b=13kHLZt0IiM+oi
	/bbMDmrvGIMd21gnAnsUwKnz9WN4ym1g7J/1PdEaFAvSakog309ebowkFEHFQUXtllVqymgTmJYph
	8j6KF0CrVj40FhDqpv/dimWF59+sBh/f2ASHCZ4Y9zCEG8eixeGCUjTM9wPK/2CFx2zA0f4Ras7Gb
	S58m3TgYQPAFsE7IhwcHFE/kn7ibcvHlZU2beeGI7RD+3iCg0FQ9zgschtWRzCmtruuUVmPis5I/z
	mdkY8dCqS2Pp3Ar7mWEgOCw3EMfkiWmMQBYxDhGFG0a9YdyR1S5gAwc1bmaa4UjRpHqotuKFhae9C
	dq6l019A1lSjn7bIHstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFrB-0000000CdTc-1aPv;
	Fri, 10 Apr 2026 17:41:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr8-0000000CdQp-2HUN
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:41:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D69D4E429B6;
	Fri, 10 Apr 2026 17:41:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8A51603F0;
	Fri, 10 Apr 2026 17:41:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 226AD10450081;
	Fri, 10 Apr 2026 19:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775842880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bAVqa4MQXm7GdlPrbv7BpQQFj39D/pUUubDLu72NyMI=;
	b=RfbMYEke9rGFR7c6cTZKWElMdomfmM05zlbY+k17DJCJH7/CHnvw4PBCpRfKwCjg923VFT
	7FmYoYGOKFpc9xwdIhQbJjA3Rn4FqyZ/n5JCp8fwB4nDc+4qtKkNNL/NAhb7+WXmXWxzvu
	Wr4hcn1mUK+xklrhfwEBHdRpwA9uVMqo9RaW8kIL+Mv42JiKef4fCnn7YUCed/gALp+hPX
	wSpXuoPvjGIl8VOkYcdXbNvRnjJb3IgUlNDWf28HiPfqDnvyuXOVm/KddBhMFC2EO3OVTR
	rtiXEC2anYAt9mQkaXRZws/AjqFNJ5SsxdGzf9lNcj7oynpsgVQ6/z8d6LVXfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Apr 2026 19:41:04 +0200
Subject: [PATCH 4/5] mtd: spinand: winbond: Set the packed page read flag
 to W35N02/04JW
MIME-Version: 1.0
Message-Id: <20260410-winbond-6-19-rc1-oddr-v1-4-2ac4827a3868@bootlin.com>
References: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
In-Reply-To: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_104122_716941_9A2BA840 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both W35N02JW and W35N04JW diverge from W35N01JW when it comes to the
"data read" operation in ODTR mode. In order to stuff more address
bits (up to 18), the second command byte is replaced by the most
significant address bits, keeping the number of address bytes to 2.

Fixes: 44a2f49b9bdc ("mtd: spinand: winbond: W35N octal DTR support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6dfd0dcc8ee7..a3fca8a1cff1 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -515,7 +515,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
 					      &write_cache_octal_variants,
 					      &update_cache_octal_variants),
-		     0,
+		     SPINAND_ODTR_PACKED_PAGE_READ,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
@@ -526,7 +526,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
 					      &write_cache_octal_variants,
 					      &update_cache_octal_variants),
-		     0,
+		     SPINAND_ODTR_PACKED_PAGE_READ,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
