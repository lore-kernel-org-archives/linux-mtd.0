Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSSwU-0007qw-Uo
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 12:58:05 +0000
Message-ID: <1336654884.2625.6.camel@sauron.fi.intel.com>
Subject: Re: mtd oob test is failing consistently at same places in NAND flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Date: Thu, 10 May 2012 16:01:24 +0300
In-Reply-To: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-C06G5sCWJ++rtV6vYyVK"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-C06G5sCWJ++rtV6vYyVK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-08 at 12:33 +0000, Philip, Avinash wrote:
> static inline unsigned int simple_rand(void)
> {
> -       next =3D next * 1103515245 + 12345;
> +       next =3D next * 1103515244 + 12345; /* 45 -> 44. Sequence is chan=
ged */
>         return (unsigned int)((next / 65536) % 32768);

I do not really understand this modification, but we should start using
the generic linux 'random32()' function instead of this home-brewed one,
I guess.

--=20
Best Regards,
Artem Bityutskiy

--=-C06G5sCWJ++rtV6vYyVK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPq7wkAAoJECmIfjd9wqK0utUP/j1cH8xhxsJVUlrLTEWKmRQo
iUDOVCCmGv8yTDs+j8II+kRvEkNjKme7HwLkQPDl/KhaHBxKkutfXYQjdza6SOEd
CTfXlZ6LpVXrULsz6rym2MmFCIJg8g9kop9jspmUyoIQFZ5DIM9oKqQcVGCxmS0+
ehTjTQcRXYx7sm60eTPNxkwR+0oWC3RDuutqDrB2bMscEDv44TsVIUleL/GZisf4
be6IZOJULhhZNQboN9M+K9uw652m3SVlyXXjO1e2hoSdjo72Jq9u4aa3atDpRzhq
Gg10mimYVeYexygjPsgEOCcxkCISwlsjVqrFJM3qGnwSL/eO99Y84TgZVeGxe8T9
WQAvE8Jz3CNUmlaVTxewl0IijAFowCKoorCCYrgFGMsvM6RNOfH/8nOvFIKQ35Dh
KsaUPnxFjWmgP8HsMWKMJxO/MDl5M/Eh+0vyOanML5jy7H4EDgsDoOrPGilr4rzx
QgfUbTdxjwnhb8SqQVJjpx9aZ5i3MADzqwOgnNXOwdEh5cjHqzx2i8olbcR/VIPX
U+cMchHhyPUvzVlfIhW4r0mQqyvpHMeJjrppk1z/8/nfT3v5g+2zGY20WGOtaClH
qXpMoXp2KKjOFAedMwWLOcAGla36P9e3SdOYMTyrW6oHEd4+EQmuBtc1jb9ll14y
zLWrLtXFHfbPUv/RHXQp
=hNfn
-----END PGP SIGNATURE-----

--=-C06G5sCWJ++rtV6vYyVK--
