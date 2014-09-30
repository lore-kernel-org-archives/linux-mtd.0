Message-ID: <1412043304.9388.83.camel@decadent.org.uk>
Subject: [PATCH v2 2/5] spi-nor: Remove spi_nor::read_id operation
From: Ben Hutchings <ben@decadent.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 30 Sep 2014 03:15:04 +0100
In-Reply-To: <1412043222.9388.81.camel@decadent.org.uk>
References: <1412043222.9388.81.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-aD38NQIi4rPe6on/9NMQ"
Mime-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-aD38NQIi4rPe6on/9NMQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is currently no useful way to override the default
implementation of this operation.  The returned struct spi_device_id
must have a pointer to struct flash_info in its private data, but this
structure is defined inside spi-nor.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +---
 include/linux/mtd/spi-nor.h   | 3 ---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 53783ed..c2f0573 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -902,8 +902,6 @@ static int spi_nor_check(struct spi_nor *nor)
 		return -EINVAL;
 	}
=20
-	if (!nor->read_id)
-		nor->read_id =3D spi_nor_read_id;
 	if (!nor->wait_till_ready)
 		nor->wait_till_ready =3D spi_nor_wait_till_ready;
=20
@@ -929,7 +927,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_=
device_id *id,
 	if (info->jedec_id) {
 		const struct spi_device_id *jid;
=20
-		jid =3D nor->read_id(nor);
+		jid =3D spi_nor_read_id(nor);
 		if (IS_ERR(jid)) {
 			return PTR_ERR(jid);
 		} else if (jid !=3D id) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5ec84cc..66af67a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -139,8 +139,6 @@ enum spi_nor_ops {
  * @write_xfer:		[OPTIONAL] the writefundamental primitive
  * @read_reg:		[DRIVER-SPECIFIC] read out the register
  * @write_reg:		[DRIVER-SPECIFIC] write data to the register
- * @read_id:		[REPLACEABLE] read out the ID data, and find
- *			the proper spi_device_id
  * @wait_till_ready:	[REPLACEABLE] wait till the NOR becomes ready
  * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
@@ -172,7 +170,6 @@ struct spi_nor {
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 			int write_enable);
-	const struct spi_device_id *(*read_id)(struct spi_nor *nor);
 	int (*wait_till_ready)(struct spi_nor *nor);
=20
 	int (*read)(struct spi_nor *nor, loff_t from,


--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-aD38NQIi4rPe6on/9NMQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCoSKee/yOyVhhEJAQpU7w//SA3GlYTtSo+gaRz6neRN1gUocnU+/0yK
YDBVtYjr+Z3e+qRpl47YqQED+C50c/sIts9h/bQgPNkmUspiX8vbsHh3KlERTWrJ
I1mimSvlmDNCEXsF/MHHZOXUKfeGyGHLkzmJbX/EFZXDXIP982GqMc0mRaM/6iWe
wU693/0zRSrVc4JLTsctpiD312eYAdZ5AHYMrpoRAHlTdzBD57W+FgADP5xj5l9w
JBgehAJ4D7UfEsIA0SD0xiReoc+T57Wi/lIluy2+xAX2ktxaMoFgxnAMxpskgoxf
mVZfjKjFV0zkxJBi4cEBAlDKA/xykFFkbArQIWa5KvdVW2hMVFfUzknH5UV3fARb
j7yt5Ydtauxmvcp0NeUZ+BwD6edbSbTqvwmyK63C4qyNItH+Az8P8MCm56g8+ShZ
Rt0ga6VyQEbWO5bhVq46s0T+ntVk4IjWTFYaPUdCayAw0bQxgMYaB2GcuYmZktwa
1f2ZX0H8u5055FKditt3eyAVlC//+TpXKDHylZYqf71764U3fCpLmbBtb1jIpvFd
/obJtIbiTYb3VNf/ISpO+dCxiJf9M4KiGBzy102rI9SL8NYMvoSmINc6z7ucQMvh
WnJqQeX6K+56MCVPjFapJLN+sNte6g6DWWgGLuVvnd5IJ9+a72n4UoH8IWtAt/cx
8VH3sciPmUE=
=kVqb
-----END PGP SIGNATURE-----

--=-aD38NQIi4rPe6on/9NMQ--
