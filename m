Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WShGY-0004Nq-FA
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 06:24:49 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so1453637pdb.28
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 23:24:25 -0700 (PDT)
Date: Tue, 25 Mar 2014 23:24:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/2] mtd: denali_dt: Use devm_ioremap_resource()
Message-ID: <20140326062419.GY31517@norris-Latitude-E6410>
References: <17863671.112301393204091097.JavaMail.weblogic@epml01>
 <1393604458.26059.1.camel@linux-builds1>
 <007901cf3676$77f3c920$67db5b60$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007901cf3676$77f3c920$67db5b60$%han@samsung.com>
Cc: 'Thierry Reding' <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 'Lars-Peter Clausen' <lars@metafoo.de>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Dinh Nguyen' <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 03, 2014 at 09:21:06AM +0900, Jingoo Han wrote:
> On Saturday, March 01, 2014 1:21 AM, Dinh Nguyen wrote:
> > On Mon, 2014-02-24 at 01:08 +0000, Jingoo Han wrote:
> > > On Sunday, February 23, 2014 11:20 AM, Brian Norris wrote:
> > > > Your code here is not a direct replacement; Dinh originally used the
> > > > _nocache variant of ioremap, but you are replacing it with the standard
> > > > one. There is no difference between the two on several ARCH's, but I
> > > > can't guarantee that your patch is safe without confirmation/testing. So
> > > > I will not take this without an Ack or Tested-by from someone
> > > > knowledgeable about denali.
> > 
> > Sorry that it took a while to get around to this. But I was able to test
> > the patch and it looks fine.
> > 
> > Tested-by: Dinh Nguyen <dinguyen@altera.com>
> 
> I really appreciate your tested-by. :-)
> Thank you a lot.

Yes, thanks Dinh!

> > > According to the comment of devm_ioremap_resource(),
> > > 'devm_ioremap_resource()' ioremaps it either as cacheable or
> > > as non-cacheable memory depending on the resource's flags
> > > Thus, devm_ioremap_nocache() will be called automatically.

I see. Thanks for pointing that out. Pushed to l2-mtd.git!

Brian
