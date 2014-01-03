Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VytYk-0004ZK-AI
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 01:28:24 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYS00DIFXEIL050@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 10:27:54 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
 <001601cefd40$f6b3dd00$e41b9700$%han@samsung.com>
 <20140103010445.GA5631@ld-irv-0074>
In-reply-to: <20140103010445.GA5631@ld-irv-0074>
Subject: Re: [PATCH 7/8] mtd: plat_nand: Use devm_*() functions
Date: Fri, 03 Jan 2014 10:27:53 +0900
Message-id: <000501cf0823$0658bc70$130a3550$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Vitaly Wool' <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, January 03, 2014 10:18 AM, Jingoo Han wrote:
> On Fri, Dec 20, 2013 at 02:04:29PM +0900, Jingoo Han wrote:
> > --- a/drivers/mtd/nand/plat_nand.c
> > +++ b/drivers/mtd/nand/plat_nand.c
> > @@ -52,25 +52,16 @@ static int plat_nand_probe(struct platform_device *pdev)
> >  		return -ENXIO;
> >
> >  	/* Allocate memory for the device structure (and zero it) */
> > -	data = kzalloc(sizeof(struct plat_nand_data), GFP_KERNEL);
> > +	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
> > +			    GFP_KERNEL);
> >  	if (!data) {
> >  		dev_err(&pdev->dev, "failed to allocate device structure.\n");
> >  		return -ENOMEM;
> >  	}
> >
> > -	if (!request_mem_region(res->start, resource_size(res),
> > -				dev_name(&pdev->dev))) {
> > -		dev_err(&pdev->dev, "request_mem_region failed\n");
> > -		err = -EBUSY;
> > -		goto out_free;
> > -	}
> > -
> > -	data->io_base = ioremap(res->start, resource_size(res));
> > -	if (data->io_base == NULL) {
> > -		dev_err(&pdev->dev, "ioremap failed\n");
> > -		err = -EIO;
> > -		goto out_release_io;
> > -	}
> > +	data->io_base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(data->io_base))
> > +		return PTR_ERR(data->io_base);
> 
> This gives me a few errors:
> 
> drivers/mtd/nand/plat_nand.c: In function 'plat_nand_probe':
> drivers/mtd/nand/plat_nand.c:61:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-
> function-declaration]
> drivers/mtd/nand/plat_nand.c:62:3: error: implicit declaration of function 'PTR_ERR' [-
> Werror=implicit-function-declaration]
> make[4]: *** [drivers/mtd/nand/plat_nand.o] Error 1
> 
> You probably need to #include <linux/err.h>. I guess you don't
> compile-test your changes? It would help if you can catch these mistakes
> before they get to the maintainer.

Hi Norris,

I did compile all patches. However, I cannot understand why the build
error happens. Anyway, I will check it and add '#include <linux/err.h'
if needed.

Thank you for your comment. :-)
Happy new year!

Best regards,
Jingoo Han
