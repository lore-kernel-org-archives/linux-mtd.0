Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0JjQ-0006w4-P2
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 02:50:53 +0000
Received: by mail-pf0-x243.google.com with SMTP id i85so2724787pfa.0
 for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2016 19:50:31 -0700 (PDT)
Date: Fri, 28 Oct 2016 19:50:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PULL v2] mtd: nand: Fixes for 4.9-rc3
Message-ID: <20161029025027.GA124299@google.com>
References: <20161028102649.7b90e308@bbrezillon>
 <f88ccae7-58f2-d86d-200a-0cf8cf642cc7@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f88ccae7-58f2-d86d-200a-0cf8cf642cc7@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris and Marek,

On Fri, Oct 28, 2016 at 10:25:34PM +0200, Marek Vasut wrote:
> On 10/28/2016 10:26 AM, Boris Brezillon wrote:
> > Here is the PR I was mentioning yesterday.
> > As usual, let me know if you find something weird in this PR, and I'll
> > fix it.
> > 
> > Thanks,
> > 
> > Boris
> > 
> > The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69:
> > 
> >   Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git@github.com:linux-nand/linux.git tags/nand/fixes-for-4.9-rc3
> > 
> > for you to fetch changes up to 8ff0513bdcdd71e84aa561cce216675d43fb41b8:
> > 
> >   mtd: mtk: avoid warning in mtk_ecc_encode (2016-10-28 10:21:23 +0200)
> > 
> > ----------------------------------------------------------------
> > Three simple fixes:
> > 
> > - the first one is fixing a non-critical bug in the gpmi driver
> > - the second one is fixing a bug in the 'automatic NAND timings
> >   selection' feature introduced in 4.9-rc1
> > - the last one is fixing a false positive uninitialized-var warning
> > 
> > ----------------------------------------------------------------
> > Arnd Bergmann (1):
> >       mtd: mtk: avoid warning in mtk_ecc_encode
> > 
> > Boris Brezillon (1):
> >       mtd: nand: Fix data interface configuration logic
> > 
> > Fabio Estevam (1):
> >       mtd: nand: gpmi: disable the clocks on errors
> > 
> >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c |  6 ++++--
> >  drivers/mtd/nand/mtk_ecc.c            | 19 +++++++++----------
> >  drivers/mtd/nand/nand_base.c          | 60 ++++++++++++++++++++++++++++++++++++++++++------------------
> >  include/linux/mtd/nand.h              |  2 +-
> >  4 files changed, 56 insertions(+), 31 deletions(-)

Looks good, thanks.

> I saw all those patches, so:
> 
> Acked-by: Marek Vasut <marex@denx.de>

Thanks!

Pulled into linux-mtd.git.

Brian
