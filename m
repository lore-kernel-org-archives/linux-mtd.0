From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: Marek Vasut <marex@denx.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
Date: Tue, 14 Oct 2014 01:26:49 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "grmoore@altera.com" <grmoore@altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch used to modify the method of spi_nor_scan overwrite platform ID =
point.

If type of platform data match with the name of spi_nor_ids set,
and JEDEC ID also match with INFO ID of spi_nor_ids set,spi device
ID point(this is before probed according to device name) shouldn't be
overwrote.Otherwise,this point will be overwrote by new spi_nor_ids
set point that probed according to JEDEC ID.

Signed-off-by: bean huo <beanhuo@micron.com>
---
v1-v2:
	add extended ID match judgment.

 drivers/mtd/spi-nor/spi-nor.c |   25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b5ad6be..3bb8077 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -963,16 +963,23 @@ int spi_nor_scan(struct spi_nor *nor, const struct sp=
i_device_id *id,
 			return PTR_ERR(jid);
 		} else if (jid !=3D id) {
 			/*
-			 * JEDEC knows better, so overwrite platform ID. We
-			 * can't trust partitions any longer, but we'll let
-			 * mtd apply them anyway, since some partitions may be
-			 * marked read-only, and we don't want to lose that
-			 * information, even if it's not 100% accurate.
+			 * If type of platform data match with the name of
+			 * spi_nor_ids set,and JEDEC ID also match with
+			 * INFO ID of spi_nor_ids set,shouldn't overwrite
+			 * spi device info point.Otherwise,will overwrite
+			 * it.
 			 */
-			dev_warn(dev, "found %s, expected %s\n",
-				 jid->name, id->name);
-			id =3D jid;
-			info =3D (void *)jid->driver_data;
+			struct flash_info *tmpinfo;
+
+			tmpinfo =3D (void *)jid->driver_data;
+			if (tmpinfo->jedec_id !=3D info->jedec_id ||
+					(info->ext_id !=3D 0 &&
+					 tmpinfo->ext_id !=3D info->ext_id)) {
+				dev_warn(dev, "found %s, expected %s\n",
+						jid->name, id->name);
+				id =3D jid;
+				info =3D (void *)jid->driver_data;
+			}
 		}
 	}
=20
--=20
1.7.9.5
