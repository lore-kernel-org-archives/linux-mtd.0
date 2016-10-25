Date: Tue, 25 Oct 2016 12:42:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 5/8] ARM: gr8: Add missing pwm channel 1 pin
Message-ID: <20161025104209.edtqoymu4thc56p4@lukather>
References: <cover.bb1e4a568bc16ada5254cad063f4afbaa1ca5906.1476951078.git-series.maxime.ripard@free-electrons.com>
 <0df42247c3348e7f6aed945e5669cec87f96f7ac.1476951078.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66w0sTzn_SWH4rrpWKOosSxALV8ot3CBQbGhwLxvX1vxw@mail.gmail.com>
 <20161020170739.lgt2ywm346vm47zd@lukather>
 <CAGb2v64Ai+8sUPyH9aTnKUw1ROmQNxzCEqUXrT4v8Q-nipqR3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w7nbiypn7hrkd6kw"
Content-Disposition: inline
In-Reply-To: <CAGb2v64Ai+8sUPyH9aTnKUw1ROmQNxzCEqUXrT4v8Q-nipqR3Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--w7nbiypn7hrkd6kw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 12:10:26PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 21, 2016 at 1:07 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, Oct 20, 2016 at 10:10:03PM +0800, Chen-Yu Tsai wrote:
> >> On Thu, Oct 20, 2016 at 4:12 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > The PWM controller has two different channels, but only the first pi=
n was
> >> > exposed in the DTSI. Add the other one.
> >> >
> >> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >>
> >> Acked-by: Chen-Yu Tsai <wens@csie.org>
> >>
> >> > ---
> >> >  arch/arm/boot/dts/ntc-gr8.dtsi | 7 +++++++
> >> >  1 file changed, 7 insertions(+), 0 deletions(-)
> >> >
> >> > diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-=
gr8.dtsi
> >> > index 74aff795e723..fad7381630f3 100644
> >> > --- a/arch/arm/boot/dts/ntc-gr8.dtsi
> >> > +++ b/arch/arm/boot/dts/ntc-gr8.dtsi
> >> > @@ -854,6 +854,13 @@
> >> >                                 allwinner,pull =3D <SUN4I_PINCTRL_NO=
_PULL>;
> >> >                         };
> >> >
> >> > +                       pwm1_pins_a: pwm1@0 {
> >>
> >> Nit: really don't need "_a" and "@0" here.
> >
> > Fixed and applied.
>=20
> Oops, you forgot to fix the label in the chip-pro dts:
>=20
>   DTC     arch/arm/boot/dts/ntc-gr8-chip-pro.dtb
> ERROR (phandle_references): Reference to non-existent node or label
> "pwm1_pins_a"
>=20
> ERROR: Input tree has errors, aborting (use -f to force output)
> scripts/Makefile.lib:313: recipe for target
> 'arch/arm/boot/dts/ntc-gr8-chip-pro.dtb' failed

Yeah, it was noticed by linux-next too, and I fixed it...

Sorry for that.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w7nbiypn7hrkd6kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDzcBAAoJEBx+YmzsjxAg1TIQAJqvhK0//NH0DZxpFP0KqzT3
x+8bTObh6Qg1Jw/KC5PmhiiEZa09upAx1MWT3aOzyePOxKzdFlq0E3idXZfzAXeI
FEwkg/tpODPS55AIFFdbEnMOl5WY233ur5RI4mlb/X82HUdmQKvJrZ0zN7VmqSAe
cgTfW01NYGj4qswbl7FH1cDVvb9MDjWI2IqfglDlvbwaIbxfuk72nT5rpCdoLTH0
lls07wodA9nif9psBUsaL/SNn0/OIH4sW+riSkFQ7Tagv7lqcjZOyHtDC/nGv6g/
YGdNW1coXVK6PkyeSgT8/wrTLEQDUjFaa1VPMOvAAnwQYHusAgASH4Xr+fzLpYbQ
wvIHeO5f1OJCzfhr2rAvENrCSashzGwQAsSpkRlz8OOxoTr/lLAaZSpGKql0nkiJ
TPhD3xuSb8bn8dCX+qFwWZDMjjnwzYqNN9m6exEfDjTmXbnSMnbB2qUXARScLpqj
p387aB0RRhkHcysIKuH8s084kZ9alsG2mSI5ln4ZNUZ+zD3gj9V5tceFmmUYWYgs
RcZttUzho2jhlY/eJ+P/J+8zL4buOeKZEVnEyNaI2oyjG4fhzqeSug8gWJ0HLTIX
X6TdYtu5cV7CTA78//j8QUaSCoFgBOhpDHEoePJQ4zE1OzQopTbbkweyTzGQkSuV
V9Zr9x7TKtc5UjUzWzyn
=u4d+
-----END PGP SIGNATURE-----

--w7nbiypn7hrkd6kw--
