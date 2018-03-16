Received: from mga06.intel.com ([134.134.136.31])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewqDu-0007nH-6k
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2018 14:20:47 +0000
Message-ID: <1521210030.23017.15.camel@linux.intel.com>
Subject: Re: [PATCH] mtd: nftl: use %*ph to print small buffer
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Antonio Cardace <anto.cardace@gmail.com>,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org
Date: Fri, 16 Mar 2018 16:20:30 +0200
In-Reply-To: <20180213175245.17703-1-anto.cardace@gmail.com>
References: <20180213175245.17703-1-anto.cardace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2018-02-13 at 17:52 +0000, Antonio Cardace wrote:
> Use %*ph format to print small buffer as hex string.
> 

Any comments so far?

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Antonio Cardace <anto.cardace@gmail.com>
> ---
> 
>  drivers/mtd/nftlmount.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
> index 184c8fbfe465..a8bdc1455b50 100644
> --- a/drivers/mtd/nftlmount.c
> +++ b/drivers/mtd/nftlmount.c
> @@ -122,8 +122,7 @@ static int find_boot_record(struct NFTLrecord
> *nftl)
>  		if (memcmp(buf, "ANAND", 6)) {
>  			printk(KERN_NOTICE "ANAND header found at
> 0x%x in mtd%d, but went away on reread!\n",
>  			       block * nftl->EraseSize, nftl-
> >mbd.mtd->index);
> -			printk(KERN_NOTICE "New data are: %02x %02x
> %02x %02x %02x %02x\n",
> -			       buf[0], buf[1], buf[2], buf[3],
> buf[4], buf[5]);
> +			printk(KERN_NOTICE "New data are: %6ph\n",
> buf);
>  			continue;
>  		}
>  #endif

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
