Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8599C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 20:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5FEE205ED
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 20:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="giiM6jpG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="DJFOB2jU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5FEE205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LzI3n9m1U1avzyTnG1u/1koKiCv8XbouoxtBAVvMvJA=; b=giiM6jpGYGQWLH
	/VNFTo3SD7rBFtbNufFkaOMkWTxmWi4MgbXEB3sXOO71uMkjahnbexmduIR8pmsDMCe+964D/xVOl
	99JT1syMy8AxSU6410wwm0llB8JrGOLC3BiTmOhtVHUJMk0NzgYo52P6ICeg6FEyWV5rA7IGh1wZt
	a7TY/LOmLTDoSfCDsQStam3NLaydNPo38rOFeeFJFqJbQhdxLGZ8+JdmEH7gpkSEbcJivDtmPAsCm
	9MAm4uc7CJobRKR0r0f3AhV/5gVvb4n/zSRg4qcnCMdCQPfUYc4cUBWGrWEbVLBMAxEwHGWLlbX0D
	/ugnaMeYK+8uhoYQWl0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYyDr-0002cT-PG; Wed, 13 May 2020 20:43:23 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYyDo-0002b1-4n
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 20:43:22 +0000
Received: by mail-lj1-x243.google.com with SMTP id u15so1115194ljd.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2020 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=3KrLM2Cb1WPMu5OEl0lNUyE+yS/VxOzuugKj4jPkQ4I=;
 b=DJFOB2jUaSIaNvKq84KZ4DBCjNlm7TEZIPPSOrSQ/aaRIpfztqbOUFcAYrEZNySrfr
 cZ55FeboMgj6FOKHnlrdfJu35SaGnDBnSKpItJBvKweyJXFo9f76+03FoGPsmB9M2788
 PPf7XesVowYT0RKnJnt8XhFA2hZdhvzKcDkEAxJ7WefdHtGU7gqkcKFxagAzbP0pJTyy
 IIKqY2NccLGGq5Dv6r+6xu9gGhPIubslQR7YX7MoS9wB8Avu7MvSCpgsCo+R7zAy6hMU
 Y4PsIuTOazDikUEy9Op1w/49I4QrXyW1z8cmOY+Dh52R4zgg41FaClv2sF3O9vYTRc9f
 KDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=3KrLM2Cb1WPMu5OEl0lNUyE+yS/VxOzuugKj4jPkQ4I=;
 b=Ix32StCUdplMlN83dYsuUiV3edp02vVQOTAbDoz1wcXA/lhmeLs+7SxwXZCnDpahxY
 o5I1wdAbMopSMKlQB3uItZ7FnunQh+TyNVgXP0qYl1xTgUJK9s7zI/qvK2aLqyhXaRq8
 ugN+Bp3aXEjCra8VZEGiNI7/SVAhRG9+LGniBq+/JP4jd8Gzd7pEcFuHdsSNmAbeypVD
 V2toX/EmY0B8QkG74+VMJ6iI9w9CBJZJMvk8tIQWmrFNaWNmKEPDygrJbBp+/RWt6N/O
 Rhwxk3Gww81idSPdKq9Fu0LgqKrOGe8b3JC5Vnh6uwtv31g/CpeTidYgTfZrDT3/tZTX
 ESfQ==
X-Gm-Message-State: AOAM531a5mKfoYdZfQcHFXQmipfgBhDX/aDJGFcTYGtfT4fYn0/I1wB4
 SevyiFNF1BNJ3CjwuOEAtHKIlGWgXNQ=
X-Google-Smtp-Source: ABdhPJx4g2FbhJBv01Vg8sDnWLTmEdJhyIEeKIT0C+T25GT2dvjJc2fXDBtN4xQW+4cj3fncFEALQQ==
X-Received: by 2002:a2e:986:: with SMTP id 128mr531033ljj.202.1589402593601;
 Wed, 13 May 2020 13:43:13 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44ec:2b72:d06f:611f:aa9d:3af9])
 by smtp.gmail.com with ESMTPSA id l2sm283600ljg.89.2020.05.13.13.43.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 13:43:12 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
Date: Wed, 13 May 2020 23:43:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_134320_366710_BD6D0B69 
X-CRM114-Status: GOOD (  18.11  )
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
This patch is against the 'mtd/next' branch of the MTD 'linux.git' repo.
Requires  the RPC-IF main driver patch in order to build/work:

[1] https://patchwork.kernel.org/patch/11283127/

Changes in version 2:
- added 'select MTD_CFI_ADV_OPTIONS' to the Kconfig entry, added #ifndef
  CONFIG_MTD_CFI_BE_BYTE_SWAP #error in the driver, and removed  be16_to_cpu()
  call in the read16() method;
- zeroed the target and burst type bits of the HyperBus command codes;
- passed the address of 16-bit entity to rpcif_prepare() in the copy_from()
  method;
- added an empty line between rpcif_prepare() and rpcif_drirmap_read() calls
  in the copy_from() method;
- renamed rpcif_io_xfer() to rpcif_manual_xfer();
- removed the C++ style comments to rpcif_prepare() calls;
- removed dev_err() call from the probe() method;
- renamed the 'status' local variable to 'error' in the probe() method;
- extended the driver copyright to this year.

 drivers/mtd/hyperbus/Kconfig  |    7 +
 drivers/mtd/hyperbus/Makefile |    1 
 drivers/mtd/hyperbus/rpc-if.c |  165 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)

Index: linux/drivers/mtd/hyperbus/Kconfig
===================================================================
--- linux.orig/drivers/mtd/hyperbus/Kconfig
+++ linux/drivers/mtd/hyperbus/Kconfig
@@ -22,4 +22,11 @@ config HBMC_AM654
 	 This is the driver for HyperBus controller on TI's AM65x and
 	 other SoCs
 
+config RPCIF_HYPERBUS
+	tristate "Renesas RPC-IF HyperBus driver"
+	depends on RENESAS_RPCIF
+	select MTD_CFI_ADV_OPTIONS
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
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Linux driver for RPC-IF HyperFlash
+ *
+ * Copyright (C) 2019-2020 Cogent Embedded, Inc.
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
+/* FIXME: How to drop this? */
+#ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP
+#error Enable config "Flash cmd/query data swapping (BIG_ENDIAN_BYTE)"
+#endif
+
+ struct	rpcif_hyperbus {
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
+	op.cmd.opcode = 0x80;
+	op.addr.val = addr >> 1;
+	op.dummy.buswidth = 1;
+	op.dummy.ncycles = 15;
+	op.data.dir = RPCIF_DATA_IN;
+	op.data.nbytes = 2;
+	op.data.buf.in = &data;
+	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL);
+	rpcif_manual_xfer(&hyperbus->rpc);
+
+	return data.x[0];
+}
+
+static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
+			     u16 data)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+	struct rpcif_op op = rpcif_op_tmpl;
+
+	op.cmd.opcode = 0;
+	op.addr.val = addr >> 1;
+	op.data.dir = RPCIF_DATA_OUT;
+	op.data.nbytes = 2;
+	op.data.buf.out = &data;
+	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL);
+	rpcif_manual_xfer(&hyperbus->rpc);
+}
+
+static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
+			       unsigned long from, ssize_t len)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+	struct rpcif_op op = rpcif_op_tmpl;
+
+	op.cmd.opcode = 0x80;
+	op.addr.val = from >> 1;
+	op.dummy.buswidth = 1;
+	op.dummy.ncycles = 15;
+	op.data.dir = RPCIF_DATA_IN;
+	op.data.nbytes = len;
+	op.data.buf.in = to;
+	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL);
+
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
+	int error;
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
+	error = hyperbus_register_device(&hyperbus->hbdev);
+	if (error)
+		rpcif_disable_rpm(&hyperbus->rpc);
+
+	return error;
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
