Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emkIx-0006fT-CX
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 18:00:17 +0000
Received: by mail-pl0-x244.google.com with SMTP id s13so2069823plq.6
 for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2018 10:00:04 -0800 (PST)
Message-ID: <1518803997.4697.5.camel@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH NAND 0/5] Replace printk
 statements with pr_*macros
From: Shreeya Patel <shreeya.patel23498@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Richard Weinberger
 <richard@nod.at>,  David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>,  outreachy-kernel
 <outreachy-kernel@googlegroups.com>, linux-mtd@lists.infradead.org
Date: Fri, 16 Feb 2018 23:29:57 +0530
In-Reply-To: <20180216184840.096e534c@bbrezillon>
References: <cover.1518797480.git.shreeya.patel23498@gmail.com>
 <CAAEAJfAg_hei2PF37_oX2tf+Mv43ye-nEOt+KRVFerp1Jfzn2Q@mail.gmail.com>
 <alpine.DEB.2.20.1802161822560.4340@hadrien>
 <CAAEAJfAtvm5bii9eyUnYmU=tQCOvE_hPk0eBJQ1vwgogbGYr-A@mail.gmail.com>
 <20180216184840.096e534c@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-02-16 at 18:48 +0100, Boris Brezillon wrote:
> On Fri, 16 Feb 2018 14:26:56 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> 
> > 
> > On 16 February 2018 at 14:23, Julia Lawall <julia.lawall@lip6.fr>
> > wrote:
> > > 
> > > 
> > > 
> > > On Fri, 16 Feb 2018, Ezequiel Garcia wrote:
> > >  
> > > > 
> > > > Hi Shreeya,
> > > > 
> > > > Thanks for the contribution.
> > > > 
> > > > On 16 February 2018 at 13:50, Shreeya Patel
> > > > <shreeya.patel23498@gmail.com> wrote:  
> > > > > 
> > > > > This patchset removes all the log levels i.e. KERN_WARN,
> > > > > KERN_NOTICE, KERN_ERR, KERN_INFO, KERN_DEBUG used in the
> > > > > printk
> > > > > statements and replaces the printk statements with
> > > > > appropriate
> > > > > pr_*macros.
> > > > > According to the kernel coding style, pr_*macro is the
> > > > > preferred
> > > > > way to print the message.
> > > > >  
> > > > So, two things to begin with.
> > > > 
> > > > First of all, despite this contribution being part of
> > > > outreachy,
> > > > I believe you can include mailing lists in your case.
> > > > 
> > > > In other words, don't use the "nol" option in get_maintainer
> > > > script and Cc the MTD mailing list: linux-mtd at
> > > > lists.infradead.org.  
> > > Shouldn't the dev_* functions also be usable?
> > >  
> > Provided that:
> > 1. it's applicable, i.e. if in the context of a device.
> Yep, be careful with that. The MTD/NAND subsystem initializes
> mtd->dev.name quite late, so it's not safe to use &mtd->dev with
> dev_<loglevel>(). Note that you can use the NAND controller pdev->dev 
> if
> available.

This information is quite useful, thanks.
I'll see that what will be the best thing to use here.

> 
> > 
> > 2. Richard is not too opposed to the idea.
> > 
> > Then, yes.
> 
> 
