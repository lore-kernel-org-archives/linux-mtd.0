Received: from lilly.ping.de ([83.97.42.2])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN7IL-0007YE-O9
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 17:13:42 +0000
Date: Mon, 29 Nov 2010 18:02:23 +0100
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS oops after remount ro
Message-ID: <20101129170223.GF23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
	<1290785057.2552.14.camel@localhost>
	<20101129131807.GB23237@leila.ping.de>
	<1291040469.2141.10.camel@koala>
	<20101129151729.GE23237@leila.ping.de>
	<1291049157.2141.17.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291049157.2141.17.camel@koala>
From: wolfgang@leila.ping.de (Wolfgang Wegner)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Mon, Nov 29, 2010 at 06:45:57PM +0200, Artem Bityutskiy wrote:
> 
> I cannot judge for sure, but this looks like non-UBIFS issue in 2.6.32,
> so merging the stable 2.6.32.X tree can help. I make sense in general to
> merge stable tree as well.

the problem is I still have some "marvell" tree
(from git.marvell.com/orion.git) and am not sure if there is anything
special in it.

Would the "stock" 2.6.35.x from
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
be an option in your opinion, too? I seem to remember the marvell tree
was completely merged in between (right now digging through the commits
to make it clear), so I could get an all shiny, new kernel when having
to do any kind of merge at all...

Regards,
Wolfgang
