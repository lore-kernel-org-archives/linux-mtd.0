Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSq6u-0000k7-Du
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 13:42:24 +0000
Message-ID: <1336743945.2625.72.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: nand: check the return code of
 'read_oob/read_oob_raw'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 11 May 2012 16:45:45 +0300
In-Reply-To: <20120509131334.2d0b7160@pixies.home.jungo.com>
References: <20120509130635.32973038@pixies.home.jungo.com>
 <20120509131334.2d0b7160@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+YrOp4J2bgMq3PWAG78w"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+YrOp4J2bgMq3PWAG78w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 13:13 +0300, Shmulik Ladkani wrote:
> Apparently, there is an implementor of 'read_oob' which may return an
> error inidication (e.g. docg4_read_oob may return -EIO).
>=20
> Test the return value of 'read_oob/read_oob_raw', and if negative,
> propagate the error, so it's returned by the '_read_oob' interface.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-+YrOp4J2bgMq3PWAG78w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrRgJAAoJECmIfjd9wqK0H7MP/16O8GH3l77ro7GybQRO0J4V
HTSy3FfSPjIZ7sgdL5DBJ+SzKXEd4DuLanqDGbUupC3LBhtxRZhJrZtVXIiobL93
zB4DELg/WW+7IMJE3rKA3bkyP4h8Ma1AkfRzQ5NeuPh/QmPndX4rX7gOFn7Em65n
3TGtC4xWfUkJeWG+wk0Bf0oH35tHSO7ce6o3cMEZDay2Pjnh+Cm0KUyRBpsyDyV+
CniFfjrLO9pebkzJWaoL/ZSmQlzISJnTOgCW3nZdafcqiySl0Lb/3w6vHpdddnK4
ywnrrXO0e1+0qh+1cw63OHVFiYnPJ5ThQrNApNuebC1NzNHNteUfPPVAbZZ04izf
m8jEwZDREdKTQO/fkmkgiylJdNmW8BUg/f3zMTjOZbolt1enaGmXCSRYWdVdHJ3V
2NdhdhCDCUkXyU9xd9vS7cce0gykaueq1DtzCOujjq5pqWqDXnmo3IT2PGricJu1
+j7G77z1BUe3b5QRik85LParIFTWxJ+4Ey7cP/vD2HzkGB0zEzFwPo5nLNt+tCwg
cR2W7FZs8Qo3VcYWJ4NMaNeav5I8+cpLqNM6IsTwLaemKcSsLMg84w7o4uBBFtDO
DTgdz3iIvyds1l5Zeeu2nataH1GFD7qZlF6kNOHGna/b1Ft7gazoOMDk2r/pVvVG
A0XV5vQ5BPP1yHoOLp4I
=svaR
-----END PGP SIGNATURE-----

--=-+YrOp4J2bgMq3PWAG78w--
