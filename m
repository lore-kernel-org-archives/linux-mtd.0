Message-ID: <1483694849.3634.6.camel@phytec.de>
Subject: Re: [PATCH 1/6] ARM: dts: am335x-phycore-som: Update NAND partition
 table
From: Teresa Remmet <t.remmet@phytec.de>
To: Brian Norris <briannorris@chromium.org>, Tony Lindgren <tony@atomide.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Brian	Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Beno=EEt?= Cousson	 <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Adam Ford	 <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 06 Jan 2017 10:27:29 +0100
In-Reply-To: <20170105175619.GA56877@google.com>
References: <1483627851-17996-1-git-send-email-t.remmet@phytec.de>
 <1483627851-17996-2-git-send-email-t.remmet@phytec.de>
 <20170105153637.GA4310@atomide.com> <20170105171845.GK4310@atomide.com>
 <20170105175619.GA56877@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Am Donnerstag, den 05.01.2017, 09:56 -0800 schrieb Brian Norris:
> On Thu, Jan 05, 2017 at 09:18:45AM -0800, Tony Lindgren wrote:
> >=20
> > * Tony Lindgren <tony@atomide.com> [170105 07:37]:
> > >=20
> > > * Teresa Remmet <t.remmet@phytec.de> [170105 06:57]:
> > > >=20
> > > > To improve NAND safety we updated the partition layout.
> > > > Added barebox backup partition and removed kernel and oftree
> > > > partition. They are kept in ubi now.
> > > What about the users with earlier partition tables?
> > >=20
> > > Please read about "flag day" changes, typically they are not
> > > acceptable.
> > Adding Brian and Adam to Cc. Can you guys come up with some
> > solution on this?
> I don't have much context for this thread, and no I don't plan to
> solve
> your problems for you. But I can provide tips!
>=20
> >=20
> > I'm suggesting we leave the kernel nodes empty and let u-boot
> > populate them, so maybe you guys can discuss this on the related
> > lists.
> That's an option. I've worked with platforms that did something like
> this, and that's really one of the only ways you can handle putting
> partition information in the device tree. You're really hamstringing
> yourself when you put all the partition information in the device
> tree.
> And it's just dumb once that gets codified in the kernel source tree.
>=20

In our case the bootloader does pass the partition table to the kernel.
So it gets overwritten anyway. This was just more for backup,=C2=A0
if someone uses a different bootloader. But I'm fine with removing the
nand partition table completely from the kernel device tree.
Same with the SPI nor partition table.

I will send patches for this.

Regards,
Teresa

> The best solution would be to try to migrate away from static device
> tree representations of partition info entirely. UBI volumes are best
> where possible. If not, then some other kind of on-flash data
> structures
> (along the lines of a GPT) with a corresponding MTD partition parser
> is
> an OK alternative. Unfortunately, there isn't any good standard
> format
> for this on MTD, so it's typically all custom -- and so people use
> the
> easiest approach: device tree. And it's even more difficult with
> NAND,
> which has reliability problems, especially with static data (e.g.,
> read
> disturb).
>=20
> Anyway, the parser solution is helpful only if one can properly fix
> the
> "flag day" first. And it requires a little bit more work to be
> generally
> useful; I posted some work for this over a year ago, but bikeshedding
> brought it down.
>=20
> >=20
> > The rest of the series looks fine to me so applying it into
> > omap-for-v4.11/dt.
> Brian
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
