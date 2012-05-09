Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSA6j-0002cT-GL
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 16:51:23 +0000
Message-ID: <1336582486.10606.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/7] mtd: Change meaning of -EUCLEAN return code on
 reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 09 May 2012 19:54:46 +0300
In-Reply-To: <4FAAA007.903@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
 <1336210990.2027.2.camel@koala> <4FAAA007.903@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aPVPWMLznJ53o1w8TZM+"
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


--=-aPVPWMLznJ53o1w8TZM+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 09:49 -0700, Mike Dunn wrote:
> On 05/05/2012 02:43 AM, Artem Bityutskiy wrote:
> > On Wed, 2012-04-25 at 12:06 -0700, Mike Dunn wrote:
> >> This v2 of this set includes the following changes:
> >>   - [Patch 4/7]: Propagate bitflip_threshold from master to slave part=
ition.
> >>   - [Patch 5/7]: Zero out max_bitflips outside of if-block in fsl_ifc_=
nand.
> >>   - [Patch 6/7]: Simplify ecc strength sanity check.
> >=20
> > Would you please do one more thing - create a piece of documentation
> > about this feature at the mtd web site.
>=20
>=20
> Do you have any suggestions regarding where on the site this should be ad=
ded?

Not sure, the site is poorly organized, may be here:

http://www.linux-mtd.infradead.org/doc/general.html

?

--=20
Best Regards,
Artem Bityutskiy

--=-aPVPWMLznJ53o1w8TZM+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPqqFWAAoJECmIfjd9wqK0BKIP/j9g1T69q0/cw3a2ur1cuI3m
DkNBZ/Wj1Ppjx4HhQvQrCCiXkrEwXrcxfUpgpSZfp7l/jGKxguYC7p8kn3PfNR7M
cPTyNouicDrC0W6+CdSWNm2TZ3WaXoH20omBN2IgsRBkFfofFljs8G+a/5wWwilI
MrYEJqX5boJyg6X34df5wLr7zIcjL03IwchoRpP//uKhU+O/sLyRSab1EmDEGvRn
6Eb1ZQuPhtR+rohpMizNL4QV5NARgpdbAxCsxQQqq6deRUQKcvxr6/s+LFsxWax/
v2PFcg6pF8D83EU/nBmgqmivZrFNu7KrjwN2eaQi0jfwe7y+hlapraLj8F6rdvn7
8hKEO5beRUSeUOf+EYLbFceEnDwQRzvwBenrhuznxOO/g2jPPZqkIMB5Hn4OgG62
0CU8HXPjQnbXQ+35FxFWuVbNuCfmMzPK4hTBP3hUVrRC0k62AFs2/7sww+SBsbMO
CrBEM1cdF/3rIKRRmoNVVJkqyMBkD3B6xro2Wn43oK09DDvmB6Z6tWGOF71C0AfV
yo0zwRSYDTjxWJOqPnyMDbyg2y6YFxtzFmTmXzd7RWPXgLATrcaxkxD3XNYAYqpq
kAZjVSroO26TOtHB+0cIdYarf++DXAnVNcktf/JGmmHTcOvDRdxbYT4PpaDBQdF8
u4/EKX69Nh/ZK6ThSi1T
=Jjs9
-----END PGP SIGNATURE-----

--=-aPVPWMLznJ53o1w8TZM+--
