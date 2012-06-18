Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgZkZ-0004Xa-PY
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 11:04:05 +0000
Message-ID: <1340017675.2420.25.camel@sauron.fi.intel.com>
Subject: Re: [patch] mtd: cafe_nand: fix an & vs | mistake
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Jun 2012 14:07:55 +0300
In-Reply-To: <20120609160825.GC6488@elgon.mountain>
References: <20120609160825.GC6488@elgon.mountain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zeGW+D3kpI2c88J/7VPr"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zeGW+D3kpI2c88J/7VPr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-09 at 19:08 +0300, Dan Carpenter wrote:
> The intent here was clearly to set result to true if the 0x40000000 flag
> was set.  But instead there was a | vs & typo and we always set result
> to true.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I do not have the hardware to test this.  The original code is clearly
> buggy, but what about if 0x40000000 is the wrong flag?

Looks like it is the right flag, I've checked

wiki.laptop.org/images/5/5c/88ALP01_Datasheet_July_2007.pdf

and your patch looks correct.

--=20
Best Regards,
Artem Bityutskiy

--=-zeGW+D3kpI2c88J/7VPr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP3wwLAAoJECmIfjd9wqK0sWoP/1OH3OcGlkOVsQOcWZI7SfjI
E/AzO7ghRUULV+FSnmhOZvxBhKSmtJQq1fbV5SwTm+v34ZjW+JNaD16yIOFhZc3K
/+avKjmXqYpXjlrJmctb1d5vZ8NBjOgEFS7rFunKC2OQQJwMOEoc9ISs8zD/tw4R
Kwrqjk42Xi24QUvWYwVKp/mdnc+IAz5QlJZwxlYqXRHmsNR6GINxj7+dhrJ5lwVl
SjUS4mwoalYDupkJjg8pEJZJXJ/jM4M3mGFKtVQJk7t9Xz9fkAUXth2a/3lxk2uL
ctw56v2Chh/KZCDUvPBR8lVLmUJEkIG69EFb8ytgcpm7IVbHf09E+TFs9DYIM8Hu
RxmTv8kc3A6v6BPYlMl7Y7hfronnxFWxpd3PN5MEGN+h6i16t9IZzvayU/Iq5kE+
W2RBIcyneHsH7iZqhMohPznsSlIhz1a6vnoYuo9NF7OjrE+rYc72YZ93lY0N4f10
z6B3qPGGP3+syDaumtScJahsMhoT0nAOGVDDkwcJc6zXLBKVKYcevEhHydCW3aaC
SC1Ocp/MiHy0ymMH8ePjh+YR9/NiBDvHd4RN6VOWCaH0TJZaTzQjRjnbEOMs/5+G
rcVPOvAJjBPRrbJ2qwY6l9Cxx2uGZYSCmVPE/eYZL3s7vFyDrCZALfM9pxGiqpxy
lBUnch+3OeLNyYdAcZYn
=sGhc
-----END PGP SIGNATURE-----

--=-zeGW+D3kpI2c88J/7VPr--
