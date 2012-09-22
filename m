Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFRAk-0006EP-9P
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 14:59:14 +0000
Received: by bkcji2 with SMTP id ji2so2132415bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2012 07:59:03 -0700 (PDT)
Message-ID: <1348325931.1894.0.camel@kyv>
Subject: Re: [PATCH] mtd: gpmi-nand: Improve logging style
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Sep 2012 17:58:51 +0300
In-Reply-To: <1346851653-28117-1-git-send-email-festevam@gmail.com>
References: <1346851653-28117-1-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RAIB59UOa3E8UCoBfOPf"
Mime-Version: 1.0
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>,
 b32955@freescale.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RAIB59UOa3E8UCoBfOPf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-05 at 10:27 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> Improve logging style by prefixing the pr_ messages with "gpmi_nand".
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-RAIB59UOa3E8UCoBfOPf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXdIsAAoJECmIfjd9wqK0BIQP/2jkygwNNTwublhrwJxlTSHN
Vjd7wK+4wr1UHvWliYZrITHIdFAJKaxkSG8+WDGy3qZKTuIFRRXPJXLz8AgE/fPc
abrIX0q/I/fK6+gW/23icSARtqXNSm2GHizX8ET/yVQnQ/OtbB5v2z7zYxhxqvYz
daH2bfl/9JNP/mnhFNnPV/7mfrBnBBytloEqTHl4IPnvV7SAD59WyPp/U0OdNl7n
shc8YzJ8EoUULa8seyVi2rSW938fuH/9GAgbFZW8b6kgGR2aPPNqh0sW+xNaRRpb
Wykhhn59Mqcq9gzN2FcRC+x1CnrQwzjLrsEoN09iLS7ADtGlso+1GSnJ0lFVOIFk
KuCivqfOMPRlVZEBFmXDdQWnHF3vP1eXaSRK70Eb5q/utDTpIkbqwWHCI0DpoEOp
joRUYCVZeYN8Dr34cFaZBu6V5wLUHOLUdt+G+le6Jkove5JEsQ2XM/AyCwM7Fs8u
nA3/MuokugHGi3vKu0Fb6amVowkYhlWKckdoqYTMBPFefal/kMScxcaCQtEN0I/X
HC1B08c521ivcuuJPp7u7w3a12kX3BqAtVcY7TCVRc0NpdiJZ5sf/z98rXz98ztN
RKX5XHOu/WBQdxT9mAmo62PJgDf+M8nmfz2OYNdXqbkqgEam68IYQx/KoVBpco9H
OCVyDXTxU23y0cbMPMnj
=q5NN
-----END PGP SIGNATURE-----

--=-RAIB59UOa3E8UCoBfOPf--
