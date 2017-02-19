Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfHZz-0004OC-D8
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2017 02:50:29 +0000
Received: by mail-ot0-x242.google.com with SMTP id l26so7892164ota.3
 for <linux-mtd@lists.infradead.org>; Sat, 18 Feb 2017 18:50:06 -0800 (PST)
Date: Sat, 18 Feb 2017 20:51:03 -0600
From: Marty Plummer <netz.kernel@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
Subject: Re: mtd: spi-nor: hisi-sfc compatibility report
Message-ID: <20170219025103.z26d3iydmzm2mrgh@tha-monstah.mydomain>
References: <20170215040646.hscl2kuc5nuvbel3@tha-monstah.mydomain>
 <e90185e2-db9e-0f1f-df44-1015f8950b36@gmail.com>
 <20170216162854.hagnxukontcgkykn@tha-monstah.mydomain>
 <77ad543d-3436-0151-c22c-23966cb6f34d@gmail.com>
 <20170219004841.qrqs3kbbtbflickw@tha-monstah.mydomain>
 <5e012080-8e31-61fa-ee59-3657c2eac5dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e012080-8e31-61fa-ee59-3657c2eac5dc@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 19, 2017 at 03:31:13AM +0100, Marek Vasut wrote:
> On 02/19/2017 01:48 AM, Marty Plummer wrote:
> > On Fri, Feb 17, 2017 at 10:28:07PM +0100, Marek Vasut wrote:
> >> Crap ... that's kinda surprising. I would've expected to see the two
> >> hisilicon contributors I see in the git log to pop up there . Can you
> >> add them and send a patch please ?
> >>
> >> -- 
> >> Best regards,
> >> Marek Vasut
> > 
> > To Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt,
> > then? Actual code needs no changes I can see, and works out of box.
> 
> To MAINTAINERS , right ? Or maybe I don't quite get what your complaint
> is all about.
> 
> > In fact, as far as I can see, it doesn't even check for
> > "hisilicon,hi3519-spi-nor" at all.
> 
> It could be it's using DT compatible with some older SoC , but yes, if
> this SoC is compatible and it is not listed in the binding document, it
> should be added.
> 
> -- 
> Best regards,
> Marek Vasut

Ok, got it. Will send a patch in the near future, and add whoever
get_maintainer.pl shows for arch/arm/mach-hisi
