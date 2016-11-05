Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2vWM-0003vH-3W
 for linux-mtd@lists.infradead.org; Sat, 05 Nov 2016 07:36:12 +0000
Received: by mail-wm0-x244.google.com with SMTP id 68so7148764wmz.2
 for <linux-mtd@lists.infradead.org>; Sat, 05 Nov 2016 00:35:51 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: denali_dt: replace clk_disable() with
 clk_disable_unprepare()
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478107264-21139-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Boyd <stephen.boyd@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Sachin Kamat <sachin.kamat@linaro.org>, Richard Weinberger <richard@nod.at>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@altera.com>,
 Graham Moore <grmoore@opensource.altera.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4681438f-9c76-8f41-10fb-47a948b71a1a@gmail.com>
Date: Sat, 5 Nov 2016 08:26:36 +0100
MIME-Version: 1.0
In-Reply-To: <1478107264-21139-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/02/2016 06:21 PM, Masahiro Yamada wrote:
> The denali_dt_probe() calls clk_disable_unprepare() in the bailout
> path, whereas denali_dt_remove calls clk_disable(), inconsistently.
> Replace the latter with clk_disable_unprepare() to make sure to
> unprepare the clock.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali_dt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index 0cb1e8d..f821dc1 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -110,7 +110,7 @@ static int denali_dt_remove(struct platform_device *ofdev)
>  	struct denali_dt *dt = platform_get_drvdata(ofdev);
>  
>  	denali_remove(&dt->denali);
> -	clk_disable(dt->clk);
> +	clk_disable_unprepare(dt->clk);
>  
>  	return 0;
>  }
> 


-- 
Best regards,
Marek Vasut
