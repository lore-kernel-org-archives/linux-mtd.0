Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRQlo-0001zT-N4
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:03:33 +0000
Received: by mail-oa0-f50.google.com with SMTP id j1so1171294oag.23
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 11:03:11 -0700 (PDT)
Date: Wed, 2 Oct 2013 11:03:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] mtd: plat-ram: Remove casting the return value which
 is a void pointer
Message-ID: <20131002180305.GQ23337@ld-irv-0074.broadcom.com>
References: <005801cead1f$6d0af870$4720e950$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005801cead1f$6d0af870$4720e950$%han@samsung.com>
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 09, 2013 at 02:42:52PM +0900, Jingoo Han wrote:
> Casting the return value which is a void pointer is redundant.
> The conversion from void pointer to any other pointer type is
> guaranteed by the C programming language.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/mtd/maps/plat-ram.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
> index 6762716..3e35b9a 100644
> --- a/drivers/mtd/maps/plat-ram.c
> +++ b/drivers/mtd/maps/plat-ram.c
> @@ -55,7 +55,7 @@ struct platram_info {
>  
>  static inline struct platram_info *to_platram_info(struct platform_device *dev)
>  {
> -	return (struct platram_info *)platform_get_drvdata(dev);
> +	return platform_get_drvdata(dev);
>  }
>  
>  /* platram_setrw

Pushed to l2-mtd.git. Thanks!

Brian
