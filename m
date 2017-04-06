Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cw8ap-0004BF-8s
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 14:41:01 +0000
Received: by mail-wr0-x242.google.com with SMTP id t20so12028900wra.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2017 07:40:37 -0700 (PDT)
Date: Thu, 6 Apr 2017 16:40:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Paul Burton <paul.burton@imgtec.com>, james.hogan@imgtec.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 13/14] pwm: jz4740: Let the pinctrl driver configure
 the pins
Message-ID: <20170406144034.GE8438@ulmo.ba.sec>
References: <20170125185207.23902-2-paul@crapouillou.net>
 <20170402204244.14216-1-paul@crapouillou.net>
 <20170402204244.14216-14-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Content-Disposition: inline
In-Reply-To: <20170402204244.14216-14-paul@crapouillou.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2017 at 10:42:43PM +0200, Paul Cercueil wrote:
> Now that the JZ4740 and similar SoCs have a pinctrl driver, we rely on
> the pins being properly configured before the driver probes.
>=20
> One inherent problem of this new approach is that the pinctrl framework
> does not allow us to configure each pin on demand, when the various PWM
> channels are requested or released. For instance, the PWM channels can
> be configured from sysfs, which would require all PWM pins to be configur=
ed
> properly beforehand for the PWM function, eventually causing conflicts
> with other platform or board drivers.
>=20
> The proper solution here would be to modify the pwm-jz4740 driver to
> handle only one PWM channel, and create an instance of this driver
> for each one of the 8 PWM channels. Then, it could use the pinctrl
> framework to dynamically configure the PWM pin it controls.
>=20
> Until this can be done, the only jz4740 board supported upstream
> (Qi lb60) can configure all of its connected PWM pins in PWM function
> mode, since those are not used by other drivers nor by GPIOs on the
> board.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/pwm/pwm-jz4740.c | 29 -----------------------------
>  1 file changed, 29 deletions(-)

Assuming that you want to take this through the pinctrl tree along with
the remainder of the series:

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljmU2EACgkQ3SOs138+
s6HGABAApLsMiPuePBh0cJc9OAijswAsVlj72HCTmH1JA3qrEfhOVWZxltlReNwi
z9upRVFfXOAux8PGiJT+0N/z5Zrkwu/haho/al14XxloMx4DSW4UWkeBAVyqBkba
N6btN6WY2TLAMi7gav0GWbXFhspUJCncB+HqK2wmXyAhQJfBjMQ2Et1OpniwQ5fe
v60TCWUjBY7dZtgtZ5I80tQKjYnZC6hLQoXZcBwTNvQbeIM3sl9cymdPbMXVIJH4
dzxud0NQLfx1flI0KlEI35gpRAAfinGr5XqUYipP1JtsegR51uvpQdQ6l2WdGcBV
9mICw0SZnFuELmPzAYXFjKEYvmOFLB9kMgVHISOgCCwFtJfIH4slY27lZLLvmUkg
y/erHU6r8KQfjkVdxNiMcktqMOoAoHaUpWfgsBL/kE3Am0aoXXL3AFEsKY8WXbDg
qjN3dsSIdafpEngfpz6tyxbZfPeUkpYubI4+D9T4ov5SC9JeKuPLd6TTXnGtAntx
FNhSfWilbcbkYG1r37LpNkW8xWo904JQ7G0pn7opGScBH92xGhV3+g0MBTlTfs/8
t1fqhL3r7+z576vncJwup/hFZq2XrjqCWjizIHKwp2q7vj8JFyN1NXrwRp0CwfJt
IwPgbk9MEqstyCKhNIpM4qoJvvmSTQS/SC3k2JvQVGkwjWiytNM=
=QxS9
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
