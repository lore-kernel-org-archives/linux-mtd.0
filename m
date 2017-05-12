Received: from us-smtp-delivery-212.mimecast.com ([63.128.21.212])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d9CbS-0007iy-Kl
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 15:35:41 +0000
Subject: [PATCH] mtd: nand: tango: Update ecc_stats.corrected
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek
 <pavel@ucw.cz>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
 <20170503200427.GC17315@amd> <20170504104216.0969423f@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <a78b005a-ef38-7dda-1213-82acc09de597@sigmadesigns.com>
Date: Fri, 12 May 2017 17:34:01 +0200
MIME-Version: 1.0
In-Reply-To: <20170504104216.0969423f@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to Boris, some user-space tools expect MTD drivers to
update ecc_stats.corrected, and it's better to provide a lower
bound than to provide no information at all.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
NB: this patch is based on 4.9; if it looks good, I'll rebase
it on v4.12-rc1 next week.
---
 drivers/mtd/nand/tango_nand.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index 4a5e948c62df..471348462e42 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -55,10 +55,10 @@
  * byte 1 for other packets in the page (PKT_N, for N > 0)
  * ERR_COUNT_PKT_N is the max error count over all but the first packet.
  */
-#define DECODE_OK_PKT_0(v)=09((v) & BIT(7))
-#define DECODE_OK_PKT_N(v)=09((v) & BIT(15))
 #define ERR_COUNT_PKT_0(v)=09(((v) >> 0) & 0x3f)
 #define ERR_COUNT_PKT_N(v)=09(((v) >> 8) & 0x3f)
+#define DECODE_FAIL_PKT_0(v)=09(((v) & BIT(7)) =3D=3D 0)
+#define DECODE_FAIL_PKT_N(v)=09(((v) & BIT(15)) =3D=3D 0)
=20
 /* Offsets relative to pbus_base */
 #define PBUS_CS_CTRL=090x83c
@@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip, u8=
 *buf)
 =09=09=09=09=09=09  chip->ecc.strength);
 =09=09if (res < 0)
 =09=09=09mtd->ecc_stats.failed++;
+=09=09else
+=09=09=09mtd->ecc_stats.corrected +=3D res;
=20
 =09=09bitflips =3D max(res, bitflips);
 =09=09buf +=3D pkt_size;
@@ -202,9 +204,10 @@ static int check_erased_page(struct nand_chip *chip, u=
8 *buf)
 =09return bitflips;
 }
=20
-static int decode_error_report(struct tango_nfc *nfc)
+static int decode_error_report(struct nand_chip *chip, struct tango_nfc *n=
fc)
 {
 =09u32 status, res;
+=09struct mtd_info *mtd =3D nand_to_mtd(chip);
=20
 =09status =3D readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
 =09if (status & PAGE_IS_EMPTY)
@@ -212,10 +215,14 @@ static int decode_error_report(struct tango_nfc *nfc)
=20
 =09res =3D readl_relaxed(nfc->mem_base + ERROR_REPORT);
=20
-=09if (DECODE_OK_PKT_0(res) && DECODE_OK_PKT_N(res))
-=09=09return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
+=09if (DECODE_FAIL_PKT_0(res) || DECODE_FAIL_PKT_N(res))
+=09=09return -EBADMSG;
+
+=09/* ERR_COUNT_PKT_N is max, not sum, but that's all we have */
+=09mtd->ecc_stats.corrected +=3D
+=09=09ERR_COUNT_PKT_0(res) + ERR_COUNT_PKT_N(res);
=20
-=09return -EBADMSG;
+=09return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
 }
=20
 static void tango_dma_callback(void *arg)
@@ -280,7 +287,7 @@ static int tango_read_page(struct mtd_info *mtd, struct=
 nand_chip *chip,
 =09if (err)
 =09=09return err;
=20
-=09res =3D decode_error_report(nfc);
+=09res =3D decode_error_report(chip, nfc);
 =09if (res < 0) {
 =09=09chip->ecc.read_oob_raw(mtd, chip, page);
 =09=09res =3D check_erased_page(chip, buf);
--=20
2.11.0
