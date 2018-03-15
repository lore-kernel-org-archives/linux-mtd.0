Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewVSc-00066M-UD
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 16:10:56 +0000
Date: Thu, 15 Mar 2018 17:10:06 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com
Subject: Re: [PATCH 3/3] mtd: Remove print after allocation failure
Message-ID: <20180315171006.258edcca@bbrezillon>
In-Reply-To: <1521041718-32492-3-git-send-email-arushisinghal19971997@gmail.com>
References: <1521041718-32492-1-git-send-email-arushisinghal19971997@gmail.com>
 <1521041718-32492-3-git-send-email-arushisinghal19971997@gmail.com>
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

Hi Arushi,

On Wed, 14 Mar 2018 21:05:18 +0530
Arushi Singhal <arushisinghal19971997@gmail.com> wrote:

> The prints after [k|v][m|z|c]alloc() functions are not needed, because
> in case of failure, allocator will print their internal error prints
> anyway.
> 
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
>  drivers/mtd/inftlmount.c | 6 +-----

I didn't check but I'm pretty sure you missed some of them here too.

>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
> index 8d6bb189..6b94646 100644
> --- a/drivers/mtd/inftlmount.c
> +++ b/drivers/mtd/inftlmount.c
> @@ -562,12 +562,8 @@ int INFTL_mount(struct INFTLrecord *s)
>  
>  	/* Temporary buffer to store ANAC numbers. */
>  	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
> -	if (!ANACtable) {
> -		printk(KERN_WARNING "INFTL: allocation of ANACtable "
> -				"failed (%zd bytes)\n",
> -				s->nb_blocks * sizeof(u8));
> +	if (!ANACtable)
>  		return -ENOMEM;
> -	}
>  
>  	/*
>  	 * First pass is to explore each physical unit, and construct the



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
