Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMGsn-00038o-7J
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 11:24:55 +0000
Message-ID: <1349954707.12014.14.camel@sauron.fi.intel.com>
Subject: Re: GPMI NAND crashes with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Thu, 11 Oct 2012 14:25:07 +0300
In-Reply-To: <201210050345.49507.marex@denx.de>
References: <201210050345.49507.marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0eh68L8dpxlxu8GFoPv3"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0eh68L8dpxlxu8GFoPv3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-05 at 03:45 +0200, Marek Vasut wrote:
> Hello guys,
>=20
> I tried integck from mtd-utils 1.5.0 on GPMI NAND driver since I suspect =
it=20
> still has issues with UBI. See the outcome for yourself, log attached. An=
y=20
> suggestions would be very appreciated.
>=20
> :~/mtd-utils-1.5.0/tests/fs-tests/integrity# ./integck /media

Wait, you have power-cut emulation enabled, did you deliberately enable
it via UBIFS debugfs files?

> (pid 492): power_cut_emulated: failing after 19403ms

^^^^

--=20
Best Regards,
Artem Bityutskiy

--=-0eh68L8dpxlxu8GFoPv3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdqyTAAoJECmIfjd9wqK0IyUP/RNp7x0CccHggDrLjViO/D6f
mqwytu8tcdnCBACPPJMKa402xbJsx+qajRm/MzE/vHgPcuqOaUeiR+NMP8/cNhhG
3zixf2YkqornTtcA0YRBA7NAqAWOdBY74P2kmPWA/++5Ht//J5VtCC4rnhhDYCkU
I3MeBM4V78qL/7yFYYNIg6Yj5JLhuYifREm54RxmFmAsWqf4XOL+0zMqnjo6rhbC
n3YaJ/sLnj0fgAYwz6ELIscQ+a8R/QCsmnIqfkvyFdsICJFbtAlmW6+IGWUMQAJV
XkFjItcc/5CK3LEh6+fBND+5191rB+JODv0Pf/bS09r/X9fY4h32tIxIFDTfQWKI
VNklFSoNQYgCEasojlJYUHhOgA4+3W2h10PTyYWWJ5rizlpyZnfrbBnaRJSTAaf7
8UiyQ8Fj3mlZzkDzC7F7uRgvj/HOoZDIT58Q/AxfmiVou37MHTmmNQgZmuFfqAVK
m3m6Ggzfz+TCJIwh374YOaOoZx6fT2Z4vjZW0sPnF+YPTeCP8AcaxzleJPVu0DwD
e/7LIIQlhDKouHsxv4W+Xexqakmbr+32Cj0H/zx6qVjlBSgWARf3grknDr3sKSKu
NwozXqDIuNy4RDig88SHchFwP+Dl2KAIMa6EEiSz21xRAXn6C5V11Y28LIPP+Q/r
su53xd70sPTl5GM8Ml8y
=k3bh
-----END PGP SIGNATURE-----

--=-0eh68L8dpxlxu8GFoPv3--
