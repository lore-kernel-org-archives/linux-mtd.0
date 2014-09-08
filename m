Received: from relay5-d.mail.gandi.net ([2001:4b98:c:538::197])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQuMk-000512-7E
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 08:32:03 +0000
Date: Mon, 8 Sep 2014 01:30:57 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 5/7] mtd: denali: remove a set-but-unused variable
Message-ID: <20140908083057.GB5361@thin>
References: <1410163813-31783-1-git-send-email-yamada.m@jp.panasonic.com>
 <1410163813-31783-6-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410163813-31783-6-git-send-email-yamada.m@jp.panasonic.com>
Cc: Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 Rashika Kheria <rashika.kheria@gmail.com>, linux-mtd@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 08, 2014 at 05:10:11PM +0900, Masahiro Yamada wrote:
> The variable "retry" in wait_for_irq() is set, but not referenced.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Sure enough.

Reviewed-by: Josh Triplett <josh@joshtriplett.org>

> 
>  drivers/mtd/nand/denali.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 259ca0ba..d37c2e1 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -697,7 +697,6 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
>  {
>  	unsigned long comp_res;
>  	uint32_t intr_status;
> -	bool retry = false;
>  	unsigned long timeout = msecs_to_jiffies(1000);
>  
>  	do {
> @@ -717,7 +716,6 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
>  			 * need to wait again
>  			 */
>  			spin_unlock_irq(&denali->irq_lock);
> -			retry = true;
>  		}
>  	} while (comp_res != 0);
>  
> -- 
> 1.9.1
> 
