Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TBOA2-0004k6-AV
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 10:57:43 +0000
Message-ID: <1347361364.26206.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: prepare place for BCMA NAND flash driver(s)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, "John W.
 Linville" <linville@tuxdriver.com>
Date: Tue, 11 Sep 2012 14:02:44 +0300
In-Reply-To: <CACna6rzWmjsxSps736Rpoy5tiC9fbAiQ4=Gs_QboHrU+R-A1yQ@mail.gmail.com>
References: <1347201121-20590-1-git-send-email-zajec5@gmail.com>
 <1347358968.21359.68.camel@sauron.fi.intel.com>
 <CACna6rzWmjsxSps736Rpoy5tiC9fbAiQ4=Gs_QboHrU+R-A1yQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IhyGNu+CQ8fbv3uoeOq1"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IhyGNu+CQ8fbv3uoeOq1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 12:45 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Sun, 2012-09-09 at 16:32 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> BCMA bus can contain NAND flash memory, it's registered in system as
> >> platform device. This adds required hooks and place for controler
> >> specific drivers.
> >> At this point it doesn't work yet, so it's marked as BROKEN.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >
> > Why should it be merged upstream as BROKEN and without
> > controller-specific drivers?
>=20
> Regarding question about BROKEN: because they will start building
> after meeting changes coming from net tree during merge window. Right
> now that driver doesn't compile :(

Usually it is solved by pulling the tree we depend on, but we need a
permanent branch for this, which will not be re-based.

--=20
Best Regards,
Artem Bityutskiy

--=-IhyGNu+CQ8fbv3uoeOq1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQTxpUAAoJECmIfjd9wqK0dc0QAMgO0FYGmok/HXxoFXHlGi0S
12U0BhgKmlwaffwa48eCPpNDWYY0lWLsHmLFJFpqgcPAt2Vr2cW1g++b+qB2v1VC
Z9Z5n+oMx1gg+2eKGxY4MlwsMTVDfqqYmdm/cVVAFHKmkRw0xhtaVogAc7WPtxBU
cJOMDTiXbX4gKWo0vmTcXIr9u1hZeBeYdxwfJG4VgN5ahsFBvLpDaUtVfEvFLQ/S
UL/QElOfSx8FncDzuNCid0UrT053VpHYiWkxzZhj9K6NfbB+YUbwcjHgMDCyHnHD
O6sxP72UbAtLNA3OL6qmaFkilbZMEQRkZTaM7X06jO/47InAv+K4zvpyDfbYMXUc
b6glroNOlXs9VDrHLoFCW8Ggo2SRi0c0A7jNr9+VBQuDH50I4Ox6dniUI0wGb1Lg
DR88kYSD0/aEHHvNbMRXUxc8vl4714QcBMze3UcBCQAzqK/neLRS/oGT5G58vVRh
u0GNTkAKJajl2q0W34ZbUDMzTIvI/Wj/5akBnl4aRw+ea1mnnl3UfGXEQYx4OSDH
/7b4JeeOuv+m0ggeVQaiyAxiOeXdNGs4c68lhdmzP3L4Pgksox8PjemkG7AhW/5g
RJbrOQwfgyIlptotjQQr0Y0p9HwMjkZlNiBB2qVyHX04qWI1myO5hm6+p2yjnSm3
EHC9m4Hoges1Z/goyB4O
=PX1E
-----END PGP SIGNATURE-----

--=-IhyGNu+CQ8fbv3uoeOq1--
