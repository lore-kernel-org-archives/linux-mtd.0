Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJlbW-00008l-AA
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 20:03:56 +0000
Date: Fri, 18 May 2018 22:03:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 043/102] mtd: spi-nor: stm32-quadspi: explicitly request
 exclusive reset control
Message-ID: <20180518220332.37da2602@bbrezillon>
In-Reply-To: <20170719152646.25903-44-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
 <20170719152646.25903-44-p.zabel@pengutronix.de>
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

On Wed, 19 Jul 2017 17:25:47 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
> reset lines") started to transition the reset control request API calls
> to explicitly state whether the driver needs exclusive or shared reset
> control behavior. Convert all drivers requesting exclusive resets to the
> explicit API call so the temporary transition helpers can be removed.
> 
> No functional changes.
> 
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Queued to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/stm32-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 86c0931543c53..a367c56deb3cc 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -633,7 +633,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	rstc = devm_reset_control_get(dev, NULL);
> +	rstc = devm_reset_control_get_exclusive(dev, NULL);
>  	if (!IS_ERR(rstc)) {
>  		reset_control_assert(rstc);
>  		udelay(2);



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
