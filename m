Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScNnx-0003Ii-NS
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 21:30:17 +0000
Message-ID: <4FCFCBE3.9000508@nod.at>
Date: Wed, 06 Jun 2012 23:30:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/5] UBI: fastmap: kill junk newlines and add a TODO about
 that
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
 <1338909119-5188-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338909119-5188-3-git-send-email-dedekind1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigF1CE97D8FC582E4C77288E0B"
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF1CE97D8FC582E4C77288E0B
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 05.06.2012 17:11, schrieb Artem Bityutskiy:
> +		/* TODO: nitpick, sorry for being annoying, but this should not
> +		 * be difficult to fix. I find it very irritating when there
> +		 * are useless blank lines like this - they only make less code
> +		 * fit my screen and make large functions even larger.
> +		 *
> +		 * Why we use blank lines inside a single function? To make
> +		 * code more readable. How we make it more readable? By
> +		 * separating logically different blocks of code with a
> +		 * newline.
> +		 *
> +		 * What is the perbose of these newlines before goto's? This is
> +		 * a single piece of error-handling code - you assing the
> +		 * return value and go to the further error processing. These
> +		 * newlines serve no purpose just blow the lines number in the
> +		 * code. Could we please kill them globally?
> +		 *
> +		 * I am again sorry - probably this is not completely
> +		 * technical, but I gave the explanation why these newlines are
> +		 * annying. And as a person who spent a lot of personal
> +		 * (non-paid) time maintaining this code and who will keep
> +		 * doing this - I think I have right to require to do such
> +		 * cosmetic things :-) If you do not agree with my reasoning,
> +		 * may be this is better - you'll keep me happier :-) */
>  		goto out;

Your and mine coding style are quite different. :-)
I *hate* it when statements like goto and return are glued to a code bloc=
k.
E.g.

a =3D 1 + b;
res =3D c + a;

return res;

vs:

a =3D 1 + b;
res =3D c + a;
return res;

Anyway, I'll change this to match the UBI style.

Thanks,
//richard

P.s: Can we please have a ubi_checkpatch.pl? *SCNR*


--------------enigF1CE97D8FC582E4C77288E0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPz8vjAAoJEN9758yqZn9e1CAIAM5zJLEoAcmviNv+49qFk2qi
gP/Xxcx2UgSUKy0Husmo/+mgZAVXgsZdQ0u1Oz1DeJjBqN90h4zkCJJPK81csYux
gq52EjQ/sDilBcI5M7/MuflBro24d8qbCcvfDF1MkyLjFnco1xyHVWY+il4ijtHj
abbHkubfziyfgBQQ3+wC32i010l6/muj7c0S983SiIshC8jcM32C3m/yWZ5JPnqE
jqSmu7HhGYqjBT/tS2Kb/mL5cv0eO4UtSDQwqPb9TzS3HEYA43+WldjISPt11Iad
uU1XItqdftv7D9dhbmZM0V8cq4tcZrWpxKqvCeg6XnU/Nv6JnIxig+vb0vbOFQI=
=WqCF
-----END PGP SIGNATURE-----

--------------enigF1CE97D8FC582E4C77288E0B--
