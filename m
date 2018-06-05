Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQ6WQ-0005EY-Ho
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 07:36:52 +0000
Date: Tue, 5 Jun 2018 09:36:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@sigma-star.at>, Philipp Rosenberger
 <p.rosenberger@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: DENALI: can't detect NAND chip
Message-ID: <20180605093627.03ee6a95@bbrezillon>
In-Reply-To: <CAK7LNARe+h_Fj5+nnpqYS4xGVLPHqgrW5g+1bckGB0+FWh9=sA@mail.gmail.com>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <20180604225117.61d2c269@bbrezillon>
 <38227338.JIUUFn9IOS@blindfold> <1864836.G720OGCVI0@blindfold>
 <CAK7LNARe+h_Fj5+nnpqYS4xGVLPHqgrW5g+1bckGB0+FWh9=sA@mail.gmail.com>
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

On Tue, 5 Jun 2018 10:43:49 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2018-06-05 7:01 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
> > Am Montag, 4. Juni 2018, 22:57:32 CEST schrieb Richard Weinberger:  
> >> Am Montag, 4. Juni 2018, 22:51:17 CEST schrieb Boris Brezillon:  
> >> > > According to the datasheet, the NAND clock rate should be 50Mhz, which is what
> >> > > is returned in both cases.
> >> > > So this does not really look invalid to me. :)  
> >> >
> >> > Did you try to put a scope on the RE or WE pin? The x2 factor looks too
> >> > perfect to be just a coincidence.  
> >>
> >> Not yet, but you are right the x2 factor is really interesting.  
> >
> > The NFC uses two clocks, nand_x_clk and nand_clk.
> > nand_clk is nand_x_clk / 4.
> > In the device tree nand_clk is referenced, and therefore used to calculate
> > the timings. So we might need to use the 200Mhz clock instead of the 50Mhz
> > for the calculation.
> >  
> 
> 
> Yes.
> 
> 
> Strictly speaking, the Denali IP takes three clocks.
> 
> [1] clk :     core clock
> [2] clk_x:    bus interface clock
> [3] ecc_clk:  for ECC engine
> 
> 
> 
> Also in my SoCs (Socionext UniPhier),
> 
> clk = 50MHz,
> clk_x = ecc_clk = 200MHz
> 
> 
> 
> In this case, the ->setup_data_interface hook
> is interested in the frequency of [2] clk_x.
> 
> However, clk_x is not a core clock.
> I admit this is confusing.
> 
> 
> If we really want to make the DT-binding precise,
> we can change the clock requirement like follows:
> 
> clock-names = "clk", "clk_x", "ecc_clk";

How about:

clock-names = "nand", "nand_x", "ecc";

The clk prefix/suffix is really redundant here.

> clocks = <...>, <...>, <...>;

If the IP really takes 3 different clks in input, then it should be
represented like that.

> 
> 
> This might be an annoying churn, though...
> 
> 

I guess you're talking about backward compat with existing dtb. This
should be a problem, and we can even fix the Richard's problem for
those dtbs if we hardcode the nand_x_clk rate to 200Mhz when nand_x_clk
is missing (see below).

--->8---
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index cfd33e6ca77f..91ee1ce1843a 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -28,6 +28,8 @@
 struct denali_dt {
        struct denali_nand_info denali;
        struct clk              *clk;
+       struct clk              *x_clk;
+       struct clk              *ecc_clk;
 };
 
 struct denali_dt_data {
@@ -114,24 +116,56 @@ static int denali_dt_probe(struct platform_device *pdev)
        if (IS_ERR(denali->host))
                return PTR_ERR(denali->host);
 
-       dt->clk = devm_clk_get(&pdev->dev, NULL);
+       dt->clk = devm_clk_get(&pdev->dev, "nand");
+       if (IS_ERR(dt->clk))
+               dt->clk = devm_clk_get(&pdev->dev, NULL);
        if (IS_ERR(dt->clk)) {
                dev_err(&pdev->dev, "no clk available\n");
                return PTR_ERR(dt->clk);
        }
+
+       dt->x_clk = devm_clk_get(&pdev->dev, "nand_x");
+       if (IS_ERR(dt->x_clk))
+               dt->x_clk = NULL;
+
+       dt->ecc_clk = devm_clk_get(&pdev->dev, "ecc");
+       if (IS_ERR(dt->ecc_clk))
+               dt->ecc_clk = NULL;
+
        ret = clk_prepare_enable(dt->clk);
        if (ret)
                return ret;
 
-       denali->clk_x_rate = clk_get_rate(dt->clk);
+       ret = clk_prepare_enable(dt->x_clk);
+       if (ret)
+               goto out_disable_clk;
+
+       ret = clk_prepare_enable(dt->ecc_clk);
+       if (ret)
+               goto out_disable_x_clk;
+
+       /*
+        * Hardcode clk_x_rate to 200Mhz when ->x_clk is missing, as was done
+        * by the driver before Linux 4.13.
+        */
+       if (dt->x_clk)
+               denali->clk_x_rate = clk_get_rate(dt->x_clk);
+       else
+               denali->clk_x_rate = 200000000;
 
        ret = denali_init(denali);
        if (ret)
-               goto out_disable_clk;
+               goto out_disable_ecc_clk;
 
        platform_set_drvdata(pdev, dt);
        return 0;
 
+out_disable_ecc_clk:
+       clk_disable_unprepare(dt->ecc_clk);
+
+out_disable_x_clk:
+       clk_disable_unprepare(dt->x_clk);
+
 out_disable_clk:
        clk_disable_unprepare(dt->clk);
 
@@ -143,6 +177,8 @@ static int denali_dt_remove(struct platform_device *pdev)
        struct denali_dt *dt = platform_get_drvdata(pdev);
 
        denali_remove(&dt->denali);
+       clk_disable_unprepare(dt->ecc_clk);
+       clk_disable_unprepare(dt->x_clk);
        clk_disable_unprepare(dt->clk);
 
        return 0;
