Received: from exprod6ob113.obsmtp.com ([64.18.1.30] helo=psmtp.com)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf1Sc-0005B9-Vn
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 00:29:17 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: Allow platform to set partitions at runtime
Date: Wed, 4 Mar 2009 19:29:00 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909013B6E09@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090120C0F4@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19090120C0F4@mi8nycmail19.Mi8.com>
From: "hartleys" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any comments on this patch?  If it looks ok how do I get it applied?

Regards,
Hartley=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of hartleys
Sent: Monday, February 09, 2009 4:31 PM
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Allow platform to set partitions at runtime

Add a callback to allow platform to initialize the static partitions.

Static partitions on a nand device could vary depending on the size of
the device.  This patch allows an optional platform callback to be used
to setup this partition information at runtime.

Scan order is:
	1) chip.part_probe_types
	2) chip.set_parts
	3) chip.partitions
	4) full mtd device (fallback for no partitions)

Some of the existing nand drivers could possibly be replaced by the
plat_nand driver by using this patch.  These include autcpu12.c and
ts7250.c drivers.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 75f9f48..f10b5a6 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -86,6 +86,8 @@ static int __init plat_nand_probe(struct
platform_device *pdev)
 			return 0;
 		}
 	}
+	if (pdata->chip.set_parts)
+		pdata->chip.set_parts(data->mtd.size, &pdata->chip);
 	if (pdata->chip.partitions) {
 		data->parts =3D pdata->chip.partitions;
 		res =3D add_mtd_partitions(&data->mtd, data->parts,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index db5b63d..4eaf328 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -563,6 +563,7 @@ extern int nand_do_read(struct mtd_info *mtd, loff_t
from, size_t len,
  * @options:		Option flags, e.g. 16bit buswidth
  * @ecclayout:		ecc layout info structure
  * @part_probe_types:	NULL-terminated array of probe types
+ * @set_parts:		platform specific function to set partitions
  * @priv:		hardware controller specific settings
  */
 struct platform_nand_chip {
@@ -574,6 +575,8 @@ struct platform_nand_chip {
 	int			chip_delay;
 	unsigned int		options;
 	const char		**part_probe_types;
+	void			(*set_parts)(uint64_t size,
+					struct platform_nand_chip
*chip);
 	void			*priv;
 };
 =20

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
