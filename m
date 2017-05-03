Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d620p-00027p-V4
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 21:40:45 +0000
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 01A2F4F835
 for <linux-mtd@lists.infradead.org>; Wed,  3 May 2017 23:40:19 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: Potential oops on error path in
 quad_enable()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Huang Shijie <b32955@freescale.com>
References: <20170428130614.w4cmbwvprgzv7sky@mwanda>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <82655033-06b0-a310-07b4-1c8fa2591da2@wedev4u.fr>
Date: Wed, 3 May 2017 23:40:09 +0200
MIME-Version: 1.0
In-Reply-To: <20170428130614.w4cmbwvprgzv7sky@mwanda>
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

Hi Dan,

Le 28/04/2017 à 15:06, Dan Carpenter a écrit :
> Before commit cff959958832 ("mtd: spi-nor: introduce SPI 1-2-2 and SPI
> 1-4-4 protocols") then we treated 1 as -EINVAL in the caller but after
> that commit we changed to propagate the return.  My static checker
> complains that it's eventually passed to an ERR_PTR() and later
> dereferenced, but I'm not totally certain if that's true.  Regardless,
> returning 1 is wrong.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 060a59e716be..a05db3371ebb 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1390,7 +1390,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	write_sr(nor, val | SR_QUAD_EN_MX);
>  
>  	if (spi_nor_wait_till_ready(nor))
> -		return 1;
> +		return -EINVAL;
>

Good catch!

However, I think we could return the return code of
spi_nor_wait_till_ready() instead, like already done in
spansion_quad_enable().

Looking at the source code of spi_nor_wait_till_ready() /
spi_nor_wait_till_ready_with_timeout(), both function return 0 when
successful, a negative error code otherwise.

Best regards,

Cyrille

>  	ret = read_sr(nor);
>  	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
> 
