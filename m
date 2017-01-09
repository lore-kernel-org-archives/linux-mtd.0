Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQX2r-0008OS-Bz
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:19:19 +0000
Date: Mon, 9 Jan 2017 11:18:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Bastian Stender <bst@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: partitions: no unnecessary check for erase block
Message-ID: <20170109111855.7580f007@bbrezillon>
In-Reply-To: <20170106162624.544-1-bst@pengutronix.de>
References: <20170106162624.544-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri,  6 Jan 2017 17:26:24 +0100
Bastian Stender <bst@pengutronix.de> wrote:

> Partitions must start/end on erase block or boundary to be writeable.
> This makes only sense if erasing is necessary. Do not force the
> partition to be read-only if MTD_NO_ERASE flag is set.

Shouldn't the partition be aligned on ->writesize in this case?

> 
> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
>  drivers/mtd/mtdpart.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index fccdd49bb964..cd138023ed32 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -557,6 +557,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  	}
>  
>  	if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +	    !(slave->mtd.flags & MTD_NO_ERASE) &&
>  	    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
>  		/* Doesn't start on a boundary of major erase size */
>  		/* FIXME: Let it be writable if it is on a boundary of
> @@ -566,6 +567,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  			part->name);
>  	}
>  	if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +	    !(slave->mtd.flags & MTD_NO_ERASE) &&
>  	    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
>  		slave->mtd.flags &= ~MTD_WRITEABLE;
>  		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
