Received: from mail-bl2nam02olkn0810.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::810]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoa8F-0006w6-4t
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 19:32:51 +0000
From: Bean Huo <beanhuo@outlook.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-elections.com"
 <boris.brezillon@free-elections.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
CC: beanhuo <beanhuo@micron.com>
Subject: [PATCH v1 2/3] mtd: probe: probe dual die entry from devicetree
 binding
Date: Wed, 21 Feb 2018 19:32:34 +0000
Message-ID: <DM2PR12MB001471EC3E5B6841C61ED9FEA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
In-Reply-To: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: beanhuo <beanhuo@micron.com>

The device_stack property now will be initialized when devicetree
has an entry compatible with "dual_die_stack".

Signed-off-by: beanhuo <beanhuo@micron.com>
---
 drivers/mtd/chips/cfi_probe.c | 7 +++++++
 include/linux/mtd/cfi.h       | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index e8d0164..6182406 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/gen_probe.h>
+#include <linux/of_platform.h>
=20
 //#define DEBUG_CFI
=20
@@ -159,6 +160,7 @@ static int __xipram cfi_chip_setup(struct map_info *map=
,
 	int num_erase_regions =3D cfi_read_query(map, base + (0x10 + 28)*ofs_fact=
or);
 	int i;
 	int addr_unlock1 =3D 0x555, addr_unlock2 =3D 0x2AA;
+	struct device_node __maybe_unused *np =3D map->device_node;
=20
 	xip_enable(base, map, cfi);
 #ifdef DEBUG_CFI
@@ -177,6 +179,11 @@ static int __xipram cfi_chip_setup(struct map_info *ma=
p,
=20
 	cfi->sector_erase_cmd =3D CMD(0x30);
=20
+	cfi->device_stack =3D CFI_DEVICESTACK_1DIE;
+#ifdef CONFIG_OF
+	if (np && of_property_read_bool(np, "dual-die-stack"))
+		cfi->device_stack =3D CFI_DEVICESTACK_2DIE;
+#endif
 	/* Read the CFI info structure */
 	xip_disable_qry(base, map, cfi);
 	for (i=3D0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 9b57a9b..bda37a4 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -277,11 +277,19 @@ struct cfi_bri_query {
 #define CFI_MODE_CFI	1
 #define CFI_MODE_JEDEC	0
=20
+/* These values represent the die count of chip stack.
+ * So far, there only exists two type of stack device,
+ * single or dual die.
+ */
+#define CFI_DEVICESTACK_1DIE	1
+#define CFI_DEVICESTACK_2DIE	2
+
 struct cfi_private {
 	uint16_t cmdset;
 	void *cmdset_priv;
 	int interleave;
 	int device_type;
+	int device_stack;	/* Device stack type, single die or dual die. */
 	int cfi_mode;		/* Are we a JEDEC device pretending to be CFI? */
 	int addr_unlock1;
 	int addr_unlock2;
--=20
2.7.4
