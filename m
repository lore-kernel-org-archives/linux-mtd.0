Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anrdr-0008M4-Pf
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 17:53:24 +0000
Received: by mail-pf0-x236.google.com with SMTP id n1so38090373pfn.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2016 10:53:03 -0700 (PDT)
Date: Wed, 6 Apr 2016 10:52:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Li Yang <leoli@freescale.com>
Cc: Scott Wood <oss@buserror.net>, Raghav Dogra <raghav.dogra@nxp.com>,
 linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Raghav Dogra <raghav@freescale.com>,
 Jaiprakash Singh <b44839@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH][v3] mtd/ifc: Add support for IFC controller version 2.0
Message-ID: <20160406175254.GC5243@localhost>
References: <1455708258-3831-1-git-send-email-raghav.dogra@nxp.com>
 <CADRPPNS1i1XgtpyiT_=rDuDXBDn=ehNY32=RKTC9hdKXhWWq8A@mail.gmail.com>
 <1455840434.2463.97.camel@buserror.net>
 <CADRPPNTauz=T9oWCeZy8G8s0vo9fmieRhn=Gd3jVqqJJEHV_ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRPPNTauz=T9oWCeZy8G8s0vo9fmieRhn=Gd3jVqqJJEHV_ag@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Mar 30, 2016 at 03:43:40PM -0500, Li Yang wrote:
> Hi Brian,
> 
> Could you help to review and pull in this patch and the Kconfig update
> after this patch(https://patchwork.ozlabs.org/patch/557389/)?  It

It's probably best for Boris to apply this now.

> stated a dependency in the notes, but actually it should be applied
> cleanly without that patch.  These patches are critical to make NAND
> mtd feature work for our new chips.
> 
> Regards,
> Leo
> 
> On Thu, Feb 18, 2016 at 6:07 PM, Scott Wood <oss@buserror.net> wrote:
> > On Thu, 2016-02-18 at 15:18 -0600, Leo Li wrote:
> >> On Wed, Feb 17, 2016 at 5:24 AM, Raghav Dogra <raghav.dogra@nxp.com> wrote:
> >> > The new IFC controller version 2.0 has a different memory map page.
> >> > Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0 PAGE size is 64KB.
> >> > This patch segregates the IFC global and runtime registers to appropriate
> >> > PAGE sizes.
> >> >
> >> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> >> > Signed-off-by: Raghav Dogra <raghav@freescale.com>
> >> > Acked-by: Li Yang <leoyang.li@nxp.com>
> >> > Signed-off-by: Raghav Dogra <raghav.dogra@nxp.com>
> >> > ---
> >> > Changes for v3: not dependent on
> >> > "drivers/memory: Add deep sleep support for IFC" patch
> >> >
> >> > Changes for v2: rebased to resolve conflicts
> >> > Applicable to git://git.infradead.org/l2-mtd.git
> >> >
> >> > This patch is dependent on "drivers/memory: Add deep sleep support for
> >> > IFC"
> >> > https://patchwork.ozlabs.org/patch/582762/
> >> > which is also applicable to git://git.infradead.org/l2-mtd.git

For the patch:

Acked-by: Brian Norris <computersforpeace@gmail.com>

> >> This patch seems to be in good shape, but the dependency is still
> >> having quite some feedback to be addressed.  Depending on it will
> >> greatly delay the time that this critical patch for LS2 to be merged.
> >> Could you remove the dependency like Scott already suggested?
> >
> > According to the changelog the dependency has been removed (it would have been
> > clearer to remove this comment as well...).
> >
> > -Scott
> >
> 
> 
> 
> -- 
> - Leo
