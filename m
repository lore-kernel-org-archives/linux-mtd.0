Subject: Re: [PATCH] pxa3xx_nand: fix time calculation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1254907903-11797-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1254907903-11797-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 15:51:15 +0300
Message-Id: <1255265475.16942.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: eric.y.miao@gmail.com, mreimer@vpop.net, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-07 at 11:31 +0200, Enrico Scholz wrote:
> Use DIV_ROUND_UP to calculate number of clocks.  Else, calculated clocks
> are nearly always to low and for times < 10ns, they will be negative on
> PXA320  (which has a nand clock of 104 MHz).
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 6ea520a..32cb4d1 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -316,7 +316,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
>  #define tAR_NDTR1(r)	(((r) >> 0) & 0xf)
>  
>  /* convert nano-seconds to nand flash controller clock cycles */
> -#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)
> +#define ns2cycle(ns, clk)	(int)(DIV_ROUND_UP((ns) * (clk / 1000000), 1000) - 1)

Why there is -1 at the end?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
