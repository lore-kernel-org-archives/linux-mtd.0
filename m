Received: from residential.serv2.aus.datafoundry.com ([209.99.125.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IyVhc-0002vq-G6
	for linux-mtd@lists.infradead.org; Sat, 01 Dec 2007 17:00:36 +0000
Message-ID: <1196528423.475193277199d@www.webmail.texas.net>
Date: Sat, 01 Dec 2007 11:00:23 -0600
From: catboat@texas.net
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: dynamic mtd_blktrans_dev not fully init'd under UBI?
References: <1196456294.47507966462cb@webmail.texas.net>
	<1196501291.13978.77.camel@pmac.infradead.org>
In-Reply-To: <1196501291.13978.77.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: catboat@texas.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thanks David. 




Quoting David Woodhouse <dwmw2@infradead.org>:

> On Fri, 2007-11-30 at 14:58 -0600, catboat@texas.net wrote:
> > In the newest git, I see a mutex named "lock" instead, but 
> > I don't think it's initialized either. See the function 
> > mtdblock_add_mtd() in drivers/mtd/mtdblock.c. The struct
> > mtd_blktrans_dev is just kzalloc'd leaving the mutex lock
> > all zeroes. 
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 74d9d30..839eed8 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -248,9 +248,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>  		return -EBUSY;
>  	}
>  
> -	mutex_init(&new->lock);
>  	list_add_tail(&new->list, &tr->devs);
>   added:
> +	mutex_init(&new->lock);
>  	if (!tr->writesect)
>  		new->readonly = 1;
>  
> 
> -- 
> dwmw2
> 
> 
> 
