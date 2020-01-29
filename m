Return-Path: <SRS0=VDEF=3S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B357C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 20:39:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8E020702
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 20:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PveessG5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="vVgIh4n/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8E020702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIxn8ES4NZtZZhAHU+SSAXuwy+DhVa92PlI0qxOjOxA=; b=PveessG5Ff6pIB
	8Zw68PtyBFK0RhNtQFJ1a0ttAK/kyxKzMG7vuOdy8HLTwaH5vvJMfMoSSKRaLrJgmnpl2V7XI5Wh9
	yzzJb0mnKXc7CGUDfc+tvEFZX1gYY9fZ6WtJpH9/X2n1k89eTsJylbZyA5Snt0Z7Oe+unmz6430kh
	nntr4dy8msu0xZHl57p1a0149wU8yKbrl18AkyOfb9KPNDuWLdbIjpc4yJI18FDmp3fiZE8nUHYgc
	XgpYCfkdhmNAzPWr0yse8n6t6uxBZatDS58F6NzXkZLo5sTSwmG+gbiFguqw0nAPTtyAvNWDKrk8M
	xvP43edW2+1e0tol1zsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwu7h-0003YL-Bf; Wed, 29 Jan 2020 20:39:41 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwu7d-0003Xz-MD
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2020 20:39:39 +0000
Received: by mail-lj1-x242.google.com with SMTP id r19so877841ljg.3
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2020 12:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b1bHGYLQ5gQ/6Ai3tYNgg10rSzDIsVzfhquqU/7j8dU=;
 b=vVgIh4n/ejzGxghYm5oyCd7PXsaKxOwMiOrFWJ85jpfFD3XThy5pRRU83h5M+7fR3d
 uqDZ//26X7eRan8Rq7z/dl/l6CDqndBsKWGahTJd2hDY4nGzJxd3PifgLE69sFRrKEAd
 pot/cIdCnPvGaHz0HozU9x71Ud9TWZjWo8HRtT6MwT7g9aR9BxkcFfIIU0CIc7LocMoH
 zjNq3CicX5B2xkj+gcFp/CfvFRgKdD9bRABZZHy8Cn1QQXgELA+iO0386sst7UgxJRNc
 GeZXxffFoRSUesrKaMcFLWz/LZRgYuqz4wwkW9dkoEm+qvSM5y/2IYwCdQrdX/DB88Ko
 E8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=b1bHGYLQ5gQ/6Ai3tYNgg10rSzDIsVzfhquqU/7j8dU=;
 b=RiONrcLDY1LHUpLhGN5PQE/MzHPaBcB4tmGQHLvVP5ULjY405JCke1l/skVGQ3KCyt
 KO/qWNfv3hrfbh+TUUyNGVyUMFk6Y06NBHcgJMdqCeykirqAsmkulgjlmaOXuVYQYJZh
 FxfR0xp9Cx11IJvK8FpdFfWk/xfg+AFKjjd2aiDbbyLvNQ3dEfRqm8d+bvYC0yh5KYJ9
 4V/DWVxQj4edOCGF2myqrBP9VoeHCklivE5CC+Lg6Ye4vqU+fOGS4qXi3sDCwQMS6PeJ
 xzcO6qg+qn/TBeGJvX4qiWeyryBKRu/A9jGZ0/UpfFDOCoD6xU5Y6XzPUCYZXCSANA9y
 6ZLw==
X-Gm-Message-State: APjAAAW6oACq1jCvjaUqd6IOzORyRyleqrxCxKK4JQsSbbFdiIiTZo/V
 tUscC2DQCAe4BmhEnQQZ7AcuxQ==
X-Google-Smtp-Source: APXvYqyNseBgiWRvfOPgTWlJeKdB7smcVIA1H38J6pD0sReFqkOH/JuOGc+aD1Y2eE9RUc/ArMl3Hw==
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr541332ljo.99.1580330376034;
 Wed, 29 Jan 2020 12:39:36 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:2b4:78de:120:879a:3c09:8a9d])
 by smtp.gmail.com with ESMTPSA id u16sm1530062ljo.22.2020.01.29.12.39.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jan 2020 12:39:35 -0800 (PST)
Subject: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
Date: Wed, 29 Jan 2020 23:39:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_123937_790222_D85A8851 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
driver using the "back end" APIs in the main driver to talk to the real
hardware.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/hyperbus/Kconfig  |    6 +
 drivers/mtd/hyperbus/Makefile |    1 
 drivers/mtd/hyperbus/rpc-if.c |  162 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)

Index: linux/drivers/mtd/hyperbus/Kconfig
===================================================================
--- linux.orig/drivers/mtd/hyperbus/Kconfig
+++ linux/drivers/mtd/hyperbus/Kconfig
@@ -22,4 +22,10 @@ config HBMC_AM654
 	 This is the driver for HyperBus controller on TI's AM65x and
 	 other SoCs
 
+config RPCIF_HYPERBUS
+	tristate "Renesas RPC-IF HyperBus driver"
+	depends on RENESAS_RPCIF
+	help
+	  This option includes Renesas RPC-IF HyperFlash support.
+
 endif # MTD_HYPERBUS
Index: linux/drivers/mtd/hyperbus/Makefile
===================================================================
--- linux.orig/drivers/mtd/hyperbus/Makefile
+++ linux/drivers/mtd/hyperbus/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
 obj-$(CONFIG_HBMC_AM654)	+= hbmc-am654.o
+obj-$(CONFIG_RPCIF_HYPERBUS)	+= rpc-if.o
Index: linux/drivers/mtd/hyperbus/rpc-if.c
===================================================================
--- /dev/null
+++ linux/drivers/mtd/hyperbus/rpc-if.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Linux driver for RPC-IF HyperFlash
+ *
+ * Copyright (C) 2019 Cogent Embedded, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mtd/hyperbus.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mux/consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <memory/renesas-rpc-if.h>
+
+struct	rpcif_hyperbus {
+	struct rpcif rpc;
+	struct hyperbus_ctlr ctlr;
+	struct hyperbus_device hbdev;
+};
+
+static const struct rpcif_op rpcif_op_tmpl = {
+	.cmd = {
+		.buswidth = 8,
+		.ddr = true,
+	},
+	.ocmd = {
+		.buswidth = 8,
+		.ddr = true,
+	},
+	.addr = {
+		.nbytes = 1,
+		.buswidth = 8,
+		.ddr = true,
+	},
+	.data = {
+		.buswidth = 8,
+		.ddr = true,
+	},
+};
+
+static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+	struct rpcif_op op = rpcif_op_tmpl;
+	map_word data;
+
+	op.cmd.opcode = 0xC0;
+	op.addr.val = addr >> 1;
+	op.dummy.buswidth = 1;
+	op.dummy.ncycles = 15;
+	op.data.dir = RPCIF_DATA_IN;
+	op.data.nbytes = 2;
+	op.data.buf.in = &data;
+	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
+	rpcif_io_xfer(&hyperbus->rpc);
+
+	return be16_to_cpu(data.x[0]);
+}
+
+static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
+			     u16 data)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+	struct rpcif_op op = rpcif_op_tmpl;
+
+	op.cmd.opcode = 0x40;
+	op.addr.val = addr >> 1;
+	op.data.dir = RPCIF_DATA_OUT;
+	op.data.nbytes = 2;
+	op.data.buf.out = &data;
+	cpu_to_be16s(&data);
+	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
+	rpcif_io_xfer(&hyperbus->rpc);
+}
+
+static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
+			       unsigned long from, ssize_t len)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+	struct rpcif_op op = rpcif_op_tmpl;
+
+	op.cmd.opcode = 0xA0;
+	op.addr.val = from;
+	op.dummy.buswidth = 1;
+	op.dummy.ncycles = 15;
+	op.data.dir = RPCIF_DATA_IN;
+	op.data.nbytes = len;
+	op.data.buf.in = to;
+	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
+	rpcif_dirmap_read(&hyperbus->rpc, from, len, to);
+}
+
+static const struct hyperbus_ops rpcif_hb_ops = {
+	.read16 = rpcif_hb_read16,
+	.write16 = rpcif_hb_write16,
+	.copy_from = rpcif_hb_copy_from,
+};
+
+static int rpcif_hb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpcif_hyperbus *hyperbus;
+	int status;
+
+	hyperbus = devm_kzalloc(dev, sizeof(*hyperbus), GFP_KERNEL);
+	if (!hyperbus)
+		return -ENOMEM;
+
+	rpcif_sw_init(&hyperbus->rpc, pdev->dev.parent);
+
+	platform_set_drvdata(pdev, hyperbus);
+
+	rpcif_enable_rpm(&hyperbus->rpc);
+
+	rpcif_hw_init(&hyperbus->rpc, true);
+
+	hyperbus->hbdev.map.size = hyperbus->rpc.size;
+	hyperbus->hbdev.map.virt = hyperbus->rpc.dirmap;
+
+	hyperbus->ctlr.dev = dev;
+	hyperbus->ctlr.ops = &rpcif_hb_ops;
+	hyperbus->hbdev.ctlr = &hyperbus->ctlr;
+	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
+	status = hyperbus_register_device(&hyperbus->hbdev);
+	if (status) {
+		dev_err(dev, "failed to register device\n");
+		rpcif_disable_rpm(&hyperbus->rpc);
+	}
+
+	return status;
+}
+
+static int rpcif_hb_remove(struct platform_device *pdev)
+{
+	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
+	int error = hyperbus_unregister_device(&hyperbus->hbdev);
+	struct rpcif *rpc = dev_get_drvdata(pdev->dev.parent);
+
+	rpcif_disable_rpm(rpc);
+	return error;
+}
+
+static struct platform_driver rpcif_platform_driver = {
+	.probe	= rpcif_hb_probe,
+	.remove	= rpcif_hb_remove,
+	.driver	= {
+		.name	= "rpc-if-hyperflash",
+	},
+};
+
+module_platform_driver(rpcif_platform_driver);
+
+MODULE_DESCRIPTION("Renesas RPC-IF HyperFlash driver");
+MODULE_LICENSE("GPL v2");

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
