Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCC3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZlODmQ+ffsTJ0v9D/fNsd7XV3MdzORPMosDnZ2M58k=; b=WqaFncepE19VQi
	OzgjL+tpdktALtu8iIH3evN5uNuYsW8Y9wqZCAj4TRPiNZWxulSEe1w31zAeLk8+IXtOxOY7T+0+p
	TG7uhYgNghxOzAfLLVeiLopa2KG84xk/lWdBm2rhMO8jTmAPqPG1BOcX84nsIgHgYpWXdP16WhPLE
	Xz3fDmXmXry6suusTszUop8uD9lNcMF5bjgO0UHL4Qqq5Sh6FOs9p2LsFIevHEkaicT53vpTJ16QS
	qUgXusEFoEbW4V3WXDx7zQFrp7wCB3AyWSsmMRA74qQBI5Mad/vOPzgE/krZiaEjIiYBGsfhCivRJ
	LxzFaTrN8EITRd42Caww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms07R-004Wor-Ks; Tue, 30 Nov 2021 10:12:14 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzsf-004SB8-OM; Tue, 30 Nov 2021 09:56:59 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AU9uSbu092749;
 Tue, 30 Nov 2021 03:56:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638266188;
 bh=6Ge5f6Ocb77L1g70NashIqeTVKeFl+CnrtGgc6cejzI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dEifJXYba+xSjx5Vi+wZb9/CN5aI1VP/hlo1qBTP83XAaBk3kHI5e9Y+xXFJMtkBm
 Q0HVY6hHul8pjhTInaM3+4tyMyVWTajIhvQ7JUSuZkmC5l04LOZi23U/YUG2xIRenx
 czb98iYtdWmIjwBe1zjSZY6cPZSKRNSa6q3f8hPs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AU9uSeU113815
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Nov 2021 03:56:28 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 30
 Nov 2021 03:56:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 30 Nov 2021 03:56:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AU9uR9k076916;
 Tue, 30 Nov 2021 03:56:27 -0600
Date: Tue, 30 Nov 2021 15:26:26 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 01/13] mtd: spi-nor: core: Don't use mtd_info in the
 NOR's probe sequence of calls
Message-ID: <20211130095624.wrnn67ajd3egjpwo@ti.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211122095020.393346-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_015657_924238_A0357706 
X-CRM114-Status: GOOD (  21.55  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/11/21 11:50AM, Tudor Ambarus wrote:
> Use NOR parameters in the probe's sequence of calls, thus
> nor->params->size instead of nor->mtd.size and let the mtd_info
> fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
> mtd_info fields should not be used during probe because we haven't
> registered mtd yet.

These changes look good to me, but there is one thing this seems to be 
missing. In xlinx.c, I see that xilinx_setup() sets nor->mtd.size. I 
think it should be updated to set nor->params->size instead otherwise 
functions like spi_nor_set_addr_width() might end up using the wrong 
value.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> v4: new patch
> 
>  drivers/mtd/spi-nor/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 88dd0908d172..5b9c827d411c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2115,7 +2115,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>  	 */
>  	op->addr.nbytes = 4;
>  	if (!spi_mem_supports_op(nor->spimem, op)) {
> -		if (nor->mtd.size > SZ_16M)
> +		if (nor->params->size > SZ_16M)
>  			return -EOPNOTSUPP;
>  
>  		/* If flash size <= 16MB, 3 address bytes are sufficient */
> @@ -3011,7 +3011,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>  		nor->addr_width = 3;
>  	}
>  
> -	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
> +	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
>  		/* enable 4-byte addressing if the device exceeds 16MiB */
>  		nor->addr_width = 4;
>  	}
> @@ -3245,7 +3245,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>  				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
>  				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
>  		.offset = 0,
> -		.length = nor->mtd.size,
> +		.length = nor->params->size,
>  	};
>  	struct spi_mem_op *op = &info.op_tmpl;
>  
> @@ -3276,7 +3276,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
>  				      SPI_MEM_OP_NO_DUMMY,
>  				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
>  		.offset = 0,
> -		.length = nor->mtd.size,
> +		.length = nor->params->size,
>  	};
>  	struct spi_mem_op *op = &info.op_tmpl;
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
