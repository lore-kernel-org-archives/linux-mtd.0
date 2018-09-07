Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyJt3-0000ju-QX
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 16:45:39 +0000
Date: Fri, 7 Sep 2018 09:45:24 -0700
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: rawnand: ams-delta: Cleanups and optimizations
Message-ID: <20180907164524.GH5662@atomide.com>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20180820213904.13475-1-jmkrzyszt@gmail.com>
 <20180905084757.432e7c19@xps13> <1855340.fVHtouTg44@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1855340.fVHtouTg44@z50>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [180905 20:56]:
> On Wednesday, September 5, 2018 8:47:57 AM CEST Miquel Raynal wrote:
> > Patch 2/3 does not apply on nand/next. Indeed the driver does not look
> > the same as in the diff.
> 
> That's because I built it on top of my former series from the mid of July, 
> containing "[PATCH v2 2/3 v4] mtd: rawnand: ams-delta: use GPIO lookup table". 
> It was acked by you, Miquel, and supposed to be merged via linux-omap tree.

Hmm I thought the plan was for dependencies to clear and then
merge the rest via various driver trees.. Or at least I don't have
the patch above tagged anywhere for me to merge. Then again, I
try to forget everything posted before -rc1 just to stay sane :)

> > I don't see any changes on my side that could
> > explain this so perhaps you could rebase on top of 4.19-rc2 (or
> > nand/next, as you wish) and resend the series?
> 
> As far as I can see, Tony hasn't applied that series yet, so maybe I can still 
> move that patch out of there and insert it into this series in front of the 
> other 3 patches and resend. That would however make patch 3/3 of that old 
> series depend on this one.
> 
> Tony, what do you think?

Yes please resend based on v4.19-rc1 or MTD next. If there
are still pending dependencies, please let us know and we can
set up an immutable branch against v4.19-rc1 with those for
MTD and me to merge in as needed.

Regards,

Tony
