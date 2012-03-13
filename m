Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7QBo-00048V-El
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 11:46:53 +0000
Message-ID: <1331639294.3595.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] drivers/mtd: docg3 fix writebufsize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 13 Mar 2012 13:48:14 +0200
In-Reply-To: <1331461726-10087-2-git-send-email-robert.jarzmik@free.fr>
References: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
 <1331461726-10087-2-git-send-email-robert.jarzmik@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/5Ph7N32YqvGHzm3b3U1"
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


--=-/5Ph7N32YqvGHzm3b3U1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-11 at 11:28 +0100, Robert Jarzmik wrote:
> The docg3 drivers lacked mtd writebufsize initialization. Without it,
> ubifs cannot work.
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

I think I've already done this in the l2-mtd.git tree. I strongly
recommend you to test on top of the l2-mtd.git because it has the latest
stuff.

--=20
Best Regards,
Artem Bityutskiy

--=-/5Ph7N32YqvGHzm3b3U1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXzP+AAoJECmIfjd9wqK0F4QP/2rwTh5OXh0m/v64H8TlQLd9
47cu2cm3C79/AhNLTkrdwycIe+ZkNhOBWNl6hwnIo44IaH6H63S8jLK1rAJySzLi
A8W9yu154zMREcFmVmyI3rvEqVPj6g1qvdMaL1ur66rk/vg42uDV8lq1e0tc3c+X
nN78odlyBqtB1TbMh6P1y3UfuAyB74pZmNXDfk0zJkP7teKtbZdX3jq2NhGugM43
QE343Zb+eEcVAolcGd16aHTJlaiL8kRfsD4X4uznELNT/H812DX6yMCsSD1ZfuMi
gXdV/O28K3GAduq6qfidmP1Zc6HDzrtwrcfPW9pYBsRCP1LckWuCT+syB+oT1YvL
tYvCPlwSx+SZNe4/hn8JsvRQJE39ujOcAAH/JH62YzyrDi8dRhKXcvqGAbwo75e5
7hpwB8237dHoAxwGX/AEV7AWnOzlwTUd2ZgyQhLYL5LlNvcrdthNIVoyFk6HoAOt
Z9w5sgJtaqxM0qkxzUF5AYaGmzLPQYDs+dYrgHo6dCxu6sgLEmM3xfMHz4pssYZ2
NP3WKibT5nmKEZIDPgagZmaioQaSHaDCxGuBJwor/CmurE5qf3aKRv+o2ECGNOma
qBZjmysgXAbLnUTPKrFPeXuh0rbCYmlxcEDi4YqwUNi6k0yMp9ifJ5qO5IB53SoT
pKL4IDZtcNgPT/Xp3/Bt
=TdSv
-----END PGP SIGNATURE-----

--=-/5Ph7N32YqvGHzm3b3U1--
