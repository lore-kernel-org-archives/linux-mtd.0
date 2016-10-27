Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzmsJ-0006ht-At
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 15:45:53 +0000
Date: Thu, 27 Oct 2016 17:45:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Steve deRosier <derosier@gmail.com>
Cc: Danesh Daroui <Danesh.Daroui@ascom.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: OOB Test fails
Message-ID: <20161027174527.6003fd37@bbrezillon>
In-Reply-To: <20161027093407.53a76657@bbrezillon>
References: <39BC08CB3FF4C84CB6397533D4FC79095770D513@SEGOTEXCH02.ascom-Resource.ads>
 <CALupW3CJ_gXS+7BrZEGTF8o0H8pJ_AOw0JcKOftSVaMVSbP1zQ@mail.gmail.com>
 <20161027093407.53a76657@bbrezillon>
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

On Thu, 27 Oct 2016 09:34:07 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Steve,
> 
> On Wed, 26 Oct 2016 09:16:42 -0700
> Steve deRosier <derosier@gmail.com> wrote:
> 
> > Hi Danesh,
> > 
> > 
> > On Wed, Oct 26, 2016 at 9:07 AM, Danesh Daroui <Danesh.Daroui@ascom.com> wrote:  
> > > Hello all,
> > >
> > > I have executed MTD tests against an unmounted MTD device which uses UBIFS. All MTD tests except OOB test is passed where the OOB test fails from time to time and from device to device. I have read here:
> > >
> > > http://www.linux-mtd.infradead.org/faq/ubi.html#L_why_no_oob
> > >
> > > that UBIFS does not use OOB area. Therefore wanted to ask if failing this test does not need that there is any problem in our system (both HW and SW/configuration) and we can safely ignore the results for this test.
> > >    
> > 
> > UBIFS doesn't use the OOB area, but your MTD driver most likely does.
> > We don't want UBI or UBIFS messing with the OOB area because your
> > flash, NAND controller and the MTD driver will use that. Bad block
> > markers are set in the OOB area by the manufacturer in most NAND
> > flashes and your controller and MTD driver will store and use the bits
> > in the OOB to do error correction.
> > 
> > So, in short - the OOB area does need to function correctly.  As to if
> > and why the OOB test is or isn't working is a different issue and I
> > have no input on that.  All that depends on your mix of flash,
> > controller and driver.  

My bad, I misread your sentence. I thought you we saying "the OOB area
does *not* need to function correctly".

My apologies for this misunderstanding, it seems we're on the same page.
