From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] new helper to define common struct resource constructs
Date: Wed, 13 Jul 2011 23:42:18 +0200
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107121529.17611.arnd@arndb.de>
	<20110713141849.b8cbf675.akpm@linux-foundation.org>
In-Reply-To: <20110713141849.b8cbf675.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201107132342.18648.arnd@arndb.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Wolfram Sang <w.sang@pengutronix.de>, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org, Uwe
	=?iso-8859-1?q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lothar =?iso-8859-1?q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 July 2011 23:18:49 Andrew Morton wrote:
> > On Monday 11 July 2011, Uwe Kleine-K__nig wrote:
> > > resource definitions that just define start, end and flags = IORESOURCE_MEM
> > > or IORESOURCE_IRQ (with start=end) are quite common. So introduce a shortcut
> > > for them. Also make available a macro to specify named resources of both
> > > types which are less common.
> > > 
> > > Signed-off-by: Uwe Kleine-K____nig <u.kleine-koenig@pengutronix.de>
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > What do others think, is this worthwhile?
> > Should we also define macros for IORESOURCE_IO and IORESOURCE_DMA?
> > 
> 
> It would help if we could see some usage examples (ie: sample
> conversions), to get a better idea of the value of this.

Uwe posted a patch '[PATCH] ARM: mxc: use new helpers to define
common struct resource entries' that converts one ARM platform to use
it, with reasonable outcome:

26 files changed, 72 insertions(+), 308 deletions(-)

This platform has 72 definitions of static resources, in total there
are well over 2000 such defintions in ARM alone, and the number is
growing. Some platforms have started creating their own macros for
this purpose, which is why I suggested doing it globally (or alternatively
removing the macros from these platforms if we conclude that they
are harmful).

> Also, DEFINE_RES_NAMED() is going to need a bunch of argument
> parentheses to make it bulletproof.

Right.

	Arnd
