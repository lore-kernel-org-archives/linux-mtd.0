Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv6Ic-0006Qo-LO
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 13:11:32 +0000
Message-ID: <1358255575.2731.134.camel@sauron.fi.intel.com>
Subject: Re: [FIX][PATCH 3.8] mtd: bcm47xxnflash: increase NFLASH_READY_RETRIES
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 15 Jan 2013 15:12:55 +0200
In-Reply-To: <1356366869-22943-1-git-send-email-zajec5@gmail.com>
References: <1356366869-22943-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Oso1+z0V7kxgRNaxAa5D"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Oso1+z0V7kxgRNaxAa5D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-24 at 17:34 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> Recently imlemented writing support has shown that current num of
> retries is too low. Writing requires longer waiting than simple reading.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Just FYI, this patch is sitting in David's tree and will probably be merged=
 to 3.8.
=20

--=20
Best Regards,
Artem Bityutskiy

--=-Oso1+z0V7kxgRNaxAa5D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9VXXAAoJECmIfjd9wqK0I9oP/jlFnKodRt7qEwKJ7CpgHKlw
aDpG6sqULt4MmyDKeEmDrZ3Vm3778kJQXPP5RD72Lg0APVZ7z9zg0IQYofwgfmiN
MM6DCVGinl4fwCwlMANcyankCbWIBa7hHQ/AP/XFAIAB8ZQDNKPFw6XvQMYK7nDn
46G13t3yafxbCXwkDgzn/esV/Jod26pQMLlOb1ilex2EJbm10WfbSCjLGfTeaGqi
NJiYKfAzPwSValcXn8kPhUkpH3opqb3FNcjaQmWmx9DJe3xYLZKP8R1BMHI08pRP
5zuSxwi8U7Y516tJHQ8CZcLhfBjC5G7dE+ML4fAwMjqHJFiuVCDFSVTweTjrefXp
5wVWofcdHyYZzAcJHnTtxTUQlN5L2p0OInh+WFHMR6qz7zii/j0nr5lndOVrUYvF
p0WBJ0eTVhBqtWNNwVS4CuR+cudQ8i0fCJVYYPJZ3naZjqIWlNQjEh9Ifmnbh0vr
qszo6heIUx5eINLpi6h8YhOBMwFEAbbJClKLkQUeJ/aqT2tBfxkeiRPe3sM2KtNL
+1XHn0yRfgSadUoB150PsQQpR3aKdWM3v/RZiEz20MlR5HINx0T4VfQuwEm9e9Oh
n4LhXymjiIrLFe1YYF8bJuMUDagxZX9fK4GPy1zBY9MGPhooAoGRvdDgFmHvvkpl
VqbCF1gnkUP5UFPW/0t9
=pQZk
-----END PGP SIGNATURE-----

--=-Oso1+z0V7kxgRNaxAa5D--
