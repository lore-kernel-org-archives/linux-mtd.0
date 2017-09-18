Date: Mon, 18 Sep 2017 12:14:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Brian Norris <computersforpeace@gmail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@lists.tuxfamily.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] mtd: oxnas_nand: Fix error handling in oxnas_nand_probe()
Message-ID: <20170918121409.03e4b978@bbrezillon>
In-Reply-To: <1504908038-26285-1-git-send-email-khoroshilov@ispras.ru>
References: <1504908038-26285-1-git-send-email-khoroshilov@ispras.ru>
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

Hi Alexey,

On Sat,  9 Sep 2017 01:00:38 +0300
Alexey Khoroshilov <khoroshilov@ispras.ru> wrote:

> oxnas_nand_probe() does not disable clock on error paths.
> The patch adds disabling using devm interface.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> ---
>  drivers/mtd/nand/oxnas_nand.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
> index 1b207aac840c..8abc69a285dd 100644
> --- a/drivers/mtd/nand/oxnas_nand.c
> +++ b/drivers/mtd/nand/oxnas_nand.c
> @@ -103,16 +103,26 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	if (IS_ERR(oxnas->io_base))
>  		return PTR_ERR(oxnas->io_base);
>  
> -	oxnas->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(oxnas->clk))
> -		oxnas->clk = NULL;
> -
>  	/* Only a single chip node is supported */
>  	count = of_get_child_count(np);
>  	if (count > 1)
>  		return -EINVAL;
>  
> -	clk_prepare_enable(oxnas->clk);
> +	oxnas->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(oxnas->clk)) {
> +		oxnas->clk = NULL;
> +	} else {
> +		err = clk_prepare_enable(oxnas->clk);
> +		if (err)
> +			return err;
> +
> +		err = devm_add_action_or_reset(&pdev->dev,
> +				(void(*)(void *))clk_disable_unprepare,
> +				oxnas->clk);
> +		if (err)
> +			return err;
> +	}
> +

Looks like something that should be made available at the CCF level
either with a devm_clk_get_prepare_enable() or with a
devm_clk_prepare_enable() helper. Would you care proposing this change
to the CCF ML?

In the meantime can you provide a simpler fix that just adds the
missing clk_disable_unprepare() call in the error path?

>  	device_reset_optional(&pdev->dev);
>  
>  	for_each_child_of_node(np, nand_np) {
> @@ -167,8 +177,6 @@ static int oxnas_nand_remove(struct platform_device *pdev)
>  	if (oxnas->chips[0])
>  		nand_release(nand_to_mtd(oxnas->chips[0]));
>  
> -	clk_disable_unprepare(oxnas->clk);
> -
>  	return 0;
>  }
>  
