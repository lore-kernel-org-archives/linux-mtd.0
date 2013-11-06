Date: Wed, 6 Nov 2013 06:42:44 -0500
From: Jason Cooper <jason@lakedaemon.net>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Grant Likely <grant.likely@secretlab.ca>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 25/28] ARM: mvebu: Add support for NAND controller
 in Armada 370/XP
Message-ID: <20131106114244.GC8308@titan.lakedaemon.net>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383656135-8627-26-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131105132905.GJ3060@titan.lakedaemon.net>
 <20131105135145.GA2676@localhost>
 <20131105151531.GK3060@titan.lakedaemon.net>
 <20131106092435.5f95aa55@skate>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131106092435.5f95aa55@skate>
Cc: Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

Adding Grant and Mark to the Cc to make sure they don't have buyer's
remorse ;-)

On Wed, Nov 06, 2013 at 09:24:35AM +0100, Thomas Petazzoni wrote:
> Dear Jason Cooper,
> 
> On Tue, 5 Nov 2013 10:15:31 -0500, Jason Cooper wrote:
> 
> > > And I'd rather do that in a separate patch, to avoid cluttering the poor
> > > devicetree people with an unrelated 28-piece patch :-)
> > 
> > No (really), according to Grant and Mark during the closing session, I
> > asked this specific question.  They _do_ want the entire series so they
> > can refer to the corresponding code changes if necessary.  As I stated
> > above, we can make their job easier by making the binding a separate
> > patch that is clearly marked as such.
> 
> Interesting, because I had understood exactly the opposite from the
> discussions at the ARM kernel summit. But maybe the DT folks changed
> their mind between the ARM kernel summit and the closing session of the
> kernel summit :-)

Yes, that's why I asked the question.  Mark Rutland said he wanted to
see the code changes when he was reviewing a binding.  Which is indeed
the opposite of what we had arrived at during the ARM mini-summit.

So I asked Grant (last question of the Q&A) what he wanted us to tell
the contributors.  He said (bad paraphrasing here) "I have better
filters now for finding the binding changes, so send the whole series"

As him and Mark aren't the only reviewers, I took the extra step of
saying send the DT bindings as a separate patch with it clearly
identified in the subject line...

thx,

Jason.
