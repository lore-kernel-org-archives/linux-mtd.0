Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dcDYV-0007Ye-TM
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 16:28:40 +0000
Date: Mon, 31 Jul 2017 18:28:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Alexander Dahl <ada@thorsis.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: atmel: Fix EDO mode check
Message-ID: <20170731182813.3ec4d72e@bbrezillon>
In-Reply-To: <1501489941-7468-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501489941-7468-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Mon, 31 Jul 2017 10:32:21 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> EDO mode should be used when tRC is less than 30ns, but timings are
> expressed in picoseconds in the nand_sdr_timings struct.

Applied to nand/fixes.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
> Reported-by: Alexander Dahl <ada@thorsis.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index d922a88e407f..2c8baa0c2c4e 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -1201,7 +1201,7 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
>  	 * tRC < 30ns implies EDO mode. This controller does not support this
>  	 * mode.
>  	 */
> -	if (conf->timings.sdr.tRC_min < 30)
> +	if (conf->timings.sdr.tRC_min < 30000)
>  		return -ENOTSUPP;
>  
>  	atmel_smc_cs_conf_init(smcconf);
