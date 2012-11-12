Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXwGX-0001tq-7N
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:49:37 +0000
Message-ID: <1352735412.2262.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtdoops : don't erase flash at each boot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Mon, 12 Nov 2012 17:50:12 +0200
In-Reply-To: <1350660573-6631-1-git-send-email-matthieu.castet@parrot.com>
References: <1350660573-6631-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qqn2r2guTrSNvtz02Xzi"
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


--=-qqn2r2guTrSNvtz02Xzi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-19 at 17:29 +0200, Matthieu CASTET wrote:
> If there is no oops stored (flash is erased), find_next_position will
> exit with maxcount =3D=3D 0xffffffff and erase the first page.
>=20
> Only erase it if mark_is_used.
>=20
> Signed-off-by: Matthieu Castet <matthieu.castet@parrot@com>

The code of mtdoops is really hard to read. Could you please provide a
better commit message with better description about what you do:

1. what problem you fix exactly, and why is it a problem
2. how the code currently works
3. how you change it to make the problem go away

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-qqn2r2guTrSNvtz02Xzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRq0AAoJECmIfjd9wqK0XlEQAJOGKB2ZnnzoA7BT3U+EFYP2
YwV+nGKgHUK4s1fju/VPKa4Go1b+eQDrV/aJcM2Q6gRB94IPTnW/WsN7mccSLj5S
Bj+1jLA9CBH0XR38NYKHi9xxVvDrICDje4IDy8XDSggUCSoD0Y3jWj+oKPooEmcZ
nD+BJXwKejgoAKY6LdicyVWfuhtK1dy1Pvll7TB5cgnoHv/EqdA+CtsOI/1OKvVQ
le6tt/zFZlpQBLNC4BeOvZLeIH5fuREfq/Pobw9qistyOiOY3A5gvrlSD6pW37hg
/+bPuHhZROmqI4PYO8y8MBsw3WwqY7aKXdMO2yNGov9LruKYChmBKZdYR0ykr01P
lwG7LLcL7mkN+ckJ1V/3ZtLlV2d9BlEH2xx42Bjc/gmmRXQdg1YDi68j5ehlqSm6
KP/EN1TEVx1OPG4Y/fo7KNEBUJhWaymGQdc4N4gyGUlEGrFT6NSCs20b7H4TQFYh
DRqKP3I8bU5t3Q0tC8lC5bDNV/QG5GUSMM3sFsk9G47iiRXRdbqp/7UhaWDtpebN
aSCultx4HmmLZPhfk3mLstMaBeT5gshidDuGNdTCxZ0Uc9Lrqf5p1g8FDabfC6cF
uusWIoH3N6AhFO8oeG03nNT4fUQeeucYdtIeGAl/rrCJbFbrRcVIWVrtSIrc2YHH
G9imWWTmkP7D30hPOpVm
=Elfz
-----END PGP SIGNATURE-----

--=-qqn2r2guTrSNvtz02Xzi--
