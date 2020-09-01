Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B5C433E6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 19:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F9A207D3
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 19:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F4ARUfV9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F9A207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Fge3YDrST3roArtrfppPW5yQ4Ju30v/g51ANw7/Ifc=; b=F4ARUfV9EydItSWOnZ8ma2TVK
	4ab1zrqVCV4FgjwC7wumLCI/gFQJjx6cV8MqT2+A5aLC4kIkY3T20F3+8oDhGOLbb/rLDOX8cO8is
	NWWgIWJgJR+/38Jz5DUQzh/rY1ZpJOTsSKIXxQw6+Ul5nXZB6mwdpd7w5gof2dpDwSlriaYT6tlqI
	II/aUWxIdiSMggmkJScRUxp9vuTk+ovg5WiZxP+/jm6eImB+N88cazzqA9pZz3I/vWuODBnZN32m8
	a2lSS1RqcstIOFzpCLhgdtHBNC4f4Bu05d1zfZo/l/va22kbmqFfqOsABrvcrt1oMm2bwVVSdezx/
	YFGeMmp3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDBhw-000169-Em; Tue, 01 Sep 2020 19:12:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDBhr-00015E-NY; Tue, 01 Sep 2020 19:12:37 +0000
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr
 [90.66.108.79]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A11C8FF807;
 Tue,  1 Sep 2020 19:12:27 +0000 (UTC)
Date: Tue, 1 Sep 2020 21:12:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/6] mtd: rawnand: atmel: Simplify with dev_err_probe()
Message-ID: <20200901191227.GK3204668@piout.net>
References: <20200901142535.12819-1-krzk@kernel.org>
 <20200901142535.12819-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901142535.12819-2-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_151235_862263_B899CC6E 
X-CRM114-Status: GOOD (  18.27  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/09/2020 16:25:31+0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index c9818f548d07..71e2b83485d7 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1976,13 +1976,9 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>  	platform_set_drvdata(pdev, nc);
>  
>  	nc->pmecc = devm_atmel_pmecc_get(dev);
> -	if (IS_ERR(nc->pmecc)) {
> -		ret = PTR_ERR(nc->pmecc);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Could not get PMECC object (err = %d)\n",
> -				ret);
> -		return ret;
> -	}
> +	if (IS_ERR(nc->pmecc))
> +		return dev_err_probe(dev, PTR_ERR(nc->pmecc),
> +				     "Could not get PMECC object\n");
>  
>  	if (nc->caps->has_dma && !atmel_nand_avoid_dma) {
>  		dma_cap_mask_t mask;
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
