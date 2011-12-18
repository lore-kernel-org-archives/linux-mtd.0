Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RcFBY-0003Sp-3a
 for linux-mtd@lists.infradead.org; Sun, 18 Dec 2011 11:45:44 +0000
Received: by iadk27 with SMTP id k27so6676257iad.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Dec 2011 03:45:42 -0800 (PST)
Message-ID: <1324208821.17534.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM
 partitions are at least 64K
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 18 Dec 2011 13:47:01 +0200
In-Reply-To: <CAOiHx=nwZ27ByyLDOXcy21x3_NJZKWU4AEJo3m3SfcposAbucA@mail.gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
 <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
 <1324157643.2240.2.camel@koala>
 <CAOiHx=nwZ27ByyLDOXcy21x3_NJZKWU4AEJo3m3SfcposAbucA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-E+Nd6eqYg0UMJjsoC+P8"
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-E+Nd6eqYg0UMJjsoC+P8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-12-17 at 22:57 +0100, Jonas Gorski wrote:
> On 17 December 2011 22:33, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Not that I have any knowledge about BCM platform, but still, I think
> > it is good idea to explain why these partitions have to be at least
> > 64KiB. Could you please do this, just for the sake of having good
> > commit messages?
>=20
> Sure, no problem. Should I sent the whole series again or is a V2 of
> this one enough?

Just one patch is better - less traffic.

--=20
Best Regards,
Artem Bityutskiy

--=-E+Nd6eqYg0UMJjsoC+P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7dK1AAoJECmIfjd9wqK0MIwQAICLA0YfLdDzGAVJRknYBXYb
WP25czqUN/5tZ4jUbasSfQp/WTGyDOL6aZljCJaJ2FXDtYYNoZQgB7+i613Nn/gu
wwdRphbrjqxhfxqzSLliBxp5ltyr5Dbi6nhCSx4Yx8PIfsuG7B9gvUDfvrFnaQRc
2r+zaYnoTIINS14wwRC0KXaXGTxRnyMJryyH7BYqhTtN23Plb4MfG6uNgmScv9+8
5+pwK+dFloEAitgbhU91/wfPtp6+zdJUTwWP3bQS68GopZAf/+1UFmzOs/+fMXNV
EnBGKu9Tqedg0f7Y95xr5w3Hp6NjZYsuN/Sh3i2vxnaIyFLt0g9IOPjaJCeX8jNZ
K/jlAluVi3jnYCB0aD7siljdR+7k5NEjSBeT6EyfaRm6a71OMTFSKN3+drmf6Dpa
EYMjuL/Ic/DZtGtKoDggF8ZVSDv1pIkagSFnQz2gBmpkrDsl9nM6BozeAfXStjCh
aMUXGUMSFmzJ4ST4MoMJstJdZ9lWZkOOVhwCoYgl2ViR/Npgp5lzzIwdqy4kzHjT
oOj874RuyL7QAVqYsf4sva0F2XhGhfPEr0pHYfpAT7xGj2EY9416tbfKeXcYDOLl
KvRXZjYmxtN3Fo9oH28e9cTZ6RmqGlczI8h46tyF1/hKl8YIO/KsbefNUnO9Bv8t
Z3dOcwd3UPX3cvEGGJLV
=mlpg
-----END PGP SIGNATURE-----

--=-E+Nd6eqYg0UMJjsoC+P8--
