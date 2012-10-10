Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLxQD-0003Mt-Hx
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 14:38:06 +0000
Message-ID: <1349879897.20594.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: fsl_elbc_nand: remove unnecessary badblock_pattern
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 10 Oct 2012 17:38:17 +0300
In-Reply-To: <1348701327-12226-1-git-send-email-computersforpeace@gmail.com>
References: <1348701327-12226-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pKyq1+MVE84vr+72UBJ4"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
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


--=-pKyq1+MVE84vr+72UBJ4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 16:15 -0700, Brian Norris wrote:
> Since the introduction of nand_create_default_bbt_descr() (now known as
> nand_create_badblock_pattern()) in
>=20
>   commit 58373ff0afff4cc8ac40608872995f4d87eb72ec
>=20
> nand_chip.badblock_pattern will be dynamically calculated to the same
> 1-byte-length pattern that is required by fsl_elbc_nand. This custom
> badblock_pattern is no longer needed, then, and its removal may help
> facilitate further nand_bbt.c/nand_base.c cleanup in the future (one
> down, many to go?)
>=20
> Anyway, with nand_bbt.c fixed, this effectively reverts:
>=20
>   commit 452db2724351ff3d9416a183a7955e00ab4e6ab4
>   [MTD] [NAND] fsl_elbc_nand: fix OOB workability for large page NAND chi=
ps
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Scott Wood <scottwood@freescale.com>
> ---
>=20
> Not even compile-tested...

Compile-tested and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-pKyq1+MVE84vr+72UBJ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdYhZAAoJECmIfjd9wqK00IIQAKGEabwZ8T4Yx7C/1raHmknm
RjLaLUYfP9WEXuOWUXxZzimuG7siWwAIQYu68HZkE70inx/uETeSGF4T3g48669h
y2s8njssZdAdSirD/kSWdmw1Hahibqj+PJ0njnxs4PdLT60BYICDSafdQXZIacvI
jJpGn2umNkaU9QLryCUix5MxRxHBbtOohpMA1ktWtD7wLQeVp0RO2GtfRgswtKZ/
cXYOdm8iP157uivLg3JhDWppVg/7nIKp75YlP2wh/5+Nrd/vXP0PMUpkDj2AT8TP
et/iEcqRbpXvjzG8/fesylZDRnikmwx/SSdJzavk/mrZNZLtdl3L97CVrzwltGz7
FTpXdH6+cb1tjJsH6awpYsgHqIT+RxWcuYz0ytYhINNmVBdjTEVIsGvFqaMAxlrm
vLiwcnQ+wJlg1t3KsmeMLZevRUB+9Hnb5LNsryCvq54WHCphzZN7tKbdIux+xCWL
r2/6SukfqpiX9Ero7dgQ33xaBj3hMyoaiE2jAu0w0jPyO4xDrmjwzWfTR1TKpgsZ
9H5eZESbA53An4O0NX01qTc4/ACRkUQVs5JqAWq1luNARbQKT4RPS7ebfMyGg4+R
C22yJjk6Y+bSa3Isc0JiUqp3UmNICgq3wwDKoq3FGCelnaVSL8HSV3amSvFVPZjE
g0ffB4EVLWH6pt06FQuB
=eEBc
-----END PGP SIGNATURE-----

--=-pKyq1+MVE84vr+72UBJ4--
