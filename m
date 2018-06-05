Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQ6nS-0006d1-VT
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 07:54:29 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: DENALI: can't detect NAND chip
Date: Tue, 05 Jun 2018 09:54:12 +0200
Message-ID: <2579185.auXlyMyjWC@blindfold>
In-Reply-To: <20180605093627.03ee6a95@bbrezillon>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <CAK7LNARe+h_Fj5+nnpqYS4xGVLPHqgrW5g+1bckGB0+FWh9=sA@mail.gmail.com>
 <20180605093627.03ee6a95@bbrezillon>
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

Am Dienstag, 5. Juni 2018, 09:36:27 CEST schrieb Boris Brezillon:
> On Tue, 5 Jun 2018 10:43:49 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > Also in my SoCs (Socionext UniPhier),
> > 
> > clk = 50MHz,
> > clk_x = ecc_clk = 200MHz
> > 
> > 
> > 
> > In this case, the ->setup_data_interface hook
> > is interested in the frequency of [2] clk_x.
> > 
> > However, clk_x is not a core clock.
> > I admit this is confusing.

:-)

> > 
> > If we really want to make the DT-binding precise,
> > we can change the clock requirement like follows:
> > 
> > clock-names = "clk", "clk_x", "ecc_clk";
> 
> How about:
> 
> clock-names = "nand", "nand_x", "ecc";
> 
> The clk prefix/suffix is really redundant here.
> 
> > clocks = <...>, <...>, <...>;
> 
> If the IP really takes 3 different clks in input, then it should be
> represented like that.
> 
> > 
> > 
> > This might be an annoying churn, though...
> > 
> > 
> 
> I guess you're talking about backward compat with existing dtb. This
> should be a problem, and we can even fix the Richard's problem for
> those dtbs if we hardcode the nand_x_clk rate to 200Mhz when nand_x_clk
> is missing (see below).

I agree this makes sense and unbreaks existing users that upgrade their kernels.

> --->8---
> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
> index cfd33e6ca77f..91ee1ce1843a 100644
> --- a/drivers/mtd/nand/raw/denali_dt.c
> +++ b/drivers/mtd/nand/raw/denali_dt.c
> @@ -28,6 +28,8 @@
>  struct denali_dt {
>         struct denali_nand_info denali;
>         struct clk              *clk;
> +       struct clk              *x_clk;
> +       struct clk              *ecc_clk;
>  };
>  
>  struct denali_dt_data {
> @@ -114,24 +116,56 @@ static int denali_dt_probe(struct platform_device *pdev)
>         if (IS_ERR(denali->host))
>                 return PTR_ERR(denali->host);
>  
> -       dt->clk = devm_clk_get(&pdev->dev, NULL);
> +       dt->clk = devm_clk_get(&pdev->dev, "nand");
> +       if (IS_ERR(dt->clk))
> +               dt->clk = devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(dt->clk)) {
>                 dev_err(&pdev->dev, "no clk available\n");
>                 return PTR_ERR(dt->clk);
>         }
> +
> +       dt->x_clk = devm_clk_get(&pdev->dev, "nand_x");
> +       if (IS_ERR(dt->x_clk))
> +               dt->x_clk = NULL;
> +
> +       dt->ecc_clk = devm_clk_get(&pdev->dev, "ecc");
> +       if (IS_ERR(dt->ecc_clk))
> +               dt->ecc_clk = NULL;
> +
>         ret = clk_prepare_enable(dt->clk);
>         if (ret)
>                 return ret;
>  
> -       denali->clk_x_rate = clk_get_rate(dt->clk);
> +       ret = clk_prepare_enable(dt->x_clk);
> +       if (ret)
> +               goto out_disable_clk;
> +
> +       ret = clk_prepare_enable(dt->ecc_clk);
> +       if (ret)
> +               goto out_disable_x_clk;
> +
> +       /*
> +        * Hardcode clk_x_rate to 200Mhz when ->x_clk is missing, as was done
> +        * by the driver before Linux 4.13.
> +        */
> +       if (dt->x_clk)
> +               denali->clk_x_rate = clk_get_rate(dt->x_clk);
> +       else
> +               denali->clk_x_rate = 200000000;

We should emit a message when a hardcored value is used.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
