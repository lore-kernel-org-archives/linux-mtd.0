Received: from dns-bn1lp0143.outbound.protection.outlook.com ([207.46.163.143]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlDJa-0004do-MZ
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 08:16:28 +0000
From: "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: RE: Support of Micron SPI flash (size > 16MB)
Date: Fri, 16 May 2014 08:15:59 +0000
Message-ID: <86bc6bed6ec74c8c8fc3d0e929baee48@BY2PR03MB508.namprd03.prod.outlook.com>
References: <92977332ffca4669b5c1987b42b0d0c5@BY2PR03MB508.namprd03.prod.outlook.com>
 <20140509104404.GK12304@sirena.org.uk>
 <20140516061856.GD2413@norris-Latitude-E6410>
In-Reply-To: <20140516061856.GD2413@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: Friday, May 16, 2014 2:19 PM
> To: Mark Brown
> Cc: Hu Mingkai-B21284; dwmw2@infradead.org;
> vivien.didelot@savoirfairelinux.com; linux-mtd@lists.infradead.org;
> linux-spi@vger.kernel.org
> Subject: Re: Support of Micron SPI flash (size > 16MB)
>=20
> On Fri, May 09, 2014 at 11:44:04AM +0100, Mark Brown wrote:
> > On Fri, May 09, 2014 at 10:25:04AM +0000, Mingkai.Hu@freescale.com
> wrote:
> > > 2.       What are the changes needed for SPI controller to support 4
> byte addressing?
> >
> > If the SPI controller is a genuine SPI controller and not something
> > specially optimised for flash it shouldn't need any changes, it
> > doesn't know anything about the data it's sending.
>=20
> Right. A true SPI controller doesn't need to know anything about
> addressing modes.
>=20
> > The SPI flash code might
> > need updating though, I don't know about that.
>=20
> The SPI flash code in MTD (m25p80.c, some of which is moving to
> drivers/mtd/spi-nor/ in -next) already supports 4-byte addressing for
> most flash. Check for flash support there.
>=20
> You might also look at my comments in this commit, regarding the
> different types of "4-byte addressing":
>=20
> commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Thu Apr 11 01:34:57 2013 -0700
>=20
>     mtd: m25p80: utilize dedicated 4-byte addressing commands
>=20
> But again, most of this should just work(TM) for true SPI controllers.
>=20

Thanks for your info, Brian. We are using N25Q512A Micron SPI flash. Micron=
 implemented
two commands to enter and exit 4 bytes address mode.

Another question is for erase and program command. From the datasheet, not =
only the WTITE
ENABLE command need to be issued before the command can be executed, but al=
so a special
READ FLAG STATUS RESISTER command need to be issued after the erase/program=
 command which
is not implemented in the upstream code. We implement the READ flag operati=
on and erase
can work, but write still fail.

I saw somebody has added the Micron larger SPI flash (>16Mb) support, so I'=
d like to know
if they run into such issue.

Thanks,
Mingkai
