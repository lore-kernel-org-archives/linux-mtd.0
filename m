Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2B2C00144
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HIn6Erld0LwqzeK4zRCltt4S1SU06riyPOaMN2MExg=; b=X2rA72jG8SyN1p
	7Knpmb6oiIUW516DFfIZ0vzMOpl+HlvdvCOBdJ8rRaf4aOlOuhSaO2Y6Z1du2Vxzqp1aMctxDxMx+
	1Bamy3ejwJBPwaitwS9Sl+L6t+1gQ9lKCkIZV9lafcx/hajC74U3y4/wWKuK7OB3gOTfj/jl9LsdU
	792Mc1qu6fA8/6aRLjLZhQVMCodWhus4MZ4CX4uOwpCfH682GAxSjmv3sQ9KQ1jEtecPD/7vkieem
	MauK2WRC9xwwup09oScnL8FamX7xZjzEKfFWfMNtnkc+n+3XGbYazLpeX1qb56IlOLmJG540fYMUN
	F1fbrAO1yLubBw1AczpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNjE-004HVa-PY; Fri, 29 Jul 2022 11:00:24 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNj4-004HOQ-GX; Fri, 29 Jul 2022 11:00:16 +0000
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, peda@axentia.se, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bbrezillon@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Date: Fri, 29 Jul 2022 12:59:55 +0200
Message-ID: <2099405.mp5hVA6q5l@ada>
In-Reply-To: <20220728074014.145406-1-tudor.ambarus@microchip.com>
References: <20220728074014.145406-1-tudor.ambarus@microchip.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_040014_760932_92650FB2 
X-CRM114-Status: GOOD (  12.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Tudor,

Am Donnerstag, 28. Juli 2022, 09:40:14 CEST schrieb Tudor Ambarus:
> Every dma_map_single() call should have its dma_unmap_single() counterpart,
> because the DMA address space is a shared resource and one could render the
> machine unusable by consuming all DMA addresses.
> 
> Cc: stable@vger.kernel.org
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c
> b/drivers/mtd/nand/raw/atmel/nand-controller.c index
> 6ef14442c71a..330d2dafdd2d 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -405,6 +405,7 @@ static int atmel_nand_dma_transfer(struct
> atmel_nand_controller *nc,
> 
>  	dma_async_issue_pending(nc->dmac);
>  	wait_for_completion(&finished);
> +	dma_unmap_single(nc->dev, buf_dma, len, dir);
> 
>  	return 0;

Acked-by: Alexander Dahl <ada@thorsis.com>

After studying 
https://www.kernel.org/doc/html/latest/core-api/dma-api-howto.html
this seems like the correct thing to do to me.

I was made aware of this patch in IRC, after discussing a strange lzo 
decompression and/or page reading error with Richard after upgrading from 
kernel v5.2.21-rt13 to v5.15.49-rt47.

Now testing this on top of 5.15.49-rt47 on two boards, both with Microchip 
sama5d27c 128MiB SiP and Spansion S34ML02G1 raw nand flash. Will report later.

Thanks and greets
Alex




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
