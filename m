Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584C4C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaFrUYEWwD34iR/LioFiwHlWlWIMQHk5z2+wFPfzXkM=; b=Ww49TaPOYSUa3N
	W6fDiVezbCET3aim/iK510KW07H3b5Pug/JsQjO/qDJw2fkdoZSkTWT8BfX8rmRCYURmvSIxTNKCq
	OURNCmKM1LYXPuAP0rb/5uc4/+KdoaRh/hnMFUFciLhlokN5kEu9gzmPsOPzAB4TfAGPUgYSEzAbV
	7ORraelDQieTy2CVY90ezo6OjmJC5Kl8veewAD8pJ4TR4jAO7AHc37AaHNkDL0MXdKHM4SyW1W8Mz
	dHgbsAePHKwat9zCSks6TF/gXwn8NjDyqqNpHTmO1axVmC6tM2q3O43tmTtoZKyLzFJvlvcPcGZtu
	+j0lQ/6PXZ9bPGpaEOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fKT-00Al6R-5f; Tue, 04 Jan 2022 08:38:01 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fJD-00Akfk-H6
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 08:36:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9B1DB1C0010;
 Tue,  4 Jan 2022 08:36:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v9 04/13] spi: mxic: Provide a capability structure
Date: Tue,  4 Jan 2022 09:36:22 +0100
Message-Id: <20220104083631.40776-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_003643_780303_0B9BB60A 
X-CRM114-Status: GOOD (  11.09  )
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

This controller has DTR support, so advertize it with a capability now
that the spi-controller structure contains this new field. This will
later be used by the core to discriminate whether an operation is
supported or not, in a more generic way than having different helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mxic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 45889947afed..9952fcdf3627 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -448,6 +448,10 @@ static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 	.exec_op = mxic_spi_mem_exec_op,
 };
 
+static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
+	.dtr = true,
+};
+
 static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
 {
 	struct mxic_spi *mxic = spi_master_get_devdata(spi->master);
@@ -580,6 +584,7 @@ static int mxic_spi_probe(struct platform_device *pdev)
 
 	master->num_chipselect = 1;
 	master->mem_ops = &mxic_spi_mem_ops;
+	master->mem_caps = &mxic_spi_mem_caps;
 
 	master->set_cs = mxic_spi_set_cs;
 	master->transfer_one = mxic_spi_transfer_one;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
