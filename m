Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLw9V-0006zs-He
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 12:44:29 +0000
Message-ID: <1335098664.4879.6.camel@golum>
Subject: Re: UBIFS mount failure upon power off
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Sun, 22 Apr 2012 15:44:24 +0300
In-Reply-To: <4F85764C.7070408@gmail.com>
References: <4F85764C.7070408@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2daS6qwAUNwlibIaIuR1"
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


--=-2daS6qwAUNwlibIaIuR1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2012-04-11 at 20:17 +0800, Mark wrote:
> brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
> offset=3D3c81c00, ret=3D-77
> UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
> 21:4096, read 2048 bytes
> UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes from
> LEB 18:0, error -5
> mount: mounting ubi13_0 on /usr/local/appdata failed: Input/output
> error
>=20
Please fix your NAND driver and why it returns strange error code
-EBADFD (-77). Uncorrectable ECC errors should be reported as -EBADMSG
instead. Bit-flips as -EUCLEAN.

--=20
Best Regards,
Artem Bityutskiy

--=-2daS6qwAUNwlibIaIuR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPk/0oAAoJECmIfjd9wqK0YxUQAIyCvPWor0kP+QtHLHHkKPuo
5FRUScQ3AEvDo0Y6aMV9m7PNtxHnwnW78k26PZUORUPz5E+HulHIU8slnJzdqS3H
wbXMdDtsObhviCJhRIUAWOZhwHHLDxJZOV//jN/3qWCOvQghm3ovTJSMMCJy9Oxh
wKcSZUwE1k/3Qsj7kFeaxsHrdfx9rHAeaWU6V3Su8pKtDo4nwIH46v1UfatIMW4H
K42RG+z42Q9H3ahxw5iqYywDx83GnkI0m9CzGD1D59q6P/Klzo4asiALbnF8l7FM
MEpxKQXFlzo8ZduJ+RSdv6ewr5j5RRuEoUxON9gBPaWFgWuTohba4DQ7gg5b+JO7
c0wtJQ2RK30fLOiuXMeNjD0SuJ0hK8CCCYeN2afVvcDqffXxe8mrp3GIUpNPlmx0
mptf0h68q1s+IjV+/FWI0V/vH1Lp6gWyo0nttQpkmxqY3dmV+86eju+uewpCLsLh
vV/K+O8u6mttk8HmdIBa2IL2g/yJasS4DxrKavSHWzuVkInGAOZTqnw+L8w4znmo
xd+97TsHqIpcJBAZjD/ijSPdGQNHelzd5rGtodTSPVBFq1vMu/oB2vhM7PS9ujNB
8JckhChBKKeLcVtanFckPqpz9RvF7Bno5tQmbfxb6HDMLxupP0uOm8hURRbVDn5E
E0bCZDWFX8B4CO+lqnJl
=VgYO
-----END PGP SIGNATURE-----

--=-2daS6qwAUNwlibIaIuR1--
