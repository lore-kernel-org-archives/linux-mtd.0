Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQLKO-0006W2-9G
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 20:44:05 +0000
Received: by mail-pa0-x22f.google.com with SMTP id cy9so87949416pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 12:43:43 -0800 (PST)
Date: Mon, 1 Feb 2016 12:43:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Li Yang <leoli@freescale.com>
Cc: Raghav Dogra <raghav@freescale.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, oss@buserror.net,
 prabhakar.kushwaha@nxp.com, Jaiprakash Singh <b44839@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd/ifc: Segregate IFC fcm and runtime registers
Message-ID: <20160201204339.GK19540@google.com>
References: <1454323598-5149-1-git-send-email-raghav@freescale.com>
 <1454323598-5149-3-git-send-email-raghav@freescale.com>
 <CADRPPNThvUNOtN=2PErWVfhKz_xqBmps+HyL8GTo8+D_-eKX4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRPPNThvUNOtN=2PErWVfhKz_xqBmps+HyL8GTo8+D_-eKX4Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 01, 2016 at 01:41:45PM -0600, Li Yang wrote:
> On Mon, Feb 1, 2016 at 4:46 AM, Raghav Dogra <raghav@freescale.com> wrote:
> 
> A general comment is that you should include the linux-mtd mailing
> list and it's maintainers for this set of patches.  Although the
> MAINTAINERS file doesn't specify a maintainer for drivers/memory
> directory, it should be most related to linux-mtd, IMO.

Yes, please resend.

This is especially odd, considering that it appears your resending here
is in direct response to my comments on the linux-mtd mailing list, and
neither I nor linux-mtd were CC'd on this iteration...

> > IFC has two set of registers viz FCM (Flash control machine)
> > aka global and run time registers. These set are defined in two
> > memory map PAGES. Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0
> > PAGE size is 64KB
> 
> So I guess this patch is the critical change to make the fsl_ifc
> driver work with the version 2.0 hardware block?  If so, it will be
> better to mention this in the patch title.

I made a similar comment on the 1st version. But I can't see the patch
this time :(

> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > Signed-off-by: Raghav Dogra <raghav@freescale.com>
> > ---
> >  drivers/memory/fsl_ifc.c        | 251 +++++++++++++++++++++-------------------
> >  drivers/mtd/nand/fsl_ifc_nand.c |  72 ++++++------
> >  include/linux/fsl_ifc.h         |  48 +++++---
> >  3 files changed, 203 insertions(+), 168 deletions(-)

Brian
