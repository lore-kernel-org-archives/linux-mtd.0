From: Arnd Bergmann <arnd@arndb.de>
To: "Uwe =?iso-8859-15?q?Kleine-K=F6nig?=" <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] new helper to define common struct resource constructs
Date: Tue, 12 Jul 2011 15:29:17 +0200
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107072304.05626.arnd@arndb.de>
	<E1QgHeh-0004k8-2m@octopus.hi.pengutronix.de>
In-Reply-To: <E1QgHeh-0004k8-2m@octopus.hi.pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 8bit
Message-Id: <201107121529.17611.arnd@arndb.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Wolfram Sang <w.sang@pengutronix.de>,
	linux-kernel@vger.kernel.org, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 11 July 2011, Uwe Kleine-König wrote:
> resource definitions that just define start, end and flags = IORESOURCE_MEM
> or IORESOURCE_IRQ (with start=end) are quite common. So introduce a shortcut
> for them. Also make available a macro to specify named resources of both
> types which are less common.
> 
> Signed-off-by: Uwe Kleine-KÃ¶nig <u.kleine-koenig@pengutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

What do others think, is this worthwhile?
Should we also define macros for IORESOURCE_IO and IORESOURCE_DMA?

	Arnd
