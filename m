Date: Thu, 30 Mar 2017 16:07:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <20170330150742.wflswzqhg53mozx2@sirena.org.uk>
References: <E1ctZXC-0008DB-4g@optimist>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hk4orzs4jlqwphpi"
Content-Disposition: inline
In-Reply-To: <E1ctZXC-0008DB-4g@optimist>
Subject: Re: next-20170330 build: 2 failures 8 warnings (next-20170330)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--hk4orzs4jlqwphpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 01:50:39PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/mtd/nand/atmel/nand-controller.c:2126:25: error: 'atmel_nc_id_=
table' undeclared here (not in a function)
> ../include/linux/module.h:212:27: error: '__mod_of__atmel_nc_id_table_dev=
ice_table' aliased to undefined symbol 'atmel_nc_id_table'

caused by d09703f9459c94c78e029 (mtd: nand: Cleanup/rework the
atmel_nand driver), it tries to export atmel_nc_id_table as the DT ID
table but the variable is called atmel_nand_controller_of_ids.=20

--hk4orzs4jlqwphpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljdHz0ACgkQJNaLcl1U
h9DnyQf/SVMfg7/3Gq/sUge70caQaZF2EnyJA0cY9OKzTS8610B/k9xe+/3Q7RvK
h1QKSuMM2V96ko6K4YmQZRPD34ElYQ9KPmIGCdxGMl9nZ1VnjUoQISI57YRF2jZX
45ew1B+vNkx3NBm0clz9OlGI7cJ/S6SMEoJVYSYfFvALAYGju1I+/D9w4I9EGIpe
wqR1x109AIR/5F8FE/6rLvFlbKnK4HMoT4y3N6UH9f+JcIiPGcz69hwmxuSlgmlD
B2K0yqAlwhfFgNF+PFN+Box6Pbz4ZHVGYhVe6KOQ3N6rBeoRaphGTqTr4HusEO65
OwMu8UK4RuOjitCCMkQhqOgrI9lfPw==
=OdWn
-----END PGP SIGNATURE-----

--hk4orzs4jlqwphpi--
