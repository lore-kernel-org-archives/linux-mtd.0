Received: from mail-yb0-x243.google.com ([2607:f8b0:4002:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmAr5-00069T-UG
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 02:32:20 +0000
Received: by mail-yb0-x243.google.com with SMTP id p81so48178ybb.2
 for <linux-mtd@lists.infradead.org>; Mon, 19 Sep 2016 19:31:59 -0700 (PDT)
Date: Mon, 19 Sep 2016 23:31:49 -0300
From: Sergio Prado <sergio.prado@e-labworks.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, kgene@kernel.org, k.kozlowski@samsung.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: s3c2410: add device tree support
Message-ID: <20160920023149.GC11294@n1>
References: <CGME20160917152404eucas1p2ca0ebfe59dd762f5cdd611a9dd3cd1a5@eucas1p2.samsung.com>
 <1474125760-28168-1-git-send-email-sergio.prado@e-labworks.com>
 <f8907616-0d6b-37ef-1419-f6aedf3ddbdc@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8907616-0d6b-37ef-1419-f6aedf3ddbdc@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 19, 2016 at 12:44:07PM +0200, Sylwester Nawrocki wrote:
> On 09/17/2016 05:22 PM, Sergio Prado wrote:
> > +static int s3c24xx_nand_probe_dt(struct platform_device *pdev)
> > +{
> > +	const struct s3c24XX_nand_devtype_data *devtype_data;
> > +	struct s3c2410_platform_nand *pdata;
> > +	struct s3c2410_nand_info *info = platform_get_drvdata(pdev);
> > +	struct device_node *np = pdev->dev.of_node, *child;
> > +	const struct of_device_id *of_id;
> > +	struct s3c2410_nand_set *sets;
> > +
> > +	of_id = of_match_device(s3c24xx_nand_dt_ids, &pdev->dev);
> > +	if (!of_id)
> > +		return 1;
> > +
> > +	devtype_data = of_id->data;
> 
> You could make it a bit simpler with of_device_get_match_data().

I wasn't aware of this interface. I'll use it. Thanks!

> 
> --
> Thanks,
> Sylwester

-- 
Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420
