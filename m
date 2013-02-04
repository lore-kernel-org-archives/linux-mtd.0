Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2H4G-0006Fq-27
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 08:06:21 +0000
Message-ID: <1359965280.13791.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: devices: elm: Removes <xx> literals in elm DT node
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Philip Avinash <avinashphilip@ti.com>
Date: Mon, 04 Feb 2013 10:08:00 +0200
In-Reply-To: <9580c5839ea64e09ddd61610ce922d7cd1adc861.1359010256.git.avinashphilip@ti.com>
References: <9580c5839ea64e09ddd61610ce922d7cd1adc861.1359010256.git.avinashphilip@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xwUgq7gi4ffNHM1Nna01"
Mime-Version: 1.0
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com,
 gururaja.hebbar@ti.com, grant.likely@secretlab.ca,
 linux-mtd@lists.infradead.org, hvaibhav@ti.com, rob@landley.net,
 dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xwUgq7gi4ffNHM1Nna01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-24 at 12:23 +0530, Philip Avinash wrote:
> As part of removing generalized dependency, replace <xx> literal fields
> in DT compatible field with <52> for am335x platforms.
>=20
> Signed-off-by: Philip Avinash <avinashphilip@ti.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-xwUgq7gi4ffNHM1Nna01
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD2xgAAoJECmIfjd9wqK013EQAICi9n36zs4RoRxN98qurA+K
r7blCtPgWEi4TpxKXD9TYAGlMtEgkT7zhD7RfH+k7TC42mo2pWmSLcMPwmmkSOX0
SbWcgqEy+N498K+Id25W6yNX51qLlrQ/GWvLWtMw9seOiYz3Lt6jr+cCGTZI3ZO6
ZO6gOD+7jlqs1R1aGUGQR5NOqdGQcqARCmbm138p0AJzL1+qatLxUV8i+xaHUldB
TQzr0tR7uH/mH1PFAsxs0LVWjJS1REXQGQKY980hnUVNcGwPEiURXbSUFyn1p4ai
2DHCihDX3p2oKOH1gVLDUQp2amTtZvhoUyJSiqGAO9auDOTSP0No2iP4F1tlTRJo
43Drn+GNZgYRs4zuXGBQI4S9tt0nUlgc3/Q0eBDjA79X5CH46U4aVxw6kDKfFeUV
g9IkYIvq2MKqd4Ka3gZ4mdb8OmWSEEuTLP8FKLkmc5cwCLdXnRr2yevTi4YgbqiA
LDdFic6BoMDeJ2MDm+m2J0xZsMKgkj3RNOYnh3QsV4/onOWmoMD4Bv3IOP1vVF5L
yR26vRMq/zBUpEQb1hrSQM03L0P7AgDJnDOz6Rj8KLnLrUaUz5oEG1yiuvkcuvu+
D2cAPqkMG+IvuX+tBVYIb8vW1cEyxzvb8uru1i99IgpSHckoN/ppr/rQxYWrK4GS
sI/PtrEftGSUjTtxIhRn
=7p52
-----END PGP SIGNATURE-----

--=-xwUgq7gi4ffNHM1Nna01--
