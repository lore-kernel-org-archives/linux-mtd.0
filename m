Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daT7g-0001oR-DR
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 20:41:38 +0000
Date: Wed, 26 Jul 2017 22:40:56 +0200
From: Alexander Dahl <post@lespocky.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexander Dahl <ada@thorsis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Message-ID: <20170726204054.oejtb73jsxxlmovm@falbala.home.lespocky.de>
References: <5326598.QgYTQxcFMR@ada> <20170725205406.5a946c08@bbrezillon>
 <9879279.x3T2Y4a6KK@ada> <20170726203326.2159f0cc@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7aion7tzqiex7r4x"
Content-Disposition: inline
In-Reply-To: <20170726203326.2159f0cc@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--7aion7tzqiex7r4x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei Boris,

On Wed, Jul 26, 2017 at 08:33:26PM +0200, Boris Brezillon wrote:
> If it works, I'd like you to drop SMC timings in both situations (with
> and without this commit).

What do you mean with drop? For other CS? How?

> I'd also like to to dump NAND timings (those passed to
> ->setup_data_interface()).

I'll see hat I can do tomorrow.

Greets
Alex

--=20
=BBWith the first link, the chain is forged. The first speech censured,=20
the first thought forbidden, the first freedom denied, chains us all=20
irrevocably.=AB (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***

--7aion7tzqiex7r4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAll4/lAACgkQNK3NAHIh
XMaySBAAxWCOHBCK4r3uJCws854VIgSR+vmct6c0LTbk+k4sD0/ikCUIVx3byxgf
vERcY3UD4EyONWKV6A+srszjBKUou8MRd84VDOPlcOOgVWtJatENFR6Fh7deGQjn
jGwjciM+tLgyjNbKruFlVByzi8t+Pp4QiiIRUiomAfzLuVyqEaJ3qCUkRkCUIuaA
Wxpjv7aNNZAMLHjjHjDLwNJXtzXjKPGm1yILr3ZP8b7EaYxW9uPURVuvWrHV+c2b
Eu+Z/uDh4FFCINDioDj6MogPtL46P0aiSIyDaISeUAluq0bxv+uZlm31zgrZm5uV
VO7b4nXftsr4mJ4O4k4xHmXevNDBp2mhGBtxEravYAqQYghcZ6WHR6FruceIgxKw
1RW71rmUsa/kabMYrfhwXYpw1H6RJ0GRRRNB8MfgY2SOqORky5YPqz1519/Ptwta
4DHeP0krEByfHoZ48EoZt6AW+CtU8aIm1r//PRpeBVsmMruZ7iOQoqEpyN9i99MO
UXf2IC4mG1PE12QdonNDv9senMx4L1tySAYQoKnDEJ4SjWkGWy55YzCpkHoOVLea
CvdrJG6FkmBxkPsimqfn64Yqccdn8979mzDrrJu0/K1HaTxy+JpIIGemHzh54EHW
Q2Udpg/BmSi43+rRY4jSEa/9Q1nh0s0d3aCEigX4xPERmoCFKH0=
=xG4h
-----END PGP SIGNATURE-----

--7aion7tzqiex7r4x--
