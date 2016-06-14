Date: Tue, 14 Jun 2016 15:57:16 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Aleksei Mamlin <mamlinav@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
 Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 4/4] ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC
Message-ID: <20160614135716.GK9354@lukather>
References: <1465903058-9211-5-git-send-email-mamlinav@gmail.com>
 <201606142105.1AaT2uM6%fengguang.wu@intel.com>
 <20160614161908.53016f4f22c18e9126a041d2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="nrM5Z5VIJgwP9LWp"
Content-Disposition: inline
In-Reply-To: <20160614161908.53016f4f22c18e9126a041d2@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nrM5Z5VIJgwP9LWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 04:19:08PM +0300, Aleksei Mamlin wrote:
> On Tue, 14 Jun 2016 21:11:12 +0800
> kbuild test robot <lkp@intel.com> wrote:
>=20
> > Hi,
> >=20
> > [auto build test ERROR on mripard/sunxi/for-next]
> > [also build test ERROR on next-20160614]
> > [cannot apply to robh/for-next v4.7-rc3]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to help improve the system]
> >=20
> > url:    https://github.com/0day-ci/linux/commits/Aleksei-Mamlin/dts-sun=
xi-Add-sunxi-NAND-Flash-Controller-support/20160614-192539
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.g=
it sunxi/for-next
> > config: arm-sunxi_defconfig (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (Debian 5.3.1-8) 5.3.1 20160205
> > reproduce:
> >         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests=
=2Egit/plain/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         make.cross ARCH=3Darm=20
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > >> Error: arch/arm/boot/dts/sun7i-a20.dtsi:806.26-27 syntax error
> >    FATAL ERROR: Unable to parse input tree
> >=20
>=20
> My bad, dual semicolon at line 806. Maxime, can you fix it locally?

Already did :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nrM5Z5VIJgwP9LWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYA08AAoJEBx+YmzsjxAgT2gP/3FhM/GuSuXTZV4Q3Tsybqba
cYtgPa4Pfxab9A99CnmxG3RMdE67c0WkfzoZa+mxdOf13TKJO/KR0I04dE+Hv2TG
ZBkC66vEMECa0DIfT91ZdlgUq8SnZNyu4lzlrHec1UpGihF2oRzif/CxQCGE6apY
yjJ5sobKhmtu1M08UFrpniSVY5ncxSX4VtdBn+SD44RXBX1PsN+D0MJTJKmvZygY
3xBPJXDOVuwaopPbNhFUWZa3U5YaBAC87/V/Il8wgz3xA84o8cuEdR0m+rXFNyqG
cD4TFw6W4exUsSYf1kz/+uJcRRwlZadiM2CdNuS1iwSAlEkatRWmBY/dYgWdCNUo
BvvyjmYIJ+NWSJ9gywXmFuop8GC/p7um6Ls4CRlI2ls2CHUvnzYaZBfEd9B8fgng
pgYQ8pdVVAgDSBccnpYWYBPYEjixRDN4ddIfzphcQbQCUuqfOFql4k2mB6iwk6TE
sS5Vg5O3DQGPf+9d8h54t6Pu2i0wxQyJIotp5ll5yLb4wri3nCVncAQ/xDLZMYhi
XMDHIajoEIgNL0qMZlq9jFG0Z+m+y/7PHJoMIwDmY/Jfma4Lj6TBJAcJ6+7KyP4V
a4phEV+H1TwWIXtwbi8frPZgt1FScquvzpplEcevdELcZHgfxHJXO0mfRlKYT5/g
+NO58c2gMG7C2rI2KQ2+
=ZBAR
-----END PGP SIGNATURE-----

--nrM5Z5VIJgwP9LWp--
