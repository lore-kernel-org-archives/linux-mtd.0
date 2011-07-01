Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcXSp-00033h-6F
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 06:44:32 +0000
Date: Fri, 1 Jul 2011 08:44:25 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: reply: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for
	imx23/imx28
Message-ID: <20110701064425.GR11559@pengutronix.de>
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107010029.51965.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201107010029.51965.arnd@arndb.de>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"w.sang@pengutronix.de" <w.sang@pengutronix.de>,
	"thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	Huang Shijie-B32955 <B32955@freescale.com>,
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

Hello,

On Fri, Jul 01, 2011 at 12:29:51AM +0200, Arnd Bergmann wrote:
> On Thursday 30 June 2011 18:12:27 Huang Shijie-B32955 wrote:
> > 
> > I think gpmi-nfc is much better then gpmi-nand or gpmi-flash.
> 
> Then how do you want to name the near field communication drivers?
I'm not aware that the i.MX23/28 has support for near field
communication, still the i.MX28 Reference speaks about "GPMI NAND Mode".
I couldn't find "NFC" in the document. So I vote for gpmi-nand, too.
(IMHO gpmi-flash is too generic.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
