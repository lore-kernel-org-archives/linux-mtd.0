Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSodP-0008Gj-Or
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 19:39:33 +0000
Date: Fri, 30 Nov 2018 20:39:06 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD))
Subject: Re: [PATCH RFC 09/15] mtd: replace **** with a hug
Message-ID: <20181130203906.1af0d88d@bbrezillon>
In-Reply-To: <20181130192737.15053-10-jarkko.sakkinen@linux.intel.com>
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
 <20181130192737.15053-10-jarkko.sakkinen@linux.intel.com>
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

On Fri, 30 Nov 2018 11:27:18 -0800
Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> In order to comply with the CoC, replace **** with a hug.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  drivers/mtd/mtd_blkdevs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index b0d44f9214b0..bdf68678fccc 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -565,7 +565,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>  	int ret;
>  
>  	/* Register the notifier if/when the first device type is
> -	   registered, to prevent the link/init ordering from fucking
> +	   registered, to prevent the link/init ordering from hugging
>  	   us over. */

Please rephrase the comment instead of this replacement.

>  	if (!blktrans_notifier.list.next)
>  		register_mtd_user(&blktrans_notifier);
