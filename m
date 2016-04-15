Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar6Tg-0002J1-Mw
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 16:20:26 +0000
Date: Fri, 15 Apr 2016 09:19:51 -0700
From: Tony Lindgren <tony@atomide.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Roger Quadros <rogerq@ti.com>, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/17] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20160415161950.GT5995@atomide.com>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
 <20160413212500.GD5995@atomide.com> <5710B58C.7050108@ti.com>
 <20160415120942.3131eac1@bbrezillon> <5710C86A.9060108@ti.com>
 <20160415135108.63716f06@bbrezillon>
 <20160415154139.GS5995@atomide.com>
 <20160415180531.15d790d2@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160415180531.15d790d2@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Boris Brezillon <boris.brezillon@free-electrons.com> [160415 09:06]:
> On Fri, 15 Apr 2016 08:41:40 -0700
> Tony Lindgren <tony@atomide.com> wrote:
> > Well the rules are that if something agreed to be immutable, then
> > it will never get redone. And the immutable branch should be based
> > on the absolute minimal set of patches against some earlier tag,
> > usually -rc1 is a good one. This avoids other tree to need to pull
> > in a huge amount of changes from other trees just to avoid merge
> > conflicts.
> 
> How would you do it in this particular case. Say I have to provide you
> with an immutable branch, it should only contain Roger's patches, right?

Well ideally it would be just minimal NAND related changes
branch against v4.6-rc1. Then if Roger has a dependency to
that, Roger can pull it in.

Then Roger would make a branch for the GPMC changes against
your minimal NAND branch.

Then if there were non-trivial merge conflicts, I could pull
in Roger's GPMC branch as needed.

But in this case, it seems you can just merge everything via
the NAND tree and problem solved.

> But this also means this immutable branch has to be pulled into my
> nand/next branch before all other changes touching the same set of
> files, which in turn means that I'll have to rebase and push -f my
> nand/next branch (which I'd like to avoid).

Yeah let's not do rebases, there should be no need for it.

> Or should I just pull this immutable branch in my current nand/next and
> let you pull the same immutable branch in omap-soc. I mean, would this
> prevent conflicts when our branches are merged into linux-next, no
> matter the order.

Ideally just one or more branches with just minimal changes in
them against -rc1. But you may have other dependencies in
your NAND tree so that may no longer be doable :) Usually if
I merge something that may need to get merged into other
branches, I just apply them into a separate branch against -rc1
to start with, then merge that branch in.

Regards,

Tony
