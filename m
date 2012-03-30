Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDcRF-0004ff-2F
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 14:04:25 +0000
Message-ID: <1333116451.5440.39.camel@sauron.fi.intel.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Fri, 30 Mar 2012 17:07:31 +0300
In-Reply-To: <CAHMF36FjJcd3au5GWFzy-=vfmM1HViLnZJN-HDeDTLyu9R1fSw@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
 <1331727617.3730.5.camel@sauron.fi.intel.com>
 <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
 <1331731119.3730.17.camel@sauron.fi.intel.com>
 <CAHMF36Fyb+X_tZjgs1Siu2p1Zbrmu-7TBL73Zf3Rjx3SiyeBjA@mail.gmail.com>
 <1332421678.18717.25.camel@sauron.fi.intel.com>
 <CAHMF36Ews_JmsOptgeo1mWJ-yb0tKtaCtBjozbCqa74ck=FLgQ@mail.gmail.com>
 <CAHMF36FjJcd3au5GWFzy-=vfmM1HViLnZJN-HDeDTLyu9R1fSw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-F3IK6GD/ZP7nLljBs/R1"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-F3IK6GD/ZP7nLljBs/R1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-03-24 at 08:22 +0100, Matej Kupljen wrote:
> To all,
>=20
> after reading the posts on the mailing list, with similar problems,  I
> believe that
> Artem was right already in the beginning where he suggested that I am
> experiencing
> "unstable bit" issue.
>=20
> If you look at the kernel log, the dump of the empty space, clearly
> shows one bit-flip,
> where the first word is read as 0xfffffffd, instead of 0xffffffff.

The unstable bits issue is related to unclean reboots. AFAIU, you
observe problems when you do not have power cuts at all. This means you
have some issues in your driver/HW level. Did you check if your driver
corrects bit-flips in empty space?

--=20
Best Regards,
Artem Bityutskiy

--=-F3IK6GD/ZP7nLljBs/R1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPdb4jAAoJECmIfjd9wqK0csMQAL1cBOZufcaYeW8OXM3GOs3x
rqvxv1vvIw5eex/KZ3ILQhEh7sLW/rXAwzrEDYlgjUI59ZYrrYZfiVzCdmULa9z4
oK8lpB1lEAVY4PdFDK2i9aPMWrYRcvrt8shzNgDnP4XazEoZ+AJ5CFbdF1O/UgzC
0vohd6B4z2S5buHXmso1XXIgSmU/Tpcwm+ZwA0M5ae49yeSkKwY/OHLrYhITyRvw
0hpoP6fPoCJhAlJLkOuBalhxS6F8ZgRlMIyOFzHGo0MA7lSqlnMjy6yGaE+q4PrC
rKrJoGMJ+w96Ibv8CyHUbprgXl/ErBEUhFftX2rafPKbY+3M4ub4gHgVKggoLKo+
zhokI/Eo1RJHLakpwObjMVzIhR6LevVxnNXGVoNhEY7wjFUhUQc6EUSEPfDE8dkx
FHz0kHTBXC3uvVNECoqSocrjOrg60qo22KU0KmZboD8Vq3u1qyxPqzQVPrRLeOCK
2+vE/EYmMcg08Q6CuOE0LTBvEOKCHZ4CTtf2olPVv2rGWb1HPkTTsLL3itvP3Go8
GePAxuTwlRIMPzqm6Lec1L5+oqwnfuM9MVRP5X8/5hiJRUAd4DKZhGw9tDu4QaRl
nmtwIvTcil52qXJd7rV9WJvSFZ0Mav/bQopbSATFMPNQ+y2umrQuESfsRI3m15jd
Rq3pGsMXuzwZmYMLiiEJ
=u0oE
-----END PGP SIGNATURE-----

--=-F3IK6GD/ZP7nLljBs/R1--
