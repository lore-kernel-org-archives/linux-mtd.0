From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: reply: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for
	imx23/imx28
Date: Fri, 1 Jul 2011 16:52:48 +0200
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107010029.51965.arnd@arndb.de> <4E0D8C04.6010409@freescale.com>
In-Reply-To: <4E0D8C04.6010409@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201107011652.48869.arnd@arndb.de>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"w.sang@pengutronix.de" <w.sang@pengutronix.de>,
	"thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"LW@karo-electronics.de" <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 01 July 2011, Huang Shijie wrote:
> > On Thursday 30 June 2011 18:12:27 Huang Shijie-B32955 wrote:
> >> I think gpmi-nfc is much better then gpmi-nand or gpmi-flash.
> > Then how do you want to name the near field communication drivers?
> >
> what's meaning of "near field communication" ?

See http://en.wikipedia.org/wiki/Near_field_communication

It's likely to be present in most future mobile phones. Think of it as
a combination of bluetooth and RFID (oversimplified).

	Arnd
