Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJjeX-0004Rd-Vf
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 15:17:36 +0000
Date: Thu, 14 Jan 2016 16:17:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: nand: remove EXPORT_SYMBOL of nand_scan_bbt()
Message-ID: <20160114161700.477715cb@bbrezillon>
In-Reply-To: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
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

Hi Thomas,

On Thu, 14 Jan 2016 15:44:49 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Since commit 17799359e7b3fa6ef4f2bf926cd6821cf7903ecf ("mtd: nand_bbt:
> make nand_scan_bbt() static"), the nand_scan_bbt() function is marked
> as static but is still exported using EXPORT_SYMBOL(), which doesn't
> make much sense.
> 
> This commit gets rid of the useless EXPORT_SYMBOL.

Hehe, I noticed this useless EXPORT_SYMBOL while reviewing the BBT
rework, just forgot to post the patch removing it.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_bbt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index b1d4f81..4dfaf93 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -1373,5 +1373,3 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
>  
>  	return ret;
>  }
> -
> -EXPORT_SYMBOL(nand_scan_bbt);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
