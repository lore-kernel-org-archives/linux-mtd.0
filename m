Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dc9Ho-0006ao-7N
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 11:55:02 +0000
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: atmel: Fix EDO mode check
Date: Mon, 31 Jul 2017 13:54:28 +0200
Message-ID: <4140295.E3feCPtUhy@ada>
In-Reply-To: <1501489941-7468-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501489941-7468-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Tested-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

Am Montag, 31. Juli 2017, 10:32:21 schrieb Boris Brezillon:
> EDO mode should be used when tRC is less than 30ns, but timings are
> expressed in picoseconds in the nand_sdr_timings struct.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface()
> hooks") Reported-by: Alexander Dahl <ada@thorsis.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c
> b/drivers/mtd/nand/atmel/nand-controller.c index
> d922a88e407f..2c8baa0c2c4e 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -1201,7 +1201,7 @@ static int atmel_smc_nand_prepare_smcconf(struct
> atmel_nand *nand, * tRC < 30ns implies EDO mode. This controller does
> not support this * mode.
>  	 */
> -	if (conf->timings.sdr.tRC_min < 30)
> +	if (conf->timings.sdr.tRC_min < 30000)
>  		return -ENOTSUPP;
> 
>  	atmel_smc_cs_conf_init(smcconf);
