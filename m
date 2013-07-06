From: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: MTD EEPROM support and driver integration
Date: Sat, 06 Jul 2013 11:18 +0200
Message-ID: <5811519.oHVuMujf0I@wuerfel>
In-Reply-To: <20130706082804.GZ2959@lukather>
References: <20130705201118.GM2959@lukather>
 <201307060033.13259.arnd@arndb.de> <20130706082804.GZ2959@lukather>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Artem Bityutskiy <dedekind1@gmail.com>, oliver@schinagl.nl,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 06 July 2013 10:28:04 Maxime Ripard wrote:
> > a) like interrupts, regs, dmas, clocks, pinctrl, reset, pwm: fixed property names
> > 
> >       regmap = <&at25 0xstart 0xlen>;
> >       regmap-names = "mac-address";
> > 
> > b) like gpio, regulator: variable property names
> > 
> >       mac-storage = <&at25 0xstart 0xlen>;
> > 
> > It's unfortunate that we already have examples of both. They are largely
> > equivalent, but the tendency is towards the first.
> 
> I don't have a strong feeling for one against another, so whatever works
> best. Both solutions will be a huge improvement anyway 
> 
> Just out of curiosity, is there any advantages besides having a fixed
> property name to the first solution?

I think it's mostly for consistency: trying to get most subsystems to
do it the same way to make it easier for people to write dts files.

A lesser point is that it simplifies the driver code if you don't
have to pass a name.


	Arnd
