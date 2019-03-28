Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EA8C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 19:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A93B20811
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 19:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="drhhO7ok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A93B20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DohKoZdMOwkdILo9bSnU2MVBVjQWjqPLiGmjJyujtSc=; b=drhhO7okwK9yM2
	p/pxs8A9xf+45EZIiG3WVCeCp4TKi1uwggD3JLlh7BKebkwlqP25JmQQ86T6jgvi+ApxAzBxQch1o
	k8p/UVNiuAaLPzGDmJUkXJn2ajzf2C8k5/Geuk/9IMK9e98zhZpl+4+PmCaGN7p1fUChaqzVnm3gN
	/PipXfM0fh3ArH/1OgTag1wDILiWWas3nenTxZ1WJOvq/Tws9QsC3XdiNSxJdIs2mveDZrQeQAB+N
	ptMhUl/VhG4EI9UAeWIvFg6XVT8zvYnlBZ9zAjPliXYepr0FYXOZ5v70tV7rLiKsCpiIAj1yUn7/i
	ZQDCKLdY8ZHW0yJYImCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9b7g-00011c-2s; Thu, 28 Mar 2019 19:55:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9b7Y-00011B-If
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 19:55:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C86028227F;
 Thu, 28 Mar 2019 19:55:26 +0000 (GMT)
Date: Thu, 28 Mar 2019 20:55:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
Message-ID: <20190328205522.272e1da6@collabora.com>
In-Reply-To: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_125528_743347_BE57FCF2 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, nagasuresh12@gmail.com,
 dwmw2@infradead.org, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 28 Mar 2019 16:46:24 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> Call spi_mem_default_supports_op() first, before calling controller
> specific ctlr->supports_op().
> With this, controller drivers can drop checking the buswidths again.

No, this was done on purpose, in case the controller does not want the
default check to be applied (say it does not need bus-width props to
be defined and has another way to check if a device can be accessed in
dual, quad or octal mode).
Just call spi_mem_default_supports_op() from your driver
->supports_op() hook if needed.

> 
> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Details can be found at https://lkml.org/lkml/2019/3/1/183
> ---
>  drivers/spi/spi-mem.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 5217a56..56aa158 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -189,11 +189,14 @@ static bool spi_mem_internal_supports_op(struct spi_mem *mem,
>  					 const struct spi_mem_op *op)
>  {
>  	struct spi_controller *ctlr = mem->spi->controller;
> +	bool ret;
> +
> +	ret = spi_mem_default_supports_op(mem, op);
>  
>  	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
> -		return ctlr->mem_ops->supports_op(mem, op);
> +		ret =  ctlr->mem_ops->supports_op(mem, op);
>  
> -	return spi_mem_default_supports_op(mem, op);
> +	return ret;
>  }
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
