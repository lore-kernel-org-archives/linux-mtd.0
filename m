Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvzhJ-00021y-8m
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 01:25:15 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE00A1J3X6WS90@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 10:24:42 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
 <001001cefd55$aa828110$ff878330$%han@samsung.com>
 <20131220153816.GA14450@localhost>
In-reply-to: <20131220153816.GA14450@localhost>
Subject: Re: [PATCH V2 3/8] mtd: lantiq-flash: Use devm_kzalloc()
Date: Thu, 26 Dec 2013 10:24:41 +0900
Message-id: <007801cf01d9$40165490$c042fdb0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>,
 'Thomas Langer' <thomas.langer@lantiq.com>, linux-mtd@lists.infradead.org,
 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'John Crispin' <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, December 21, 2013 12:38 AM, Ezequiel Garcia wrote:
> On Fri, Dec 20, 2013 at 04:32:41PM +0900, Jingoo Han wrote:
> > Use devm_kzalloc() to make cleanup paths simpler.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> > Change since v1
> > - Remove unnecessary goto labels.
> >
> >  drivers/mtd/maps/lantiq-flash.c |   31 ++++++++++---------------------
> >  1 file changed, 10 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
> > index d7ac65d..45a7ac7 100644
> > --- a/drivers/mtd/maps/lantiq-flash.c
> > +++ b/drivers/mtd/maps/lantiq-flash.c
> > @@ -123,24 +123,22 @@ ltq_mtd_probe(struct platform_device *pdev)
> >  		return -ENODEV;
> >  	}
> >
> > -	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
> > +	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);
> 
> And you don't check if the allocation succeded?
> 
> >  	platform_set_drvdata(pdev, ltq_mtd);
> >
> >  	ltq_mtd->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	if (!ltq_mtd->res) {
> >  		dev_err(&pdev->dev, "failed to get memory resource\n");
> > -		err = -ENOENT;
> > -		goto err_out;
> > +		return -ENOENT;
> >  	}
> >
> > -	ltq_mtd->map = kzalloc(sizeof(struct map_info), GFP_KERNEL);
> > +	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
> > +				    GFP_KERNEL);
> 
> Ditto.
> 
> I think that's a far more urgent fix, than moving to devm_kzalloc.


OK, I see.
Although I think that checking return value can be sent as
another patch, I will add this to the next v3 patch.

Thank you for your comment.

Best regards,
Jingoo Han
