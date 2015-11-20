Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzrGI-0002ra-4x
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:22:22 +0000
Date: Fri, 20 Nov 2015 19:21:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Martin Sperl <martin@sperl.org>
Message-ID: <20151120192157.GF1929@sirena.org.uk>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
 <564EC4E0.90602@gmail.com>
 <CAFSsGVsJBi6yPin7X9MCS8LD6nygjynfgDgFicjojkm0rOJSJw@mail.gmail.com>
 <20151120123540.GC1929@sirena.org.uk> <564F6D99.8090203@gmail.com>
 <CAOMqctTt=78C4m2jjMb9mRBOkoZ5uZ4neVm0NS39iNO8otn=dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline
In-Reply-To: <CAOMqctTt=78C4m2jjMb9mRBOkoZ5uZ4neVm0NS39iNO8otn=dA@mail.gmail.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2015 at 08:05:48PM +0100, Michal Suchanek wrote:

> I don't think ignoring errors in general is good idea.

> If it's desirable that a partial transfer is reported as error then a
> particular error value should be defined for this case and drivers
> that can continue the transfer in a driver-specific way (such as
> spi-nor) can check for this error and handle it appropriately and pass
> through any other error.

Fundamentally callers just shouldn't be trying to do excessively large
transfers in the first place, this is why we want capability reporting.
*Any* error code could indicate a truncation, we may have truncated due
to some length limitation but it could also be that there was some
hardware problem that occurred mid transfer or something similar.

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWT3LVAAoJECTWi3JdVIfQm+kH/iCuYCtjXTEkZk8I5D5ZU9Yv
Y24RO6PFYZHkRJoyv0rOb2jl+Hads2lX0xW7jcbO/peVyyxoPgG37OadKUnlTsE5
EyMYPzykLIg359rvrwt2hBBpq0iiawV2MIsuWZAJtFErEvOjb32rn/YNgm3Gzi4c
3KEYDnUd7Zw1yc/oWjK4AFU/PMSVxud/hWaDB3eEJK1Z2ZOQuXnIb6Zy1i8pmMA6
bmPYEZusUR5bMCJmpKCwmUgTzlXZFtadux3lboLciPi/OMpbQAJACRZR1kP0A5qH
AWuuG5ZXv5vZ8QOAr296TurMCmba/THFLknqZUqWu4E0fvlY1rnQSiubyyHb+y4=
=eG+H
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
