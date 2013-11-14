Date: Thu, 14 Nov 2013 20:15:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 00/14] Armada 370/XP NAND support
Message-ID: <20131114231528.GA9793@localhost>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131114230436.GV9468@ld-irv-0074.broadcom.com>
 <20131114230540.GW9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131114230540.GW9468@ld-irv-0074.broadcom.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 03:05:40PM -0800, Brian Norris wrote:
> + Daniel (missed the CC)
> 
> On Thu, Nov 14, 2013 at 03:04:36PM -0800, Brian Norris wrote:
> > On Thu, Nov 14, 2013 at 06:25:25PM -0300, Ezequiel Garcia wrote:
> > > * Changes from v4
> > > 
> > >   * Rebased on top of l2-mtd.git origin/next branch
> > > 
> > >   * Fixed is_ready flag reset, renamed by a more descriptive
> > >     and readble "need_wait".
> > > 
> > 
> > ...
> > 
> > I think this series is now good as-is. Pushing to l2-mtd.git/next.
> > Thanks for the efforts! I can submit my extra diff from patch 12 as a
> > separate patch for review.
> > 
> > Do you have any available regression tests? Or was there somebody else
> > we could run this by for some Tested-by's? Daniel Mack, perhaps?
> 
> Brian

Yes, if Daniel (or anybody else) can push a Tested-by, that's better because
he's a "third-party" tester.

Other than that, since I could solve my PXA board issues I can now test PXA
non-DMA and DMA. I must thank the Compulab guys for that.

And of course, I'll test my Armada 370 and Armada XP boxes.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
