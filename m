Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C20C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzFGR/IdHX6VWXzGCkDmkal/AIotpWvfTqx1hNNMR64=; b=YBn4BVnpWMn/4L
	Vnmoq39nOrnoH58zcRyBXvCMU7vsIgmDSju9wxXzMmqgKpehr1FHg/4V8aoHk2AvB0WdMRkm99ouN
	u71Vp4HVdHxlOP/iXKdBrErcjHFjMaq5cydStVH264IJxRnkuHjVgHJCi3Q6cRw5cMo+KXOdi1YZ0
	AlFU9tsFbJbyWxUAcdGDV/MWhlFfVzH66EK0hV/lMedEcCGpoEdKVVCGzP5ZfKVM2NDQNyhVjofqv
	r7Zgf0pr4NDg7v7D/Ft/SswTSp5bVEw2c1LReXSJe4iw7ynaPCsOTBc1jV+I1mH9l3p/3zswvyGPB
	EkyHNC0t48hAmq5L614Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piKhl-008exR-15;
	Fri, 31 Mar 2023 19:46:33 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piKhg-008evS-27
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 19:46:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9768AE0005;
	Fri, 31 Mar 2023 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680291984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u4fuLB+4zCRUrSFm/DeUm1gbEH0AyuRfuJZKJaTfMh4=;
	b=mzNOqpZwkKmYtTxFK7mj2pe8fr0+zWiJXZVMhgeOJEy57l1pXSoCRiQ5e93aom4ra4Ce+e
	tabVA4UOPRJ38xVRaUhqkcxbC7nydoECceNEuPZT5qEJihp6c5RB58a0rIrWBm3SgjRZmb
	gvoRiLFbKMiuEYCPvgxk3lTeTXqW8ojsv33P9KzKbFzN+H43yvoFtq6z+H8Whk7ZS3qkD+
	peCEIUdp4bts5aol/5WkK+WF/yUFrXlbcTR/QGDrm7yXn04q+xknI104hZgXNr2qy1EA8y
	Q02AL2SQtlBbEkk9xko6Wc+SnRG/lrE2hNnWXjANbggIUuBnoUQYoEKkRw1AmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 1/2] mtd: spi-nor: Delay the initialization of bank_size
Date: Fri, 31 Mar 2023 21:46:19 +0200
Message-Id: <20230331194620.839899-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_124628_869960_40630A2B 
X-CRM114-Status: GOOD (  13.30  )
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

Bank size is derived from the chip's size, which in
spi_nor_init_default_params() can still be zero if the size is not
hardcoded in a table (eg. sfdp parsing). We need to delay the
initialization of this field in the "late" helpers.

Based on the fact that RWW compatible devices will use the bank_size to
derive in which bank an access is made, we absolutely want to avoid
divisions by 0. Right now there is no such opportunity between
spi_nor_init_default_params() and spi_nor_late_init_params() but it is
probably safer to enforce a default value (assuming 1 bank) as early as
possible, just in case some day code using this variable is moved
earlier than expected.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
I made the choice to keep a default value, to be honest this is not
actually needed today, so feel free to drop the line if you don't like
it, both choices seem reasonable to me.
---
 drivers/mtd/spi-nor/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9e6a0730cdb8..f436395ca489 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2882,6 +2882,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	 */
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
+
+	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
 }
 
 /**
@@ -2948,7 +2950,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
-	params->bank_size = div64_u64(params->size, info->n_banks);
+	params->bank_size = params->size;
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
