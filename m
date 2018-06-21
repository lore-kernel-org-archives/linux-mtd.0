Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fW7xM-0004qY-CL
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 22:21:33 +0000
Date: Fri, 22 Jun 2018 00:21:09 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: gpio_flash: add error handling for ioremap_nocache
Message-ID: <20180622002109.0cffb249@bbrezillon>
In-Reply-To: <1528773302-37265-1-git-send-email-jiazhouyang09@gmail.com>
References: <1528773302-37265-1-git-send-email-jiazhouyang09@gmail.com>
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

On Tue, 12 Jun 2018 11:15:00 +0800
Zhouyang Jia <jiazhouyang09@gmail.com> wrote:

> When ioremap_nocache fails, the lack of error-handling code may
> cause unexpected results.
> 
> This patch adds error-handling code after calling ioremap_nocache.
> 
> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index 385305e..7fbba02 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -242,6 +242,9 @@ static int gpio_flash_probe(struct platform_device *pdev)
>  	state->map.phys       = NO_XIP;
>  	state->map.map_priv_1 = (unsigned long)state;
>  
> +	if (!state->map.virt)
> +		return -ENOMEM;

Please move the test just after the ioremap_nocache() call. Also, I see
that iounmap() is never called. Probably a good opportunity to switch
to devm_ funcs.

> +
>  	platform_set_drvdata(pdev, state);
>  
>  	i = 0;
