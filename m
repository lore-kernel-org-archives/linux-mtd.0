Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD0AC4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mABdZsir4RpF1KK+Jos4iY2aLgp4nNxQrnVnGul/EA=; b=4uw15to/5DyErG
	ve6ZBSiNPj/jefaoxASF7FSx/KuVFhbfgx4rONTlYausL+CbhbmzhGYHD4OufB/LZiBZsi0YS+41g
	bpodu9XsYfH+8AkVOVs/+IY57660iJnb0xenTkgoFAmipbtsZnYROyvU86Qvl4MHflpOxaKEznEHb
	H1SK/+3A81aWWZk+Xfn80dOvi1rmvkwpsQmVpCHaJc9i8Jj9pevwzN5DKw9FArhW29oNWjz2eVP1g
	dCpOTGPf1na4lY1tO1KNMkzLcrJb/6v1jHwFZCDYX2d0NPWtBQLL8D9MrNWLiAhENG9BkGmPoepkk
	MjJQJfXzUyWpfZmPoCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmhP-005T79-Fy; Sun, 20 Nov 2022 15:57:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmhM-005SxE-ED
	for linux-mtd@lists.infradead.org; Sun, 20 Nov 2022 15:57:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C025460C7B;
	Sun, 20 Nov 2022 15:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7204C433C1;
	Sun, 20 Nov 2022 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668959855;
	bh=M8i47peUNdwHmXAe6DdSIXpOKxB8Uz7fH7KG90H/9Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmZdb2d66HgOXUPfzZRRnP3M96HFYz8kYc0BIrJTUvWZpyRkcvZ7yjlL8RTpAArQ8
	 CGCSQT3Hd1cw2OVF3Fs7xOFZt0eWa0hj3d8p1UPYe3VX02T6IFy6Z//WKF5inW2aI4
	 ux4sbHxGxanPxjKHWmiy8orORmtmv87QJ7ZwLWPTw/fRkGrOjNDLk02qsJK/Zf3Is7
	 v95rpCnHJGlboxnOEZAp13xu1rFXSi6rd+u1Vr/FPyvAl9avS+c1jluEa5I3KAImxb
	 H3jdeTOEzo+c/vIurOExy80fKYlQXMTV1zJzDlihmGfUX9/CxIkrvGz7nY4kdtqO8K
	 /0ul1ovX0E23Q==
Date: Sun, 20 Nov 2022 16:57:27 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/9] mtd: spi-nor: Create macros to define chip IDs
 and geometries
Message-ID: <20221120155727.jrqv7mtl67qh3cfe@yadavpratyush.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
 <20221110155513.819798-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110155513.819798-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_075736_587013_84E16525 
X-CRM114-Status: GOOD (  20.19  )
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

On 10/11/22 04:55PM, Miquel Raynal wrote:
> The INFO() macro defines an ID array and a couple of geometry
> properties. Right now all its lines are duplicated twice because of the
> INFO6() macro (for extended IDs) and soon as well we will need to add a
> geometry parameter to include the number of banks.
> 
> In order to limit the code duplication, let's create a number of
> intermediate macros which will facilitate defining high-level INFOX()
> macros.
> 
> There is not functional change.

I think the INFO() macros in general are a bit convoluted, but this at 
least makes them a bit better.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.h | 43 ++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 85b0cf254e97..dc74c7be3e28 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -527,33 +527,30 @@ struct flash_info {
>  	const struct spi_nor_fixups *fixups;
>  };
>  
> +#define SPI_NOR_ID_2ITEMS(_id) ((_id) >> 8) & 0xff, (_id) & 0xff
> +#define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, SPI_NOR_ID_2ITEMS(_id)
> +
> +#define SPI_NOR_ID(_jedec_id, _ext_id)					\
> +	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_2ITEMS(_ext_id) }, \
> +	.id_len = !(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))
> +
> +#define SPI_NOR_ID6(_jedec_id, _ext_id)					\
> +	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, \
> +	.id_len = 6
> +
> +#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors)			\
> +	.sector_size = (_sector_size),					\
> +	.n_sectors = (_n_sectors),					\
> +	.page_size = 256
> +
>  /* Used when the "_ext_id" is two bytes at most */
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
> -		.id = {							\
> -			((_jedec_id) >> 16) & 0xff,			\
> -			((_jedec_id) >> 8) & 0xff,			\
> -			(_jedec_id) & 0xff,				\
> -			((_ext_id) >> 8) & 0xff,			\
> -			(_ext_id) & 0xff,				\
> -			},						\
> -		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
> -		.sector_size = (_sector_size),				\
> -		.n_sectors = (_n_sectors),				\
> -		.page_size = 256,					\
> +	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
>  
>  #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
> -		.id = {							\
> -			((_jedec_id) >> 16) & 0xff,			\
> -			((_jedec_id) >> 8) & 0xff,			\
> -			(_jedec_id) & 0xff,				\
> -			((_ext_id) >> 16) & 0xff,			\
> -			((_ext_id) >> 8) & 0xff,			\
> -			(_ext_id) & 0xff,				\
> -			},						\
> -		.id_len = 6,						\
> -		.sector_size = (_sector_size),				\
> -		.n_sectors = (_n_sectors),				\
> -		.page_size = 256,					\
> +	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
>  
>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
>  		.sector_size = (_sector_size),				\
> -- 
> 2.34.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
