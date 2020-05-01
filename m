Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7A8C47253
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 10:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872352071C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 10:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbddyAqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872352071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsUfLdSoyqMv1tzBmVsM5eU3BZky70L+HrGCSYZv5qc=; b=rbddyAqaMXKSSl
	9LhgSctsYuO/DuXTRkPug7brhVGVhv25LVy1Oo88J3hTjEjqHkITc2L+sp+kgI38NF12tWzSNp4t/
	idUxGtoXMuKn5TtN8oJvBVmESnkee/+EPtr7xVknj2sDlnTc+7pOd4ffl+CpqxUIFQ2YwQTqjRXae
	piTv4Xy9kCQ9Pt/qP//SADCfpmBjYtgAR+0XjxQUiIGvwYxbYjaofTY8EHhAHNXOZ1nObfzXYsEbM
	cY2GfvHz09UwWXwCttE+dx8XN/CiZkbYqWjawk+sCf9TUdeM1mR98TsSFro1YBDfPvDUzgNBa1T4j
	JW6NNzUrLZKcGfifJWaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUSaf-0000eU-As; Fri, 01 May 2020 10:08:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUSZz-0008Pc-M1
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 10:07:38 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B4A92A2DC8;
 Fri,  1 May 2020 11:07:34 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/5] mtd: rawnand: davinci: Implement exec_op()
Date: Fri,  1 May 2020 12:07:27 +0200
Message-Id: <20200501100729.1237040-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501100729.1237040-1-boris.brezillon@collabora.com>
References: <20200501100729.1237040-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_030735_844028_18CCD08F 
X-CRM114-Status: GOOD (  14.36  )
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
---
 drivers/mtd/nand/raw/davinci_nand.c | 72 ++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 779f708c791f..296047884c6a 100644
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
@@ -678,8 +678,78 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 	return ret;
 }
 
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
+		nand_davinci_read_buf(&info->chip, instr->ctx.data.buf.in,
+				      instr->ctx.data.len);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		nand_davinci_write_buf(&info->chip, instr->ctx.data.buf.out,
+				       instr->ctx.data.len);
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
+	int ret;
+
+	if (check_only)
+		return true;
+
+	info->current_cs = info->vaddr + (op->cs * info->mask_chipsel);
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = davinci_nand_exec_instr(info, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.attach_chip = davinci_nand_attach_chip,
+	.exec_op = davinci_nand_exec_op,
 };
 
 static int nand_davinci_probe(struct platform_device *pdev)
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
