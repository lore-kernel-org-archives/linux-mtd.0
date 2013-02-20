Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U881F-0002i2-9E
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 11:39:25 +0000
Message-ID: <5124B5E7.5040503@pengutronix.de>
Date: Wed, 20 Feb 2013 12:39:19 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: SELinux + ubifs: possible circular locking dependency
References: <51123C80.2050400@pengutronix.de> <5115076E.3070703@pengutronix.de>
 <1360759673.12703.147.camel@sauron.fi.intel.com>
 <511BA51E.9000606@pengutronix.de>
 <1360826119.12703.155.camel@sauron.fi.intel.com>
 <511CD0EC.6070200@pengutronix.de>
 <1360843685.12703.165.camel@sauron.fi.intel.com>
 <5124B159.1040305@pengutronix.de>
 <1361359441.2734.48.camel@sauron.fi.intel.com>
In-Reply-To: <1361359441.2734.48.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2SRCBOLAVGDAMMCAVHJBR"
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2SRCBOLAVGDAMMCAVHJBR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/20/2013 12:24 PM, Artem Bityutskiy wrote:
> On Wed, 2013-02-20 at 12:19 +0100, Marc Kleine-Budde wrote:
>>> Hmm, probably I have to annotate the ui mutex. Let's drop security
>>> mailing lists from the loop so far, I'll come up with a patch tomorro=
w.
>>
>> Do you have a patch I can test?
>=20
> Mark, I apologise for not keeping my promise, I got distracted. I will
> _try_ to look at this again this week. Sorry!

I know what you're talking about ;), no problem.

regards,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2SRCBOLAVGDAMMCAVHJBR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlEkteoACgkQjTAFq1RaXHNq2ACffOKNlybZ4V7xAiCW0kP82jjX
mIgAnRO8/1d6ED+j5g0fkhgxSaQvppps
=wPR5
-----END PGP SIGNATURE-----

------enig2SRCBOLAVGDAMMCAVHJBR--
