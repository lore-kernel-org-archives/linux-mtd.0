Date: Thu, 8 Aug 2013 11:35:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130808103510.GV6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-18-git-send-email-zonque@gmail.com>
 <20130807160743.GI6427@sirena.org.uk> <5202718F.2050507@gmail.com>
 <20130807163258.GL6427@sirena.org.uk> <52035463.1030909@gmail.com>
 <52035A81.6090903@metafoo.de> <52035EF0.1030208@gmail.com>
 <20130808093628.GS6427@sirena.org.uk> <5203683C.2000904@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="eRJUXWYUKFXpoo3g"
Content-Disposition: inline
In-Reply-To: <5203683C.2000904@gmail.com>
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


--eRJUXWYUKFXpoo3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2013 at 11:43:24AM +0200, Daniel Mack wrote:

> Hmm. We have this big "if SND_SOC" in sound/soc/Kconfig which prevent
> that symbol to be selected. In fact, SND_PXA2XX_LIB already selected
> SND_SOC_DMAENGINE_PCM, but that didn't help.

Ah, that'd cause problems.

> And code that is not ASoC specific should live outside of sound/soc, no?

Yeah, OTOH it's pretty much entirely for ASoC and it'd be less churn.
No problem to move it though, but please leave in the files pattern for
ASoC.

--eRJUXWYUKFXpoo3g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSA3RaAAoJELSic+t+oim9TLwP/RyMngjxQduzc7BMEkN+SrsQ
CDv8nJal3p1hamijmW8FPHQO6AsVRmx2qkog0OnJw1w3sfBmhnWQaYShbNEveq9+
XZmwn2eTOLS4XMQ6fqCbc+eaOBd1xdihx+nIqY8roRbIcEOMfqfaq/i0/ava2UXf
Mp8IbiibKph7AfTy6GfhWBVEwJxMygS7hX5F2cILvD62uByI0cYze0lQInK+Y9qi
5RaKPtHAaBO0lYh7KBtmZIKEuPYGtFqA6OXgKaMotFyCMAlc5od81DSwWO/bEj65
R25rHIn0XSHKSBKCtw9wVHy/GpeTOO0KcgOduz7RQCZnLRFgszrfMZEKCubtaxD5
0vwQYEjFA5WWptj5iyb8deSFbg4aw1U+AIZ24lJIudwliqRXnmmrzYdoOOYeITEK
cFXPn0yIwYCHfvhfI2nJQp0Z/DgPLjWIxATpWJt7XrnbUNcg4h5G9hgCWZz2tpVJ
wj6N9vXHekI8KmG/42TeCv+0Ax4J4Dv5ovVPkMp0cU3BfQA+2VT76e4vXaTUw2Z3
YXJowzBGT5ECyX024Nuxg8saqJ97qYQFj6xqAHOgRFfyqrrDcvw+vxd2AslbIx9u
XLSX5u1UbHtvRuAmxcdYSmCB0hDPmrKgwpGsCyaRhGC85YnNHEV8ZRRVlVXz5Oik
EaqHz8bN0stW38tikljI
=Yx5D
-----END PGP SIGNATURE-----

--eRJUXWYUKFXpoo3g--
