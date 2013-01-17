Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvpvU-0007gl-3K
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 13:54:41 +0000
Message-ID: <1358430969.2731.253.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd/nand: Print source of error message
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tormod Volden <lists.tormod@gmail.com>
Date: Thu, 17 Jan 2013 15:56:09 +0200
In-Reply-To: <1357986867-22396-1-git-send-email-lists.tormod@gmail.com>
References: <1357986867-22396-1-git-send-email-lists.tormod@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DXEKb/osPSQpyiOxu7RR"
Mime-Version: 1.0
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DXEKb/osPSQpyiOxu7RR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2013-01-12 at 11:34 +0100, Tormod Volden wrote:
> From: Tormod Volden <debian.tormod@gmail.com>
>=20
> Add the function name to the error message.
>=20
> These messages are not very helpful:
>=20
> [183356.176682] uncorrectable error :
> [183356.180273] uncorrectable error :
> [183356.184194] uncorrectable error :
> [183356.187773] uncorrectable error :
> [183356.191280] uncorrectable error :
>=20
> Signed-off-by: Tormod Volden <debian.tormod@gmail.com>

Pushed to l2-mtd.git with a minor amendment (kill the semicolon at the
end).

--=20
Best Regards,
Artem Bityutskiy

--=-DXEKb/osPSQpyiOxu7RR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ+AL5AAoJECmIfjd9wqK0M+gP/2HU1eZytk3IU9k0+twL1baO
B3vPuuxBUMiU3LGTrNnTI19qpFvI3e8iHiZ0mVcGaD8vsZfv5JcpARs7ylnXRp1s
Us67HODC5QUejdasQSxgJtrT72xv4boQNaw0tOJB+CzF/Cad6wQSypKj4n+ew5su
oB1H6rmamWQ01tFnmOwIMhLu7KsGHamE5cuxI/zRxwfrxpdHLmdUU1kDVF8hGcLp
6dzKSqMNpit98TwN54QognRNkr0HyH39a7WLjfkQUL8/EcFyjJs/hZWjYyJMmwfs
Z8dBcY/WpcEuGEwF4yd8QPPIhJwV9RW4nTHCUM8S7Z0U4KnGE0HZ8t+bqrIg0S5G
JCcsmN+ZaNpTTSGWuWMp3/46PqACjolDriCar1TWc6PcnwOZkPYqFn/1zS4Mf/Rd
btEMiRD93XLjbVh/TS8AwocvCfDMNpouRc18lO0OwCIQC58y3MKT8F2TnFQiN+Nx
u3C2/jSOWfwe/TP3Q88QKanhrNJg7Yd7W7naSQvoCVpXSdl7dsn8yPicR/s0fRIw
BaxcuhjbAXIo8P3tFiXyPORLXu+G8PkSzwYutDWbbPSDHnVDmBK0tUSpeNOiI9Mw
Sl12B/DJXr1ZCOnrnJtX6B7wgSpHCD9FKTmVNHJQBs3ILRRaZF9oiLLncLgbD6ep
/O3VjFtNwhxwE8JcH6oF
=ExGP
-----END PGP SIGNATURE-----

--=-DXEKb/osPSQpyiOxu7RR--
