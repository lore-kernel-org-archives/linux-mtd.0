Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7D6C5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tT3REcE2BLvbTFANWbTdCGlopJ6daBAej0+BG1p4x1s=; b=3xGJADJ7FgJwHa
	Qy3desHMnot4ueMHtvC54KtQWRhXgPT4vnypEyZ83aHkjZ5qw63igOsvNlk7Pu/LWZwE+0tI9Pqu9
	Wn27poJwmd5C4E/JUpu18O28nZzR4fhuL/1+oN13OAmfToedIum90kSPR9cFSZUhzq8Q5XXOU4hsE
	3ABch/XedxOXAvMzYKvtFvFJfO5rMDdWMq2jyJh3185Hg8ldpv1BMFvkLJIJAMbc86XM25f7NIr2k
	z0rrQ3R2ya7yAIUnS6sPCRntTaIgenpdUyhUxie1wR0Xh8eKVriIg82LTn0xcPCMdyvCwKHChPm2/
	UpJPtPpAtkDNVzQ9CFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRew-0000000C9ty-4BYC;
	Mon, 10 Aug 2026 15:11:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRet-0000000C9qw-3FJk
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 15:11:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C7E11A1533;
	Mon, 10 Aug 2026 15:11:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1156F6033B;
	Mon, 10 Aug 2026 15:11:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E69E511C4A9F3;
	Mon, 10 Aug 2026 17:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786374677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zn32rgRm94l4EzfC6PqAkGOthXJmT/0MRbdxmTrZ2XE=;
	b=E7Jy+3vM3oEC0H6s3G1rWMwlk/mH23SOr8oj9nZyFa9q8ABYi5bpP/ZO7WmqO1/rObYy4+
	kUel5txeGDVWAv4RXG+QInGakvHLk42uud+UZCZJ2BTzcfWDWFj0Z8+iGQ5LNWV58895lS
	kjSrW5/f/2FWQbRyUvzxjlGwDuFpa9skF7M9TRTiV6n8IaXI37RlZCNKi9ePDc1Nr+ajsa
	tC8jqCjvfFY+ZAKMcNSwmX+Gk9Kw3eSDln1gDBQX/UC5kWcfYuU+gwLRQd74afLCuk5ZjJ
	R0MpHqRsFEF/jSQ/yyw+Srq2jjtohriD/7w6oKEt43v3YoCnWTmyfEGDYaQj8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 10 Aug 2026 17:10:44 +0200
Subject: [PATCH v3 3/3] mtd: spi-nand: winbond: Enable the DQS pin on
 W35N**JW series
MIME-Version: 1.0
Message-Id: <20260810-winbond-nand-next-phy-tuning-v3-3-a97c3a61e675@bootlin.com>
References: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
In-Reply-To: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_081123_963042_8FC384B8 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

These chips have a DQS pin, enable it by default in DTR mode because
there is apparently no issue in setting it for lower frequencies, and
the extra power consumption seems very low compared to the current drawn
by the NAND array itself while operating.

This setting will be required for high speed I/O transfers (with PHY
tuning).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b78c1e6cbc9..8209b214e594 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -607,7 +607,7 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
 	else if (!single && !dtr)
 		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_SDR;
 	else if (!single && dtr)
-		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR;
+		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR_DS;
 	else
 		return -EINVAL;
 
@@ -689,7 +689,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     0,
+		     SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
@@ -744,7 +744,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     SPINAND_ODTR_PACKED_PAGE_READ,
+		     SPINAND_ODTR_PACKED_PAGE_READ | SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
@@ -776,7 +776,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     SPINAND_ODTR_PACKED_PAGE_READ,
+		     SPINAND_ODTR_PACKED_PAGE_READ | SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
