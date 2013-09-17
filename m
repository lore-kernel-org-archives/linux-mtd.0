Date: Tue, 17 Sep 2013 11:51:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Huang Shijie <b32955@freescale.com>
Message-ID: <20130917105142.GO21013@sirena.org.uk>
References: <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com>
 <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com>
 <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com>
 <20130916101912.GY29403@sirena.org.uk>
 <5236DD17.5090203@freescale.com>
 <20130916110634.GC29403@sirena.org.uk>
 <5237BB01.3080700@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ugCSa1rMkiCAmd9S"
Content-Disposition: inline
In-Reply-To: <5237BB01.3080700@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ugCSa1rMkiCAmd9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2013 at 10:14:25AM +0800, Huang Shijie wrote:

> The dummy is just a delay in a command sequence.
> The dummy maybe only several clock cycles, less then 8 bit.

This is what the delay_usecs field in the spi_transfer struct is for,
the flash code should be using that to ensure that the minimum delay
requirement is met.

--ugCSa1rMkiCAmd9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSODQ7AAoJELSic+t+oim9GmgP/210toLwtzpyb8/xaQRfHD+t
qNl9Aq74IbXzOWhZtKencQnETIIMIoXnaoQ+QMmXBqxrVUZo1dOW3YLSiQmj1f+C
r/sr3jgVPhfC2O5chk22xWEDFm+46xlJOeXbeHRVt4j29ljjsPpydiPVpEa4t6fI
epCKpd6rqfh3q+wzjKss02etd7ELbYM21Lb/vXMaCNiIrGlOF2rm4F/sDoJuH+Mf
9BALxvs+XUZ6PDU3leDAvDWHuKqirHHJwmCm7Ejti/wqq25Xk8eGQRVHY22k3QfA
K7q4xPLjmIsW6tkOEPv8Iw7akMSw1HaVhA9eKpvw2PMKAjnEeTBPkdsenXHJyTKs
7bXpXJj/jJU36Fgbew42pihkvTy1WB2B/YOMOOFy3dIhbZR4IYNLBmSQfeAp6sTo
qxEVhI4kCYB37V1c0UejRFrqaEM6dmrFGjir5fLAR4S/Y68OJPY32l+oN4SqpkMv
bbnm/Xsr7B5mB2llYMsSCOoJkDLqojS2V69d63wxj21WtGRopy7xudjNAEBFDAUe
MC+6iw2uJwY+X424mDar4wAIcHYKcM6XAeSyB00ITRjBoaDHKc7dx2+GWCT1rAMJ
kl/b3aOhOLZd5mndxCtNMQMvX/jfkgrNT/f4p5yf4M4bGZw9tkgTWphXnGb2Buuj
uByzUplWsZifTHtxlg2Y
=KVyf
-----END PGP SIGNATURE-----

--ugCSa1rMkiCAmd9S--
