Date: Wed, 18 Sep 2013 17:00:24 +0100
From: Mark Brown <broonie@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20130918160024.GB21013@sirena.org.uk>
References: <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com>
 <20130916101912.GY29403@sirena.org.uk>
 <5236DD17.5090203@freescale.com>
 <20130916110634.GC29403@sirena.org.uk>
 <5237BB01.3080700@freescale.com>
 <20130917105142.GO21013@sirena.org.uk>
 <20130917150548.GE14747@book.gsilab.sittig.org>
 <20130917191318.GJ21013@sirena.org.uk>
 <1379518822.753.91.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Nc+Vvx0JXuqp7Zy0"
Content-Disposition: inline
In-Reply-To: <1379518822.753.91.camel@shinybook.infradead.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Nc+Vvx0JXuqp7Zy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2013 at 10:40:22AM -0500, David Woodhouse wrote:
> On Tue, 2013-09-17 at 20:13 +0100, Mark Brown wrote:

> > > [ potential "LUT" optimization, implementation details ]

> > AFAICT the big issue with the LUTs in this controller is that they are
> > expensive to reprogram so things are going to work better if there is a
> > small set of known operations that will happen repeatedly.  Otherwise
> > walking the transfer list at runtime isn't too hard.

> I think you can drop the word "known" there. With decent management of
> the LUT as a kind of LRU cache of recent operations, surely you'll
> quickly get into a situation where the operations you're actually
> *doing* on the flash are all already in the LUT and you're never
> actually *having* to reprogram it?

Yeah, assuming it's not too annoying to identify the repeated patterns
and doesn't blow up horribly just caching should work fine.

--Nc+Vvx0JXuqp7Zy0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOc4VAAoJELSic+t+oim99dEP/RrP3dTPaEwOvbYZdx2qOg0c
tx3jH9uJ+T6EbMZdZCM5IEKq++NbzuoPJAyOr1HVCD53EYD7+rawuw992X9pMhHY
YEbhYQxgT1aikaqlJBMZ2PtsYXhCahEPoRfpH5AshK+4WkSltb9KJtheMCGB8h/W
kxKfrtPpnDPjwI7iu/W3BhJFYU0fvy4U/UCnmAVNnZoR68y4U9VjXotrzus7luA0
3fQZSMtVBRB08Vj+vG7Tk1FsQqsTDACSDagFRglveHznRdY9sIbEhXSnHDlsJouF
/JMmuN7tJNujCvRiOz7UWmvKMlSHFt1kothZlBFU0LEUvzGKAbp7LhMiEmxAWOYg
c69yfRE01qvsQxT8W0hSwEhek4lVehD+38yJtxp7+KDtZ8NvVJhgkTmOZdEFA+ni
KZmRE+qsbHIgneyMk+irPYPhHOotzIKa7hHF6a42LNh3VRQvaR1injyS00nGeV9q
8LGzGVY22f6Sh2WOmkN+4Fl6UzKMXwZR8Vhije1VyAUc5EKsfpHwaxmxltysUtzG
1slG6uNMnfd9YVIRgJiPd/sllNgU0I40QxzQwa/VxGqqqJrcFGtXiIA3bMGvlr3h
p9QqTR5vPcfd+ZIrEo0KGy8qfNI9PuhP1zJckqM9VzoDQ9skYF20y8LkSFll0Pxe
1iB8I5lygKum0/8/AH+e
=KsIK
-----END PGP SIGNATURE-----

--Nc+Vvx0JXuqp7Zy0--
