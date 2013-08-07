Date: Wed, 7 Aug 2013 16:57:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807155737.GF6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-15-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gnQ/OOKD4CRsnGw/"
Content-Disposition: inline
In-Reply-To: <1375889649-14638-15-git-send-email-zonque@gmail.com>
Subject: Re: [PATCH 14/20] ASoC: pxa: use snd_dmaengine_dai_dma_data
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gnQ/OOKD4CRsnGw/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2013 at 05:34:03PM +0200, Daniel Mack wrote:
> Use snd_dmaengine_dai_dma_data for passing the dma parameters from
> clients to the pxa pcm lib. This does no functional change, it's just an
> intermedia step to migrate the pxa bits over to dmaengine.
>=20
> The calculation of dcmd is a transition hack which will be removed again
> in a later patch. It's just there to make the transition more readable.

Acked-by: Mark Brown <broonie@linaro.org>

--gnQ/OOKD4CRsnGw/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAm5uAAoJELSic+t+oim9dMQP/RVA+4bdvOuKE9pG5dnuvd7g
6wCnaNI8O8nT9dK9v6nn0jrLcjcPZxpUJeOO2cWo0O8cKigqLTmyQBsGizXq2pht
yuJI9r3G9DhhrYEcDzzQkanNXoHL5xLjkvM+bjrckS7S82P8k9954s0q4TVvqv0r
sWY1wWQ16uglI3j30liwICazdTrPHrPUmOYCULKzrf2bcbf2RzfKUnHkpCbhmUSj
8g4LTm+gUY4aKl72hAviE17vbK3U1ktiz2LmYljb8cvQfkbGwwrX/Klra2XoKFI3
FlQox01dy4ItX8MYtKQdGb7E48lYXLrxWYUippuM/h1Isy60XkoHCHyqFxRmKyne
aQtp98XmoFSe3QetbG9YbZOjHclsoa7PGWO9gRUmEIbVtQRWeNliBmocmYxYSKuY
Tltnb78kVcLd9Ed3maHklrXQpHfrANckwOEZZf2mIEJ5uTxMmXkNXcRARIAVcEeu
FVTOUOVnjPM6sRHwoZF9Ic26IQk8/+j0HkQgSFg3fnNqU/hQJhZrRHjMmZXis3ju
5QM5NFyMLk/h9WX7C+kI3Z5x6vBJw+iVrvtlIGe7EHjb5K4id4xBT3J9lglzP2aH
9uBtPzx21HrIivE5vdPuEL7CAdQkoL4QpE+AMtJdYOCbBOttkZLbj0kBRHzf2eM/
a5yaWO3gWeFR1m+FJXH0
=Vn6t
-----END PGP SIGNATURE-----

--gnQ/OOKD4CRsnGw/--
