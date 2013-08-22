Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCULY-0007G2-8l
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 12:50:41 +0000
Date: Thu, 22 Aug 2013 13:50:13 +0100
From: Mark Brown <broonie@kernel.org>
To: wangyuhang <wangyuhang2014@gmail.com>
Message-ID: <20130822125013.GH26118@sirena.org.uk>
References: <1376216630-5915-1-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2+N3zU4ZlskbnZaJ"
Content-Disposition: inline
In-Reply-To: <1376216630-5915-1-git-send-email-wangyuhang2014@gmail.com>
Subject: Re: [PATCH v3 2/2]spi: DUAL and QUAD support
Cc: linux-abi@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 tpiepho@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--2+N3zU4ZlskbnZaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2013 at 06:23:50PM +0800, wangyuhang wrote:
> fix two things in previous patch
> 1. Change the value of transfer bit macro(SPI_NBITS_SINGLE, SPI_NBITS_DUAL
>    SPI_NBITS_QUAD) to 0x01, 0x02 and 0x04 to match the actual wires in
>    spidev.h.
> 2. To keep tx_nbits and rx_nbits in @spi_ioc_transfer compatible to exist=
ed
>    binary in userspace, add SPI_SPIDEV_TRPBIT in Kconfig to make user sel=
ect
>    appropriate spi_ioc_transfer.

This isn't really a good solution for the ABI - it's OK to remove
support for features but it's not good to have the ABI vary depending on
the kernel config.

> @@ -86,6 +95,10 @@ struct spi_ioc_transfer {
>  	__u64		tx_buf;
>  	__u64		rx_buf;
> =20
> +#ifdef CONFIG_SPI_SPIDEV_TRPBIT
> +	__u8		tx_nbits;
> +	__u8		rx_nbits;
> +#endif

Instead of doing this I'd define a new structure like this:

	struct spi_ioc_ext_transfer {
		struct spi_ioc_transfer core;
		__u8		tx_nbits;
		__u8		rx_nbits;
	};

(though this is going to get messy if we get more additions...).  I'm
not sure there's a nice way of doing this though.

--2+N3zU4ZlskbnZaJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFgkBAAoJELSic+t+oim9O3oQAJ0oEPj0urEhkpjTdApfMFFA
P8XVgEDmljxZ7uUO4c4TePkEZ2ttQX8YBNFe+F1JoHxQoxMLkFwwS0DZ+sBsynhy
sH2mgwzI6NQvzvXkGuKRcBSdQx+b4MpSuKREC4B/xuuxEl25xE8nb2F8iwmnb3nu
D9w7RYVt+LJOCVbGiRWwLD71NetT8M81A4lssvhbISIfVZtS9fMijyl/imTmQlMS
5sj9stXSdBXe4LM/ZZ+qRjYs9kGm4XCjgAakCio6E44y0o6pGrMOyfmUZB1KIHgm
pieyh4e6reNKG+tq/l3Je0QkqwT8REZcekIBKTcHhmqCoXsnTWaok45+7yZNmxzg
MLoDXj1GWuCrAkPYsGAw4O7HaW241c1yU8og3TahBpRiN3d9Klv6GDL7DNC6zjqN
FhmGo5e2b8bREKdOB+DKPC7HHdrcjIvqF44ZjCka6OVLJ2qjDo6RQE9Xp1N0jrLD
ev53BI7fAbW+rxK+GHXbzjQuWnssqc0XerHXtXDk4ekhY7dzFtjKDKMeYW/mgQCl
nTIBjuvUuJ31PdpErSC+uXFoVOr4ZJeOfAWgqNq1hf2JCbs6j2i5BbcYekwt9g0j
riv25mPEXog1EQ+BBO0LnVQq/u3foucRuRAF/kZfk4nlulZPfIuoRc5wJC3osS7t
dWsOu4WP1p3btBWWouHK
=BKJY
-----END PGP SIGNATURE-----

--2+N3zU4ZlskbnZaJ--
