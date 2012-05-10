Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSSue-0006Ra-No
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 12:56:11 +0000
Message-ID: <1336654770.2625.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [JFFS2] check xattr data integrity during first GC scan.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Thu, 10 May 2012 15:59:30 +0300
In-Reply-To: <1336480911-16707-1-git-send-email-jcd@tribudubois.net>
References: <1336480911-16707-1-git-send-email-jcd@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Wttwc/eFSXTitb1oMUJ3"
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


--=-Wttwc/eFSXTitb1oMUJ3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-08 at 14:41 +0200, Jean-Christophe DUBOIS wrote:
> This patch allows JFFS2 to distinguish between a recoverable
> and non recoverable errors and to act accordingly.
>=20
> Furthermore, extended attribute integrity is now checked on
> first GC pass (at the same time as the file data integrity
> is checked).
>=20
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>

Please, separate out the error code stuff and the checking stuff.
This should be at least 2 patches.

For the error code part - make sure you checked that the
JFFS2_XATTR_IS_CORRUPTED is never propagated to the user-space, if you
have to introduce it.

--=20
Best Regards,
Artem Bityutskiy

--=-Wttwc/eFSXTitb1oMUJ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPq7uyAAoJECmIfjd9wqK0j+sP/30EfL0s0QTOdYFaSrYQ5yDr
4Jk/TX1EzgdhTIgTnj4YqxuvuAnZ85AlAwM60YJ5b687h39cjfG80NJxuhlg10Ab
xOebgrlKom+h8ykjPKite9pTUsRfawFvL5X1RNTLgDKJ+Wno0v/r9ia6IRw2w0i7
98kHoiVfAq3LSsKOK/jQi/+tBv2H2NyxkrBcxEKPUzgz5gMMgCK30QceNAKRYS3C
d65lSet6j0cwuyWEXyb7bS0c3+Vuxx7x+bD3I4vga36oeT13Ldb+ZT8Ud1n/Y6A5
o/yWfUZO8MGgOOoH6KkjF6+Qk2MKFrlXMlMiPUnojBWlyS9o3CR7kxAkWXQFjV7Q
u8aSABOSYUMeZJjn0dqEFWmXIXWKgksgr9Niz/wnluFjyMtaSrElslkOTilM21Bw
Qh6x9yip/gvTryRz2+Q4h873LM9mA6PHbb7xskBbkym129AQenxGym0AAIu7Zbsk
LSr96fhEkxCHvqlvjkrtYUNu8RP9Hpm+uuHyLISo1vcnmhdXbYkEf3xItIUBs74p
fFKYc2zrelZLXpsjHZpYci32eleRJI1fiq+HISRvGWgDJgdqM9dJKb2RHda44lFK
d5rWTi+IwqXlW23EYs1yHOD3cdJjKk52Tl5YArQ0qzPfAhfI4OJeng8M2msKqRq2
L3xj5L0GAbNMkF3YPZU+
=fTnr
-----END PGP SIGNATURE-----

--=-Wttwc/eFSXTitb1oMUJ3--
