Date: Thu, 20 Oct 2016 19:07:39 +0200
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
Message-ID: <20161020170739.lgt2ywm346vm47zd@lukather>
References: <cover.bb1e4a568bc16ada5254cad063f4afbaa1ca5906.1476951078.git-series.maxime.ripard@free-electrons.com>
 <0df42247c3348e7f6aed945e5669cec87f96f7ac.1476951078.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66w0sTzn_SWH4rrpWKOosSxALV8ot3CBQbGhwLxvX1vxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pr2bi74pr2efxgjc"
Content-Disposition: inline
In-Reply-To: <CAGb2v66w0sTzn_SWH4rrpWKOosSxALV8ot3CBQbGhwLxvX1vxw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--pr2bi74pr2efxgjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 10:10:03PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 20, 2016 at 4:12 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The PWM controller has two different channels, but only the first pin w=
as
> > exposed in the DTSI. Add the other one.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>=20
> > ---
> >  arch/arm/boot/dts/ntc-gr8.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8=
=2Edtsi
> > index 74aff795e723..fad7381630f3 100644
> > --- a/arch/arm/boot/dts/ntc-gr8.dtsi
> > +++ b/arch/arm/boot/dts/ntc-gr8.dtsi
> > @@ -854,6 +854,13 @@
> >                                 allwinner,pull =3D <SUN4I_PINCTRL_NO_PU=
LL>;
> >                         };
> >
> > +                       pwm1_pins_a: pwm1@0 {
>=20
> Nit: really don't need "_a" and "@0" here.

Fixed and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pr2bi74pr2efxgjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCPnaAAoJEBx+YmzsjxAgCbIP/iYf2qdtbBqOelrNNvxHjmO7
z/4TdeB8fO8dLn3jIzEsTg044hUklx8wQLT6msTuB2kH6YjVxpVPI1pUi/SWGFdf
OrWQXbagcWOUuAP9o/4ApOt/8Zv+9mKVkifBrsIfZ3CvSjgQS7S7akHJ2M+rbyYn
sS/peydiiuZc06XkFx815Vv8plr9uWXc84GjMxqLWZB8soCtvq0gOyRK7saeKIfT
QZe0bZYzRZYtyCuADULfYGT7RSwnZ7jv4hyWULEH47yKEXgVxkKvZpjpRioJbW4t
8aP66ZCH6rIGBlsPsk3JhWlxqP0lacyg059Fjc/8byMFenKfw9sk5yCwvhkvIUvt
twbkaPeuNrWC51M2sDJlDzMePxnsnMv0s2MSB1hVvwd5NIEZ7p8c40/ODHfUQwKc
CPfMuQYVT13OVFrft3T+xXC3BUJWIbht9n4CrpFBks4Wc5HHgt0h9vwJS4Klo7z3
PjdTN6vrmOSoY3Kazart8D83Ty7n71Gi+3NmhpTuA9vpTIvC4jsq+JwLgQW4Zklf
m0BCz87ylPbMqveZDXerz4cymtcqNqXuexThGc0HKVu6YDltUX5icQMHr/6wSGqb
HXRyEdyFIM0wqKF4ZGqDe0ezhruWkvq/S43D1jxFh6nPAsDEM/V03Z41Da1MKe4z
Tvngf/ZdbyF9Obqv0oLv
=mlUy
-----END PGP SIGNATURE-----

--pr2bi74pr2efxgjc--
