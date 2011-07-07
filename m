From: Arnd Bergmann <arnd@arndb.de>
To: "Uwe =?iso-8859-1?q?Kleine-K=F6nig?=" <u.kleine-koenig@pengutronix.de>
Subject: Re: reply: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support
	for?imx23/imx28
Date: Thu, 7 Jul 2011 23:04:05 +0200
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107071757.23405.arnd@arndb.de>
	<20110707204833.GL29624@pengutronix.de>
In-Reply-To: <20110707204833.GL29624@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <201107072304.05626.arnd@arndb.de>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"w.sang@pengutronix.de" <w.sang@pengutronix.de>,
	"thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	"LW@karo-electronics.de" <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 07 July 2011 22:48:33 Uwe Kleine-König wrote:
> My thoughts on this is that it should better go to where struct resource
> is defined (<linux/ioports.h>, as Arndt suggested) but then probably a
> bit more generic as:
> 
>         #define RES_MEM_NAMED(_start, _end, _name)                      \
>                 {                                                       \
>                         .start = _start,                                \
>                         .end = _end,                                    \
>                         .name = _name,                                  \
>                         .flags = IORESOURCE_MEM,                        \
>                 }
>         #define RES_MEM(_start, _end)                                   \
>                 RES_MEM_NAMED(_start, _end, NULL)
> 
> (Maybe alternatively take a _size parameter instead of _end?)
> While this makes the repetition shorter, it's still there.
> 

This sounds reasonable, and I'd also prefer the size instead of end
argument here. If you prepare a patch to do this, I can ack it for you.

	Arnd
