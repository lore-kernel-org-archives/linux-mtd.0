Date: Fri, 23 Aug 2013 10:41:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20130823094141.GE25263@sirena.org.uk>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <201308222229.01778.marex@denx.de>
 <20130822233611.GA25263@sirena.org.uk>
 <201308230158.05909.marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <201308230158.05909.marex@denx.de>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
Cc: devicetree@vger.kernel.org, shawn.guo@linaro.org, b44548@freescale.com,
 dedekind1@gmail.com, b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 01:58:05AM +0200, Marek Vasut wrote:

> > I was actually thinking something more generic than that - putting the
> > property at the SPI generic bindings level.  Though if all flashes with
> > this dual/quad read functionality have the prefix m25p the above would
> > work also, at the minute this does seem to be mostly used by flash (I
> > bet someone's got some DSPs or something though).

> Ah! So you mean the SPI controller would provide information that it can =
do=20
> dual/quad transfers? But then, the additional pins can only be wired to c=
ertain=20
> chips (controller by certain CS lines).

No, not exactly - I just meant that the property on the child node
should be one that's consistent over all chips and could hopefully be
implemented in the SPI core as part of instantiating the device in DT.
Which probably just means stripping or changing the vendor prefix.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFy5RAAoJELSic+t+oim9uyUP/jzHngITvMmOWOxV6lKH27Xi
nUsoRcLqAI8ZCl/Xr1Id93QxrBiEKtwsR5dTd2rw6D+B8OiOfqefJqFBg+fC49nP
Q0VypHlXgJU705DHggM5Xw+htjr8Wg30RStNiVjyWbfRQyLFpdu9A+gWKgCax4qL
JEjeBXo15IoFKxWAChKgM7+EjC/YOitgLVfvqm3A1YffoRBacGXZqpkQvYXP3VZ8
Usal2TCjV0Qig7ukHH2cxmctgiRXo7Czg/TpxixzCDC3t8bs8i/59tLov9JcqeV6
3jU/1An2Bai1ZzARRUKp7b4LPNDSn7j+mSsS6iUDC6a9Go/UIYbne6D1I9lN1FXq
Co3RpBhksqxCdgyKJlFmir/Gq20NvzuCp7Wx3/JkqSaIOTCCVs3BuPy1J98UbHwm
EMfAvQdIlDQHlwSPw7VE1spL2UhCePrwacG7BpFXrWC3bK7mbtlRL9nkT/nrJxbb
BZFokOJed+mKEs37K/PJVBSkn004FaY/pZKabaGwZl6YvTblGIBt7bm6LXKJIVgT
zul/TjjwEKoGveLanwmLLd1G3WPCLhNxZUUCvWiTcUigk9eB9rpiPD13q4yw0oiK
oywS7YLIu9HDkvQuKu9x4S7F5VwkChM62EV2/G1E7WrKOF7xQiRyMrX8IRBJRwv9
8R0d9vH1Q8tfFEsSgOfi
=iBcm
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
