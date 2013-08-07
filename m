Date: Wed, 7 Aug 2013 17:07:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807160743.GI6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-18-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="b2u6xDyV6U2OU5E0"
Content-Disposition: inline
In-Reply-To: <1375889649-14638-18-git-send-email-zonque@gmail.com>
Subject: Re: [PATCH 17/20] ASoC: pxa: pxa-pcm-lib: switch over to
 snd-soc-dmaengine-pcm
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


--b2u6xDyV6U2OU5E0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2013 at 05:34:06PM +0200, Daniel Mack wrote:
> This patch removes the old PXA DMA API usage and switches over to
> generic functions provided by snd-soc-dmaengine-pcm.
>=20
> More cleanups may be done on top of this, and some function stubs can
> now be removed completetly. However, the intention here was to keep
> the transition as small as possible.

Has this been tested with the standalone non-ASoC PXA AC'97 driver?

--b2u6xDyV6U2OU5E0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAnDMAAoJELSic+t+oim9fWsP/2PaPG4kqVq8yiLTlxsr6G6t
2cjquMBQsY0rBpeWAIBklWjPfY9bFfvJMD4ShNsSk6ZXx6X1uvFB51yvYdsMWJS9
xUHj0K3KLZCAyV/1H9OxjuqVzdDSPagDnlDq7YLC+RTY5kGl4kG9TlHpqkGWiwfD
5x2ir8zypr5jyvcoK88UZMToM4rQU7dxEBqjqha/pHBjbEZeroTWuTqXWuRPUN1T
z8+lSkdWQnwqtvb/i5+mrWwd+ZfrqGhWRao+x1l3JDz3ZdT/iGS0n8vk9E73jR14
Nr1NzUOpyBY2Qcytlel35W8okn/6ibvAbzc3reRz/1NKTr/WeOjm6csdvwtOVO9p
xZj+Z1MZgnzoe9E1kQlQMYT/KIZbjeemHqOAJQ97Dy8nO2zz1H5tfDAe7C+xozhg
ii7ZKmHhzXo1g7yIO118Pb18FyOWP/olU5xl2WslTHg7zkyho0E3uZeftyWqLOEh
0Ss+WZK2oCHDpmVe0hawFP0vzqufh+kcnAM/0V6Baj4uo96PHZGmucSrDwpdaIhq
+YWcKWX4rrEheTru6F6sl5ZAkQYy8atwKvmku38A0XrZ1v+XkcoOMiM8V8UVDVuZ
q9pKKQEjYI8rA+lUtuKqpt+flSlgP0NrkKzsDfL1pEcOqnGcH2psbmbbA1aKWSsZ
WyhyWSu1OyQ7xjV7HO/5
=pXE3
-----END PGP SIGNATURE-----

--b2u6xDyV6U2OU5E0--
