Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EB8C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 14:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2E821852
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 14:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kzEwy9RB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2E821852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9Bw3yU8u5uK6KhI6jzGQGDIpPab/o5RFYZJpfZJDv0=; b=kzEwy9RBV1IME/
	YXw0uvwiH4Oy4MPYEh8wYd9AE9xCS5Tct9VMl3fz+gKiGEUYNssR8AeVFT2oDtU6siYN2nsDZbiMw
	UWb4mxFRgOjqd2sqT4AsC1kN1V1nbroguvxj5f747/tPalIwuvg4dphx7+zI6KTU1bgp6ENhFXCry
	qXVvYyZuWXtRWLBU0iV1LWh1ighaXkWqB3XKC+LJ55eI/WPXnS+DFW878zkuJ5kkou3fwEVI/6KRW
	SV9SRASH+QHySX+JYORw4xibbx5x66BpipEd66jN+Sph0w0n7evyZkci6l/+f4hOePRRgANcSj0ps
	j67ODebO9W+uWqai/TbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCPXx-000434-02; Fri, 05 Apr 2019 14:10:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCPXt-00042j-4g
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 14:10:18 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCPXr-000674-EY; Fri, 05 Apr 2019 16:10:15 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCPXq-0000t3-GF; Fri, 05 Apr 2019 16:10:14 +0200
Date: Fri, 5 Apr 2019 16:10:14 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/10] mtd: rawnand: gpmi: Implement exec_op
Message-ID: <20190405141014.raib2bxteonkkpx2@pengutronix.de>
References: <20190405100740.5074-1-s.hauer@pengutronix.de>
 <20190405100740.5074-11-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190405100740.5074-11-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:06:30 up 18 days,  1:17, 87 users,  load average: 1.53, 1.33, 1.21
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_071017_343985_42F85C71 
X-CRM114-Status: GOOD (  23.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Apr 05, 2019 at 12:07:40PM +0200, Sascha Hauer wrote:
> The gpmi driver performance suffers from nand operations being split
> in multiple small dma transfers. This has been forced by the nand layer
> in the former days, but now with exec_op we can use the controller as
> intended.
> 
> With this patch gpmi_nfc_exec_op becomes the main entry point to nand
> operations. Here all instructions are collected and chained as separate
> DMA transfers. In the end whole chain is fired and waited to be
> finished. gpmi_nfc_exec_op only does the hardware operations, bad block
> marker swapping and buffer scrambling is done by the callers. It's worth
> noting that the nand_*_op functions always take the buffer lengths for
> the data that the nand chip actually transfers. When doing BCH we have
> to calculate the net data size from the raw data size in some places.
> 
> This patch has been tested with 2048/64 and 2048/128 byte nand on
> i.MX6q. mtd_oobtest, mtd_subpagetest and mtd_speedtest run without
> errors. nandbiterrs, nandpagetest and nandsubpagetest userspace tests
> from mtdutils run without errors and UBIFS can successfully be mounted.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/dma/mxs-dma.c                      |    3 +
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1104 ++++++++------------
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   25 +-
>  3 files changed, 435 insertions(+), 697 deletions(-)
> 
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> +
> +	dev_dbg(this->dev, "%s setup done\n", __func__);
> +
> +	if (nbufs > 1) {
> +		dev_err(this->dev, "Multiple data instructions not supported\n");
> +		ret = -EINVAL;
> +		goto unmap;
> +	}
> +
> +	if (this->bch) {
> +		writel(this->bch_flashlayout0,
> +		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT0);
> +		writel(this->bch_flashlayout1,
> +		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT1);
> +	}
> +
> +	if (this->bch && buf_read) {
> +		completion = &this->bch_done;
> +	} else {
> +		desc->callback = dma_irq_callback;
> +		desc->callback_param = this;
> +		completion = &this->dma_done;
> +	}
> +
> +	init_completion(completion);

This needs a fixup. The bch_done completion is not always used, still
the bch interrupt is always enabled and the interrupt handler calls
complete() on it. For some reason this works on i.MX6 but crashes on
i.MX28. We have to enable the bch interrupt only when needed.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
