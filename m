Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB728C88E77
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O5DzTW5AI8LG0MpS8gcHzJnrlZOuKoNtev1KLivHQIk=; b=MqZJ79SHjj7gZE
	IIcamiLfnGw8OUC3SmYj8l5ITDgf79qKwq12yPylI6O6yRl2hxFSvca2eaCuUdOc3ryOvg3TS4NQT
	VJ2xonIq8i/exGSv9ItQ77u6Nr5BOLDT4rBIDSCrvsy3a9YbCMUeXXLMiYXsn3Btro/LXaEGzIPoC
	9G3Vb9FbnNOSoOlXtHxNA5I+gNvhmmaY6EKkO+dJPxxUJ5cbgGABQqcR4VUq7B3FqK2fE0a5u/ghP
	XMwjtoBQH0bv+rzctKR3LenREtvky+whZlHXGCLXf5ETgQUHYGGQf3GZ9NPDpqvxy+82le+iMZOy+
	uy7195oMiZ6Ty3yMImBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Z2o-00000007sgA-0hRW;
	Tue, 15 Sep 2026 19:42:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Z2l-00000007sfm-1iin
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 19:42:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F70860008;
	Tue, 15 Sep 2026 19:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEB41F000FF;
	Tue, 15 Sep 2026 19:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789501334;
	bh=lRO8Hk7d0Iglr71vivK2TJOxKQ4BfQZPY0f0uOCf70A=;
	h=From:To:Cc:Subject:Date;
	b=OMpAiatROL25mc3V5Oa3jASlu12n9NRTmK8khclYKmw7Q/qhhd3StaLKttvbOsUjL
	 ON9rV35hqshOLynoAmZ7P+w0hH3mWng57BYZ/RNQVrWFnZDVbFJrRLc+N/UCJ1b/R/
	 sI7JJMcR0dvKx1V8/x6dBB70O0Atr5AINdUCh+oMGdrWlgNr3EujPnv63OQduhE066
	 rKniqi4N3bGXOtFESjWV0iGrfyLS7OMK5ENKdZ4vvv0jL1I68lnJtiMXJlfoYlOyNi
	 3i8SqCR9HhZdFTJQsPVT5AI1gB7Im7ifgF0qlPGjtgeohc4UqCc1bDmLodSJRnnu6V
	 j1UZ8nkzLqMEA==
From: Arnd Bergmann <arnd@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: reduce stack usage in spi_nor_parse_sfdp()
Date: Tue, 15 Sep 2026 21:40:31 +0200
Message-ID: <20260915194203.3511147-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

Two large spi_nor_flash_parameter structures on a function stack
is really too much, and this can exceed an otherwise reasonable
frame limit:

drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Change one of them to a dynamic allocation to make this more reasonable.

Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..5d0901074f50 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1520,7 +1520,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
-	struct spi_nor_flash_parameter params, params2;
+	struct spi_nor_flash_parameter __free(kfree) *params = NULL;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
 	struct sfdp *sfdp;
@@ -1532,7 +1532,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 * Get a backup of all the parameter to roll back to in case of an
 	 * error.
 	 */
-	memcpy(&params, nor->params, sizeof(params));
+	params = kmemdup(nor->params, sizeof(*params), GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1652,6 +1654,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
+		struct spi_nor_flash_parameter params2;
+
 		memcpy(&params2, nor->params, sizeof(params2));
 		param_header = &param_headers[i];
 
@@ -1711,7 +1715,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
 	kfree(param_headers);
 	if (err)
-		memcpy(nor->params, &params, sizeof(*nor->params));
+		memcpy(nor->params, params, sizeof(*nor->params));
 
 	return err;
 }
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
