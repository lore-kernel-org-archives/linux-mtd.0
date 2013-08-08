Date: Thu, 8 Aug 2013 10:36:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130808093628.GS6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-18-git-send-email-zonque@gmail.com>
 <20130807160743.GI6427@sirena.org.uk> <5202718F.2050507@gmail.com>
 <20130807163258.GL6427@sirena.org.uk> <52035463.1030909@gmail.com>
 <52035A81.6090903@metafoo.de> <52035EF0.1030208@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8bIXokQePRfDuBGo"
Content-Disposition: inline
In-Reply-To: <52035EF0.1030208@gmail.com>
Subject: Re: [PATCH 17/20] ASoC: pxa: pxa-pcm-lib: switch over to
 snd-soc-dmaengine-pcm
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com,
 Lars-Peter Clausen <lars@metafoo.de>, nico@linaro.org, vinod.koul@intel.com,
 marek.vasut@gmail.com, ezequiel.garcia@free-electrons.com,
 rmk+kernel@arm.linux.org.uk, devicetree@vger.kernel.org, samuel@sortiz.org,
 arnd@arndb.de, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com,
 eric.y.miao@gmail.com, gregkh@linuxfoundation.org, g.liakhovetski@gmx.de,
 sachin.kamat@linaro.org, kernel@pengutronix.de, djbw@fb.com,
 davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--8bIXokQePRfDuBGo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2013 at 11:03:44AM +0200, Daniel Mack wrote:
> On 08.08.2013 10:44, Lars-Peter Clausen wrote:

> > There is intentionally no dependency on ASoC for the soc-dmaengine-pcm =
code,=20
> > though since I wasn't sure whether there was ever going to be a usersid=
e=20
> > outside of ASoC the coded ended up in ASoC folder. It shouldn't be a pr=
oblem to=20
> > make it available to all of ALSA.

> Ok, great. I queued a patch for that. Will be part of my next spin, or,
> in case the series doesn't make it in time, I'll re-post all the patches
> that can be applied independently up front.

You probably don't need to move it, just adding a select (which should
ignore Kconfig dependencies) from the non-ASoC PXA stuff ought to do the
trick.

--8bIXokQePRfDuBGo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSA2aYAAoJELSic+t+oim9THAP/AsldXD/bmk+5ZLXe45Tguql
dczij5jRPOdECgemwzFXGdOkFdSELrBflyhopxv8UBtORspoYlSK1Iow+2kjr0Wb
2KJGam7lgOpNNr4FqQgCHQQE+/zABxH1gxXK7DN8MFYZ+zjy3tKMbuJekwueyygm
QnLdtZs82Ih8/I9MuwoO25b1SIp637w/YAgZGH5xJpr6Ffp1G9H0l4u1IPgheRjZ
TvPivKyDcKMRuIcvFX6joIVy8zWDqKAM+Dw2V4P4VTnAO1npxTLbubNawNpcSq3T
6XgeASziL8ED8sNSAeeEMs3LnUbmcW86volhx/xQZNIgpqIAvIZ4nq3VRMroAYtw
r/kTJgQQV7gnwPnIPS2jpA4bU2mSMScMMHuqNMGgWeecMZcgIfQX3Yn1MVzo/M7n
gq2zBO7tXbIShzDEFhZiXvFeST0FWY2M1xy8sPCskHQ+q6Uc1NsO+XXZJs5VBY16
kZBVrv9Qkcvxi24a+yGF3hrD+b/pdw/uTksxax7Qs7yQYv/43oMF2HNHEUsaxfFG
MjiNTDYPch3GsNwGdCouXEsoKQI907P9pfDkSHH7fPxCVFcAojWSszInFipHxFGw
L9/gxifTwQmLoc2PMqBu1o8B1xTVeGLXNSQXoGqPl807tH2JUxgS/xTa1DX72zdk
50BkhudG+Vm1wlwXZlE6
=QXMz
-----END PGP SIGNATURE-----

--8bIXokQePRfDuBGo--
