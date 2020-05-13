Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A4FC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2442920659
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABfS4Szd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2442920659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjtT9CHLbyJrYK5DTltl+uS+/goK36ZZQnJ4EKG/WIo=; b=ABfS4SzdmCxpud
	UdZA9rqOYmhZrtjjhsO4HKyivNbY/xqsphvbBoSTYVr9fYmpCv8uolEZYtwW1NjlH0jud4RnqnijA
	2EzxFxlXfNy21q2DRSm31kMKh40bZ7/hKXCBsTw2z4ScfkfvBgJN03qhZqfj3T8kXtnZUWnROCHWa
	YFyGai2XIDSppPaEbdFcRNp3lyQXTVg5HjEoTRjAk6bBM/6+JdM9HAzo/EjdFd6mSpdQNrVvQeff/
	V4LUYJmDARczYvowpFXYK9E7Plr6o9+gXvSmo6tKfi/MB4t95/j6LS7fVt61+emhh5Ii/liK12Ycm
	S8HEWTDX/XMJKIFYmLVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYv6S-0001qW-UR; Wed, 13 May 2020 17:23:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYv5u-0001BM-9p
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 17:23:01 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B99AD2A215C;
 Wed, 13 May 2020 18:22:56 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/4] mtd: rawnand: davinci: Implement exec_op()
Date: Wed, 13 May 2020 19:22:47 +0200
Message-Id: <20200513172248.141402-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513172248.141402-1-boris.brezillon@collabora.com>
References: <20200513172248.141402-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_102258_560393_1611E02F 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implement exec_op() so we can later get rid of the legacy interface
implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Changes in v2:
* Add T-b
* Fix the code to support NANDs on 16bit buses
---
 drivers/mtd/nand/raw/davinci_nand.c | 102 +++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 779f708c791f..0eeb30c7fc4e 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -14,7 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/err.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
@@ -678,8 +678,108 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 	return ret;
 }
 
+static void nand_davinci_data_in(struct davinci_nand_info *info, void *buf,
+				 unsigned int len, bool force_8bit)
+{
+	u32 alignment = ((uintptr_t)buf | len) & 3;
+
+	if (force_8bit || (alignment & 1))
+		ioread8_rep(info->current_cs, buf, len);
+	else if (alignment & 3)
+		ioread16_rep(info->current_cs, buf, len >> 1);
+	else
+		ioread32_rep(info->current_cs, buf, len >> 2);
+}
+
+static void nand_davinci_data_out(struct davinci_nand_info *info,
+				  const void *buf, unsigned int len,
+				  bool force_8bit)
+{
+	u32 alignment = ((uintptr_t)buf | len) & 3;
+
+	if (force_8bit || (alignment & 1))
+		iowrite8_rep(info->current_cs, buf, len);
+	else if (alignment & 3)
+		iowrite16_rep(info->current_cs, buf, len >> 1);
+	else
+		iowrite32_rep(info->current_cs, buf, len >> 2);
+}
+
+static int davinci_nand_exec_instr(struct davinci_nand_info *info,
+				   const struct nand_op_instr *instr)
+{
+	unsigned int i, timeout_us;
+	u32 status;
+	int ret;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		iowrite8(instr->ctx.cmd.opcode,
+			 info->current_cs + info->mask_cle);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			iowrite8(instr->ctx.addr.addrs[i],
+				 info->current_cs + info->mask_ale);
+		}
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		nand_davinci_data_in(info, instr->ctx.data.buf.in,
+				     instr->ctx.data.len,
+				     instr->ctx.data.force_8bit);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		nand_davinci_data_out(info, instr->ctx.data.buf.out,
+				      instr->ctx.data.len,
+				      instr->ctx.data.force_8bit);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		timeout_us = instr->ctx.waitrdy.timeout_ms * 1000;
+		ret = readl_relaxed_poll_timeout(info->base + NANDFSR_OFFSET,
+						 status, status & BIT(0), 100,
+						 timeout_us);
+		if (ret)
+			return ret;
+
+		break;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+
+	return 0;
+}
+
+static int davinci_nand_exec_op(struct nand_chip *chip,
+				const struct nand_operation *op,
+				bool check_only)
+{
+	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
+	unsigned int i;
+
+	if (check_only)
+		return 0;
+
+	info->current_cs = info->vaddr + (op->cs * info->mask_chipsel);
+
+	for (i = 0; i < op->ninstrs; i++) {
+		int ret;
+
+		ret = davinci_nand_exec_instr(info, &op->instrs[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.attach_chip = davinci_nand_attach_chip,
+	.exec_op = davinci_nand_exec_op,
 };
 
 static int nand_davinci_probe(struct platform_device *pdev)
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
