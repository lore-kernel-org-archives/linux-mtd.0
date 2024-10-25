Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB8FD149C5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SNmcOc2g/R5xG5BHEo+cYs5nCSwjd25piFP8x1MB2c=; b=m9n5KyHmPEiG8L
	g8GttB/4JXilKE1QLWcVhoFvaV2Yd5ZXCFdXNYEZ/2gd7bNiQLaXzjrDW0JFqUvJJ0l8mtpju2Ggt
	fZCsCkPMRRL9J2KZAGfUbiwDbXcZgHxhgaSx2LwRCsTKCvWaKQMNqabfUIYwxdnvyrxMQTeJoTuWM
	281yllAUZXrifsfWQDJgXN1yvVwjVPz0JnWLOlbxnuA98PlkXvKjdP7nBZrOZBXSz7SAlEOSSlVoM
	aMjY/41VAkjpxZg9bxJeG8c9ZCUXH0qDzoh0OFj3O3ji/TSjMWPMJS8ez7Hy0hY7iziU865JWn6ZL
	Bs+Q0XZWqqLgimFOF+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N15-00000004ONn-2er4;
	Fri, 25 Oct 2024 16:18:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mxx-00000004NYu-1VCT
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29DD9E000A;
	Fri, 25 Oct 2024 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0vC0DL0bDzRlD8Mzhgsf/g4p+1Jphg3XH+Wo7G+9lo=;
	b=ABNP5yV+IqzOu77m+jOHMwud+fQf/AyzU0Vozov+woSMNv7sK0sTKgCGzVoFb8r8fvZ7Vo
	bLJKp2gndHhjdWjZXMNI3KMp33uyOjnESouNzFMyZ25Oju3h2ZzjcUBYMqU4IQwjpYn6Mq
	7yMgoI19dLaw1LrZbF453Z7AIrDG77296oall8SOEL8NanX+cVgctkosbO7gqvob12i9H8
	sqP6dXe18Czg2HuABTTqh+R+kXHYUKj22Jnd2sABOFE/rMePdUyf+pcOXgV2Przidbk2zI
	8NviwJGS8lwN1DdPwq5XUtLrDsqgElptOA4M2xXTjHvHRWhvZ9+rQQZHQXBFaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 04/24] spi: amlogic-spifc-a1: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:41 +0200
Message-ID: <20241025161501.485684-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091509_944445_75556C1E 
X-CRM114-Status: GOOD (  12.52  )
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

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index fadf6667cd51..18c9aa2cbc29 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -259,7 +259,7 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 	size_t data_size = op->data.nbytes;
 	int ret;
 
-	ret = amlogic_spifc_a1_set_freq(spifc, mem->spi->max_speed_hz);
+	ret = amlogic_spifc_a1_set_freq(spifc, op->max_freq);
 	if (ret)
 		return ret;
 
@@ -320,6 +320,10 @@ static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
 	.adjust_op_size = amlogic_spifc_a1_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps amlogic_spifc_a1_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int amlogic_spifc_a1_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctrl;
@@ -356,6 +360,7 @@ static int amlogic_spifc_a1_probe(struct platform_device *pdev)
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->auto_runtime_pm = true;
 	ctrl->mem_ops = &amlogic_spifc_a1_mem_ops;
+	ctrl->mem_caps = &amlogic_spifc_a1_mem_caps;
 	ctrl->min_speed_hz = SPIFC_A1_MIN_HZ;
 	ctrl->max_speed_hz = SPIFC_A1_MAX_HZ;
 	ctrl->mode_bits = (SPI_RX_DUAL | SPI_TX_DUAL |
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
