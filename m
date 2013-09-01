Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG73b-0002Md-DT
 for linux-mtd@lists.infradead.org; Sun, 01 Sep 2013 12:47:08 +0000
Date: Sun, 1 Sep 2013 13:46:42 +0100
From: Mark Brown <broonie@kernel.org>
To: wangyuhang <wangyuhang2014@gmail.com>
Message-ID: <20130901124642.GE3084@sirena.org.uk>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
 <1378028181-5409-1-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline
In-Reply-To: <1378028181-5409-1-git-send-email-wangyuhang2014@gmail.com>
Subject: Re: [PATCH] spi: quad: fix the name of DT property
Cc: devicetree@vger.kernel.org, swarren@wwwdotorg.org, tomasz.figa@gmail.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 01, 2013 at 05:36:21PM +0800, wangyuhang wrote:
> spi: quad: fix the name of DT property in patch
>=20
> The previous property name spi-tx-nbits and spi-rx-nbits looks not
> human-readable. To make it consistent with other devices, using property
> name spi-tx-bus-width and spi-rx-bus-width instead of the previous one
> specify the number of data wires that spi controller will work in.
> Add the specification in spi-bus.txt.

Applied, thanks - if there's disagreement about the DT bindings (or
indeed other problems) then I can not send this in the final pull
request but if it is OK I wanted it to be in -next on Monday.

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSIzcvAAoJELSic+t+oim9elAP/3C2m9bf+XMJbtp2vDT8KJi4
pUjotZCd0++5bnkiE3trp6QuNt8OdR0h7CY2o1A+HUHRv5yupQJ5kF603HvyIjoo
fUghWAp/9tDc2UecrQ26lhh6k/guTpcnnnbk66Fcn/TnJgnZUz1R+720NuGx1XUf
waPx+JDNWgkD2tfm6bItUtWKKn5IriuMNQpZdcpMl0+CgpRG15VtzSM/rK+kFZKr
1w6Q9lC92ePbKIrqRhfFeEADiXCSOncQ6EpjC90lE9BT7hJXWm8jGfqZXq1EB1Hr
/Xh3fBn6LhYd2J8d10ID/ycZbLOR9FD0qM+BfmnFLSYhvsFk/XjEIdcjQ70/5hkG
BDPOgqB/GG6DRvwQtf5Bsmw9Ywz2dEDedHTOB52a++tdlVWWGy1RNQgFVCvaZtAv
W0NnGTIWUo3iFdt1Re7yCY2A9jlvOOtQRas2vXSSevz7OnXPaVbYyJLx1jQNF7+3
pAEvvNCcR5wfZa6+Hk9Yl+AiCEug5tGJ+a5B8Uo6JAJ8z3aS3HuHbmQz3Fg0JHtm
v/iwGo1Iou6mRRRYek9iciqnEvBptH+fI5L1zvioXte9yG7pTPUJQ+X0alqEacqS
e/3fhfICAh3FF9Vi+jHEXhwq67ceI5vcD++55HP/ZwSp4reK69FU0QMNIQZ6bAIH
0LRfIDncvxh/xuwYDtmk
=d3K1
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
