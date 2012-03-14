Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7n9D-0000vv-2n
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 12:17:43 +0000
Message-ID: <1331727617.3730.5.camel@sauron.fi.intel.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Wed, 14 Mar 2012 14:20:17 +0200
In-Reply-To: <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iVTXLP+c0y8T1CEN9cke"
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


--=-iVTXLP+c0y8T1CEN9cke
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-14 at 11:01 +0100, Matej Kupljen wrote:
> Here is the first results of the mtd_tourturetest:
>=20
> [84703.428000] mtd_torturetest: 00010240 erase cycles done, took
> 2054461 milliseconds (2054 seconds)
> [86757.800000] mtd_torturetest: 00010752 erase cycles done, took
> 2054365 milliseconds (2054 seconds)
> [88812.120000] mtd_torturetest: 00011264 erase cycles done, took
> 2054319 milliseconds (2054 seconds)
> [90866.352000] mtd_torturetest: 00011776 erase cycles done, took
> 2054229 milliseconds (2054 seconds)
> [92920.496000] mtd_torturetest: 00012288 erase cycles done, took
> 2054137 milliseconds (2054 seconds)
> [94974.508000] mtd_torturetest: 00012800 erase cycles done, took
> 2054008 milliseconds (2054 seconds)

Well, it is still good to run it for few days.

But then I would try to do UBIFS testing in some limited environment to
exclude a possibility of some process writing directly to /dev/mtd and
corrupting data. E.g., testing it in a minimal shell.

--=20
Best Regards,
Artem Bityutskiy

--=-iVTXLP+c0y8T1CEN9cke
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYI0BAAoJECmIfjd9wqK0FzUP/35j2LI6GJDUpljImHLTg7m2
7xuDl1T/Nbzejiq5qyu+v44pI2g2dpulJbN3VR+daiYiyqHtFYjATILMHyj2xbHx
fHsGmxUDk0RtboE5lWEMD8aUYcOcJPMNDPkPI5aTzc8JhsvR4z3pcszcGPhHB0dt
MlzNGSVAY1tzLfq1MmFQnFaDEGAlPWo+ola9hr0buw17M7N+M6stB5bM9gUQp/o4
EzmrLbPO5OO9fePMwnAbYqbzOsFUDxE2fxycUEBkRbiTV9/XzI9Cv2PjF6lpbdgE
i7j430FE82Hx/sK+P8v25xGQ4VHOD9ha0QOSaRgOuesp4SgOL/V1b4nTwr0K8T7g
lca0WU7R08/tjic7T6SqAqO8HPJSmyfQRTfrIpnjuHRbA2P+H5pfob6m94OuWvwE
wH15SFZEWd+XGd+cGcU5s6Bg+dUW74oK0sqLTgCNhcEj93A3POD9JNTq5fuiONgB
hjGM7Ylhbiri2qcIU/V6hwgglmBo4shAPwMq4kcn8do/B/JR194Qh7+cbhXCjiuD
47bGa4OBOT7ERsXGGo9+JymBx7dYI5RO3bdnzURaJmCyG5Yu4gQnfMpfd8ok9sj9
0AA6PsDzAGl6CjkOBJTz5uHaIuzLdTHqVA1VlWmO5B/M28cS8MsZFTCenfD1mYIz
klbQiQg1KSSafdZUgmyb
=HqD/
-----END PGP SIGNATURE-----

--=-iVTXLP+c0y8T1CEN9cke--
