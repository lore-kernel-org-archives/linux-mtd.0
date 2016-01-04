Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGEdk-0006vF-RV
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 23:34:17 +0000
Received: by mail-pf0-x233.google.com with SMTP id e65so156523348pfe.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 15:33:56 -0800 (PST)
Date: Mon, 4 Jan 2016 15:33:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/6] MTD: lantiq: xway: fix invalid operator
Message-ID: <20160104233354.GB128501@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <1451941501-42952-2-git-send-email-blogic@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451941501-42952-2-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 10:04:56PM +0100, John Crispin wrote:
> xway_read_byte should use a logic or and not an add operator when working
> out the nand address.

Why? It looks like a typical base address + offset use case. Or am I
missing something?

It would help if there was some kind of documentation, like the missing
DT doc that I mentioned on the cover letter, so I can know what the IO
mem range is supposed to be.

> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---
>  drivers/mtd/nand/xway_nand.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 3b28db4..81ec685 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -124,7 +124,7 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
>  	int ret;
>  
>  	spin_lock_irqsave(&ebu_lock, flags);
> -	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
> +	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));

This looks like odd code anyway; why all the casting? We have:

  void __iomem * --> unsigned long --> void __iomem *

Brian

>  	spin_unlock_irqrestore(&ebu_lock, flags);
>  
>  	return ret;
> -- 
> 1.7.10.4
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
