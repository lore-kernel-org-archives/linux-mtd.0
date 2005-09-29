Received: from caramon.arm.linux.org.uk ([212.18.232.186])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EL5Th-0006Oi-Gq
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 16:58:15 -0400
Date: Thu, 29 Sep 2005 21:52:52 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20050929205252.GG7684@flint.arm.linux.org.uk>
References: <20050929195205.GA30002@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050929195205.GA30002@plexity.net>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix IXP4xx MTD driver no cast warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 29, 2005 at 12:52:05PM -0700, Deepak Saxena wrote:
> Fix following warning:
> 
> drivers/mtd/maps/ixp4xx.c: In function 'ixp4xx_flash_probe':
> drivers/mtd/maps/ixp4xx.c:199: warning: assignment makes integer from
> pointer without a cast
> 
> Signed-off-by: Deepak Saxena <dsaxena@plexity.net>
> 
> diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
> --- a/drivers/mtd/maps/ixp4xx.c
> +++ b/drivers/mtd/maps/ixp4xx.c
> @@ -196,7 +196,7 @@ static int ixp4xx_flash_probe(struct dev
>  		goto Error;
>  	}
>  
> -	info->map.map_priv_1 = ioremap(dev->resource->start,
> +	info->map.map_priv_1 = (unsigned long)ioremap(dev->resource->start,

Shouldn't this be using info->map.virt instead of the old map.map_priv_1 ?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
