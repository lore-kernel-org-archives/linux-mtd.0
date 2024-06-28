Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB67C30658
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ysylncMkBSCj4X1a0yOqx9ZN/WZYAx/JX7bBN501QY=; b=WGvnrRyQNex7yx
	R535OaBmhUjXarpWr5U8XHuHQtYHEksjxpz9tV3l4U3Ys07qZ9VkxbiLldGeoR10JXBfu0lZDE+OZ
	lgfN8L/HI3u1VqvLkKSGC492U40c7EaeNggT0csuXklMSL100gQDCcRQ4z6zD77Wlwoo4/ExAj6cW
	tSIBVyktMogS3eA4u+YBlq0J/zqepMKjPU+g6t4KF8PHt2QBlJEmNF7tZKZNARVN6a5B7O7qyPPH4
	GLadNIugKXyZTfvqwQcf61gqreO6QWUqZmfIkGkY1930gHnG7wHVGQFjz5NcZfTWv19gG7HniokbE
	MGlsDdwpPCs+Io/EobBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCDE-0000000Dv5E-0Sn7;
	Fri, 28 Jun 2024 14:04:28 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCDB-0000000Dv2V-3A69
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 14:04:27 +0000
Received: from localhost.localdomain (unknown [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4W9ccY3L1GzMQLT;
	Fri, 28 Jun 2024 14:04:13 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH 4/4] Add Macronix SPI-NOR mx25l12833f with OTP.
Date: Fri, 28 Jun 2024 16:03:28 +0200
Message-Id: <20240628140328.279792-5-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628140328.279792-1-erezgeva@nwtime.org>
References: <20240628140328.279792-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_070425_883677_2BC1706A 
X-CRM114-Status: GOOD (  10.90  )
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

mx25l12833f uses the same JEDEC-id as mx25l12805d.
The 2 chips have the same flash size.
mx25l12833f support SFDP and
 have a bigger symmetric OTP.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 drivers/mtd/spi-nor/core.c     | 1 +
 drivers/mtd/spi-nor/macronix.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0f267da339a4..f2a46add2695 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3799,6 +3799,7 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
+	{"mx25l12833f"}, /* uses the same jedec ID of mx25l12805d */
 	{"mx25l25635e"},{"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
 	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f210231468a6..fba3fc8e0d49 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -247,6 +247,11 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K,
+	}, {	/* Yes, Same JEDEC-id as mx25l12805d */
+		.id = SNOR_ID(0xc2, 0x20, 0x18),
+		.name = "mx25l12833f",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.otp = SNOR_OTP(512, 2, 0x000, 0x200),
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
 		.name = "mx25l25635e",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
