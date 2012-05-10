Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSOpM-0000Es-FT
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 08:34:43 +0000
Message-ID: <4FAB7D70.1040704@nod.at>
Date: Thu, 10 May 2012 10:33:52 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC v2] UBI: UBIVIS (aka checkpointing) support
References: <1336585125-127220-1-git-send-email-richard@nod.at>
 <1336624000.1936.22.camel@brekeke>
In-Reply-To: <1336624000.1936.22.camel@brekeke>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4A472D14821CF0BDA8640FA7"
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4A472D14821CF0BDA8640FA7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Artem!

Am 10.05.2012 06:26, schrieb Artem Bityutskiy:
> Hi Richard, I would like to complain about the names again. I though I
> better give this feed back as soon as possible...

No problem. :)

> Firs of all, thanks for doing this, I will look closer, and I am very
> keen of merging this stuff once we are sure its design is good, allows
> for future extensions and is backward-compatible.
>=20

Yeah.
First of all, yes it's fully backward-compatible. It uses two new interna=
l volume IDs
with compat =3D UBI_COMPAT_DELETE.
Old UBI implementations will delete the checkpoint and continue with scan=
ning...

Regarding design, ubi_wl_get_peb() currently offers three types of data t=
ypes.
UBI_LONGTERM, UBI_SHORTTERM and UBI_UNKNOWN. Do we really need them?
Checkpointing has a pool of unknown PEBs. This PEBs have to be scanned wh=
ile attaching.
For now I had to create three pools (for UBI_LONGTERM, UBI_SHORTTERM and =
UBI_UNKNOWN).
This makes the whole thing complexer than needed.
It introduces also some nasty corner cases.

To make the review easier for you:
The most critical code path is scan_pool() -> process_pool_seb() -> updat=
e_vol().
It searches within a pool for PEBs which are no longer empty and scans th=
em.
After that it updates the corresponding volume.

ubi_update_checkpoint() is also very important because it has to find
unused PEBs at the beginning of the MTD to place the super block.

> So may be just naming your stuff UBI2, having terms like "UBI2 format",=

> would be the easiest? Then someone could make this to be UBI3. A
> documentation section could describe what UBI2 is and how it is
> different from UBI1 or just UBI.

Okay, got your point.
I think "fastmap" is a good name because I can also use it within the cod=
e.
So, while reviewing the code please keep s/checkpoint/fastmap/g and s/cp/=
fm/g in mind. ;-)

I like the UBI2 idea. UBI2 =3D UBI + fastmap.
After the UBI2/fastmap design is stable I will happily write a detailed d=
esign paper
for http://www.linux-mtd.infradead.org/doc/ubi.html.

Thanks,
//richard


--------------enig4A472D14821CF0BDA8640FA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPq310AAoJEN9758yqZn9eJnUH/iPEVCRsCCbajySwTx1bc8Sq
/m1474PrumjB9LzCePlAWlixsQkBf9YsSvDInexHuQWQFc9YS8LbVG/E51qVZM+y
nX6aoS9aVkmKSxtLxm9VAYDJ2VPOP3EO7a0Tlsf7qaA74RdCz8TISUEXdUjCiKRK
YpfylfuZE3bKTRHHp79/8KyotfiUv1QefDLGl9AsjBhka9kbB/4X0EY3t9YZan/N
anqMGbDss8I1ckPXp1Y1MBPZ3pOO+qqi7zMPrGNMciEFHIHMitxry+COzj5slX2+
ZPKM7HL5Wtyz590yePaLjIjYNfdLRqrYFD46BZNK/0TmEaOw/9T2hX3ruOYrmHE=
=7lwM
-----END PGP SIGNATURE-----

--------------enig4A472D14821CF0BDA8640FA7--
