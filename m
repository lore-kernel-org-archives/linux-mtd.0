Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bynQU-0003dr-N8
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 22:09:03 +0000
Subject: Re: [PATCH v3 1/9] mtd: spi-nor: improve macronix_quad_enable()
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
 <c63d3715903e640c7ea5328614bd4468688b761d.1477325128.git.cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-kernel@vger.kernel.org
From: Marek Vasut <marex@denx.de>
Message-ID: <74f0fa1b-3212-8a21-f966-14f153d2bf43@denx.de>
Date: Tue, 25 Oct 2016 00:00:33 +0200
MIME-Version: 1.0
In-Reply-To: <c63d3715903e640c7ea5328614bd4468688b761d.1477325128.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/24/2016 06:34 PM, Cyrille Pitchen wrote:
> The patch checks whether the Quad Enable bit is already set in the Status
> Register. If so, the function exits immediately with a successful return
> code. Otherwise, a message is now printed telling we're setting the
> non-volatile bit.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Reviewed-by: Jagan Teki <jagan@openedev.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165d7d66..5c87b2d99507 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1211,6 +1211,11 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	val = read_sr(nor);
>  	if (val < 0)
>  		return val;
> +	if (val & SR_QUAD_EN_MX)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	dev_info(nor->dev, "setting Macronix Quad Enable (non-volatile) bit\n");

Should probably be dev_dbg(), since this is just churn in the kernel
log. The user doesn't care and the developer can just up the debug level
or add his own printk .

>  	write_enable(nor);
>  
>  	write_sr(nor, val | SR_QUAD_EN_MX);
> 


-- 
Best regards,
Marek Vasut
