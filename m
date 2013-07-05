From: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: MTD EEPROM support and driver integration
Date: Sat, 6 Jul 2013 00:33:13 +0200
References: <20130705201118.GM2959@lukather>
 <201307052302.40588.arnd@arndb.de> <20130705222342.GP2959@lukather>
In-Reply-To: <20130705222342.GP2959@lukather>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201307060033.13259.arnd@arndb.de>
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

On Saturday 06 July 2013, Maxime Ripard wrote:
> > My first thought is that it should be more generic than that and not
> > have the mac address hardcoded as the purpose. We could possibly use
> > regmap as the in-kernel interface, and come up with a more generic
> > way of referring to registers in another device node.
> 
> Hmm, I maybe wasn't as clear as I wanted. Here mac-storage was just an
> example. It should indeed be completely generic, and a device could have
> several "storage source" defined, each driver knowing what property it
> would need, pretty much like what's done currently for the regulators
> for example.
> 
> We will have such a use case anyway for the Allwinner stuff, since the
> fuses can be used for several thing, including storing the SoC ID,
> serial numbers, and so on.

Ah, I see. In general, we have two ways of expressing the same thing
here:

a) like interrupts, regs, dmas, clocks, pinctrl, reset, pwm: fixed property names

	regmap = <&at25 0xstart 0xlen>;
	regmap-names = "mac-address";

b) like gpio, regulator: variable property names

	mac-storage = <&at25 0xstart 0xlen>;

It's unfortunate that we already have examples of both. They are largely
equivalent, but the tendency is towards the first.

	Arnd
