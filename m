Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YupaD-00017z-0H
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 22:01:53 +0000
Received: by pacwv17 with SMTP id wv17so41309043pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 15:01:32 -0700 (PDT)
Date: Tue, 19 May 2015 15:01:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/1] [RESEND] IFC: Change IO accessor based on endianness
Message-ID: <20150519220124.GA11598@ld-irv-0074>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
 <1431438951.16357.490.camel@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431438951.16357.490.camel@freescale.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org,
 Bharat Bhushan <r65777@rhuath.am.freescale.net>, linux-mtd@lists.infradead.org,
 prabhakar@freescale.com, Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 12, 2015 at 08:55:51AM -0500, Scott Wood wrote:
> On Tue, 2015-05-12 at 03:49 -0500, Bharat Bhushan wrote:
> > From: Jaiprakash Singh <b44839@freescale.com>
> > 
> > IFC IO accressor are set at run time based
> > on IFC IP registers endianness.IFC node in
> > DTS file contains information about
> > endianness.
> > 
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > ---
> >  Tested on T1040RDB, LS2085a, LS1
> > 
> >  .../bindings/memory-controllers/fsl/ifc.txt        |    3 +
> >  drivers/memory/fsl_ifc.c                           |   43 +++-
> >  drivers/mtd/nand/fsl_ifc_nand.c                    |  258 ++++++++++----------
> >  include/linux/fsl_ifc.h                            |   50 ++++
> >  4 files changed, 213 insertions(+), 141 deletions(-)
> 
> As before,
> Acked-by: Scott Wood <scottwood@freescale.com>
> 
> This touches MTD as well as dependencies outside MTD -- which tree
> should it go through?

I haven't actually seen the patch on linux-mtd. Were we CC'd? If not,
please resend, and CC linux-mtd@lists.infradead.org. (Try
scripts/get_maintainer.pl to find the right people/lists.)

And is this the previous version?

http://lists.infradead.org/pipermail/linux-mtd/2014-November/056249.html

I don't mind either tree. I don't think fsl_ifc_nand.c will have
anything noisy in linux-mtd for this release cycle.

Brian
