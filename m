Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06ECCCA47C
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jun 2022 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wGhR0Sc0l11Hqqp19G9vd9geuVLB0qU1NikfAAEf4fg=; b=x2xuKXDMqrVDtE
	qpqnJc9NIHz1uW2Q42uLgaokqj8qgMWwmfgpxagW/emehfdOL/pkg0myNBNFluNaNCT2Sa8aWreYf
	5Zv0t/6X8Lx/8ulexkA2lJFBsdahitGOpIp99tR0WY66QDGuY4OHvvDUIssIuUWvlYa8GfyMEE/yL
	S2kMWz6NvQnh4N97DCAr/XOP6mlidBOGXGk3SufWklhTQBxGVwP2LTaFhXmtSC9d98zbP3UOvLrmg
	YMYD3y/24+SdBgden2o/IlDJ8k/jAOaaA3AexUH+nBc9four0x18iDmySJjSHICPdFDedFQGpMHmI
	8ypZe2iOVd22MsVANOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JFL-001Ewl-Su; Mon, 20 Jun 2022 15:23:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JFJ-001Ew3-O6
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2022 15:23:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A35FB80F1A;
	Mon, 20 Jun 2022 15:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEEBC3411B;
	Mon, 20 Jun 2022 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655738599;
	bh=J0AVDvwi+PvxIkqAwYINYekO84CN0cY/Zc6Bz0k7oMY=;
	h=From:To:Cc:Subject:Date:From;
	b=h6NZdsu+zrm+km9v7oUwCxlz2jij0HFJeCWnakjcFIThZU9/kfERl1Dbf+aqw4Kyw
	 PgxHi3Bba7Zbfn1i/PrOR4c9sVehBYk4iXUrJIq+MvRZPb+epvtXhKWLlAsNAdwfBS
	 BwqN+23HTk1ihgT/VBAKCvnMon3KvAdjeimG6a4CbUeWGBuyoSbYoQpFRmE1kRf+lM
	 JYlo8LV8SxcZo5jQyV31Lsy28EREklR3RUq5WWXxQAx3qq10fn82BS9wj5kQEuGs1J
	 ylU5pK7t2JIje3ITtfbMC/YiXvdtQ/3pXTN0uSWa+U3/m/GpLOkJ9Ck/XHqaweUwkM
	 OdpxzSRoqjxlg==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] mtd: dataflash: Add SPI ID table
Date: Mon, 20 Jun 2022 16:23:13 +0100
Message-Id: <20220620152313.708768-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; h=from:subject; bh=J0AVDvwi+PvxIkqAwYINYekO84CN0cY/Zc6Bz0k7oMY=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBisJC+XxHok8kBSYShad6IPvtjg1uJL1N7n8LcEigy 1la3FiyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYrCQvgAKCRAk1otyXVSH0CK8B/ 4tBdKhwDwlw1bJv8O4ad2WC+rOH5V9M91yOPs//g4hYfrbie1kFBQ3QZmimVpM4z6kMLxTVTW9dVY5 l/Ciuhe822Gvi0+I+9B72N3k602ckUzPdxVyTe+zCLMqGOyKveGgeK/QVeo1wvPZMLLrDJ03BvuIAU EOcfdZICIm7NrABWTs7jgDFpgvAQdvbX383AZkdWToq13AGmcHreUeP3HPeZ5sHtbZw2/chAXCV7ig Hbroje36TH7pTKz8F2cYwri8ImmVJ+CaydVDKarsJUJl1LxxbJdfeMIlhZGU8Wv0zg/3Px8/8EqW9V SQwiWyNCztKGtioR26ma/5zyzge+gN
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_082321_968407_56D551C5 
X-CRM114-Status: GOOD (  13.74  )
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

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding an id_table listing the
SPI IDs for everything.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mtd/devices/mtd_dataflash.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 134e27328597..25bad4318305 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -112,6 +112,13 @@ static const struct of_device_id dataflash_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
 #endif
 
+static const struct spi_device_id dataflash_spi_ids[] = {
+	{ .name = "at45", },
+	{ .name = "dataflash", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, dataflash_spi_ids);
+
 /* ......................................................................... */
 
 /*
@@ -936,6 +943,7 @@ static struct spi_driver dataflash_driver = {
 
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
+	.id_table	= dataflash_spi_ids,
 
 	/* FIXME:  investigate suspend and resume... */
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
