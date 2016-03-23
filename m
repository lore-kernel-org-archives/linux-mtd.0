Date: Wed, 23 Mar 2016 09:26:15 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
Message-ID: <20160323092615.1450363a@bbrezillon>
In-Reply-To: <56F1E378.3000107@linaro.org>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322175850.2722c389@bbrezillon> <56F1E378.3000107@linaro.org>
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

On Tue, 22 Mar 2016 20:29:44 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> On 03/22/2016 12:58 PM, Boris Brezillon wrote:
> >> +
> >> > +static struct sdg1_ecc_if *sdg1_ecc_get(struct device_node *np)
> >> > +{
> >> > +	struct platform_device *pdev;
> >> > +	struct sdg1_ecc *ecc;
> >> > +
> >> > +	pdev = of_find_device_by_node(np);
> >> > +	if (!pdev || !platform_get_drvdata(pdev))
> >> > +		return ERR_PTR(-EPROBE_DEFER);
> >> > +
> >> > +	get_device(&pdev->dev);
> >> > +	ecc = platform_get_drvdata(pdev);
> >> > +
> >> > +	clk_prepare_enable(ecc->clk);
> >> > +	ecc->dev = &pdev->dev;
> > ecc->dev should be assigned in ->probe().
> >
> 
> fyi this was just copied verbatim from

Yep, I noticed the jz4780 driver was doing the same. Maybe you can send
a patch to fix it (in general, dev <-> priv data association is done at
proble time).

> 
> static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
> {
>     struct platform_device *pdev;
>     struct jz4780_bch *bch;
> 
>     pdev = of_find_device_by_node(np);
>     if (!pdev || !platform_get_drvdata(pdev))
>         return ERR_PTR(-EPROBE_DEFER);
> 
>     get_device(&pdev->dev);
> 
>     bch = platform_get_drvdata(pdev);
>     clk_prepare_enable(bch->clk);
> 
>     bch->dev = &pdev->dev;
>     return bch;
> }



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
