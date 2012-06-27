Message-ID: <1340788471.29342.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v11 0/4] MTD: at91: Add PMECC support for at91 nand
 flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Wed, 27 Jun 2012 12:14:31 +0300
In-Reply-To: <4FEAC6B2.6030104@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
 <1340768981.2317.7.camel@koala> <4FEA87E5.9010604@atmel.com>
 <1340771320.2317.13.camel@koala> <4FEAC6B2.6030104@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kmmHrF59VVgvpPk71zJ2"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, jack.lan@freescale.com, nick.spence@freescale.com,
 tie-fei.zang@freescale.com, Josh Wu <josh.wu@atmel.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, bryan.wu@analog.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kmmHrF59VVgvpPk71zJ2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 10:39 +0200, Nicolas Ferre wrote:
> AT91 is looked after carefully, yes it is.
>=20
> The thing is that CAP9 SoC (the defconfig that you are using)
> has been obsoleted then removed for 3.4:
> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmit;h=3D9918ceafd4a9e013572e03983f528017c29bb1cb

Ok, sorry for that phrase. I basically only need to do compile-testing.
And I only care about atmel_nand, so I take a defconfig, disable most of
the stuff, and use it for compilation. And when this minimal defconfig
stops working, I get upstet. If you have any suggestion what should I
base my configuration on, please, let me know.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-kmmHrF59VVgvpPk71zJ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6s73AAoJECmIfjd9wqK0ahgP/11t7kIVovqLVbKTR1dN3bu6
jc62dk4XAmoHJ9FeAHenxldvXR+5c/pfWO8VJ94qPQEVOpbjxX+WBZ6xbF09DHtD
ZWKYIhR9i/gIaSJYMh3XS3igisMRJPDyrxfxYh8WIcDowZ+rf67bE9qT+GFwiXU3
jdTNXMVu3VfTHJn3RYlgUYlVvPiixMlk/6G7f5lgJPwgs0Pm5VPT9NNV6ZY3t+jp
o/LH+/+FH3cy/IGJphwdokVcaZ6RMJna1IgfpXTGF46b5YcBwEW5j9bWEFz1iGlM
mGCkKeobJF/MBZlS2DMc6qg4ATvXk0RrJ/y//7WBUl+Z9/8AMo15gZ1kFRf21wel
GvT6dwyOv2m3YV7cDAnEUbtXFuTBakb6vQmYbumqEi9phX0hilzXi6jITLCZkxnN
NqyHdYqmd0xlhZRWmeT/UGIJmAt4PoDIot7Q1n+BSa2givBggRFGmbRfaJFRkool
OC1y85pKUpM6IfGoeERDNYUIJOAqOGGpygDePGm9ZRQdIKlnRadL19ryy76DpP81
UZk30d2lLxMUGOSfHX79fos2EitDa2BNBZOpc4MOFhlHTshY8CqBake/ZBsr1rl6
3lI1zUKVgaSMvYmWRNKIh2FbeDKKXLBR5T+T7cNjguuy7r5F/Y7Rw2IiPU8kN3jn
9E98uScd7ta1eOUZEXp/
=8Eb8
-----END PGP SIGNATURE-----

--=-kmmHrF59VVgvpPk71zJ2--
