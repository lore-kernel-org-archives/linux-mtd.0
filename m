Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exfkm-0005v6-LT
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 21:22:14 +0000
Date: Sun, 18 Mar 2018 22:21:46 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Antonio Cardace <anto.cardace@gmail.com>
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] mtd: st_spi_fsm: use %*ph to print small buffer
Message-ID: <20180318222146.25423c5d@bbrezillon>
In-Reply-To: <20180212184130.10238-1-anto.cardace@gmail.com>
References: <20180212184130.10238-1-anto.cardace@gmail.com>
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

On Mon, 12 Feb 2018 18:41:30 +0000
Antonio Cardace <anto.cardace@gmail.com> wrote:

> Use %*ph format to print small buffer as hex string.

Applied.

Thanks,

Boris

> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Antonio Cardace <anto.cardace@gmail.com>
> ---
>  drivers/mtd/devices/st_spi_fsm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> index 7bc29d725200..a33f5fd6818c 100644
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -1868,8 +1868,7 @@ static struct flash_info *stfsm_jedec_probe(struct stfsm *fsm)
>  	 */
>  	ext_jedec = id[3] << 8  | id[4];
>  
> -	dev_dbg(fsm->dev, "JEDEC =  0x%08x [%02x %02x %02x %02x %02x]\n",
> -		jedec, id[0], id[1], id[2], id[3], id[4]);
> +	dev_dbg(fsm->dev, "JEDEC =  0x%08x [%5ph]\n", jedec, id);
>  
>  	for (info = flash_types; info->name; info++) {
>  		if (info->jedec_id == jedec) {



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
