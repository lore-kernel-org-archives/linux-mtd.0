Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHr54-00062X-VN
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 14:02:48 +0000
Date: Wed, 31 Oct 2018 15:02:25 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bbanghj.park@gmail.com
Subject: Re: [PATCH] mtd: change len type from signed to unsigned type
Message-ID: <20181031150225.175ec1d4@bbrezillon>
In-Reply-To: <1535013819-1646-1-git-send-email-huijin.park@samsung.com>
References: <CGME20180823084348eucas1p2157ab1089290298cf43647e522b8be4f@eucas1p2.samsung.com>
 <1535013819-1646-1-git-send-email-huijin.park@samsung.com>
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

Hi Huijin,

On Thu, 23 Aug 2018 04:43:39 -0400
Huijin Park <huijin.park@samsung.com> wrote:

> From: "huijin.park" <huijin.park@samsung.com>
> 
> assign of a signed value which has type 'int' to a variable of
> a bigger unsigned integer type 'uint64_t'.

Why are you mentioning u64? AFAICT, the len passed to erase_write() is
always an unsigned int.

> this is ok most of the time, but can lead to unexpectedly large
> resulting value if the original signed value is negative.
> in addtion, the callers of the erase_write() pass the len parameter

  ^In addition,

> as unsigned type.
> 
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> ---
>  drivers/mtd/mtdblock.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index a5b1933..b2d5ed1 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -56,7 +56,7 @@ struct mtdblk_dev {
>   */
>  
>  static int erase_write (struct mtd_info *mtd, unsigned long pos,
> -			int len, const char *buf)
> +			unsigned int len, const char *buf)

The diff looks good, but the commit message is not clear at all. Can
you reword it?

Thanks,

Boris

>  {
>  	struct erase_info erase;
>  	size_t retlen;
