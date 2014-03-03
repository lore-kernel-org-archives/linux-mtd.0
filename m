Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKGdT-0007TO-Vs
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 00:21:37 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1U001SQ3N6W590@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 09:21:07 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Dinh Nguyen' <dinguyen@altera.com>
References: <17863671.112301393204091097.JavaMail.weblogic@epml01>
 <1393604458.26059.1.camel@linux-builds1>
In-reply-to: <1393604458.26059.1.camel@linux-builds1>
Subject: Re: [PATCH 1/2] mtd: denali_dt: Use devm_ioremap_resource()
Date: Mon, 03 Mar 2014 09:21:06 +0900
Message-id: <007901cf3676$77f3c920$67db5b60$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Lars-Peter Clausen' <lars@metafoo.de>, 'Jingoo Han' <jg1.han@samsung.com>,
 'Thierry Reding' <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, March 01, 2014 1:21 AM, Dinh Nguyen wrote:
> On Mon, 2014-02-24 at 01:08 +0000, Jingoo Han wrote:
> > On Sunday, February 23, 2014 11:20 AM, Brian Norris wrote:
> > > On Wed, Feb 12, 2014 at 11:29:42AM +0900, Jingoo Han wrote:
> > > > Use devm_ioremap_resource() in order to make the code
> > > > simpler, and remove redundant return value check of
> > > > platform_get_resource_byname() because the value is
> > > > checked by devm_ioremap_resource().
> > > >
> > > > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > > > ---
> > > >  drivers/mtd/nand/denali_dt.c |   39 ++++++++-------------------------------
> > > >  1 file changed, 8 insertions(+), 31 deletions(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> > > > index babb02c..35cb17f 100644
> > > > --- a/drivers/mtd/nand/denali_dt.c
> > > > +++ b/drivers/mtd/nand/denali_dt.c
> > > > @@ -30,24 +30,6 @@ struct denali_dt {
> > > >  	struct clk		*clk;
> > > >  };
> > > >
> > > > -static void __iomem *request_and_map(struct device *dev,
> > > > -				     const struct resource *res)
> > > > -{
> > > > -	void __iomem *ptr;
> > > > -
> > > > -	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> > > > -				     "denali-dt")) {
> > > > -		dev_err(dev, "unable to request %s\n", res->name);
> > > > -		return NULL;
> > > > -	}
> > > > -
> > > > -	ptr = devm_ioremap_nocache(dev, res->start, resource_size(res));
> > >
> > > Your code here is not a direct replacement; Dinh originally used the
> > > _nocache variant of ioremap, but you are replacing it with the standard
> > > one. There is no difference between the two on several ARCH's, but I
> > > can't guarantee that your patch is safe without confirmation/testing. So
> > > I will not take this without an Ack or Tested-by from someone
> > > knowledgeable about denali.
> >
> 
> Sorry that it took a while to get around to this. But I was able to test
> the patch and it looks fine.
> 
> Tested-by: Dinh Nguyen <dinguyen@altera.com>

Hi Dinh Nguyen,

I really appreciate your tested-by. :-)
Thank you a lot.

Best regards,
Jingoo Han

> 
> Thanks,
> Dinh
> > (+cc Lars-Peter Clausen, Thierry Reding)
> >
> > According to the comment of devm_ioremap_resource(),
> > 'devm_ioremap_resource()' ioremaps it either as cacheable or
> > as non-cacheable memory depending on the resource's flags
> > Thus, devm_ioremap_nocache() will be called automatically.
> >
> > ./lib/devres.c
> > void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res)
> > {
> > 	....
> >
> > 	if (res->flags & IORESOURCE_CACHEABLE)
> > 		dest_ptr = devm_ioremap(dev, res->start, size);
> > 	else
> > 		dest_ptr = devm_ioremap_nocache(dev, res->start, size);
> >
> > Best regards,
> > Jingoo Han
