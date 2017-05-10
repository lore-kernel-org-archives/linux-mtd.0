Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8OSz-0001OM-CP
 for linux-mtd@lists.infradead.org; Wed, 10 May 2017 10:03:35 +0000
Received: from player788.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 429384FA25
 for <linux-mtd@lists.infradead.org>; Wed, 10 May 2017 12:03:09 +0200 (CEST)
Subject: Re: [PATCH v2] mtd: spi-nor: Potential oops on error path in
 quad_enable()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20170505053356.vcgboleyqigluhc3@mwanda>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1bc9d422-734b-8520-8e25-510ce9253f6f@wedev4u.fr>
Date: Wed, 10 May 2017 12:03:01 +0200
MIME-Version: 1.0
In-Reply-To: <20170505053356.vcgboleyqigluhc3@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 05/05/2017 à 07:33, Dan Carpenter a écrit :
> Before commit cff959958832 ("mtd: spi-nor: introduce SPI 1-2-2 and SPI
> 1-4-4 protocols") then we treated 1 as -EINVAL in the caller but after
> that commit we changed to propagate the return.  My static checker
> complains that it's eventually passed to an ERR_PTR() and later
> dereferenced, but I'm not totally certain if that's true.  Regardless,
> returning 1 is wrong.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to the github/spi-nor tree.

Thanks!
> ---
> v2: Propogate the error code from spi_nor_wait_till_ready() instead of
>     just returning -EINVAL
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 060a59e716be..eef55b597ec7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1389,8 +1389,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  
>  	write_sr(nor, val | SR_QUAD_EN_MX);
>  
> -	if (spi_nor_wait_till_ready(nor))
> -		return 1;
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
>  
>  	ret = read_sr(nor);
>  	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
> 
