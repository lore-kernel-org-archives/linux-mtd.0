Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDs7B-0004gq-MQ
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 12:11:27 +0000
Date: Mon, 5 Dec 2016 13:10:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 john@phrozen.org, cyrille.pitchen@atmel.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH] mtd: nand: xway: fix build undefined MODULE_DEVICE_TABLE()
Message-ID: <20161205131059.45fafdf6@bbrezillon>
In-Reply-To: <eb0b0e63-6c77-8192-adf9-14fdf83aabba@hauke-m.de>
References: <20161130225110.10759-1-hauke@hauke-m.de>
 <20161201133627.38953fb0@bbrezillon>
 <eb0b0e63-6c77-8192-adf9-14fdf83aabba@hauke-m.de>
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

On Sun, 4 Dec 2016 23:40:56 +0100
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> On 12/01/2016 01:36 PM, Boris Brezillon wrote:
> > Hi Hauke,
> > 
> > On Wed, 30 Nov 2016 23:51:10 +0100
> > Hauke Mehrtens <hauke@hauke-m.de> wrote:
> >   
> >> The header file with the definition of MODULE_DEVICE_TABLE() was
> >> missing, add include for linux/module.h to fix the problem in 4.9.  
> > 
> > I tried to enable this driver as a module, and the build failed because
> > of a missing symbol (see the following patch).
> > Now, if it's not supposed to be compiled as a module, then you should
> > modify the Kconfig accordingly.
> > 
> > Regards,
> > 
> > Boris
> >   
> > --->8---  
> > diff --git a/arch/mips/lantiq/xway/sysctrl.c
> > b/arch/mips/lantiq/xway/sysctrl.c index 236193b5210b..29e753556597
> > 100644 --- a/arch/mips/lantiq/xway/sysctrl.c
> > +++ b/arch/mips/lantiq/xway/sysctrl.c
> > @@ -156,6 +156,7 @@ static void __iomem *pmu_membase;
> >  static void __iomem *ltq_xbar_membase;
> >  void __iomem *ltq_cgu_membase;
> >  void __iomem *ltq_ebu_membase;
> > +EXPORT_SYMBOL(ltq_ebu_membase);
> >  
> >  static u32 ifccr = CGU_IFCCR;
> >  static u32 pcicr = CGU_PCICR;
> >   
> 
> Also module_platform_driver() needs linux/module.h, because it contains
> module_init() and some more stuff.

You should use builtin_platform_driver() and not
module_platform_driver().

> 
> I would like to add the include for linux/module.h and deactivate module
> support. It looks like it was possible to select module building since
> it was added, but it should never have worked.
> 
> Hauke
