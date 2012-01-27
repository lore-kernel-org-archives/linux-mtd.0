Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqlqK-00017z-GA
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 13:27:53 +0000
Received: by pbdx9 with SMTP id x9so2002443pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 05:27:51 -0800 (PST)
Message-ID: <1327670996.26648.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix access to 16 bit NAND devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nikolaus Voss <n.voss@weinmann.de>
Date: Fri, 27 Jan 2012 15:29:56 +0200
In-Reply-To: <201201251217.q0PCHmRe027024@gatekeeper.vosshq.de>
References: <201201251217.q0PCHmRe027024@gatekeeper.vosshq.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sdMvggJudGoVwV8TrpWF"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
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


--=-sdMvggJudGoVwV8TrpWF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-18 at 10:16 +0100, Nikolaus Voss wrote:
> commit fb5427508abbd635e877fabdf55795488119c2d6 optimizes PIO
> NAND accesses by using IO memcpy instead of IO read/write
> repeated functions.
>=20
> This breaks access to 16 bit NAND devices as memcpy_fromio()/toio()
> _always_ use byte accesses (see arch/arm/kernel/io.c), so with
> 16 bit NAND, one byte gets lost per NAND access cycle and NAND
> address count is wrong.
>=20
> Using memcpy() instead of the IO memcpy functions fixes this, but
> depends on correct word alignment of the buffer and length has to
> be a multiple of four, otherwise it might issue byte accesses and
> possibly break 16 bit NAND access (cf arch/arm/lib/copy_template.S).
>=20
> Memcpy variants seem to be the wrong approach here, since the
> NAND controller doesn't make the NAND appear as truely randomly
> accessible memory (as opposed to the DRAM controller which does
> exactly that).
>=20
> So, my proposal is to use 32 bit IO read/write (and let SMC
> map it to 8 bit or 16 bit NAND accesses) and account for
> length % 4 > 0 with two additional IO read/writes.
>=20
> Signed-off-by: Nikolaus Voss <n.voss@weinmann.de>

Why not to revert fb5427508abbd635e877fabdf55795488119c2d6 instead, it
is in my opinion a bit more readable?

--=20
Best Regards,
Artem Bityutskiy

--=-sdMvggJudGoVwV8TrpWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIqbUAAoJECmIfjd9wqK0OaEP/iw+nCKEuGm7z8ta8xHh7OFr
z6feYUcJcoGw7fqMEfEEHGaUYTt10RpOEYJWDSJZ3m1PrNKd+NnTXD1ooyGTlpiL
VY7BNn0qoFwIpommCNBJYeim8Av4c0WYzFtaybcCqN27Km93wO+eXnk8ghDPAY1w
/U6HOM4+a2VIFrtg8rEBrVrE0Rt+sJ/HiZFXbLH8Lgo0mBFKfo6eTOeC6STuukkr
odTDPJFOLcNOdPDM3PF/icn4EUJmvOmDn48PMlnCYxpf0D5loV6IydShIylzbUtt
Lbxf1HSaRKgqNWlBlpNBsqKnUFQAQ9KvhZcTUcKlwMJPBxhRUzuRUzahN0wwQXys
jKAUc3W9P6K35clSbtmPK+tV+0GdS8Dn3U3DpI0PfWzkTEsBeCSxJpkyTvFbTSUN
VGej7QBCqxftjygTpEb+p1DaU/a9kRnrUlutQATjrVQ9DhNLataEJv+4Jkk+xR/6
i4rRnLGkMbq4V36OFMkmrP/6gzb7b1JxyMRiDn9bDgzSiUts7fKTxwD0DeNxRaim
Eig9tfpD5uwNFVMV67OCq272YvKu2x4lPVgOHvD2PIUE9lYFtTMuFttc6/erIy7a
ASPkq/P3SVthA9PKt5icP2BkKw2SyCpsVoS/qB1PUMu1meeU3se0vxm3uA+lOKO2
v2eAbv9t7oCEuxZqrnHr
=gvmw
-----END PGP SIGNATURE-----

--=-sdMvggJudGoVwV8TrpWF--
