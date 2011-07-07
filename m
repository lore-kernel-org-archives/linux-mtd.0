Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QevVI-0004ie-Ar
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 20:48:58 +0000
Date: Thu, 7 Jul 2011 22:48:33 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: reply: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support
	for?imx23/imx28
Message-ID: <20110707204833.GL29624@pengutronix.de>
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107011109.27206.arnd@arndb.de> <4E1574A1.4050502@freescale.com>
	<201107071757.23405.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201107071757.23405.arnd@arndb.de>
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

On Thu, Jul 07, 2011 at 05:57:23PM +0200, Arnd Bergmann wrote:
> On Thursday 07 July 2011, Huang Shijie wrote:
> > > On Friday 01 July 2011 10:57:40 Huang Shijie wrote:
> > >>>> It's annoying, but it really saves some lines.
> > >>> It would save more lines if you introduce the macros globally and
> > >>> convert all existing resource definitions ;-)
> > >> The origin code did not use any macros.
> > >> Some one suggested me to use macros.
> > >> So i used the macros.
> > >>
> > >> Do i have to drop the macros?
> > > Can you find out who made the suggestion? Let's first reach consensus
> > > about how we want to do these things in the future.
> > http://www.spinics.net/lists/arm-kernel/msg121384.html
> > 
> 
> Ok, so Uwe made a rather generic comment that he'd prefer you to use
> macros for that part. I think your original code actually looks cleaner
> in this case, mostly because it doesn't obfuscate the identifiers
> and because the macro is specific to this file.
> 
> Uwe, do you think it's worthwhile introducing a global macro for
> everyone to use for defining resources? Clearly this is not an
> mxs specific problem, and I'd much rather have the same solution
> everywhere.
The thing I didn't like in the original code is that there are two
nearly identical data definitions. With the macros introduced here
(one example to ease the discussion:

	#define RES_MEM(soc, _id, _s, _n)				\
		{							\
			.start = soc ##_## _id ## _BASE_ADDR,		\
			.end   = soc ##_## _id ## _BASE_ADDR + (_s) - 1,\
			.name  = (_n),					\
			.flags = IORESOURCE_MEM,			\
		}

)

My thoughts on this is that it should better go to where struct resource
is defined (<linux/ioports.h>, as Arndt suggested) but then probably a
bit more generic as:

	#define RES_MEM_NAMED(_start, _end, _name)			\
		{							\
			.start = _start,				\
			.end = _end,					\
			.name = _name,					\
			.flags = IORESOURCE_MEM,			\
		}
	#define RES_MEM(_start, _end)					\
		RES_MEM_NAMED(_start, _end, NULL)

(Maybe alternatively take a _size parameter instead of _end?)
While this makes the repetition shorter, it's still there.

I thought this could be shrinked down to

	const struct resource res_imx23[] __initconst = something_magic(MX23);
	const struct resource res_imx28[] __initconst = something_magic(MX28);

While this part looks nice, I agree that it's not as easy to understand
(for a human) as the expanded version. Knowing not everybody agrees with
me, I still prefer the shrinked representation.
But as I'm not willing to argue about that: Please use the expanded version
if you prefer it.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
