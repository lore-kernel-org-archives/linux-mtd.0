Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNHmu-00062a-6t
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 13:34:29 +0000
Date: Thu, 15 Nov 2018 14:34:17 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bbanghj.park@gmail.com
Subject: Re: [PATCH v2] mtd: change len type from signed to unsigned type
Message-ID: <20181115143417.4e0e7dbe@bbrezillon>
In-Reply-To: <1542258430-19885-1-git-send-email-huijin.park@samsung.com>
References: <CGME20181115050724eucas1p169b2046c03e108035199a4481a82a560@eucas1p1.samsung.com>
 <1542258430-19885-1-git-send-email-huijin.park@samsung.com>
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

On Thu, 15 Nov 2018 00:07:10 -0500
Huijin Park <huijin.park@samsung.com> wrote:

> From: "huijin.park" <huijin.park@samsung.com>
> 
> This patch casts the "len" parameter to an unsigned int.

Hm, that's not really what this patch actually. Actually it avoids the
cast from an int to an unsigned int.

> The callers of erase_write() pass the "len" parameter as unsigned int.

That's the important part here. Callers of erase_write() always pass an
unsigned int, so what you're trying to do here is avoid a cast to an
int.

> 
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> ---

You should have a changelog here.

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
>  {
>  	struct erase_info erase;
>  	size_t retlen;
