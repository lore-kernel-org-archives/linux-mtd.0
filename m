Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eeOdo-0000OD-80
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 17:15:18 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990395AbeAXRPCQwgMD (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 24 Jan 2018 18:15:02 +0100
Date: Wed, 24 Jan 2018 18:15:01 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH v2 2/3] devres: Add devm_ioremap_shared_resource()
Message-ID: <20180124171501.GA1043@lenoch>
References: <20180124100604.GA19593@lenoch> <20180124100754.GC19593@lenoch>
 <CAHp75VeGpj28G60L86d4FDOL1YMAoM5kcdvSC5O6iH4Xi8zfHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeGpj28G60L86d4FDOL1YMAoM5kcdvSC5O6iH4Xi8zfHg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 24, 2018 at 06:21:38PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 24, 2018 at 12:07 PM, Ladislav Michl <ladis@linux-mips.org> wrote:
> > Implement managed ioremap function for shared resources.
> 
> > +#define devm_ioremap_resource(dev, res) \
> > +       __devm_ioremap_resource(dev, res, false)
> > +#define devm_ioremap_shared_resource(dev, res) \
> > +       __devm_ioremap_resource(dev, res, true)
> > +void __iomem *__devm_ioremap_resource(struct device *dev, struct resource *res,
> > +                                     bool shared);
> 
> I would rather do the following:
> 
> _resource() ->  _resource_exclusive()
> 
> #define _resource()  _resource_exclusive()
> 
> Add _resource_shared()
> 
> And use long names below in this file whenever refer to exclusive or
> shared variant.

Two separate functions were also considered, but I was unable to find small
common implementation. If code size does not matter or you can provide a hint
to make this solution small and nice, I'll go for it.

> >  void devm_iounmap(struct device *dev, void __iomem *addr);
> >  int check_signature(const volatile void __iomem *io_addr,
> >                         const unsigned char *signature, int length);
> > +
> >  void devm_ioremap_release(struct device *dev, void *res);
> 
> This part doesn't belong to the change.
> 
> > + * When possible, use devm_ioremap_resource() or
> > + * devm_ioremap_shared_resource() instead.
> > - * Checks that a resource is a valid memory region, requests the memory
> > - * region and ioremaps it. All operations are managed and will be undone
> > - * on driver detach.
> > + * Checks that a resource is a valid memory region, eventually requests the
> > + * memory region and ioremaps it. All operations are managed and will be
> > + * undone on driver detach.
> 
> Wording is changed and no clue in commit message why.

Above will be moved to separate patch.

	ladis
