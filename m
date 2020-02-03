Return-Path: <SRS0=yeSB=3X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CFBC33C9E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 04:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCF82073C
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 04:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="toYTNKS7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R7rtFSm1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CCF82073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9e3QDw72F09KyX5cqEzFtxRQoQ3JTIQSJLuLfNoNhos=; b=toYTNKS7QX7Sm+
	Bsq+k2Gl9DDRO5bSCPasckC8tQfIPdEO4tXmytUoY5Kl9OS3nl6gilqvJ+FiKkUcfkuNB47gGRLMj
	r1qEtjqrCSX9ZBhoAtLWK0EmpR2kp87saIlKHbLl2H/Blb6fXJZ53/CTg2v/ipigjMJbU9nIYGZQQ
	7z95Fo1BoCE22zvZxSsHn0+flPydqYVzm5oQ8uGQnyDbw/sIqmJm36O+sF6x8FaUUyfeiK739bO5u
	2T3Qx5WBh+CcvJyvRh9MA16PsFpEZWKltP0ZHE1MfBrqL1RAsOHe4QRF4rRk4mkM2rn5Qi7xzVO/z
	nLnJVu8FH9DaVBlQDt3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyTpP-0008Nl-My; Mon, 03 Feb 2020 04:59:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyTpM-0008Mx-J5
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2020 04:59:18 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0134x1Ga032115;
 Sun, 2 Feb 2020 22:59:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580705941;
 bh=cT3nnQQlEe0dpKKsOx6WRbzY61g03pGQAgjCy8y7NfU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=R7rtFSm1fyauGAh8ce+bcs6pqwiLLw5qsoII+wfcffrxhp7tQd9IOHfjwEeM76RDb
 lLVVGxF0sJboB4C6fDQuOstKJk4MaTFmwTuNhKvUw42Uhp1wjkyYRctxYc1DIiyIZw
 Xc3ytYzHcUu4ZrNcKeg3MHjt49PMKU8JZV86Z4fQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0134x1v4058380;
 Sun, 2 Feb 2020 22:59:01 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 2 Feb
 2020 22:59:01 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 2 Feb 2020 22:59:01 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0134wwmq129656;
 Sun, 2 Feb 2020 22:58:59 -0600
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <26e74968-9bc6-9b83-e824-c972f159ff2c@ti.com>
Date: Mon, 3 Feb 2020 10:29:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_205916_759735_349EEB6F 
X-CRM114-Status: GOOD (  20.17  )
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

Hi Sergei,

On 30/01/20 2:09 am, Sergei Shtylyov wrote:
> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
> driver using the "back end" APIs in the main driver to talk to the real
> hardware.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---

Is the backend merged? Or are the patches still in RFC stage?

Regards
Vignesh

>  drivers/mtd/hyperbus/Kconfig  |    6 +
>  drivers/mtd/hyperbus/Makefile |    1 
>  drivers/mtd/hyperbus/rpc-if.c |  162 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 169 insertions(+)
> 
> Index: linux/drivers/mtd/hyperbus/Kconfig
> ===================================================================
> --- linux.orig/drivers/mtd/hyperbus/Kconfig
> +++ linux/drivers/mtd/hyperbus/Kconfig
> @@ -22,4 +22,10 @@ config HBMC_AM654
>  	 This is the driver for HyperBus controller on TI's AM65x and
>  	 other SoCs
>  
> +config RPCIF_HYPERBUS
> +	tristate "Renesas RPC-IF HyperBus driver"
> +	depends on RENESAS_RPCIF
> +	help
> +	  This option includes Renesas RPC-IF HyperFlash support.
> +
>  endif # MTD_HYPERBUS
> Index: linux/drivers/mtd/hyperbus/Makefile
> ===================================================================
> --- linux.orig/drivers/mtd/hyperbus/Makefile
> +++ linux/drivers/mtd/hyperbus/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
>  obj-$(CONFIG_HBMC_AM654)	+= hbmc-am654.o
> +obj-$(CONFIG_RPCIF_HYPERBUS)	+= rpc-if.o
> Index: linux/drivers/mtd/hyperbus/rpc-if.c
> ===================================================================
> --- /dev/null
> +++ linux/drivers/mtd/hyperbus/rpc-if.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Linux driver for RPC-IF HyperFlash
> + *
> + * Copyright (C) 2019 Cogent Embedded, Inc.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include <memory/renesas-rpc-if.h>
> +
> +struct	rpcif_hyperbus {
> +	struct rpcif rpc;
> +	struct hyperbus_ctlr ctlr;
> +	struct hyperbus_device hbdev;
> +};
> +
> +static const struct rpcif_op rpcif_op_tmpl = {
> +	.cmd = {
> +		.buswidth = 8,
> +		.ddr = true,
> +	},
> +	.ocmd = {
> +		.buswidth = 8,
> +		.ddr = true,
> +	},
> +	.addr = {
> +		.nbytes = 1,
> +		.buswidth = 8,
> +		.ddr = true,
> +	},
> +	.data = {
> +		.buswidth = 8,
> +		.ddr = true,
> +	},
> +};
> +
> +static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
> +{
> +	struct rpcif_hyperbus *hyperbus =
> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
> +	struct rpcif_op op = rpcif_op_tmpl;
> +	map_word data;
> +
> +	op.cmd.opcode = 0xC0;
> +	op.addr.val = addr >> 1;
> +	op.dummy.buswidth = 1;
> +	op.dummy.ncycles = 15;
> +	op.data.dir = RPCIF_DATA_IN;
> +	op.data.nbytes = 2;
> +	op.data.buf.in = &data;
> +	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
> +	rpcif_io_xfer(&hyperbus->rpc);
> +
> +	return be16_to_cpu(data.x[0]);
> +}
> +
> +static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
> +			     u16 data)
> +{
> +	struct rpcif_hyperbus *hyperbus =
> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
> +	struct rpcif_op op = rpcif_op_tmpl;
> +
> +	op.cmd.opcode = 0x40;
> +	op.addr.val = addr >> 1;
> +	op.data.dir = RPCIF_DATA_OUT;
> +	op.data.nbytes = 2;
> +	op.data.buf.out = &data;
> +	cpu_to_be16s(&data);
> +	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
> +	rpcif_io_xfer(&hyperbus->rpc);
> +}
> +
> +static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
> +			       unsigned long from, ssize_t len)
> +{
> +	struct rpcif_hyperbus *hyperbus =
> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
> +	struct rpcif_op op = rpcif_op_tmpl;
> +
> +	op.cmd.opcode = 0xA0;
> +	op.addr.val = from;
> +	op.dummy.buswidth = 1;
> +	op.dummy.ncycles = 15;
> +	op.data.dir = RPCIF_DATA_IN;
> +	op.data.nbytes = len;
> +	op.data.buf.in = to;
> +	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
> +	rpcif_dirmap_read(&hyperbus->rpc, from, len, to);
> +}
> +
> +static const struct hyperbus_ops rpcif_hb_ops = {
> +	.read16 = rpcif_hb_read16,
> +	.write16 = rpcif_hb_write16,
> +	.copy_from = rpcif_hb_copy_from,
> +};
> +
> +static int rpcif_hb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpcif_hyperbus *hyperbus;
> +	int status;
> +
> +	hyperbus = devm_kzalloc(dev, sizeof(*hyperbus), GFP_KERNEL);
> +	if (!hyperbus)
> +		return -ENOMEM;
> +
> +	rpcif_sw_init(&hyperbus->rpc, pdev->dev.parent);
> +
> +	platform_set_drvdata(pdev, hyperbus);
> +
> +	rpcif_enable_rpm(&hyperbus->rpc);
> +
> +	rpcif_hw_init(&hyperbus->rpc, true);
> +
> +	hyperbus->hbdev.map.size = hyperbus->rpc.size;
> +	hyperbus->hbdev.map.virt = hyperbus->rpc.dirmap;
> +
> +	hyperbus->ctlr.dev = dev;
> +	hyperbus->ctlr.ops = &rpcif_hb_ops;
> +	hyperbus->hbdev.ctlr = &hyperbus->ctlr;
> +	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
> +	status = hyperbus_register_device(&hyperbus->hbdev);
> +	if (status) {
> +		dev_err(dev, "failed to register device\n");
> +		rpcif_disable_rpm(&hyperbus->rpc);
> +	}
> +
> +	return status;
> +}
> +
> +static int rpcif_hb_remove(struct platform_device *pdev)
> +{
> +	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
> +	int error = hyperbus_unregister_device(&hyperbus->hbdev);
> +	struct rpcif *rpc = dev_get_drvdata(pdev->dev.parent);
> +
> +	rpcif_disable_rpm(rpc);
> +	return error;
> +}
> +
> +static struct platform_driver rpcif_platform_driver = {
> +	.probe	= rpcif_hb_probe,
> +	.remove	= rpcif_hb_remove,
> +	.driver	= {
> +		.name	= "rpc-if-hyperflash",
> +	},
> +};
> +
> +module_platform_driver(rpcif_platform_driver);
> +
> +MODULE_DESCRIPTION("Renesas RPC-IF HyperFlash driver");
> +MODULE_LICENSE("GPL v2");
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
