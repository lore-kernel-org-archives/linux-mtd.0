Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D24C433E8
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 13:14:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A420120737
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 13:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J9qKlAxc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A420120737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fFbTrBjS2yRbHzICSkM/gbA3icCpv8eUegtCiHVbEs4=; b=J9qKlAxcp37OYyHeXksg9q3Kp
	fjNJzXWLwiBfWvQ6dbzo+HSCn+zDhLG7G289Uc2LyDCRMqaW2IWEt5Ntq0uil2MXQiyuJuHedmyfc
	FPfDtjfC08/BLDkOiTSpisZEDQYir1xYiJr0j+QKYInPDwPib+OH/0Sow3L6Z2kJS959upe9/FM2V
	1YMOuU5XEXDIcphQ5el1mF9Xe6/72+ZP1T5tl83CMr4XpS7MK5omps5ZrjqBaVTElaqRzNNTonUaE
	mHKov33leWuB1QMOtRHOptO2KpYsc0KZ8KOtDx1FHno8bQQ5psEk4R1XqLbPDQ23MMJQWjQrjZoP9
	fkuCOlMBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyb2d-00041M-DG; Thu, 23 Jul 2020 13:13:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyb23-0003gL-Ae
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 13:13:08 +0000
X-Originating-IP: 42.109.196.68
Received: from localhost.localdomain (unknown [42.109.196.68])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F2EBA1C0010;
 Thu, 23 Jul 2020 13:13:02 +0000 (UTC)
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 10/14] mtd: spi-nor: core: perform a Soft Reset on shutdown
Date: Thu, 23 Jul 2020 18:41:59 +0530
Message-Id: <20200723131203.40916-11-me@yadavpratyush.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723131203.40916-1-me@yadavpratyush.com>
References: <20200723131203.40916-1-me@yadavpratyush.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_091307_661834_FD5B97FF 
X-CRM114-Status: GOOD (  12.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Pratyush Yadav <me@yadavpratyush.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Pratyush Yadav <p.yadav@ti.com>

Perform a Soft Reset on shutdown on flashes that support it so that the
flash can be reset to its initial state and any configurations made by
spi-nor (given that they're only done in volatile registers) will be
reset. This will hand back the flash in pristine state for any further
operations on it.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c  | 41 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b990fc7add20..f55c062a7bd5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -40,6 +40,9 @@
 
 #define SPI_NOR_MAX_ADDR_WIDTH	4
 
+#define SPI_NOR_SRST_SLEEP_MIN 200
+#define SPI_NOR_SRST_SLEEP_MAX 400
+
 /**
  * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
  *			   extension type.
@@ -3155,6 +3158,41 @@ static int spi_nor_init(struct spi_nor *nor)
 	return 0;
 }
 
+static void spi_nor_soft_reset(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	int ret;
+
+	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 8),
+			SPI_MEM_OP_NO_DUMMY,
+			SPI_MEM_OP_NO_ADDR,
+			SPI_MEM_OP_NO_DATA);
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret) {
+		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		return;
+	}
+
+	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 8),
+			SPI_MEM_OP_NO_DUMMY,
+			SPI_MEM_OP_NO_ADDR,
+			SPI_MEM_OP_NO_DATA);
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret) {
+		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		return;
+	}
+
+	/*
+	 * Software Reset is not instant, and the delay varies from flash to
+	 * flash. Looking at a few flashes, most range somewhere below 100
+	 * microseconds. So, sleep for a range of 200-400 us.
+	 */
+	usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
+}
+
 /* mtd resume handler */
 static void spi_nor_resume(struct mtd_info *mtd)
 {
@@ -3175,6 +3213,9 @@ void spi_nor_restore(struct spi_nor *nor)
 	    nor->flags & SNOR_F_BROKEN_RESET)
 		nor->params->set_4byte_addr_mode(nor, false);
 
+	if (nor->flags & SNOR_F_SOFT_RESET)
+		spi_nor_soft_reset(nor);
+
 	spi_nor_quad_enable(nor, false);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cd549042c53d..299685d15dc2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -51,6 +51,8 @@
 #define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
 #define SPINOR_OP_RDEAR		0xc8	/* Read Extended Address Register */
 #define SPINOR_OP_WREAR		0xc5	/* Write Extended Address Register */
+#define SPINOR_OP_SRSTEN	0x66	/* Software Reset Enable */
+#define SPINOR_OP_SRST		0x99	/* Software Reset */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
