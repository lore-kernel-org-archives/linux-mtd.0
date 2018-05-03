Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEB2V-0005sY-6v
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 10:00:44 +0000
Date: Thu, 3 May 2018 12:00:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: dwmw2@infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: devices: check mtd_device_register() return code
Message-ID: <20180503120027.4480765c@bbrezillon>
In-Reply-To: <20180324111820.GA1997@seema-Inspiron-15-3567>
References: <20180324111820.GA1997@seema-Inspiron-15-3567>
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

On Sat, 24 Mar 2018 16:48:20 +0530
Arushi Singhal <arushisinghal19971997@gmail.com> wrote:

Subject prefix should be "mtd: devices: st_spi_fsm: ", and it's really
about checking return code which was already propagated to the lower
layer (platform bus), but it's about making sure we disable the clk we
have previously enabled in case of failure.

BTW, I see that the clk is not disabled in ->remove(), probably
something we should fix too (in a separate patch).

> stfsm_probe() misses error handling of mtd_device_register().
> 
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
>  drivers/mtd/devices/st_spi_fsm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> index 7bc29d7..4a99a6a 100644
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -2125,7 +2125,13 @@ static int stfsm_probe(struct platform_device *pdev)
>  		(long long)fsm->mtd.size, (long long)(fsm->mtd.size >> 20),
>  		fsm->mtd.erasesize, (fsm->mtd.erasesize >> 10));
>  
> -	return mtd_device_register(&fsm->mtd, NULL, 0);
> +	ret = mtd_device_register(&fsm->mtd, NULL, 0);
> +	if (ret) {
> +		pr_err("Failed to register device\n");
> +		goto err_clk_unprepare;
> +	}
> +
> +	return 0;
>  
>  err_clk_unprepare:
>  	clk_disable_unprepare(fsm->clk);
