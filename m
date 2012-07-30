Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvqT5-0002xK-21
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2012 13:57:07 +0000
Received: by bkcji2 with SMTP id ji2so2949072bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 06:56:53 -0700 (PDT)
Message-ID: <1343656610.1513.14.camel@kyv>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 30 Jul 2012 16:56:50 +0300
In-Reply-To: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uG6B4i+BHL3NFqZ5ld7a"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uG6B4i+BHL3NFqZ5ld7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 11:05 +0300, Shmulik Ladkani wrote:
> The existing mechanism of reserving PEBs for bad PEB handling has two
> flaws:
> - It is calculated as a percentage of good PEBs instead of total PEBs.
> - There's no limit on the amount of PEBs UBI reserves for future bad
>   eraseblock handling.
>=20
> This patchset changes the mechanism to overcome these flaws.

Hi Shmulik, I've separated out the defconfig changes and pushed patches
1,2, and 3 to the UBI tree (the master branch). Patches 4 and 5 are
already merged upstream. I did a couple of minor modifications in
commentaries and messages and I think in variables declaration section,
nothing else. I'll send you the patches separately.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-uG6B4i+BHL3NFqZ5ld7a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQFpKiAAoJECmIfjd9wqK0370QAJ47jjlq84OeWohUwRWazx7O
h43ZJ7ArGPYZuUQj69G1W8wxv3y5O1hMQemmxkfcYVCBwtCly/e3gxY50rDKLNPm
ZzpqxkVX49YxQKRpP7P0URRNEqtNPWDBs2ivplTbjwzkLTNYgl7dbkX3v4fctEuc
m0CPkhODAsKttb0U1NnyjrU9pVIgi4ycXGG18C+eQAYpmoz2RFeT4mXrn8cKcd+B
YUSwa6XJuEMlBYzRjdOA0EdnrgM4Rn58+1eqgfNgnn00XKR9PP8hLXF1Ge8rkN88
bp7dJusDfzkIaQTCYlrJDPsfIIEwrpXp9f7s2kMVQ7nCLc2Oxswzj0ixGrwbnW98
JXC1/L5jA5Nsu/9yopU1vkNiutxI6vnVVBho6LP3unmwhx6kQgKuoTtv3fO9jYpd
ZFIyjQNpsE0TSF7aKbf+6sIFLUMF1QfuS+ZbxAox7W8HOaX3EGqBjVQR9k2FfE9D
m+cfUaEx7DAmV5hE6RlojxNYu5W5diF16xlcWLTtdQCv/kcqyTQg54RnP/aEDlmr
dhOtsUDPAIwLreN9L71r4SrsNL167bKaykWnfAnjI68zqJDhFJ6hZVGTcLmsaMC/
8kiuNs5RjrXcq36TUSmEvoxousRSaxmwsFr4BwUQ9JEPG3stBWQJhefoclKz+mS5
06SBpF8Zp3WGHMw3LlME
=JMn1
-----END PGP SIGNATURE-----

--=-uG6B4i+BHL3NFqZ5ld7a--
