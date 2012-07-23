Received: from opensource.wolfsonmicro.com ([80.75.67.52])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StNQp-0003rg-56
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 18:32:36 +0000
Date: Mon, 23 Jul 2012 19:32:31 +0100
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
Message-ID: <20120723183230.GA12438@opensource.wolfsonmicro.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
 <20120723174605.GA23707@sirena.org.uk>
 <1343067861.19880.30.camel@hornet>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <1343067861.19880.30.camel@hornet>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 07:24:21PM +0100, Pawel Moll wrote:
> On Mon, 2012-07-23 at 18:46 +0100, Mark Brown wrote:
> > > +	info->vpp_regulator =3D devm_regulator_get(&dev->dev, "vpp");
> > > +	if (IS_ERR(info->vpp_regulator))
> > > +		info->vpp_regulator =3D NULL;

> > No, this is very bad karma.  You shouldn't just silently ignore the
> > error here, if we didn't get the supply it's probably important and
> > otherwise why bother checking the error at all? =20

> The reason is simple - to make the regulator completely optional. That's
> also why I check the existence of "vpp-supply" property in the OF
> version.

Yes, I know what you think you're doing here but the fact remains that
you're just guessing about why you got an error, perhaps it's due to
there not being anything there but perhaps it's something important.
The thing that's particularly bad here is that your change will just
silently ignore the error which is far from awesome, at the very least
it ought to complain (though I don't think that's a good idea).

It shouldn't be that hard to find the in-tree users...

> > At a bare minimum you should be passing back -EPROBE_DEFER if you get
> > that.

> Which is, if I'm not mistaken, exactly what is returned when no supply
> is defined by the board. Which gets us to the starting point. As I said
> - if this is deemed unacceptable, I'll simply forget about this patch.

Well, in the DT case it'll probably start returning -ENODEV soon if
there's no supply binding set up (which would get you back to your
current case), given that you're from ARM probably that's covering all
the cases you're especially interested in.  Otherwise we just can't tell
why we didn't find the regulator.

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQDZipAAoJEBus8iNuMP3dfqQP/34plShaUr2gHL/20Tg3DwuF
kwzd8C2YONEjRKTrhKmDswhQL/CYSRV7xfIvErCN/BRQ4rl866cTxhFmbkWtbZQi
GtHXuHoWLlsaG58cbWKPCuLeYIeHO4Zu1aYVEvsuc85a47XKoWRRNYhD7hVaTM6M
6KXJoLBcr0hs6c9l1OyxAL/CYzaiCwJHS1lmETYHwX/ob08/OEOU92sVsmbGu6jA
9O6u1gOIwCB8yRx6YwtFei15meW5uKryqW7pXLKgtkkRvWC+wJCF7Ei3YaQlowXM
4NwjGYeg9hkequ9nMzWaPIORvWjq4CnuQ8mBwszRnSOh39/UpM/ryiAWwaq/O9X4
nmShX4Qk8Tks+eQHN98aZUIQB1RK2igKlSvSr/RMAXqLTSA0j9xrIugpDqpVLP8b
fWmGx6kwtt6SbeLAuW/UvoKd/uO+6scSptmsJBuW7CFrtPXxti/s+DtiT+ZJQ8rM
O5IUHw8DTtApKFD5h4xRwSnwAeP8vpadO+oDiep4Mbx18aqTDOCnwoFe/22iw0Ww
I4sEIA4E/xgC4hk3gVAbdPL4ZY72s1kAw6PdOPa/lf0BGqSrR0gVEYLdiMB2g/t5
3rpXh9Ixa+pYZPr5e7/9AKZOPsur+I58cl6Ytnv8wO0HhfP072HtBG8I6B7ruAt/
VB93XEBwId5TDmVa4d76
=IAS1
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
