Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjpz8-0001VY-Im
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 11:00:35 +0000
Message-ID: <4FEAE7CD.6060803@nod.at>
Date: Wed, 27 Jun 2012 13:00:29 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi_update_fastmap: could not find an early PEB
References: <201206222005.02308@blacky.localdomain> <4FE49E19.4070005@nod.at>
 <201206222126.12515@blacky.localdomain>
 <1340794586.29342.52.camel@sauron.fi.intel.com>
In-Reply-To: <1340794586.29342.52.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig29E1A5ADC7FB340F2D927D5B"
Cc: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>,
 Alexander Kaliadin <akaliadin@mvista.com>, linux-mtd@lists.infradead.org,
 Rob Taylor <rtaylor@mvista.com>, Pavan Jadhav <pjadhav@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig29E1A5ADC7FB340F2D927D5B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 27.06.2012 12:56, schrieb Artem Bityutskiy:
> I've just pushed out the latest work of Richard to the "fastmap" branch=
,
> should be up-to-date now. Thanks for feed-back, testing is very
> appreciated and certainly should help merging this faster.
>=20

I'll send another patch set today.
It contains only minor coding style fixes and such stuff.

Before fastmap gets merged I'd like to have a discussion about fastmaps
parameters.

/* A fastmap anchor block can be located between PEB 0 and
 * UBI_FM_MAX_START */
#define UBI_FM_MAX_START        64

/* A fastmap can use up to UBI_FM_MAX_BLOCKS PEBs */
#define UBI_FM_MAX_BLOCKS       32

/* 5% of the total number of PEBs have to be scanned while attaching
 * from a fastmap.
 * But the size of this pool is limited to be between UBI_FM_MIN_POOL_SIZ=
E and
 * UBI_FM_MAX_POOL_SIZE */
#define UBI_FM_MIN_POOL_SIZE    8
#define UBI_FM_MAX_POOL_SIZE    256
#define UBI_FM_WL_POOL_SIZE     25

Are we all fine with them?
Especially the size of both pools used by fastmap needs to be discussed m=
ore.
If the pool size is too small UBI was to write the fastmap very often.
A too large pool means that attaching takes longer because fastmap has to=
 rescan
more PEBs.

Thanks,
//richard


--------------enig29E1A5ADC7FB340F2D927D5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP6ufNAAoJEN9758yqZn9eNPgH/RvUlQvLLLOy99bZt0XFYV0E
zptUo8WQvOmiJqZxkAshTqRGex14UHycObySrJ5EH5c94vKKto1jvcd2sE0vThPo
26El5AnCM6wP0wVjDy3O/wI0XfkEtgHD05uJgnreMLI5eHowYcEPY4ruoB3Np/sj
xyB8FxqsvEHzs3F2x4rNRCc9+jWfXMUurBxbz807cU3yqrLCjX8v8vpya+/8ivHO
rSfmjs25EXod+zl+JjTYqciJpNcZMC3lu4bJA4r/05o7IsXnSMSuCNTmdxbkVhp5
1HQtDHiIJHRG8LQvk8ePobbwwEocCQMQSzuzOuhP24yDC+LcghAfrja03n+PHC0=
=Xcqg
-----END PGP SIGNATURE-----

--------------enig29E1A5ADC7FB340F2D927D5B--
