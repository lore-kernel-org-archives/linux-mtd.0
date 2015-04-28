Date: Tue, 28 Apr 2015 09:03:47 -0500
From: Josh Cartwright <joshc@ni.com>
To: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
Message-ID: <20150428140347.GC2798@jcartwri.amer.corp.natinst.com>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427232353.GD32500@ld-irv-0074>
 <CAGnW=BYVn5quNKooiB44CiCYtuYckWArTkft4BQLxs188FwUpg@mail.gmail.com>
 <20150428032213.GI19571@brian-ubuntu>
 <CAGnW=BYeJQyg8BYX0oOxrnT_VNUh9iUNPGPmioqV7Xrj3by92g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGnW=BYeJQyg8BYX0oOxrnT_VNUh9iUNPGPmioqV7Xrj3by92g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ben Shelton <ben.shelton@ni.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 09:14:26AM +0530, punnaiah choudary kalluri wrote:
> On Tue, Apr 28, 2015 at 8:52 AM, Brian Norris <computersforpeace@gmail.co=
m> wrote:
> > On Tue, Apr 28, 2015 at 08:18:12AM +0530, punnaiah choudary kalluri wro=
te:
> >> On Tue, Apr 28, 2015 at 4:53 AM, Brian Norris <computersforpeace@gmail=
=2Ecom> wrote:
[..]
> >> Agree that read_buf need not be returning raw data always including
> >> my new driver for arasan nand flash controller.
> >
> > I agree with that. At the moment, chip->read_buf() really has very
> > driver-specific meaning. Not sure if that's really a good thing, but
> > it's the way things are...
> >
> >> http://lkml.iu.edu/hypermail/linux/kernel/1504.2/00313.html
> >
> > In the half a minute I just spent looking at this (I may review it
> > properly later), I noted a few things:
> >
> > 1. you don't implement ecc.read_page_raw(); this means we'll probably
> > have trouble supporting on-die ECC with your driver, among other things
>=20
> On-die ECC is optional as long as the controller has better ecc coverage.
> The arasan controller supports up to 24 bit ecc. There is no point to use
> on-die ECC and will always use hw ecc even for On-die ecc devices.

Maybe this is true of the controller instantiated in the Zynq MPSoC
chips, but the Zynq 7000 series SMC is documented to support only 1-bit
ECC.

(Which is why we're looking at your pl353 driver and this set).

  Josh

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVP5M/AAoJEKp7ZBKwQFArIKEH/0hmA21KwBjUnbtnD7FsisjE
gHNWB6Zlthj14lrSMgVv6nKPnB7+InYHn4y6B4eNYOE6urQfP9kVSoN87WDilW2G
yzdVesiS93Mkha7e0Ix9Cyg1G021ndM+X/Yaq903O0RCbzmBVOmxkVeLr7gbO1vS
8ywJ1Hw1LceicKRopkOJwfjI63Tk9FmgDWiWpD3/D2wO+ImIq7CgzkrtNKavb0HY
SYZf95jWJZIL419PrbjDlSvIX5LJ646XIuFulUBZJ8xE8qeNjmNhtxj7Mp/8PxFS
yT1p11XV5GxqebyQWOHy1agRWhuI3+qWME8FoOY2/pO7apcSxEgiOqPGSs2FMOg=
=v0qL
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
