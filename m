Date: Sat, 7 Oct 2017 07:49:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Robert
 Jarzmik <robert.jarzmik@free.fr>, arm@kernel.org
Subject: Re: [PATCH] ARM: pxa: cm-x255: Fix up GPIO NAND device name in table
Message-ID: <20171007074939.516ae693@bbrezillon>
In-Reply-To: <20171006215144.18039-1-linus.walleij@linaro.org>
References: <20171006215144.18039-1-linus.walleij@linaro.org>
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

On Fri,  6 Oct 2017 23:51:44 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> My patch set the device name wrong because I confused the
> device name for a partition name. Sorry.
> 
> Cc: arm@kernel.org
> Fixes: ("mtd: nand: gpio: Convert to use GPIO descriptors")
> Reported-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This can be squashed into the commit or applied on top
> as a fix. The original patch was ACKed by the ARM SoC
> maintainers so I believe this is fine to apply.
> ---
>  arch/arm/mach-pxa/cm-x255.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-pxa/cm-x255.c b/arch/arm/mach-pxa/cm-x255.c
> index f8d67acb7194..fa8e7dd4d898 100644
> --- a/arch/arm/mach-pxa/cm-x255.c
> +++ b/arch/arm/mach-pxa/cm-x255.c
> @@ -178,7 +178,7 @@ static inline void cmx255_init_nor(void) {}
>  #if defined(CONFIG_MTD_NAND_GPIO) || defined(CONFIG_MTD_NAND_GPIO_MODULE)
>  
>  static struct gpiod_lookup_table cmx255_nand_gpiod_table = {
> -	.dev_id         = "cmx255-nand",
> +	.dev_id         = "gpio-nand",

Are you sure it works? AFAIR, you have to set "<driver-name>.<dev-id>"
here, which, assuming there's only one gpio-nand dev, would give

	.dev_id		= "gpio-nand.0",

Regards,

Boris

>  	.table          = {
>  		GPIO_LOOKUP("gpio-pxa", GPIO_NAND_CS, "nce", GPIO_ACTIVE_HIGH),
>  		GPIO_LOOKUP("gpio-pxa", GPIO_NAND_CLE, "cle", GPIO_ACTIVE_HIGH),
