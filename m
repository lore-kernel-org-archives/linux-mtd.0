MIME-Version: 1.0
In-Reply-To: <1417980062-25151-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417980062-25151-2-git-send-email-Julia.Lawall@lip6.fr>
Date: Sun, 7 Dec 2014 23:48:26 +0100
Message-ID: <CAFLxGvyiqxQ6U6p-A-JW8Nv8OvXFGsna93afUu-Gek0EV3gATA@mail.gmail.com>
Subject: Re: [PATCH 1/20] mtd: s3c2410: fix misspelling of current function in
 string
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=UTF-8
Cc: linux-samsung-soc@vger.kernel.org,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 linux@rasmusvillemoes.dk, LKML <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Joe Perches <joe@perches.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 7, 2014 at 8:20 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Replace a misspelled function name by %s and then __func__.
>
> s3c2410 is the name of the file, but using the exact function name should
> make it easier to connect the error message to the code.
>
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
> The semantic patch is difficult to summarize, but is available in the cover
> letter of this patch series.
>
>  drivers/mtd/nand/s3c2410.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 35aef5e..0a9c41f 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -948,7 +948,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
>
>         cpu_type = platform_get_device_id(pdev)->driver_data;
>
> -       pr_debug("s3c2410_nand_probe(%p)\n", pdev);
> +       pr_debug("%s(%p)\n", __func__, pdev);

I think we can drop the line completely.
We have ftrace to trace function calls...

-- 
Thanks,
//richard
