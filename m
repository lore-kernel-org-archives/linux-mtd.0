Subject: Re: [PATCH] mtd: cfi_cmdset_0001: Fix max timeout for locking
	operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anders =?ISO-8859-1?Q?Grafstr=F6m?= <anders.grafstrom@netinsight.net>
In-Reply-To: <4B8834FB.2070004@netinsight.net>
References: <4B8834FB.2070004@netinsight.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Apr 2010 15:14:03 +0300
Message-ID: <1270124043.15073.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-26 at 21:54 +0100, Anders Grafström wrote:
> The max timeout is currently too short for some flash chips.
> This patch increases it to 10 seconds. The typical timeout
> remains unchanged (the tick period, 1000000/HZ).
> 
> Specification change #11 in '5 Volt Intel StrataFlash Memory Specification Update'
> (297848-15) specifies an increase of Clear Block Lock-Bit Time Max to 7 sec.
> This is contradicted by the table in Specification Change #8 which says .70 sec
> but a 10 sec timeout doesn't hurt so play it safe.
> 
> Signed-off-by: Anders Grafström <anders.grafstrom@netinsight.net>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 9253043..83e4ae2 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2077,7 +2077,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
>  	 */
>  	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
>  
> -	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
> +	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * HZ * 10);
>  	if (ret) {
>  		map_write(map, CMD(0x70), adr);
>  		chip->state = FL_STATUS;

Pushed to l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
