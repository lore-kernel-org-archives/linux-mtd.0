From: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: MTD EEPROM support and driver integration
Date: Sat, 06 Jul 2013 21:06:49 +0200
Message-ID: <8997501.Dchyii8uWX@wuerfel>
In-Reply-To: <20130706120112.GA11069@lukather>
References: <20130705201118.GM2959@lukather> <5811519.oHVuMujf0I@wuerfel>
 <20130706120112.GA11069@lukather>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Artem Bityutskiy <dedekind1@gmail.com>, oliver@schinagl.nl,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Jean Delvare <khali@linux-fr.org>, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 06 July 2013 14:01:12 Maxime Ripard wrote:
> I'm not exactly sure on what happened to the previous mail that has been
> sent empty, but anyway:
> 
> On Sat, Jul 06, 2013 at 11:18:00AM +0200, Arnd Bergmann wrote:
> > On Saturday 06 July 2013 10:28:04 Maxime Ripard wrote:
> > > > a) like interrupts, regs, dmas, clocks, pinctrl, reset, pwm: fixed property names
> > > > 
> > > >       regmap = <&at25 0xstart 0xlen>;
> > > >       regmap-names = "mac-address";
> > > > 
> > > > b) like gpio, regulator: variable property names
> > > > 
> > > >       mac-storage = <&at25 0xstart 0xlen>;
> > > > 
> > > > It's unfortunate that we already have examples of both. They are largely
> > > > equivalent, but the tendency is towards the first.
> > > 
> > > I don't have a strong feeling for one against another, so whatever works
> > > best. Both solutions will be a huge improvement anyway 
> > > 
> > > Just out of curiosity, is there any advantages besides having a fixed
> > > property name to the first solution?
> > 
> > I think it's mostly for consistency: trying to get most subsystems to
> > do it the same way to make it easier for people to write dts files.
> > 
> > A lesser point is that it simplifies the driver code if you don't
> > have to pass a name.
> 
> So that leave us with mainly one path to achieve this goal:
>   - Add a regmap-mtd backend
>   - Add DT parsing code for regmap
>   - Move the EEPROM drivers from misc to mtd

Yes, I think that would be good. For the last step, we definitely need
buy-in from Wolfgand and Jean, as they are maintaining the current eeprom
drivers.

> What other option would we have?
> 
> I also thought about writing an EEPROM framework of its own, but the
> line is really thin between a large EEPROM and say a small SPI
> dataflash, which would make it pretty hard to choose between such a
> framework and MTD.

Isn't flash by definition block based, while EEPROM can be written
in byte or word units? I think that is a significant difference, although
it doesn't necessarily mean that we can't use MTD for both.

We also have a bunch of OTP drivers spread around the kernel, it probably
makes sense to consolidate them at the same time, at least on the DT binding
side if not the device drivers.

	Arnd
