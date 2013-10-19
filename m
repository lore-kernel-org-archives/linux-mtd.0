From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v9 4/9] mtd: nand: omap: enable auto-detection of
 bus-width for omap-nand drivers
Date: Sat, 19 Oct 2013 09:11:39 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA28D68@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-5-git-send-email-pekon@ti.com>
 <20131016222248.GZ23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA27917@DBDE04.ent.ti.com>
 <20131017183016.GG23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA280A4@DBDE04.ent.ti.com>
 <20131017214349.GH23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131017214349.GH23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> On Thu, Oct 17, 2013 at 09:00:27PM +0000, Pekon Gupta wrote:
> > > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > > > On Thu, Oct 17, 2013 at 04:42:23AM +0000, Pekon Gupta wrote:
 [...]

> > > But the real point: you need to clearly communicate what you are
> > > choosing in this patch. Either you want to
> > >
> > >  (1) strictly follow the buswidth provided by the platform or
> > >
> > >  (2) use the nand_base.c BUSWIDTH_AUTO automatic configuration.
> > >
> > Ideally, I would like to go with (2), but that would need other changes
> > in-order to re-configure GPMC with newly parsed ONFI data, which
> > can be a separate patch-set.
>=20
> What exactly needs changed to support this? It looks like this omap2
> NAND driver doesn't make assumptions about 8-bit vs. 16-bit until after
> nand_scan_ident(). But maybe there is something I missed.
>=20
The GPMC driver will be touched by NAND_BUSWIDTH_AUTO change.
There are two set of configurations in GPMC controller..
(a) device based configurations:
  These are static configurations derived on DT bindings for each
  chip-select (like NAND signal timings, etc). These done on GPMC probe.
(b) ecc-scheme based configurations:
  These are dynamic configurations done in NAND driver in
  chip->ecc.hwctl() and are refreshed at each NAND accesss.

However, 'nand-bus-width' configuration is part of both (1) and (2).
Thus, both 'OMAP NAND driver' and 'GPMC driver' need to be
consistent in programming  'nand-bus-width' otherwise ecc-engine
would not work.
Thus, I'm proceeding with (1) DT based parsing of 'nand-bus-width'.


> > Thus, I would drop this patch for now. And go with (1),
>=20
> OK, but to drop this patch entirely would still not be (1); it would
> still leave the possibility of calling nand_scan_ident() twice, and it
> puts you in a middle ground between (1) and (2). That's fine if it works
> for you, but I just want to acknowledge that now: this driver requires
> changes to become either (1) or (2).
>=20
I have re-posted [PATCH v10 4/10] with this updates. However, please
take into account that some limitation of dual programming require
such probe. New patch also call nand_scan_ident() twice, but only
on certain pre-determined conditions, not in all failure.
Once I convert to NAND_BUSWIDTH_AUTO these should get clean,
 as I would update both GPMC and NAND driver for this.
(Till then this was most optimal solution I could think of)..


> Does your series need a rebase if we're removing this patch? Or you're
> rewriting/simplifying it to the following two points? (Perhaps it's
> best to separate this portion to its own patch (set) and discussion,
> since it is independent of your ECC rewrite.)
>=20
> > with following
> > updates in  omap_nand_probe().
> >
> > (a) perform nand_scan_ident() in "x8" mode, so that ONFI params are
> >     read and device-info (chip->writesize, chip->oobsize) are populated=
.
>=20
> OK.
>=20
> > (b) Then switch to "x8" or "x16" mode based on "nand-bus-width"
> >     as passed from GPMC driver to NAND driver via platform-data.
> >    And re-populate mtd->byte, mtd-read_buf, mtd->write_buf.
>=20
> I'm not sure if switching buswidth after nand_scan_ident() is really
> supported, but I'll hold off until I see the code you're proposing.
>=20
I have re-posted [PATCH v10 4/10] with this updates.
Please accept this ...


with regards, pekon
