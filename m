Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exfm7-0006hd-Tt
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 21:23:41 +0000
Date: Sun, 18 Mar 2018 22:23:10 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Antonio Cardace <anto.cardace@gmail.com>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] mtd: nftl: use %*ph to print small buffer
Message-ID: <20180318222310.63630656@bbrezillon>
In-Reply-To: <20180213175245.17703-1-anto.cardace@gmail.com>
References: <20180213175245.17703-1-anto.cardace@gmail.com>
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

On Tue, 13 Feb 2018 17:52:45 +0000
Antonio Cardace <anto.cardace@gmail.com> wrote:

> Use %*ph format to print small buffer as hex string.

Applied.

Thanks,

Boris

> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Antonio Cardace <anto.cardace@gmail.com>
> ---
> What about this one?
> 
>  drivers/mtd/nftlmount.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
> index 184c8fbfe465..a8bdc1455b50 100644
> --- a/drivers/mtd/nftlmount.c
> +++ b/drivers/mtd/nftlmount.c
> @@ -122,8 +122,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
>  		if (memcmp(buf, "ANAND", 6)) {
>  			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but went away on reread!\n",
>  			       block * nftl->EraseSize, nftl->mbd.mtd->index);
> -			printk(KERN_NOTICE "New data are: %02x %02x %02x %02x %02x %02x\n",
> -			       buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
> +			printk(KERN_NOTICE "New data are: %6ph\n", buf);
>  			continue;
>  		}
>  #endif



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
