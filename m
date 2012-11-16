Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHJm-00077h-1A
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:30:30 +0000
Message-ID: <1353054666.3618.6.camel@sauron.fi.intel.com>
Subject: Re: UBIFS error (pid 564): read_znode: bad indexing node at LEB
 484:66064, error 2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Micah Anderson <micah@riseup.net>
Date: Fri, 16 Nov 2012 10:31:06 +0200
In-Reply-To: <87625h85fd.fsf@minnow.riseup.net>
References: <87625h85fd.fsf@minnow.riseup.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kNyzu06N+BosBIbotFbl"
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


--=-kNyzu06N+BosBIbotFbl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-07 at 16:32 -0500, Micah Anderson wrote:
> I had a power outage yesterday. When things came back and I tried to
> boot my guruplug, I am not getting the following:
>=20
> [   97.273764] UBIFS error (pid 564): read_znode: bad indexing node at LE=
B 484:66064, error 2
> [   97.282188] UBIFS warning (pid 564): ubifs_ro_mode: switched to read-o=
nly mode, error -22
> [   97.290431] UBIFS error (pid 564): ubifs_budget_space: cannot budget s=
pace, error -22

I'd need to see entire log, no -ENOCLUE with this amount of input.

> The filesystem is read-only and I can't seem to figure out how to get it
> out of this state. As far as I can tell, there is no fsck.ubifs and I'm
> at a loss at how to get things back to a reasonable state. I found the
> 'nandtest' command, which might be useful for mapping out bad areas, but
> I'm not going to run that without a better clue at how likely I am to
> brick things.

No, there is no recovery program, the file-system is supposed to always
be mountable. Please, use mtdtests to validate the HW:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

--=20
Best Regards,
Artem Bityutskiy

--=-kNyzu06N+BosBIbotFbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpfnKAAoJECmIfjd9wqK03TMQAIXNkJG5V8Hw+NGG1QqLnVIE
xF5uJ9M+Tduz9sZGCNX7gRx3FITVYOA2c/txN9li6cYu9sX0Jh/0SgClQQ0nem3Q
FIhGORyVmQ4rGmN0SrQ70W1ISKsmFUKPycHuP3KJRpNqfU7+piJynknySSh1lPbQ
xg3EBlNI/tIcsMI1RsI/GsOPVyTg4CLqe5qy7H0Hky0Des5XbTsbaMfeUcDRK+zQ
JZHmhFgv5f6ShOdyCLPpERxIpoJOnXJRaysJt/Nd908ImtheESQ8GPwSDrJM1j6J
yybzKlY2gbroNGxGIa59E4Jv3o6JOWBIAIcMMPHAuWoDY5Sk/YEl8wCKu2WXaijQ
TuokfW2/nhOTzQgvTsKX8D2G+pFWUBTJPpPebNpGnhVZ2cKGnR0fMHRl1aTuLgHX
zM9zzo2XT4QY3TcyBnVK8sQJuta/eiWKBEmF1gHdY8iL8wXZNM/AtfWfB4n7ybb3
ewHihtNQkfHjzS6e4jB03vGiADBDoWYKxHCGhsZxdzYIvskOuEvjUed//SB9l1C6
Tm15PABPof9ZyyJiv3dS1+Sm0hXXIScqfu284slPz/00PhyXEV+Qr0BcaoN3C+ux
NYKHFPDImknHTXRn3Wg9ZDtDjugdk8a0Y0oZC5E0a29VQ06Fxeeo9TZCiYPpynVA
2IvYjk5xkh2fbHgS+lit
=uVSG
-----END PGP SIGNATURE-----

--=-kNyzu06N+BosBIbotFbl--
