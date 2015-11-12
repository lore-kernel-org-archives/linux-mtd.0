Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwncX-0007JZ-PF
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:52:42 +0000
Date: Thu, 12 Nov 2015 09:52:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: zero out mtd_partion struct before using it
Message-ID: <20151112095219.666e32c2@bbrezillon>
In-Reply-To: <1447289272-131828-1-git-send-email-computersforpeace@gmail.com>
References: <1447289272-131828-1-git-send-email-computersforpeace@gmail.com>
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

On Wed, 11 Nov 2015 16:47:52 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> It's easier to guarantee we've cleared out all unused fields with
> memset() than by manually initializing each field.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> I hit this while testing out the added 'of_node' field:
> 
>   http://patchwork.ozlabs.org/patch/538838/
> 
>  drivers/mtd/mtdpart.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index c2b6e967a160..3ace53342fd2 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -597,11 +597,10 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>  	if (length <= 0)
>  		return -EINVAL;
>  
> +	memset(&part, 0, sizeof(part));
>  	part.name = name;
>  	part.size = length;
>  	part.offset = offset;
> -	part.mask_flags = 0;
> -	part.ecclayout = NULL;
>  
>  	new = allocate_partition(master, &part, -1, offset);
>  	if (IS_ERR(new))



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
