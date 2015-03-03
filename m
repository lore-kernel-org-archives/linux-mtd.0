Date: Tue, 3 Mar 2015 12:18:46 +0200
From: Baruch Siach <baruch@tkos.co.il>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Switch FIFO draining to jiffies-based
 timeout
Message-ID: <20150303101846.GO15668@tarshish>
References: <1425376529-1860-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425376529-1860-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Boris Brezillon <boris@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Maxime,

On Tue, Mar 03, 2015 at 10:55:29AM +0100, Maxime Ripard wrote:
> Now that the driver handles the FIFO draining in a threaded interrupt, we can
> base our timeout on jiffies and sleeping, instead of using mdelay.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 3f09f2e9aeb4..1eb957c347cd 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -496,16 +496,15 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>  		while (len > 8) {
>  			__raw_readsl(info->mmio_base + NDDB, data, 8);
>  
> -			for (timeout = 0;
> -			     !(nand_readl(info, NDSR) & NDSR_RDDREQ);
> -			     timeout++) {
> -				if (timeout >= 5) {
> +			timeout = jiffies + msecs_to_jiffies(5);
> +			while (!(nand_readl(info, NDSR) & NDSR_RDDREQ)) {
> +				if (!time_before(jiffies, timeout)) {
>  					dev_err(&info->pdev->dev,
>  						"Timeout on RDDREQ while draining the FIFO\n");
>  					return;
>  				}
>  
> -				mdelay(1);
> +				msleep(1);
>  			}

You may want to consider using readl_relaxed_poll_timeout() from 
linux/iopoll.h, which was introduced in v4.0-rc1.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
