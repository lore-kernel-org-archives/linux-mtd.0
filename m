Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2388C4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 04:39:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F48206DD
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 04:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oya2pdsq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vfE7UOCB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48F48206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKKWL88FHTPnGCkLSjbjWV4egHJosG5sadgRGoHCupc=; b=oya2pdsqzuV3FL62XrZIEEK2GR
	4ZpUVdmg8ptnXekL92UN9P27GIAkJm5ygOJXUBpmpRwtzs3Jb+WnyCaleYSngU4O9xmr4+bCWMC97
	D440tC9iTCSKdMIXlXXAFY1nVQ22qwvJ/cyyznLaJfw8OGKPBtDYhTOqv0sho/lDuD0ABxjiNVaiJ
	mrRMBcVnM9PEgP05jE2Vb4ge7zyh/LY4NC5lgx5f+giF+6F4BWtuV9Gcbngy1JiqCqAmJjmlIcM31
	diOP1cWoTAzLXGENkQsXFqbueEhRbjWEK112tAFs/vwdtkp8tXSG7T/aWb4hDDhxcAPyocQya5eJm
	6lvO67ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvmi-00035A-BO; Sun, 04 Oct 2020 04:38:08 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvmf-00032s-3n
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 04:38:06 +0000
Received: by mail-ej1-x642.google.com with SMTP id u8so7182820ejg.1
 for <linux-mtd@lists.infradead.org>; Sat, 03 Oct 2020 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=akTjh5s829ygXWoLmGMPPyqwgdYuKiafWToy1Z3aBbA=;
 b=vfE7UOCBXMr9wQmjEpQrMLk8DJz6xsIR2fGVD6IAV4lyz2E5g/TS9t60RFzqDltRId
 rsbzH0XdYFHq1I/l8V2aWhJnCYbabyiixZ9h6xUr+7sOcICCq3CH2BqIN9bH18xqg0+f
 ttAnbPKkw8EZIQZOaA1gREJUW51C06ZXSf/GbFxpt26uVA9HIQj1aT1fdS1AMU4PIo02
 CNyBIjrg8/CzkXVgl1it1Wj1bBjuDoJWnm9uhShZRev+keaxJjhAiZavTz/JjeMGpMo3
 VUAZJnAPVHjlQNgnJ2x0CzU38eCZYsRbIJ3zAVonPb2NGYryPqo4Wm1mlZAtWnlSmdke
 OwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=akTjh5s829ygXWoLmGMPPyqwgdYuKiafWToy1Z3aBbA=;
 b=tL+PzrrY0cP6/nc1sGAnTrbYbnf6ruUvwokdcBWokZaLBr9ZdAIciOoWDmfD59Homh
 xPT0v1/ld1jmVo3jf1xEHhuHKPbpwqBF+gjnAq46Nl/uT1a0yT+k5un/Qm22aoPCvMSU
 2OMPtFv88l9TJ3Q8sF6U6oxSbt4KD12/7CiMilZp8SGsNtreCMp/vz+4/SJjTBtesOG/
 dP04Bo3vdzE2SSoh9t7aPjkVNb8tqMBcaYjcqmWJMmedWS3mDOIt90vuja/rFARIRqxt
 Dqw1sS5qF1jv9lX2g2819M1HpG5N3gehBx6KDM3tt6pQxVPoyBuYH/+b8T504Fc4PtDi
 F/pg==
X-Gm-Message-State: AOAM533OO0tJtL6I/h36/T5xvx+UncjvBZhpNs4fv1bivc+QVKnhmP5A
 vaYQGLTuHm3ROCwAyLfX9hGdVYnikSo=
X-Google-Smtp-Source: ABdhPJwOxPe2Ie3wSw2JAqfu5jH0+22e0zK01W6kn0l2zu+DBM8ytLxgr+305jnhnW+RauTLYi1wjA==
X-Received: by 2002:a05:6512:338e:: with SMTP id
 h14mr2668520lfg.422.1601756602417; 
 Sat, 03 Oct 2020 13:23:22 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4263:86b1:7b03:4405:a50:ae1c])
 by smtp.gmail.com with ESMTPSA id v13sm2325056lfo.30.2020.10.03.13.23.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Oct 2020 13:23:21 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: [PATCH v3] mtd: hyperbus: add Renesas RPC-IF driver
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Brain-dead Software
Message-ID: <78abb851-2beb-fe7d-87e5-ce58ee877d35@gmail.com>
Date: Sat, 3 Oct 2020 23:23:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_003805_180458_A0AEE1B9 
X-CRM114-Status: GOOD (  27.45  )
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

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
driver using the "back end" APIs in the main driver to talk to the real
hardware.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'mtd/next' branch of the MTD 'linux.git' repo.

Changes in version 3:
- factored out rpcif_hb_prepare_read() out of the read16() and copy_from()
  driver methods and rpcif_hb_prepare_write() out of the write16() method;
- added #define's fo the HyperBus command bits to the HyperBus header file,
  made use of them in the driver;
- removed #ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP fromn the driver; convertged the
  'select' line to 'depends on' line inm the Kconfig option;
- added CONFIG_COMPILE_TEST to the 'depends on' line of the driver's Kconfig
  option;
- changed HyperFlash to HyperBus in the driver's Kconfig option's help text;
- killed a stray space before the declaration of the 'struct rpcif_hyperbus'.

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
 drivers/mtd/hyperbus/rpc-if.c |  170 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/hyperbus.h  |   11 ++
 4 files changed, 189 insertions(+)

Index: linux/drivers/mtd/hyperbus/Kconfig
===================================================================
--- linux.orig/drivers/mtd/hyperbus/Kconfig
+++ linux/drivers/mtd/hyperbus/Kconfig
@@ -22,4 +22,11 @@ config HBMC_AM654
 	 This is the driver for HyperBus controller on TI's AM65x and
 	 other SoCs
 
+config RPCIF_HYPERBUS
+	tristate "Renesas RPC-IF HyperBus driver"
+	depends on RENESAS_RPCIF || COMPILE_TEST
+	depends on MTD_CFI_BE_BYTE_SWAP
+	help
+	  This option includes Renesas RPC-IF HyperBus support.
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
@@ -0,0 +1,170 @@
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
+static void rpcif_hb_prepare_read(struct rpcif *rpc, void *to,
+				  unsigned long from, ssize_t len)
+{
+	struct rpcif_op op = rpcif_op_tmpl;
+
+	op.cmd.opcode = HYPERBUS_RW_READ | HYPERBUS_AS_MEM;
+	op.addr.val = from >> 1;
+	op.dummy.buswidth = 1;
+	op.dummy.ncycles = 15;
+	op.data.dir = RPCIF_DATA_IN;
+	op.data.nbytes = len;
+	op.data.buf.in = to;
+
+	rpcif_prepare(rpc, &op, NULL, NULL);
+}
+
+static void rpcif_hb_prepare_write(struct rpcif *rpc, unsigned long to,
+				   void *from, ssize_t len)
+{
+	struct rpcif_op op = rpcif_op_tmpl;
+
+	op.cmd.opcode = HYPERBUS_RW_WRITE | HYPERBUS_AS_MEM;
+	op.addr.val = to >> 1;
+	op.data.dir = RPCIF_DATA_OUT;
+	op.data.nbytes = len;
+	op.data.buf.out = from;
+
+	rpcif_prepare(rpc, &op, NULL, NULL);
+}
+
+static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+	map_word data;
+
+	rpcif_hb_prepare_read(&hyperbus->rpc, &data, addr, 2);
+
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
+
+	rpcif_hb_prepare_write(&hyperbus->rpc, addr, &data, 2);
+
+	rpcif_manual_xfer(&hyperbus->rpc);
+}
+
+static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
+			       unsigned long from, ssize_t len)
+{
+	struct rpcif_hyperbus *hyperbus =
+		container_of(hbdev, struct rpcif_hyperbus, hbdev);
+
+	rpcif_hb_prepare_read(&hyperbus->rpc, to, from, len);
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
Index: linux/include/linux/mtd/hyperbus.h
===================================================================
--- linux.orig/include/linux/mtd/hyperbus.h
+++ linux/include/linux/mtd/hyperbus.h
@@ -8,6 +8,17 @@
 
 #include <linux/mtd/map.h>
 
+/* HyperBus command bits */
+#define HYPERBUS_RW	0x80	/* R/W# */
+#define HYPERBUS_RW_WRITE 0
+#define HYPERBUS_RW_READ 0x80
+#define HYPERBUS_AS	0x40	/* Address Space */
+#define HYPERBUS_AS_MEM	0
+#define HYPERBUS_AS_REG	0x40
+#define HYPERBUS_BT	0x20	/* Burst Type */
+#define HYPERBUS_BT_WRAPPED 0
+#define HYPERBUS_BT_LINEAR 0x20
+
 enum hyperbus_memtype {
 	HYPERFLASH,
 	HYPERRAM,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
