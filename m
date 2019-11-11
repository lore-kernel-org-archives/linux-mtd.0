Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6EEC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AFB2075B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oO1xoXbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2AFB2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nkTer/qfJePULpnsLksNabgF5aU+ko7Xb8HJoenz1g=; b=oO1xoXbPfODsW0
	rZ8YdB9q3J56vbQu8qGQyy0Q1PskFYEZxS5xcdbCtrj5ic+ZYk2sjyDWe5f7GN1qUyxvtTHkaqSnd
	E4s6tNogexir+zrDgIpP2ls0gHJWUrxb1ysN4hAKb6OtLo1cjWhPHtqnEaUO2cG7WJybli6NsKBT5
	QRY8JiWVWfaFq3EF6e+eLuInEQJBe77F9ck5mmO+nyIWdC7vJ+HTCkrZoZmevlfX/XVL//maMeZL1
	01FAR8sdDNRL+RCtP0QZEmn1m7XT8AmVfdVSVRj41MM6oS9GvuunJCGg0psWf2F1ko6Bw9c00FX1g
	9SNpt+SR63Yk9qBuh3NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU5gh-0002Qo-Jm; Mon, 11 Nov 2019 09:08:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU5gf-0002QO-21
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:08:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D9D7728EA77;
 Mon, 11 Nov 2019 09:08:39 +0000 (GMT)
Date: Mon, 11 Nov 2019 10:08:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Move condition to avoid a NULL check
Message-ID: <20191111100836.0a3af484@collabora.com>
In-Reply-To: <20191025142811.541-2-tudor.ambarus@microchip.com>
References: <20191025123217.12790-1-tudor.ambarus@microchip.com>
 <20191025142811.541-1-tudor.ambarus@microchip.com>
 <20191025142811.541-2-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_010841_231855_E3D22E18 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: linux-mtd@lists.infradead.org, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 25 Oct 2019 14:28:36 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> When the controller is not under the SPI-MEM interface it may implement
> the optional controller_ops->erase() method.
> 
> nor->spimem and nor->controller_ops are mutual exclusive. Move the

					  ^mutually

> nor->controller_ops->erase != NULL check as an 'else if' case to
> nor->spimem, in order to avoid the nor->controller_ops != NULL
> check.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> v2: add Reported-by tag, amend commit description.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b452d3d0de28..8eaf097098d9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -942,9 +942,6 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  
>  	addr = spi_nor_convert_addr(nor, addr);
>  
> -	if (nor->controller_ops && nor->controller_ops->erase)
> -		return nor->controller_ops->erase(nor, addr);
> -
>  	if (nor->spimem) {
>  		struct spi_mem_op op =
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
> @@ -953,6 +950,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  				   SPI_MEM_OP_NO_DATA);
>  
>  		return spi_mem_exec_op(nor->spimem, &op);
> +	} else if (nor->controller_ops->erase) {
> +		return nor->controller_ops->erase(nor, addr);
>  	}
>  
>  	/*




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
