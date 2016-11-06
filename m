Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3WM9-0001bx-AF
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2016 22:56:05 +0000
Date: Sun, 6 Nov 2016 23:55:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Jingoo
 Han <jg1.han@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Graham Moore
 <grmoore@opensource.altera.com>, Stephen Boyd <stephen.boyd@linaro.org>,
 Dinh Nguyen <dinguyen@altera.com>, linux-kernel@vger.kernel.org, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: denali_dt: replace clk_disable() with
 clk_disable_unprepare()
Message-ID: <20161106235545.779797fe@bbrezillon>
In-Reply-To: <1478107264-21139-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478107264-21139-1-git-send-email-yamada.masahiro@socionext.com>
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

On Thu,  3 Nov 2016 02:21:04 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The denali_dt_probe() calls clk_disable_unprepare() in the bailout
> path, whereas denali_dt_remove calls clk_disable(), inconsistently.
> Replace the latter with clk_disable_unprepare() to make sure to
> unprepare the clock.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied.

Thanks,

Boris

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
