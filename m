Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E165EC04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gDteOD+GtEX9fRvLaFg60wy5wGzaFqNpGPvgcRRvJQ=; b=qTNnTaVyA+BDPEgQ1wpMyU3Sfe
	AdLmwvQ53NxsRrErIqSB//F16DRzTgl8U7RMP17Wo2pHRMlRk/h6IgXm3xDSZmgPWqvZHbL4tQArq
	kJbRfPEMWJZHhLlTGsc3fSP96v9B6Sa8RzjPTvQZxSIIfp9868ikWEkXeOdjyvkhdjSLffIv7KaiU
	otezhfpNhEf33KeaI+qzLIZPug64d+IzkdB047uWvyOk4P8Sknqsir7TXq662MfxTRm4ceEc1hBiI
	XURRDlwWj7gNfGwX0FD+MM4fmz6yUnPmCP0eZ6YA80BELYdAEHbT6tA9nv8C6fDln+NHR3KxbkDg7
	D/F4g8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2QD-00987q-TR; Thu, 28 Jul 2022 12:15:21 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2QB-009814-27
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 12:15:20 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 130482223A;
	Thu, 28 Jul 2022 14:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1659010509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iB+y4UmlKWdeQTVxa4fIZkk162vSuzYY7Z6Mms0feo=;
	b=eRYFdqz2fx5llgTDNvLBmUKDpRFg4BwptGeeBb26uAvHV/QilbqJXphE7otOcrQ82AQjxy
	xaRsiheInsQF2bmrQfMCW7gBfdU6iwAJcjYMEG41hrMclA9veRA4L/LoTBT6sMeCzVryPu
	YHUKvG/o5oxz8yDT7EtrFnI47U8L9go=
MIME-Version: 1.0
Date: Thu, 28 Jul 2022 14:15:05 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Add an error message when failing to
 exit the 4-byte address mode
In-Reply-To: <20220728030159.68680-1-tudor.ambarus@microchip.com>
References: <20220728030159.68680-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <27c95d5e17906f5e45c04cec7c1bda9d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_051519_310492_5EF7B150 
X-CRM114-Status: GOOD (  16.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-07-28 05:01, schrieb Tudor Ambarus:
> Add an error message when failing to exit the 4-byte address mode. Do 
> not
> stop the execution and go through the spi_nor_soft_reset() method if 
> used,
> in the hope that the flash will default to 3-byte address mode after 
> the
> reset.
> 
> Suggested-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..1cdbdad97136 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2841,7 +2841,8 @@ void spi_nor_restore(struct spi_nor *nor)
>  	/* restore the addressing mode */
>  	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
>  	    nor->flags & SNOR_F_BROKEN_RESET)
> -		nor->params->set_4byte_addr_mode(nor, false);
> +		if (nor->params->set_4byte_addr_mode(nor, false))
> +			dev_err(nor->dev, "Failed to exit 4-byte address mode\n");

Could we stick to the ususal pattern:

ret = func()
if (ret)
    err("blubb (%d)", ret);

I know it is more lines but imho it makes the code much more readable.
And that way you could also print the error code. You could also use
dev_err("bla (%pe)\n", ERR_PTR(ret));

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
