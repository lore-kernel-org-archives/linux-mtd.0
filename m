Date: Wed, 7 Aug 2013 17:06:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807160606.GH6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-17-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="jOtImjXIA9XXnHrK"
Content-Disposition: inline
In-Reply-To: <1375889649-14638-17-git-send-email-zonque@gmail.com>
Subject: Re: [PATCH 16/20] ASoC: pxa: add DT bindings for pxa2xx-pcm
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


--jOtImjXIA9XXnHrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2013 at 05:34:05PM +0200, Daniel Mack wrote:
> The bindings do not carry any resources, as the module only registers
> the ASoC platform driver.

This should be done by the device for the DAI (as with other DT
platforms that have a similar thing where the DMA device is just a
wrapper around dmaengine).  This is slightly funky here, I'll follow up
on the first patch about that.

--jOtImjXIA9XXnHrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAnBrAAoJELSic+t+oim95HgP/12l7T64WABazIb+rwN7U+w/
5+8DiOShviLFFmkJCcxX7zApw384QehnZk3tCC/bF1jitSHAiFO8SSKXZWW48P5G
Mbpvux5s2cyGXJhBIsNV/N+Pb7l7p9HKFNDuEKXeEOXOAlPcXaqg4K4i4lhx5N41
1QmHEnR4ge+l6mkLMjCF+dbroXunyE+0b47RF5YlFkO+mK9pTLp46hNeNU9S0oV4
g10YV7xo74pqfjrkK9Y+l0NbddqNoRvMRmiS5xtBMI0XWkSaH7/jpcOdpIcFaTEx
eIV8ccMOinjGZYZ7JFCuUwbbcRKPnqBKeTWz2Xvx92SeIhx7HldJm8n33Tf07TBO
MQW2ntX0nlkHiXZIl+KtxWggIUsOFnpT+TAknTNpshH7WXttk+gfpHn/fURE2ZTg
i90sp8CFEi4dlQp3bJ+NhYAv2I34NZwZ6o5OIMKq1RYIFngo7+w8EdKqzd0IQFT7
ewtQXi+6wbodD/WbrEDknvkBNSA/d1gCSadsvRNVboDti8DGCUPY9d67LsEG5bHj
jaGql/KcRLXweSKDFyAzLzZQQvuD0c+CwwlpmmtjMRQq21FxsMvEPtMzE9r7L76M
t9+hqndlujUk6Wo+k/mSN+U+GUrLmH6XQ5rUoE+K2cVt0/NNoklOF7bcUVzcMc0+
SMagGK9kPUqqzbV+DWne
=Hp6J
-----END PGP SIGNATURE-----

--jOtImjXIA9XXnHrK--
