Date: Wed, 7 Aug 2013 17:40:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807164039.GM6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-14-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="TlDjLAx2PuPdVSSH"
Content-Disposition: inline
In-Reply-To: <1375889649-14638-14-git-send-email-zonque@gmail.com>
Subject: Re: [PATCH 13/20] ASoC: pxa: pxa-ssp: add DT bindings
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


--TlDjLAx2PuPdVSSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2013 at 05:34:02PM +0200, Daniel Mack wrote:
> This patch contains a cruel hack for looking up the the DMA request
> number. The problem here is that the implementation as it stands will
> allocate the DMA channel from the user of the ssp port, and hence we
> cannot allocate a real channel here.
>=20
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt |  7 +++++++
>  sound/soc/pxa/pxa-ssp.c                                  | 12 ++++++++++=
--
>  2 files changed, 17 insertions(+), 2 deletions(-)

So, really this should be part of a generic binding for the SSP device
but obviously this is just a virtual device that binds to a generic bit
of hardware that can be used for other applications like SPI.  For the
ASoC case we could instantiate the DAI from the machine driver but that
isn't going to work for things like SPI.  I'm not 100% sure what the
best way to deal with that is.

One way of doing this is to have two compatible strings for the same bit
of hardware describing the application.  I'm not sure that's nice but it
works...

--TlDjLAx2PuPdVSSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAniDAAoJELSic+t+oim9TMYP/i45oaGePHmIANMuc+uuyZ/+
1jS9C9YSJYhtUFb7FgBgYH1IWq3I/PBINUs8k1zhZfH0pv34WQ3jqf/9Kl/vkYlp
jKBLdLqk7R333Xfjn8QtuSClbggeGddGFCH18pgIP1eSpZ9/NkmMVzkow1rkj1Bn
mCgqWf2OQmsfXo4mOdjz3BZXg7LzuvgDImj24AkVSE5E8jxsiSjDh7Nau0zILIHz
vnPfkJJpQXWQA9n77RRpKDyvKVIaCGyqmGTK0Ed6gTXJWQfUTCMbWN+ae+uebqiL
CFrsYniOiZio/UcUNYXQkcktQORxCT0+mBeHie6dOuENCDNRmcWFXl8EOJS0Bjhu
Y+4VGM5Lq3OriJG8x8flSWw7pO5uLjsMBFhg+VAsUfqXUMF1MpwMPoBD1R27deQw
KkTWC4yBiFObWCbvKB5aci+dyWFfQEAHhbklGNhFbotlfGbMTYjbDDEM+ZYWafo7
WVN2EieXBvYqmdAyTzVdd9k9dldNdmFiMN48PF5K/XaQ5brXSx2Lmd14y3c3tF2a
+vZDsQ2tWCofmjd1csE6qXL8a9VF1et19NuwUiY43etlykI7rcxlH157rnxfo29d
/IdmtaUd1ckWXPNkTul0b1Q1LMExm7J+KPyjgc0pfj0Z1qULuCAPCcujnq7gVRPh
l3waKsapqSptYMC3SaWz
=Y6tn
-----END PGP SIGNATURE-----

--TlDjLAx2PuPdVSSH--
