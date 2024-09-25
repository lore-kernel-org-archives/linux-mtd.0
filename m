Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE2AC369AA
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bSvScVbtt9L7l9XE5f2XOjhmXQ9wqrEyE4TPsx8C8k=; b=q8RF8qdWHIZv5h
	DMcqnQqA0ToOzejHkAZzKYiFyr8HaOG7TuGFhncbeG2Dio9m01IOfzi4r/OOy40K6aCfWm7Kl3L+2
	SYVBb+YmsHuOKaa17EEbT9PK63zqHGetewBDWHW3Tpla7TCb/cPa29TLiR9TQ9FvPVaUIMNO4CpgK
	TiZJMufhZXjGs69NT4/wJl6beZTi33b853MZlIMGXoZUXUgJK7TFJhRpOcISJO00Nvn9exQe1Rveg
	J0s+1joIzxVuU2m87oZkkVPlkaYaMyU2zlgA6xRIUBlUs1lzJ3s6cxAozk50BUkJmGiE9zeZw3imN
	ZsRXqL2psDQTSXkAT6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMof-00000004Or8-1uDX;
	Wed, 25 Sep 2024 07:52:05 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMmE-00000004OFL-2WXW
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 07:49:35 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4XD85349JKzMQlY;
	Wed, 25 Sep 2024 07:49:27 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH 1/2] mtd: spi-nor: core: add manufacturer flags
Date: Wed, 25 Sep 2024 09:49:02 +0200
Message-Id: <20240925074903.1983601-2-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240925074903.1983601-1-erezgeva@nwtime.org>
References: <20240925074903.1983601-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_004934_668332_610A7C5F 
X-CRM114-Status: GOOD (  12.57  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Add flag for always trying reading SFDP.
Some vendors reuse all JEDEC IDs on manufacture table
 with new chips that support SFDP.

In this patch series we use the new flags with Macronix.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 9 +++++----
 drivers/mtd/spi-nor/core.h | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9d6e85bf227b..d77a356d6f40 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2891,10 +2891,11 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
+	if ((nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
+					 SPI_NOR_QUAD_READ |
+					 SPI_NOR_OCTAL_READ |
+					 SPI_NOR_OCTAL_DTR_READ)) ||
+	     nor->manufacturer->flags & SPI_NOR_MANUFACT_TRY_SFDP)
 		spi_nor_sfdp_init_params_deprecated(nor);
 }
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..9237c4ed66cd 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -560,12 +560,16 @@ struct flash_info {
  * @parts: array of parts supported by this manufacturer
  * @nparts: number of entries in the parts array
  * @fixups: hooks called at various points in time during spi_nor_scan()
+ * @flags: manufacturer flags
  */
 struct spi_nor_manufacturer {
 	const char *name;
 	const struct flash_info *parts;
 	unsigned int nparts;
 	const struct spi_nor_fixups *fixups;
+
+	u8 flags;
+#define SPI_NOR_MANUFACT_TRY_SFDP	BIT(0)
 };
 
 /**
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
