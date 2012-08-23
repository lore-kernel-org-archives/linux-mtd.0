Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Ywc-0003rP-Hx
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 15:03:39 +0000
Message-ID: <1345734503.2848.247.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Thu, 23 Aug 2012 18:08:23 +0300
In-Reply-To: <1343514565-8983-2-git-send-email-festevam@gmail.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6K1volBigKBkderYR9Dc"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6K1volBigKBkderYR9Dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-07-28 at 19:29 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> When building MTD_NAND_GPMI_NAND as module, the following error shows up:
>=20
> ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] undefi=
ned!
>=20
> Export nand_update_bbt to fix it.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Why this driver redefined ->block_markbad() at all, it is not supposed
to do this. We should fix the driver instead.

--=20
Best Regards,
Artem Bityutskiy

--=-6K1volBigKBkderYR9Dc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNkdnAAoJECmIfjd9wqK0yO4QAIw0bHqoIl/R3PI1lT7Ggxa7
9d2zIFNvKNG+h4NYwJrW2TfoQvdXQeBcREcCTqTzxlvbK/4L8JbT0o1pNhDzM1pW
TQoGH10TFXrBy9UNeFqz/edo0cuCY5Sv6vD0LIYAtbDiFJM99kJRVKfGBCJ7eQWg
PDU8opfjEsuFue2sGVKC2bjNcxyMhWxrJcr9YvI5IulnaT5O1tqSMR2i0+iSr4JD
zLmh9Pozk7OtsSQ2LSRMyp1VvndqEGSiOtIOSW9qjugF5qRMwvEz4tsSJ18CSozk
FiqM0cEuDFCm8UXS3f89qV1SMZqVLrMWYvVUt9OM3qZ3VfE7ythTMpzDUIQQyZs/
PdVTAdyu4SS/5UvGZ81Q99qCzzocAMwxYM0/kGeD7T49yu+xoRNBFQy3wDapY/tt
ut69/NlZEcm1ccnc8jcYYwDSGnBpolXOCpiLhCyKSmsrPdHVs4yIDHlfjSO6ZQz4
iqapf4rCbwzlopQYk9KcqFakdZYneM1VOfYApVGO3YvxsfC7xikNhvLhD/O6fN+w
S5AAeNcYC4/URuGryXK2+RWWR8c230ssAjcczRldeIukPMPjh747g1uXodmUYarQ
MRaVU57ie4ahgF91YJixz5P6TlqJdselU0wrTmNJgU6k3SnxTd8jnGBol5lb/E5S
McjNqAvweGrh0OtNePFi
=Atz1
-----END PGP SIGNATURE-----

--=-6K1volBigKBkderYR9Dc--
