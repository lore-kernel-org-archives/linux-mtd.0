Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDatJ-0001CX-Ph
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 12:25:18 +0000
Message-ID: <1333110503.5440.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: allow atomic updates to sychronously erase old PEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 30 Mar 2012 15:28:23 +0300
In-Reply-To: <alpine.DEB.2.00.1203301413080.10066@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1203291653210.912@eristoteles.iwoars.net>
 <4F748CD6.4080704@parrot.com>
 <alpine.DEB.2.00.1203301413080.10066@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mLT6mqtNlrtp49xvwOi+"
Mime-Version: 1.0
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mLT6mqtNlrtp49xvwOi+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-30 at 14:20 +0200, Joel Reardon wrote:
> Hey,
>=20
> If there's a power cut after the new version is written and the old one i=
s
> erased, then it is my understanding that while remounting UBI will detect
> that the old version is not needed and put it on the erase queue.=20

Yes.

> The
> higher layer that issued the call to update the block will have to do a
> blocking clear of the ubi erase queue when remounting after unsafely
> unmounting.

Yes. You can do this if the security is enabled, I think, using
'ubi_sync()'.

I did not have time to look at your patches, but one quick comment is
that we usually call the argument which controls whether the function
has to wait for the operation to complete or not 'sync', could you
please follow this unwritten convention as well?

--=20
Best Regards,
Artem Bityutskiy

--=-mLT6mqtNlrtp49xvwOi+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPdabnAAoJECmIfjd9wqK0ybEQAJmAvxPe6WkfwsjGF+QcNEmn
bmCKzFL7xC3BSOlh4pSADsVzQpr4ZPTfd5xMkWGRjeyEhZB0UeAtlC32j+A9EGXp
AtBACQdJHz2sRnzKBZuYXzv7zoZ+yXAdrrn1G7Qn8UZ3tmTYNZtB/blHxjfz6uL+
vS0mXO1KN0289nfecYbRt2IstgDkKvopmLNUjXN/mJAe10pB+qZyP1JJRroBpiH/
5YkkvPRZVlDF/MknGuE6Um8O766gAofE944VAVLiimZPvsPiQOp/PzaT37cvgZce
3I8Vbd//eE1w9vg4mAxvjD9yydhrUclhPjtve9RGGXraeysKyhXVEAg2528oXZTQ
JZbBVKAo/X8XgUJ2EhTX5fysaAnxS3gBvtbqQThrwmt97vgGdJp2pOtakKAAcizP
tQMinnC3kPna5URTRw5ffQykkctJBTrIvu34KuAGHxXjgllIvKj9rPSjdtHPpw67
PMrAsydIwomhY3LgDm/thHAS1IZqSePk/JbKJbZ0AlIYpzmx9NvVbqzBmMt+xpmj
z20i7FSy+UWI0Sc3JyVLKRgBxWygCgNrJPCJYGAJFM9dneCPJZAbhrkTG0gkEqJ5
OzaJa8/8EGAA9HciIi2UIIU62PZlSTKqYLi/yJobD+QiyJ/mNC/cFK39P5DgwAzA
2Mi0nWtJyqTknt9yQLQF
=AIxd
-----END PGP SIGNATURE-----

--=-mLT6mqtNlrtp49xvwOi+--
