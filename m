Received: from mta09-winn.ispmail.ntl.com ([81.103.221.49])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbFCp-0003hO-Ek
	for linux-mtd@lists.infradead.org; Sun, 13 Nov 2005 05:35:35 -0500
From: Ian Campbell <ijc@hellion.org.uk>
To: Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20051112213355.GA4676@elf.ucw.cz>
References: <20051110095050.GC2021@elf.ucw.cz>
	<1131616948.27347.174.camel@baythorne.infradead.org>
	<20051110103823.GB2401@elf.ucw.cz>
	<1131619903.27347.177.camel@baythorne.infradead.org>
	<20051110105954.GE2401@elf.ucw.cz>
	<1131621090.27347.184.camel@baythorne.infradead.org>
	<20051110224158.GC9905@elf.ucw.cz> <4373DEB4.5070406@mvista.com>
	<20051111001617.GD9905@elf.ucw.cz>
	<1131692514.3525.41.camel@localhost.localdomain>
	<20051112213355.GA4676@elf.ucw.cz>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-OlTZezdBteloC09WUc1V"
Date: Sun, 13 Nov 2005 10:35:17 +0000
Message-Id: <1131878117.23932.3.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: latest mtd changes broke collie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OlTZezdBteloC09WUc1V
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2005-11-12 at 22:33 +0100, Pavel Machek wrote:
> I tried this one. Size 0xc0000 is reported as a "bootloader" during
> boot.=20
>=20
> [Plus I get a warning from jffs2 that flashsize is not aligned to
> erasesize. Then I get lot of messages that empty flash at XXX ends at
> XXX.]

What erase size did you end up using? Is 0xc0000 a multiple of it?

> +	subdev->mtd->unlock(subdev->mtd, 0xc0000, subdev->mtd->size);

Probably unrelated to the actual problems, but shouldn't that be
subdev->mtd->size - 0xc0000 at the end?

Ian.
--=20
Ian Campbell

--=-OlTZezdBteloC09WUc1V
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDdxblM0+0qS9rzVkRAhocAJoDPk/m0ZOP+Us0ydXMoWKFhr11vQCgzrtt
IhZN/ssaXF85z7fkkYBbXAM=
=k8EI
-----END PGP SIGNATURE-----

--=-OlTZezdBteloC09WUc1V--
