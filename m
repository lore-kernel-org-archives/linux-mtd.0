Received: from mail-pf0-f193.google.com ([209.85.192.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbbKQ-0005Ob-4i
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 23:07:13 +0000
Received: by mail-pf0-f193.google.com with SMTP id e4so12349763pfg.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 15:06:50 -0800 (PST)
Date: Wed, 8 Feb 2017 15:05:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: Changes for 4.11
Message-ID: <20170208230547.GA117657@google.com>
References: <20170207100934.74c85386@bbrezillon>
 <ba8bb8d2-d2e2-a3ac-d452-028f2d072860@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba8bb8d2-d2e2-a3ac-d452-028f2d072860@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 07, 2017 at 10:46:21AM +0100, Marek Vasut wrote:
> On 02/07/2017 10:09 AM, Boris Brezillon wrote:
> > Hi Brian,
> > 
> > Here is a rather small PR for 4.11. No fancy things in this release, and
> > not even a single new driver (which is completely my fault since I failed
> > to review the Arasan driver in time :-().
> > 
> > As usual, let me know if I did something wrong.
> > 
> > Marek, Richard, Cyrille, don't hesitate to point any patches I may have
> > missed.
> 
> >From my side, the PR looks fine. If I find something missing, I will
> yell. Thanks
> 
> > Thanks,
> > 
> > Boris
> > 
> > The following changes since commit 566cf877a1fcb6d6dc0126b076aad062054c2637:
> > 
> >   Linux 4.10-rc6 (2017-01-29 14:25:17 -0800)
> > 
> > are available in the git repository at:
> > 
> >   git@github.com:linux-nand/linux.git tags/nand/for-4.11
> > 
> > for you to fetch changes up to a4077ce5871304f8a78f80b74b18b6052a410f1a:
> > 
> >   mtd: nand: Add Winbond manufacturer id (2017-02-06 11:42:43 +0100)
> > 
> > ----------------------------------------------------------------
> > This pull request contains minor fixes/improvements on existing drivers:
> > - sunxi: avoid busy-waiting for NAND events
> > - ifc: fix ECC handling on IFC v1.0
> > - OX820: add explicit dependency on ARCH_OXNAS in Kconfig
> > - core: add a new manufacture ID and fix a kernel-doc warning
> > - fsmc: kill pdata support
> > - lpc32xx_slc: remove unneeded NULL check
> > 
> > ----------------------------------------------------------------

Pulled into l2-mtd.git. Thanks!

There was a trivial conflict in nand.h, in the kerneldoc, due to
recently-applied changes.

Brian
