Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4SPs-0000Qx-PE
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 08:05:25 +0000
Message-ID: <1345709408.2848.207.camel@sauron.fi.intel.com>
Subject: Re: Current mainline (3.6-rc3) UBIFS errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
Date: Thu, 23 Aug 2012 11:10:08 +0300
In-Reply-To: <20120823095048.6c6ee35a@archvile>
References: <20120823095048.6c6ee35a@archvile>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mgLxySZDc9tKaACQXyCT"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mgLxySZDc9tKaACQXyCT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 09:50 +0200, David Jander wrote:
> [    4.069409] UBI warning: ubi_io_read: error -74 (ECC error) while
> reading 160 bytes from PEB 5616:87112, read only 160 bytes

Hi, looks like a problem with your driver. For some reasons it returns
ECC errors when reading small amount of data (160 bytes). Did you run
mtd tests - to they pass?

So UBI just tells that it cannot read, the root-cause is in the driver.

Did this work in loder kernels? If yes, you can try to bisect.

--=20
Best Regards,
Artem Bityutskiy

--=-mgLxySZDc9tKaACQXyCT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNeVhAAoJECmIfjd9wqK09DEQAMwQg8K1OwK2q2vcfwl9tGmh
2RUBCBLHo6czWtTlWpU+Zy4DMWD//ir3xZMptWcCqHyYDa5P1oXJozIOYWfRStP3
ySrsRtPjsfvHC1o9QCoJ5vpYB4hTZJPYHtsHefjrzJ6lfK9nnXbIG9yDuYDXvFKL
zfWDGx+Ib45DwAfdfYr/TnKgDPAE3/c2BH3PjgSGiSrSIcJfKc5l+m+79b79FJ9o
FSwYt0wg6Gu8ChPxnzyJJpPo6VwchWbg0jzcMMVo6NDGQq2G5sULCRXg8eK2EtYc
JtoXghd6vhhppmlD3+gl1Y5c4zzqilALzkQrAiKxEZMxymLhDJeK7zDLCXaINe1U
J/rNGO5m2b9V0BAgL+Icx1MXZddTbd3LVWHQEEoT4WZtWtLZWPI9OK3ts1146pFV
kRYZkPlYU7LAThy1IzVgqBASjJBuGvzDK9KDxaP9L4pcTIjbJlNlrY8WEWXueefe
DwrDSvmtzPKy9zNVIk3cEb4dK6yiMbGYAUfFJtF2SNXo8SvlyHtrH4YzYx4xfEL4
vRzGIGsJP/P7oKBn7PDVqFrQ1bbZb3Nl43pC4a6RRAk5Djzd1Wn4XUozexxV3xec
UmksH6oL+hrABl/45KUnNz/mP61jOe9OLfNEcvFgVdebeH/RPi9ElHEl+Grr2nQ3
sS2be2J5vK73KU/ExdGO
=AAqM
-----END PGP SIGNATURE-----

--=-mgLxySZDc9tKaACQXyCT--
