Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtgCT-0001jE-3s
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 03:35:41 -0400
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J1A00KRTYF2G3@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 16:35:26 +0900 (KST)
Received: from hyoklinux ([168.219.193.142])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0J1A00B1FYF1YK@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 16:35:26 +0900 (KST)
Date: Fri, 23 Jun 2006 16:35:40 +0900
From: "Hyok S. Choi" <hyok.choi@samsung.com>
Subject: [RFC] arm : ALIGNMENT_TRAP and MTD
To: linux-mtd@lists.infradead.org
Message-id: <200606231635.40655.hyok.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear MTD folks,

In ARM arch, we're merging my uClinux/ARM tree into mainline.
While merging a certain CPU support codes, we found a bit doubt on the
conditional including of MTD configuration file in arch/arm/Kconfig.
The CPU core has no H/W based alignment mechanism, thus can not handle unaligned access.
However as many uClinux archs do, many of the platforms had supported MTD drivers.

Currently, _only_ ARM arch includes MTD configuration file conditionally as follows:

if ALIGNMENT_TRAP
source "drivers/mtd/Kconfig"
endif

All the other archs includes the config w/o any condition.

To support the CPU core which has no H/W alignment,
the condition should be changed to somewhat strange :

if ALIGNMENT_TRAP || CPU_HAS_NO_CP15
source "drivers/mtd/Kconfig"
endif

Currently only one platform (ARCH_EBSA110) is the out of the condition
of above if condition.

What would be the best condition? or just no condition?
I think just including w/o any condition could be clear. :-)

On Wednesday 21 June 2006 20:32, Hyok S. Choi wrote:
> On Wednesday 21 June 2006 19:42, Uwe Zeisberger wrote:
> > >   However, the mtd drivers has been used for those CPUs.
> > >   the drivers/mtd/Kconfig could be included if CPU_HAS_NO_CP15 in
> > >   arch/arm/Kconfig.
> > > 
> > >   if ALIGNMENT_TRAP || CPU_HAS_NO_CP15
> > >   source "drivers/mtd/Kconfig"
> > >   endif
> > I disbelieve this is the right fix.  Either the mtd drivers have
> > alignment problems or not.  So in the first case it's not save if you
> > have no alignment trap, be it on a processor with or without cp15.  In
> > the latter case the complete if ALIGNMENT_TRAP should be removed.
>   See below.
> 
> > >   Anyway, is this really needed to be blocked if ALIGNMENT_TRAP is not
> > >   enabled?
> > There are (or may be) some drivers, that don't pay attention to only
> > make aligned accesses.  I'd prefer if the individual drivers would be
> > marked and not all mtd drivers together.  For me the AMDSTD driver seems
> > to work.
> I agree. That's why I commented as above. In general, every other
> architectures including uClinux archs just includes mtd configuration
> w/o any condition.
> Currently the ALIGNMENT_TRAP is disabled only for ARCH_EBSA110.

-- 
Hyok
ARM Linux 2.6 MPU/noMMU Project http://opensrc.sec.samsung.com/
