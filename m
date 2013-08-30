Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFWij-0004E3-7T
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 21:59:10 +0000
Date: Fri, 30 Aug 2013 22:58:44 +0100
From: Mark Brown <broonie@kernel.org>
To: wangyuhang <wangyuhang2014@gmail.com>
Message-ID: <20130830215844.GA18608@sirena.org.uk>
References: <1377857110-6882-1-git-send-email-wangyuhang2014@gmail.com>
 <1377857110-6882-2-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <1377857110-6882-2-git-send-email-wangyuhang2014@gmail.com>
Subject: Re: [PATCH 2/2] Miss return in patch: commit
 id:f477b7fb13df2b843997559ff34e87d054ba6538
Cc: linux-mtd@lists.infradead.org, pekon@ti.com, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 30, 2013 at 06:05:10PM +0800, wangyuhang wrote:
> Delete a "return" when commit the patch to a new kernel version
>  by mistake. So recover it.

Applied, thanks.

Your commit subject should be in the form "spi: quad: Human readable
text" - I fixed this one up to read:

   spi: quad: Fix missing return

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSIRWRAAoJELSic+t+oim9FeIP/RAdLJlrzdVNeSRuN2P/YYe+
D7lOj3BLoqkYxe+yBTgfG9/y/bmsw4q/YBVM1mh/r9ZVmh8x5gsDn+DGwt/5JO8x
HLmu2RSKBu7ZqpfYJUoLbfPNAie/SlGT7dgTtLmxTqxzn1438fOvgBIMbqcSCXnN
SnjIZQ5I3hskkAZnOxmfch5McoMHz6/JBOl2RSND6vzNBky+foc3fkMt9oDKMTnz
8R9vf5AW+1jKPKiYAcRFBflTqOpEzK988P9mLRvsHFLpvwUV9bfMXKHBfF1dYKgi
gCMkNRXAhFV/e5uS9jnyZOjJRWxv4Vl7YvGVzLg2FLi5AWdHYj/LAkc0OOL3oRb0
L5M5pEhXO7V0yzNykyaR8U7ffeuNu7CE1rYPyeJmm0KPDp2Jhx/Z9c479+1X5077
SIba0Y8e7FgN/l88ZgeqPwmDXtc0nWayNiT2ij8a3h2KZsT9g2IAZWlMkMZdXaCX
E1BQCr0B5Z4DcHsmfCUntFa8sfAn1OoKoPgq3e5ZzuMIovcy6/pna3JT/i1P+5oI
BAxvWHpCzCuQ1BsA5b1D9eK4CgaZxS7asiCBJSvwSFrK0V2eJZh3+ezNz842tj7x
xGVmAkYcFg+Ep6pAE2DM2gjazBbsmFvE+HpejuZjG2EYN+j+jgZzGaQWqMiCZ82h
3R5SZns71+VoMI23BX/b
=+0eP
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
