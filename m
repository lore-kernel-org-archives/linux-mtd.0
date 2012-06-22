Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Si7o0-0001Mb-6s
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 17:38:00 +0000
Message-ID: <4FE4AD74.1040907@nod.at>
Date: Fri, 22 Jun 2012 19:37:56 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
Subject: Re: ubi_update_fastmap: could not find an early PEB
References: <201206222005.02308@blacky.localdomain> <4FE49E19.4070005@nod.at>
 <201206222126.12515@blacky.localdomain>
In-Reply-To: <201206222126.12515@blacky.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig32F92E6B9D117C195DBC962F"
Cc: Rob Taylor <rtaylor@mvista.com>, Alexander Kaliadin <akaliadin@mvista.com>,
 linux-mtd@lists.infradead.org, Pavan Jadhav <pjadhav@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig32F92E6B9D117C195DBC962F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi!

Am 22.06.2012 19:26, schrieb Nikita V. Youshchenko:
> Where to get that?

git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v12

In the meanwhile I had the chance to look closer at the issue.
The previously posted patch my help, but cannot help in all cases.
It can happen that a freshly created anchor (aka early) PEB will immediat=
ely
go into a fastmap pool, such that it cannot be used as fastmap super bloc=
k.
I'll present a solution next week.

v12 has another issue.
If your flash contains bad PEBs the following WARN_ON() in fastmap.c will=

spuriously trigger:

        /*
         * If fastmap is leaking PEBs (must not happen), raise a
         * fat warning and fall back to scanning mode.
         * We do this here because in ubi_wl_init() it's too late
         * and we cannot fall back to scanning.
         */
        if (WARN_ON(self_check_fastmap(ai) !=3D ubi->peb_count -
                    ubi->bad_peb_count - used_blocks)) {
                ret =3D UBI_BAD_FASTMAP;
                kfree(fm);
                goto free_hdr;
        }


Instead of ubi->bad_peb_count it has to be ai->bad_peb_count.

Thanks,
//richard


--------------enig32F92E6B9D117C195DBC962F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP5K11AAoJEN9758yqZn9ee28IAI2HaYbhzRFuNdlj3Fbt5pXo
x7xBNrXcpQkRKJMEbFYsTXsOrNooTFt0SJbGZ/VG8QUSKUUTo16hHq4P9Nu047o4
XPVFIO5t9DJV/4ZBf9T0uesFokKO6lsKA1qdfxIVZHfjEb/ZUr79K1ATYtUNSTTn
BydL3OHUsq8emmnqZOQDOGnRL7dEKjGyh1NPpod73SB9M6I/KkakKGo2YYKU0EPE
hkPHYHUzMhGbcELlVlkkACubsd20U1l3VusY5tePS3g92bT4PWXJz8uDJyAsWmgR
nYJcbJ77rZFXN8xYGVb9QwADdOSq1gde6yFre8OGFscIrL1bZdCaXYlGwSQZuqg=
=8uBd
-----END PGP SIGNATURE-----

--------------enig32F92E6B9D117C195DBC962F--
