Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC99C2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tT3REcE2BLvbTFANWbTdCGlopJ6daBAej0+BG1p4x1s=; b=IK6oEK8vGp02UF
	6nxa4ujzT/jIksjB4E/KS8aiNAt9n54cwGfyyEX1K4AwfNBuEghLxiHA7VWIbeQijVVQUILUgXrBQ
	J4aObiWl3330WTXBOSvapvt/9Tu95mmJl0CFH8G5XHAwhLnIajdrM1UKBcuL/2ONvQVRktGY1B3eI
	+n19t5GyobzQ54Aj2kY4iDIcHx5cjSkF1rtKMY6cXTaJZbWMGFx/+z6UEIhKIoDsE0yYJCLHyqzGb
	LhZkJS5Ukf/qciKIws/iA87cCYAnoPXjr2UjfESEG7otoxC8V5V57fE5GyWf3WCBUOe9nC9OvyPBS
	KSMmNjsKHYAhZzmxxcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqo-00000008Hy6-2ICp;
	Fri, 07 Aug 2026 14:47:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqm-00000008HxB-2mjv
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:47:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 315001A14B1;
	Fri,  7 Aug 2026 14:47:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07FCC603F0;
	Fri,  7 Aug 2026 14:47:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A64E11C37A5D;
	Fri,  7 Aug 2026 16:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786114022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zn32rgRm94l4EzfC6PqAkGOthXJmT/0MRbdxmTrZ2XE=;
	b=qkTjnvftG3/KC9ag4s9GYcRqH+2v/QHeK2dBr3m8xdcOnzAEunpKcc1I6VBIyWbYaTiBB4
	vEOHjXcD6WDcZ1A41FKVUpK1w12v8P0+okm8GNYihESdP1Wc6rdhVKSZwdQK4qMmRABBuD
	Lq7yPUCqN7Rw9H0aiGsCt7MZoYdpGB3UXfr+FxqrYUoc2ydLDeHCSaCFxEkc0aU2mta5XU
	Qp5toZI6sPzqNSY58bERZqi+GCfaisuDF1r2ei/pNsf6L9BoA9vWHWJbGLhK6C3RDX7qGq
	0T9wJP1AX2NC3baIZsg1ghFC2Wz9TKu7zwdPWvol8XXsUFFuaPkPz5AvgHN6OA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 16:46:49 +0200
Subject: [PATCH v2 3/3] mtd: spi-nand: winbond: Enable the DQS pin on
 W35N**JW series
MIME-Version: 1.0
Message-Id: <20260807-winbond-nand-next-phy-tuning-v2-3-73595e89d6e3@bootlin.com>
References: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
In-Reply-To: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_074708_860798_84658294 
X-CRM114-Status: UNSURE (   9.25  )
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
