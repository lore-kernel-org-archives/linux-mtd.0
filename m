Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89837C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5pEeYllAadR0g2l0xIQQmQiXaGkM4h9KXxsi9gpeOU=; b=BFX1Z0Yq20Iyv+
	/tMtLpVY0nuv2VV/HEf7p+KnPvUMZK6McmokgXR7P1DkMWTt/mrRecM3CGy5Nytkd1wX0g8Ygc8Z/
	ybu1SpdY3xkP0DevSEb1gtt86K0vW+2Yj3vPM5IXTB40jHMlPD01K5O1qhpSlPIAjPG/OV9i9zdwI
	sBLGnOtifEtk9ecpmJw9ePV8kFmzAlFm5H/JX1YH4EUoTmneVHGNHOOnWuSF3vvLCSSE1yNklbBeZ
	O5bOWIAOC6EGVIY8X0Byf5iPdP7NeyN8bEfUzvcAt7HDnVBIx/3hIrbWlRmA0pwEYAYDf8Sl7EwU0
	U7b60Oo5TUdE/IYjBDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyE2-00FhIW-K2; Tue, 01 Mar 2022 08:51:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyDX-00Fh1r-S6; Tue, 01 Mar 2022 08:50:49 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AA7871F43F9D;
 Tue,  1 Mar 2022 08:50:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646124644;
 bh=0ZrsARjiH24wsElmcwQCEqvABOocHSYJJ1IUet5VHj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VkssrVfGYwFWa86K5JP4dvVJi6C+6lIuwJgIlWE43OPqM0Jkp6M9+FhyeHzetVEl+
 GHv/S5dgJcAckf4Rz8kTvMI3l2e5f8DT3pWg6E9FH0/dMdwYbVh3DloQHKlmplgNrl
 /OS4LXT69IGzmAt7ExHejLoZJgKgThPU/lkUtaI3B1X8gsNlxdIrX/2m3NQApgnQ9s
 O7VmwhqHFJ0gpWAB6+nSGvaOOTp/YOQwllykSHbIkN/HgNEHhmUQyObYJGUj+vP1Ua
 w61pUvqu9bVvZlIXtQ7a3Nw/3CJkFwNzfWJj0KB7IwvU14dF5AExlse8rU/ajiY6Zm
 YPGpFHL9UWlOQ==
Date: Tue, 1 Mar 2022 09:50:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Xin Xiong <xiongx18@fudan.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, yuanxzhang@fudan.edu.cn, Xiyu Yang
 <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: atmel: fix refcount issue in
 atmel_nand_controller_init
Message-ID: <20220301095037.1763e051@collabora.com>
In-Reply-To: <20220301044556.36162-1-xiongx18@fudan.edu.cn>
References: <20220301044556.36162-1-xiongx18@fudan.edu.cn>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_005048_170085_DEC0C360 
X-CRM114-Status: GOOD (  20.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue,  1 Mar 2022 12:45:56 +0800
Xin Xiong <xiongx18@fudan.edu.cn> wrote:

> The reference counting issue happens in several error handling paths
> on a refcounted object "nc->dmac". In these paths, the function simply
> returns the error code, forgetting to balance the reference count of
> "nc->dmac", increased earlier by dma_request_channel(), which may
> cause refcount leaks.
> 
> Fix it by decrementing the refcount of specific object in those error
> paths.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Co-developed-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Co-developed-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> ---
> V1 -> V2: Rewrited the error handling block
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index f3276ee9e4fe..0efeb5d77be0 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -2060,13 +2060,15 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>  	nc->mck = of_clk_get(dev->parent->of_node, 0);
>  	if (IS_ERR(nc->mck)) {
>  		dev_err(dev, "Failed to retrieve MCK clk\n");
> -		return PTR_ERR(nc->mck);
> +		ret = PTR_ERR(nc->mck);
> +		goto out_release_dma;
>  	}
>  
>  	np = of_parse_phandle(dev->parent->of_node, "atmel,smc", 0);
>  	if (!np) {
>  		dev_err(dev, "Missing or invalid atmel,smc property\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto out_release_dma;
>  	}
>  
>  	nc->smc = syscon_node_to_regmap(np);
> @@ -2074,10 +2076,20 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>  	if (IS_ERR(nc->smc)) {
>  		ret = PTR_ERR(nc->smc);
>  		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
> -		return ret;
> +		goto out_release_dma;
>  	}
>  
>  	return 0;
> +
> +out_release_dma:
> +	if (nc->caps->has_dma && !atmel_nand_avoid_dma) {
> +		if (nc->dmac) {
> +			dma_release_channel(nc->dmac);
> +			nc->dmac = NULL;
> +		}
> +	}

Nit:

	if (nc->dmac)
		dma_release_channel(nc->dmac);

should work just fine.

> +
> +	return ret;
>  }
>  
>  static int


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
