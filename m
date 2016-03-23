Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiWgY-0003T1-Vz
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 00:30:08 +0000
Received: by mail-qg0-x22c.google.com with SMTP id u110so232301qge.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2016 17:29:46 -0700 (PDT)
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322175850.2722c389@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56F1E378.3000107@linaro.org>
Date: Tue, 22 Mar 2016 20:29:44 -0400
MIME-Version: 1.0
In-Reply-To: <20160322175850.2722c389@bbrezillon>
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

On 03/22/2016 12:58 PM, Boris Brezillon wrote:
>> +
>> > +static struct sdg1_ecc_if *sdg1_ecc_get(struct device_node *np)
>> > +{
>> > +	struct platform_device *pdev;
>> > +	struct sdg1_ecc *ecc;
>> > +
>> > +	pdev = of_find_device_by_node(np);
>> > +	if (!pdev || !platform_get_drvdata(pdev))
>> > +		return ERR_PTR(-EPROBE_DEFER);
>> > +
>> > +	get_device(&pdev->dev);
>> > +	ecc = platform_get_drvdata(pdev);
>> > +
>> > +	clk_prepare_enable(ecc->clk);
>> > +	ecc->dev = &pdev->dev;
> ecc->dev should be assigned in ->probe().
>

fyi this was just copied verbatim from

static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
{
    struct platform_device *pdev;
    struct jz4780_bch *bch;

    pdev = of_find_device_by_node(np);
    if (!pdev || !platform_get_drvdata(pdev))
        return ERR_PTR(-EPROBE_DEFER);

    get_device(&pdev->dev);

    bch = platform_get_drvdata(pdev);
    clk_prepare_enable(bch->clk);

    bch->dev = &pdev->dev;
    return bch;
}
