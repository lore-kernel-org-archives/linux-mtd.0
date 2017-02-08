Received: from mezzanine.sirena.org.uk ([106.187.55.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbXpp-0001Aa-Hc
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 19:23:23 +0000
Date: Wed, 8 Feb 2017 19:22:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Message-ID: <20170208192236.muenymk6s36hrn42@sirena.org.uk>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ufawbfqd44k6rzji"
Content-Disposition: inline
In-Reply-To: <20170208190939.GA97840@google.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ufawbfqd44k6rzji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2017 at 11:09:39AM -0800, Brian Norris wrote:

> But one question: *why* exactly is the transfer or message limit so
> fixed? If a SPI controller allows manual control over the CS line, then
> why would anybody care if a sequence of data gets split up into multiple
> HW sequences (e.g., for a long spi_transfer, why can't we split it into
> 2 sub-transfers, while keeping the CS asserted?).

Not every device will provide software control of the chip select line
so it's possible you might hit limits there.  If a device does allow
software control then yes, we should be handling this transparently in
the core and splitting up longer transfers into chunks the device can
handle and in fact this is already done in spi_split_transfers_maxsize().=
=20

We're missing masking that out in spi_max_transfer_size() though so
clients won't know if we can handle things, it's overly conservative.

--ufawbfqd44k6rzji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlibb/wACgkQJNaLcl1U
h9CR/Af+J1N+5P6VI/fn3UN2EeRJlc4XJc8GpYVKNINAl7MJgdPnwHbl5S1AMG+H
o5KluBQVruhm5HxrFU+GChsznEaBNUkGrEQpNeMWjKyM/CIuaRW090z/uHD5HQYO
T3NyyG8AdXgWpZaLTQrYWNLu3H0j06zqUZghf8mhk7jfAYIZJV9k76GGr9yYdX1V
Oy0NZh6VmPaCm79Nr5FSFqrLKtzlGZe3YwEJhni0AMPKnjTPhgKa8U8I1Q+o4HMP
jpCtyzLxZauoIol/J9pgy2CcsfNlxgvjowd9bvLvf7V8QlyJx9Er3cXW33v77wcS
HKTF4bmVxcnpRr+BSkrJrkRXFfk/rA==
=Jnms
-----END PGP SIGNATURE-----

--ufawbfqd44k6rzji--
