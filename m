Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7n2S-000076-WB
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 12:10:45 +0000
Message-ID: <1331727138.3730.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 01/13] nand/fsmc: Pass partition information through
 platform data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Wed, 14 Mar 2012 14:12:18 +0200
In-Reply-To: <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
 <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RVkra5OJjpv8lVgzQTTO"
Mime-Version: 1.0
Cc: sr@denx.de, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RVkra5OJjpv8lVgzQTTO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-14 at 11:47 +0530, Vipin Kumar wrote:
> +	ret =3D mtd_device_parse_register(&host->mtd, NULL, 0, host->partitions=
,
> +			host->nr_partitions);

This causes a GCC warning about passing plain 0 as NULL. But I'll amend
the patch myself and fix this.

--=20
Best Regards,
Artem Bityutskiy

--=-RVkra5OJjpv8lVgzQTTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYIsiAAoJECmIfjd9wqK0YhcP/jWSY2TH44apfrIdzOuACSuf
Q0EkQErYeK7XIHUmpNQACoDDNrt6ayfajOHnk9guGZfj70CibjNzu/9BZ8y8Te6U
07xtiernX/iWRbsD0E0oVWbbtgnL+0USOI6lLJtxmPkvi86KJ6alY99O9oHdPbGQ
dqiuIqw/sGkNJSQZ2U2lNFyWgTQSaJ7bLw32BB2B7MG5LCUhcMbG8hzAIvtEgc5n
0l/HatQlZlSj9kJB0SfDKhimFFlMuqSOsSOa5NYqUtvHfHq4isAClTzGNEs9yfiP
TL4T6Op9gRgsR3ecMER9SxT/PA9kFQv8VXMKbD+6wTscUFmLfay2X05aAiaPT9qA
zyGzLIgvr3xTcBVFin+IrfzoenHJpTwoyYTEfVak+h65tovP6i2wkYRx9B2qop9A
ShOgRf/ASnxCEbZgljT6sfU/YspIPmUsjrVl2YZ/MWiGB+uVrYKHou7li4bf3oBN
qJMKiLiEUXjgq7MDnOmQ2YXLIxKyGIKEJG+ztl2QOhW/G9R7n6Nfcg3NNMPoVPgS
bOHpeELYkiT8XQeVU6vgpA2xvZFgDKiSRNfAHe9hogPU8mKeXsQdJq7PZ9X4Z0mn
f0MlfGV9xkNC+0ihcEwKNb0C5w2lLWcyNGlhdGK26Rku56+3M39qOdyW4p5gHaLe
kzQNCAp2pwizJpIb6dEa
=KOcQ
-----END PGP SIGNATURE-----

--=-RVkra5OJjpv8lVgzQTTO--
