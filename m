Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bADJi-0001Ph-EI
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 09:28:58 +0000
Date: Tue, 7 Jun 2016 11:28:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, john@phrozen.org
Subject: Re: [PATCH 2/6] MTD: xway: fix invalid operator
Message-ID: <20160607112826.25daf140@bbrezillon>
In-Reply-To: <1465161609-19303-3-git-send-email-hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
 <1465161609-19303-3-git-send-email-hauke@hauke-m.de>
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

On Sun,  5 Jun 2016 23:20:05 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> From: John Crispin <john@phrozen.org>
> 
> xway_read_byte should use a logic or and not an add operator when
> working out the NAND address. The NAND address bits are used to
> activate the pins to the NAND flash.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index ccac19c..0ab6e83 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -134,7 +134,7 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
>  	int ret;
>  
>  	spin_lock_irqsave(&ebu_lock, flags);
> -	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
> +	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));

It's doing exactly the same, isn't it? What's the rationale behind this
change?

>  	spin_unlock_irqrestore(&ebu_lock, flags);
>  
>  	return ret;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
