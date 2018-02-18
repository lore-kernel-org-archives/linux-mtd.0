Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enVbw-0001fy-ED
 for linux-mtd@lists.infradead.org; Sun, 18 Feb 2018 20:31:02 +0000
Received: by mail-pl0-x243.google.com with SMTP id u13so973423plq.1
 for <linux-mtd@lists.infradead.org>; Sun, 18 Feb 2018 12:30:49 -0800 (PST)
Message-ID: <1518985842.22737.1.camel@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH NAND 0/5] Replace printk
 statements with pr_*macros
From: Shreeya Patel <shreeya.patel23498@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>,  outreachy-kernel
 <outreachy-kernel@googlegroups.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 19 Feb 2018 02:00:42 +0530
In-Reply-To: <20180218210950.30fe9310@bbrezillon>
References: <cover.1518797480.git.shreeya.patel23498@gmail.com>
 <CAAEAJfAg_hei2PF37_oX2tf+Mv43ye-nEOt+KRVFerp1Jfzn2Q@mail.gmail.com>
 <alpine.DEB.2.20.1802161822560.4340@hadrien>
 <CAAEAJfAtvm5bii9eyUnYmU=tQCOvE_hPk0eBJQ1vwgogbGYr-A@mail.gmail.com>
 <20180216184840.096e534c@bbrezillon> <1518976870.2784.4.camel@gmail.com>
 <20180218191347.76f4a287@bbrezillon> <1518978365.2969.6.camel@gmail.com>
 <20180218210950.30fe9310@bbrezillon>
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

On Sun, 2018-02-18 at 21:09 +0100, Boris Brezillon wrote:
> Hi Shreeya,
> 
> Please try to keep everyone in the loop when you reply to an email.
> All
> discussions should happen publicly to keep everyone aware of the
> progress and let other developers/maintainers take part to the
> discussion if they have something to add.

I'll keep this in mind.

> 
> 
> On Sun, 18 Feb 2018 23:56:05 +0530
> Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> 
> > 
> > On Sun, 2018-02-18 at 19:13 +0100, Boris Brezillon wrote:
> > > 
> > > On Sun, 18 Feb 2018 23:31:10 +0530
> > > Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> > >   
> > > > 
> > > > 
> > > > On Fri, 2018-02-16 at 18:48 +0100, Boris Brezillon wrote:
> > > > 
> > > > Hello Sir,
> > > >   
> > > > > 
> > > > > 
> > > > > On Fri, 16 Feb 2018 14:26:56 -0300
> > > > > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> > > > >     
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > On 16 February 2018 at 14:23, Julia Lawall <julia.lawall@li
> > > > > > p6.f  
> > > > > > r>  
> > > > > > wrote:    
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On Fri, 16 Feb 2018, Ezequiel Garcia wrote:
> > > > > > >      
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Hi Shreeya,
> > > > > > > > 
> > > > > > > > Thanks for the contribution.
> > > > > > > > 
> > > > > > > > On 16 February 2018 at 13:50, Shreeya Patel
> > > > > > > > <shreeya.patel23498@gmail.com> wrote:      
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > This patchset removes all the log levels i.e.
> > > > > > > > > KERN_WARN,
> > > > > > > > > KERN_NOTICE, KERN_ERR, KERN_INFO, KERN_DEBUG used in
> > > > > > > > > the
> > > > > > > > > printk
> > > > > > > > > statements and replaces the printk statements with
> > > > > > > > > appropriate
> > > > > > > > > pr_*macros.
> > > > > > > > > According to the kernel coding style, pr_*macro is
> > > > > > > > > the
> > > > > > > > > preferred
> > > > > > > > > way to print the message.
> > > > > > > > >      
> > > > > > > > So, two things to begin with.
> > > > > > > > 
> > > > > > > > First of all, despite this contribution being part of
> > > > > > > > outreachy,
> > > > > > > > I believe you can include mailing lists in your case.
> > > > > > > > 
> > > > > > > > In other words, don't use the "nol" option in
> > > > > > > > get_maintainer
> > > > > > > > script and Cc the MTD mailing list: linux-mtd at
> > > > > > > > lists.infradead.org.      
> > > > > > > Shouldn't the dev_* functions also be usable?
> > > > > > >      
> > > > > > Provided that:
> > > > > > 1. it's applicable, i.e. if in the context of a device.    
> > > > > Yep, be careful with that. The MTD/NAND subsystem initializes
> > > > > mtd->dev.name quite late, so it's not safe to use &mtd->dev
> > > > > with
> > > > > dev_<loglevel>(). Note that you can use the NAND controller
> > > > > pdev-  
> > > > > > 
> > > > > > dev   
> > > > > if
> > > > > available.    
> > > > I would like to ask here that what will be the benefit or good
> > > > cause if
> > > > I use pdev->dev?
> > > > How is it different from others?  
> > > Well, pdev->dev is guaranteed to be properly initialized when you
> > > pass
> > > it to dev_<loglevel>(). This is not the case with mtd->dev which
> > > is
> > > initialized in mtd_device_register(), but the NAND controller
> > > driver
> > > usually does some operations on the NAND device before reaching
> > > this
> > > point (reading the ID, reading the bad block markers to determine
> > > which
> > > blocks are bad, ...).
> > >   
> > Thanks for making me understand.
> > 
> > > 
> > > Anyway, I think it's better if you first do the
> > > s/printk(KERN_<LOGLEVEL>(/pr_<loglevel>(/ replacement. Replacing
> > > pr_xxx
> > > by dev_xxx is something we can do afterwards.  
> > I've created one patch where I have replaced printk
> > with dev_* and used pdev->dev.
> Okay. pdev->dev is not always directly accessible so doing
> s/printk(KERN_<LOGLEVEL>/dev_<loglevel>(&pdev->dev, / is likely to
> cause build failures. But I guess you compile-tested the changes
> you're
> about to submit.

Yes, it wasn't directly accessible at some places.
Also, I was unable to compile ams-delta.c file.
I am working on it right now as I will have to cross compile for arm.

Thanks


> 
> Regards,
> 
> Boris
> 
> 
