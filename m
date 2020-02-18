Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C79C34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 04:00:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0297206EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 04:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gbjRSJt/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vAmdEU07"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0297206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfPL15T9cniEqnnZ2tudY9JGfFBTzyaC4PbNJkezsrk=; b=gbjRSJt/1jtPrd
	ibggAI3waWIOKYBj2KQ0NKF7Jwd1tSXDbk7C3dXt++cB5rGqJQVh3xyqCsNRjvaXLe/GSUKaafeDd
	TiR7BsZ7ASe2voHYDh2jiDEL0Cq4rbrIisy3ST4kQEC8QwbacmbEijHSgPDn89toV+OHUvp8gvhvN
	amhFpdxZoT1ieXQbmXvBb41qS49MdBCu2TZ5ibhpptn90m1TpIFG6UIkTWsjPfR7VbuQc8gZikYgj
	VL57Ez3HSHzy+zyf1eyBCPrr0SbeJizYp2mXfyFirckdIMfaJ/Jj8GxRRPYbqHcWB6Cd4rcE/ItKQ
	051lc4sY6M1JZYNd/Azg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3u3J-00068g-N4; Tue, 18 Feb 2020 04:00:05 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3u3G-0005YT-8L
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 04:00:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01I3xnxK022135;
 Mon, 17 Feb 2020 21:59:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581998389;
 bh=tJWEZZ0UjLAZuchUr7KxVMM4gF+xPwiVf7Fe5my1WU8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vAmdEU070mS5lJG4Nd9OYE+X99OoGvZ6T9ULPD0gC8fmFFoka3MLppK0YNUXZdqG0
 QzxBIMvBwmaxsP0g81SovZqdAh4pG7LRCXvKioMq+Tpt/lpovNdpo06RmwNDWQm620
 dNVkC0CoFB4Nj0Y7wbxsFMlIlvI1dwvFFMA224Wg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01I3xnb4087088
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 Feb 2020 21:59:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 21:59:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 21:59:48 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01I3xkOu044744;
 Mon, 17 Feb 2020 21:59:47 -0600
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
Date: Tue, 18 Feb 2020 09:30:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_200002_430717_FBF8F893 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Sergei

On 30/01/20 2:09 am, Sergei Shtylyov wrote:
> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
> driver using the "back end" APIs in the main driver to talk to the real
> hardware.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
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

Looking around, there seems to be more than one SPI controllers, apart
from Renesas, which also support SPI NOR and HyperFlash protocol within
a single IP block. E.g.: Cadence xSPI controller [1]. Therefore, we need
a generic framework to support these kind of controllers.

One way would be to extend spi_mem_op to support above template along
with a new field to distinguish SPI NOR vs HyperFlash protocol. HyperBus
core can then register a spi_device and use spi-mem ops to talk to
controller driver.
So, I suggest making Renesas RPC-IF backend a full fledged spi-mem
driver (instead of driver/memory) and use extended spi_mem_op to support
HyperFlash.


[1]
https://ip.cadence.com/uploads/1244/cdn-dsd-mem-fla-host-controller-ip-for-xspi-pdf


Regards
Vignesh

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
