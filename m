From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v9 4/9] mtd: nand: omap: enable auto-detection of
 bus-width for omap-nand drivers
Date: Thu, 17 Oct 2013 21:00:27 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA280A4@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-5-git-send-email-pekon@ti.com>
 <20131016222248.GZ23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA27917@DBDE04.ent.ti.com>
 <20131017183016.GG23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131017183016.GG23337@ld-irv-0074.broadcom.com>
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

Hi Brain,

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> > On Thu, Oct 17, 2013 at 04:42:23AM +0000, Pekon Gupta wrote:
> > > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > > > On Tue, Oct 15, 2013 at 11:19:52AM +0530, Pekon Gupta wrote:
[snip]
> > So this approach is other way round, where controller is configured
> > based on DT binding "nand-bus-width" and then it checks whether
> > device actual buswidth matches DT binding value or not.
>=20
> If this is the case, then you really don't want to use
> NAND_BUSWIDTH_AUTO. The default nand_base.c just *validates* the
> pre-selected buswidth and exits with an error, in much the same way that
> you're doing here (you're just duplicating the functionality).
> NAND_BUSWIDTH_AUTO is useful if you want to turn control of the
> buswidth
> configuration entirely over to nand_base.c.
>=20
> > - GPMC controller is pre-configured to support "x8" or "x16" device bas=
ed
> >    on DT binding "nand-bus-width".
> >    Reference: $LINUX/arch/arm/mach-omap2/gpmc.c
> >   @@gpmc_probe_nand_child()
> > 	val =3D of_get_nand_bus_width(child);
> >
> > - But, bus-width of NAND device is only known during NAND driver
> >    Probe in nand_scan_ident().
> >
> > Going forward when all NAND devices are compliant to ONFI,
> > then we can deprecate "nand-bus-width".
>=20
> Buswidth auto-detection is not actually restricted to ONFI. nand_base.c
> has (corretly, AFAIK) been detecting buswidths for a long time, using
> some form of ID decode detection. But it was just that: detection. It
> did not actually configure the buswidth, since it left that
> responsibility to the low-level driver to get right.
>=20
> Another thing to consider: I think this current patch is a regression
> from previous behavior. Previously, you would run nand_scan_ident()
> twice if the first one failed; once with the platform-configured
> buswidth and once with the opposite. But now, you only run
> nand_scan_ident() once, and then you quit if it detects differently than
> you expected.
>=20
Actually having nand_scan_ident() called again if first time it fails, is=20
_not_ the right way, it was a quick-fix work-around.
It should not have been approved..


> My opinion: the platform- and device-tree-provided buswidth is
> unnecessary; it was previouisly only a suggestion which your driver
> would readily discard, and it isn't really needed now. You can probably
> get by with just NAND_BUSWIDTH_AUTO and (at most) a warning if the
> auto-configured buswidth is different than the platform specified.
>=20
> But the real point: you need to clearly communicate what you are
> choosing in this patch. Either you want to
>=20
>  (1) strictly follow the buswidth provided by the platform or
>=20
>  (2) use the nand_base.c BUSWIDTH_AUTO automatic configuration.
>=20
Ideally, I would like to go with (2), but that would need other changes
in-order to re-configure GPMC with newly parsed ONFI data, which
can be a separate patch-set.

Thus, I would drop this patch for now. And go with (1), with following
updates in  omap_nand_probe().

(a) perform nand_scan_ident() in "x8" mode, so that ONFI params are
    read and device-info (chip->writesize, chip->oobsize) are populated.

(b) Then switch to "x8" or "x16" mode based on "nand-bus-width"
    as passed from GPMC driver to NAND driver via platform-data.
   And re-populate mtd->byte, mtd-read_buf, mtd->write_buf.


with regards, pekon
