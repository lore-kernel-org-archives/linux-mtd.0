Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIiqf-0004Fo-AR
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 15:55:46 +0000
Message-ID: <1334332724.13160.3.camel@sauron.fi.intel.com>
Subject: Re: Oops with mtd_dataflash driver in 3.3
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Will Newton <will.newton@gmail.com>
Date: Fri, 13 Apr 2012 18:58:44 +0300
In-Reply-To: <CAFbHwiTfaXOFX-WYWeyisK4WCiXBRv_LpEcoR=v8qvsLAO7FJQ@mail.gmail.com>
References: <CAFbHwiTfaXOFX-WYWeyisK4WCiXBRv_LpEcoR=v8qvsLAO7FJQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qzFw5Ig+c5rqNju9r33H"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qzFw5Ig+c5rqNju9r33H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-30 at 11:51 +0100, Will Newton wrote:
> Hi all,
>=20
> I'm seeing an oops in mtd_dataflash.c with Linux 3.3. What appears to
> be happening is that otp_select_filemode calls mtd_read_fact_prot_reg
> with -1 for offset and length and a NULL buffer to test if OTP
> operations are supported. This finds its way down to otp_read in
> mtd_dataflash.c and causes an oops when memcpying the returned data
> into the NULL buf.

Hi, good catch, thanks!

I've added "Cc: stable@krnel.org [3.3+]" and pushed to l2-mtd.git,
thanks you.

But note, you should add your Signed-off-by when sending patches.
Also this patch is line-wrapped so I had to do a small surgery to apply
it. Try to save it from your mailbox and apply with 'git am'.

Anyway, thanks for the catch.

--=20
Best Regards,
Artem Bityutskiy

--=-qzFw5Ig+c5rqNju9r33H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiE00AAoJECmIfjd9wqK01V0QAMotT7Exr2iiicQZ1RMar3Xn
noUWsgCkEBFDDCManJikjYhvHblKMwOj02SPfoPzQbA+7aQ1I/ShHZ38BeeTB2h5
xk+++MtIr3BovXisXRacSf8OsOMSxE7kc8b5NDqoMaL2wBuxr64O0ytcjza0GmZF
C6KjA+rwNy0vFVR8RfmaRfzi8j8mRnZP2zKxcX0kVYI9Ohdh9BC2jaBzoh0OlJpx
j/Vh1z9Hq/T/tM0no+GbrOr9fIvQ241koqb3qPAr9QRSRdn82Wil0H++UOhP2nSm
n/LHIX6GqeAHgRlGNUmJba7sBrHMcnU7HNuxdNMPpBaDRn1vHLSSVFXQyYfU43hI
5TbqQ/HC8ORe9/l/1WaZO4M4ifQtY4Qf00ParXvjLRa9VXZMN53L1X2G18w8HIUR
6hDi1hYdFl1v4B9OXZi1ESmDn05T+QegUX4qKG1ZwyTVGQ+Ipm5Qmtd8dCyS7Wv6
HrSxG0zLlbaDKF+FKPhpjgfIZKvvJYWr0SovqQntAyAHSgdVbqwBqiQfBdIa2s6z
CtwagXs7qc9Hyp2zLu6jKSx1Bt5MpA22+mGB7R/4o4XklSiy/8JoIOX/TKUzVfVh
Bg815px477QiJpCquF6Mbk9uBPrOK9MepKd0HOPjcqiFnuPbtx3E8Uewshr/GtIF
NN3x+TcFpzQaTDK6uOQZ
=nOIE
-----END PGP SIGNATURE-----

--=-qzFw5Ig+c5rqNju9r33H--
