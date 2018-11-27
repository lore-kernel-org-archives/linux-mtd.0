Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRYdz-0005dV-OT
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 08:22:57 +0000
Date: Tue, 27 Nov 2018 09:22:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "stable@vger.kernel.org" <stable@vger.kernel.org>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Message-ID: <20181127092232.3a6d1661@bbrezillon>
In-Reply-To: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
References: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
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

On Tue, 27 Nov 2018 07:44:52 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> Fix the size of the buffer allocated to store the in-memory BBT.
> This bug was previously hidden by a different bug, that was fixed in
> d098093ba06e.

Oops :-/.

> 
> Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND devices")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/mtd/nand/bbt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
> index 56cde38..c12497f 100644
> --- a/drivers/mtd/nand/bbt.c
> +++ b/drivers/mtd/nand/bbt.c
> @@ -27,7 +27,8 @@ int nanddev_bbt_init(struct nand_device *nand)
>  	unsigned int nwords = DIV_ROUND_UP(nblocks * bits_per_block,
>  					   BITS_PER_LONG);
>  
> -	nand->bbt.cache = kzalloc(nwords, GFP_KERNEL);
> +	nand->bbt.cache = kzalloc(nwords * (BITS_PER_LONG / BITS_PER_BYTE),

I prefer

					 * sizeof(*nand->bbt.cache)
If you're okay with this change, I'll fix it when applying (no need to
send a new version).

Thanks,

Boris

> +				  GFP_KERNEL);
>  	if (!nand->bbt.cache)
>  		return -ENOMEM;
>  
