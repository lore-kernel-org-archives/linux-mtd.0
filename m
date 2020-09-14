Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B16EC43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 13:10:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAB5206B2
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 13:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jhgtT7ER";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a9+ODKht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAB5206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QllVBY0OQQiWgh6vEzwHmnOpM+bK5F2ILHqT50ZSwYE=; b=jhgtT7ERKJTP0nsfUmaiHvfLv
	+xeOcjc2kCRDc6ep23T3bO7OZoSbkocQHA7oCrOrVsL1OScGTPGPgIMyMAwW75/4T4i23f8Vh4MJQ
	Amt4DiywY051ddyNaCWaG/e5NSIrdn/IxVbAjxsT/N3vSAi5T6HQvxNfyVi8AKzbZGe4UXk8VDjVX
	ffvi5b35qWvdBLptKMaEdKMXIFJUwue/BNsVA/o3HNPbRyOM2VT6d8Zi7FyuvoB/rrSp0ZFRaixEN
	kHVRXeTe7A+dexF76I60vYg5Q6W/0meSmXd1fomswW96JU4Z+qE9VZw3JH/fJ+hGaiWNKCauIfLIq
	NS2hdxDhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHoEn-0004Vq-1c; Mon, 14 Sep 2020 13:09:41 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHoEj-0004UJ-VM
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 13:09:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08ED9T2A007847;
 Mon, 14 Sep 2020 08:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600088969;
 bh=3eOOT+qYt0RUzbtEA4r1tAGKDJQHQrEVaR+I0wSgEXM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=a9+ODKht428aI8wNHeEF4296vvlvuwAM3uvjfsrWawcjdEgIe4S4DW2p53oBdq0jY
 +IUATv4HDre9jJPHNOuo1tnYFe4L/9w4fkg0RGVZS8u2U0CCr0n8oqb9HjkRmnnVTR
 +q5icn8OrAv+be7aN2hjOW0rSojtEpaah2Cdw6lk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08ED9TZ7108466
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Sep 2020 08:09:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 08:09:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 08:09:29 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ED9Qnq073717;
 Mon, 14 Sep 2020 08:09:27 -0500
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
Date: Mon, 14 Sep 2020 18:39:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_090938_090316_36279D9B 
X-CRM114-Status: GOOD (  25.24  )
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

On 5/14/20 2:13 AM, Sergei Shtylyov wrote:
> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
> driver using the "back end" APIs in the main driver to talk to the real
> hardware.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 

Mails to this ID is bouncing which meant I could not ask status of
dependencies.

> ---
> This patch is against the 'mtd/next' branch of the MTD 'linux.git' repo.
> Requires  the RPC-IF main driver patch in order to build/work:
> 
> [1] https://patchwork.kernel.org/patch/11283127/
> 
[...]
> --- /dev/null
> +++ linux/drivers/mtd/hyperbus/rpc-if.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Linux driver for RPC-IF HyperFlash
> + *
> + * Copyright (C) 2019-2020 Cogent Embedded, Inc.
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
> +/* FIXME: How to drop this? */
> +#ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP
> +#error Enable config "Flash cmd/query data swapping (BIG_ENDIAN_BYTE)"
> +#endif

select MTD_CFI_BE_BYTE_SWAP in Kconfig does not help?

> +
> + struct	rpcif_hyperbus {

WARNING: please, no spaces at the start of a line
#73: FILE: drivers/mtd/hyperbus/rpc-if.c:25:
+ struct^Irpcif_hyperbus {$



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
> +	op.cmd.opcode = 0x80;

Here and elsewhere what does 0x80 represent? Maybe using a self
describing macro would be helpful when assigning values to op.cmd.opcode?

> +	op.addr.val = addr >> 1;
> +	op.dummy.buswidth = 1;
> +	op.dummy.ncycles = 15;
> +	op.data.dir = RPCIF_DATA_IN;
> +	op.data.nbytes = 2;
> +	op.data.buf.in = &data;

This code block seems like a good candidate to be converted to a macro/
template to avoid repetition. Template can initializes few values remain
common across the driver and override others based on parameters passed.
You could probably have one for write op and one for read op, if needed.

[...]

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
