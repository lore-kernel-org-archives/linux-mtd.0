Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1figxD-0001m0-Hs
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 14:09:24 +0000
Date: Thu, 26 Jul 2018 16:09:06 +0200
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH mtd-utils] ubi-utils: ubimkvol: Initialize req to zero to
 make sure no flags are set by default
Message-ID: <20180726140905.znyv2xnhmdk7gqfc@qschulz>
References: <20180726140529.6261-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ietmjev67dzlvlpe"
Content-Disposition: inline
In-Reply-To: <20180726140529.6261-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ietmjev67dzlvlpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Thu, Jul 26, 2018 at 04:05:29PM +0200, Boris Brezillon wrote:
> The program expects req.flags to be zero-initialized, but it's not
> the case. Let's explicitly initialize req to zero at declaration time.
>=20
> Fixes: 7b4a65a27d26 ("ubi-utils: ubimkvol: add support for skipping CRC c=
heck of a static volume when opening")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>

> ---
>  ubi-utils/ubimkvol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
> index 195006133216..b709b43a8318 100644
> --- a/ubi-utils/ubimkvol.c
> +++ b/ubi-utils/ubimkvol.c
> @@ -221,7 +221,7 @@ int main(int argc, char * const argv[])
>  	libubi_t libubi;
>  	struct ubi_dev_info dev_info;
>  	struct ubi_vol_info vol_info;
> -	struct ubi_mkvol_request req;
> +	struct ubi_mkvol_request req =3D { };
> =20
>  	err =3D parse_opt(argc, argv);
>  	if (err)
> --=20
> 2.14.1
>=20

--ietmjev67dzlvlpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJbWdX/AAoJEIS4mnU+4PGjF+IP/0MXVnGSpfhUSr0lcmKv8oX2
GS+wNRyVvjjmAwoLxZyQAAabuDHpodneRU7ZhU6bL/XdbCKcc2+a5kn4aEimi+Vm
WYSc1dtNs6Bhxlq3WUEUSMkB0bE8GcCpwj2h0E0CGDLl/gUXqsn3K2IL0wQK4lPV
UjiXU8fBXyY1r2dvF5hpqfFlmqgbAPvP5ZUQKJHDPnWeMGzm/r9fjSkdekc/A+2V
VWK0UUN5NHp6YBs7e9Kg2/NNK3hDfhNDl53CMv76b9RoZctQY7v8jzjAhtUCtscV
fryET6Okux56UwMQaUxWA/ihHUMJPbgap4lRHgnCNybKGqhLnkA2lKmfzoTT6oqL
fUMs/77oh7ViRGmZd8mrVRu5Iq0XyATMHw9i6tUReo28ucm8F5HQVLouNEeD5Mad
co2WXcDo1W9X337utgX1b6EH613+heuUkhXgdABNjsLCLuJOySev7ohXt/QTrqVA
RDk24htxD1I6OswRUxfdDYJ9dAAWS9rSozi66WSs1bElod88i3mWNj0Hkkh7WEY2
bB4WCqipidsSQMBc6cnv9taO6z6Vc8rw/Ohcx3mnO2tzePw8M3heNtl4GEelXLEL
ohW6fCKzE5IaDjf7ugNonrpU4WZmtcx/CjUp3bkOcllmV4PpLqN3pzdgY36ISh0/
0qcDJXuc4pcGnMNx6sN0
=S3kR
-----END PGP SIGNATURE-----

--ietmjev67dzlvlpe--
