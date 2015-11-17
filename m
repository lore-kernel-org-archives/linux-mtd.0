Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZygB2-00046L-NP
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 13:20:05 +0000
Date: Tue, 17 Nov 2015 13:19:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <20151117131930.GP31303@sirena.org.uk>
References: <20151113225113.GJ8456@google.com>
 <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com>
 <564A101F.9090807@osg.samsung.com>
 <20151116192434.GO8456@google.com>
 <564A35EB.5080008@osg.samsung.com>
 <20151116204702.GP8456@google.com>
 <564A4B66.6090107@osg.samsung.com>
 <20151116215144.GQ8456@google.com>
 <564B2833.8030100@osg.samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tZCmRiovzb4sxAVa"
Content-Disposition: inline
In-Reply-To: <564B2833.8030100@osg.samsung.com>
Subject: Re: spi: OF module autoloading is still broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tZCmRiovzb4sxAVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2015 at 10:14:27AM -0300, Javier Martinez Canillas wrote:
> On 11/16/2015 06:51 PM, Brian Norris wrote:

> > Lest someone else wonder whether this is theoretical or not, I'll save
> > them the work in pointing at an example: "st,st33zp24". See:

> > Documentation/devicetree/bindings/security/tpm/st33zp24-*.txt

> > and the code is in drivers/char/tpm/st33zp24/, sharing the same core
> > library, suggesting that the devices really are the same except simply
> > the bus.

> Thanks for pointing out that example although for that specific case,
> the drivers' compatible are "st,st33zp24-i2c" and "st,st33zp24-spi" to
> avoid the issue explained before.

Eew, that's gross. =20

> I still didn't find an example where the same compatible string is
> used for different drivers (i.e: "st,st33zp24" or "google,cros-ec")
> but the fact that is possible for legacy and not for OF is worrisome.

There's a bunch of audio CODEC and PMIC drivers, arizona is the first
example that springs to mind but it's very common to have mixed signal
devices devices which can run in both I2C and SPI modes.

--tZCmRiovzb4sxAVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWSylhAAoJECTWi3JdVIfQ3RUH/1KeAZAT6D4vGYQDG8MefSTW
qQj91FlaZm9HtGn88HVOAldxkUapfxsOJh7ZBzyMW5iipKkEPl+uj5P7SCxuBiEe
s641nwoKV5cAjXp8wAZp41Oeb1mWUCvl8WSBUZM2TT6xMY8tKxClSYfzpZPzUVfv
BfSTtHGj2WW976FMpTYr+EPKSqtSyXPcgVSGSHjITYcq8sRQtjF39CEKWUOlMdya
vTL/G7p1r1cv9SMfZDE2MRh83el3mfR4It2/smDgg1Jk+l9w7wyEmyXai5wh1/35
7QtPLvFJk9pEV1Gn1dOo/ePc505OAVrwCF4/pmId3htDqqzGg1av0k5kGoIBLYE=
=DFSh
-----END PGP SIGNATURE-----

--tZCmRiovzb4sxAVa--
