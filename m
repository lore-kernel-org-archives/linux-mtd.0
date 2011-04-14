Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAKxX-0004BU-5S
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 11:43:40 +0000
Received: by vxd2 with SMTP id 2so1532166vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 04:43:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302761383.2796.4.camel@localhost>
References: <BANLkTinozqCrqaDGsAX-gWWUg2G3bvg_Rg@mail.gmail.com>
	<1302761383.2796.4.camel@localhost>
Date: Thu, 14 Apr 2011 13:43:35 +0200
Message-ID: <BANLkTikgzbGGNg7AXYt89MvM4whvKxXHiQ@mail.gmail.com>
Subject: Re: mtd-utils: "flash_erase -j" failes with "unable to get NAND
	oobinfo" on large flash chips.
From: Daid <daid303@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 14, 2011 at 8:09 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2011-04-12 at 11:58 +0200, Daid wrote:
>> I've made a patch to fix flash_erase with large flash chips.
>> flash_erase uses MEMGETOOBSEL which no longer works if the ECC area is
>> larger then 32 bytes. ECCGETLAYOUT is the replacement ioctl.
>>
>> This patch is based on the work of Stanley Miao, he made a patch in
>> June 2010 for flash_eraseall.
>> http://lists.infradead.org/pipermail/linux-mtd/2010-June/031981.html
>> I've implemented the backwards compatibility differently, checking
>> kernel versions doesn't feel correct.
>
> Hi Daid, would you please use libmtd instead? If libmtd does not have
> some functionality you need - just add it there.
>
> The thing is that we are trying to unify this stuff a little.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

Hi Artem, libmtd didn't have the functionality I needed. I've made a new pa=
tch
with the functionality build into libmtd.

I've added the extra information to struct mtd_dev_info, however, the
info needed is
only available with ioctls, so even with the sysfs interface it needs
to open /dev/mtdXX.
When you use mtd_get_dev_info, it reads all the information, which simple f=
or
the user of libmtd, but sort of mixes legacy and the sysfs interface.

Note that I can only verify if it works with the legacy interface,
because we are still a few
kernel versions behind on the hardware I run on. (2.6.27)

Best Regards,
David Braam

diff -ur mtd-utils-ori/flash_erase.c mtd-utils-v1.4.4/flash_erase.c
--- mtd-utils-ori/flash_erase.c	2011-04-01 18:31:43.000000000 +0200
+++ mtd-utils-v1.4.4/flash_erase.c	2011-04-14 13:06:16.000000000 +0200
@@ -190,40 +190,18 @@
 	if (jffs2) {
 		cleanmarker.magic =3D cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype =3D cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-		if (!isNAND)
+		if (!isNAND) {
 			cleanmarker.totlen =3D cpu_to_je32(sizeof(cleanmarker));
-		else {
-			struct nand_oobinfo oobinfo;
-
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) !=3D 0)
-				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
-
-			/* Check for autoplacement */
-			if (oobinfo.useecc =3D=3D MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1])
-					return errmsg(" Eeep. Autoplacement selected and no empty space in oo=
b");
-				clmpos =3D oobinfo.oobfree[0][0];
-				clmlen =3D oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen =3D 8;
-			} else {
-				/* Legacy mode */
-				switch (mtd.oob_size) {
-					case 8:
-						clmpos =3D 6;
-						clmlen =3D 2;
-						break;
-					case 16:
-						clmpos =3D 8;
-						clmlen =3D 8;
-						break;
-					case 64:
-						clmpos =3D 16;
-						clmlen =3D 8;
-						break;
-				}
-			}
+		} else {
+			if (!mtd.oob_free[0].length) {
+				fprintf(stderr, " Eeep. No empty space in oob for JFFS2 cleanmarkers\n=
");
+				return 1;
+ 			}
+			clmpos =3D mtd.oob_free[0].offset;
+			clmlen =3D mtd.oob_free[0].length;
+			if (clmlen > 8)
+				clmlen =3D 8;
+		=09
 			cleanmarker.totlen =3D cpu_to_je32(8);
 		}
 		cleanmarker.hdr_crc =3D cpu_to_je32(mtd_crc32(0, &cleanmarker,
sizeof(cleanmarker) - 4));
diff -ur mtd-utils-ori/include/libmtd.h mtd-utils-v1.4.4/include/libmtd.h
--- mtd-utils-ori/include/libmtd.h	2011-04-01 18:31:43.000000000 +0200
+++ mtd-utils-v1.4.4/include/libmtd.h	2011-04-14 11:40:48.000000000 +0200
@@ -31,6 +31,8 @@
 #define MTD_NAME_MAX 127
 /* Maximum MTD device type string length */
 #define MTD_TYPE_MAX 64
+/* Maximum MTD nand OOB free entries */
+#define MTD_NAND_MAX_OOBFREE_ENTRIES 8

 /* MTD library descriptor */
 typedef void * libmtd_t;
@@ -50,6 +52,17 @@
 };

 /**
+ * struct mtd_nand_oobfree - information about free OOB areas
+ * @offset: offset of free OOB area from start of OOB area
+ * @length: length of free OOB area
+ */
+struct mtd_nand_oobfree
+{
+	int offset;
+	int length;
+};
+
+/**
  * struct mtd_dev_info - information about an MTD device.
  * @mtd_num: MTD device number
  * @major: major number of corresponding character device
@@ -66,6 +79,10 @@
  * @region_cnt: count of additional erase regions
  * @writable: zero if the device is read-only
  * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
+ * @eccbytes: number of ecc bytes in OOB area
+ * @eccpos: position of ecc bytes in OOB area
+ * @oob_available: number of bytes available in OOB area free other
use then ECC
+ * @oob_free: location and sizes of free OOB areas
  */
 struct mtd_dev_info
 {
@@ -84,6 +101,10 @@
 	int region_cnt;
 	unsigned int writable:1;
 	unsigned int bb_allowed:1;
+	int eccbytes;
+	int eccpos[64];
+	int oob_available;
+	struct mtd_nand_oobfree oob_free[MTD_NAND_MAX_OOBFREE_ENTRIES];
 };

 /**
diff -ur mtd-utils-ori/lib/libmtd.c mtd-utils-v1.4.4/lib/libmtd.c
--- mtd-utils-ori/lib/libmtd.c	2011-04-01 18:31:43.000000000 +0200
+++ mtd-utils-v1.4.4/lib/libmtd.c	2011-04-14 13:30:20.000000000 +0200
@@ -37,6 +37,8 @@
 #include "libmtd_int.h"
 #include "common.h"

+#define MTD_DEV_PATT  "/dev/mtd%d"
+
 /**
  * mkpath - compose full path from 2 given components.
  * @path: the first component
@@ -548,6 +550,80 @@
 	return 1;
 }

+/**
+ * mtd_get_oob_info - fill the mtd_dev_info structure with information
+ *  about the OOB data.
+ */
+static int mtd_get_oob_info(struct mtd_dev_info *mtd)
+{
+	int i, fd;
+	char node[sizeof(MTD_DEV_PATT) + 20];
+
+	sprintf(node, MTD_DEV_PATT, mtd->mtd_num);
+	fd =3D open(node, O_RDWR);
+	if (fd =3D=3D -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+	=09
+	if (mtd->type =3D=3D MTD_NANDFLASH) {
+		/* get ECC/OOB information for NAND flash */
+#if defined(ECCGETLAYOUT)
+		struct nand_ecclayout ecclayout;
+		memset(&ecclayout, 0, sizeof(ecclayout));
+		if (ioctl(fd, ECCGETLAYOUT, &ecclayout) =3D=3D 0) {
+			mtd->eccbytes =3D ecclayout.eccbytes;
+			for(i=3D0; i<64; i++) {
+				mtd->eccpos[i] =3D ecclayout.eccpos[i];
+			}
+			mtd->oob_available =3D ecclayout.oobavail;
+			for (i=3D0; i<MTD_NAND_MAX_OOBFREE_ENTRIES; i++) {
+				mtd->oob_free[i].offset =3D ecclayout.oobfree[i].offset;
+				mtd->oob_free[i].length =3D ecclayout.oobfree[i].length;
+			}
+		} else {
+#endif/*defined(ECCGETLAYOUT)*/
+			/* new ECC interface failed or not available, fall back to old OOB
interface, which does not support large flash */
+			struct nand_oobinfo oobinfo;
+			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) =3D=3D 0)
+			{
+				/* Check for autoplacement */
+				mtd->eccbytes =3D oobinfo.eccbytes;
+				for(i=3D0;i<32;i++) {
+					mtd->eccpos[i] =3D oobinfo.eccpos[i];
+				}
+				if (oobinfo.useecc =3D=3D MTD_NANDECC_AUTOPLACE) {
+					for(i=3D0;i<8;i++) {
+						mtd->oob_free[i].offset =3D oobinfo.oobfree[i][0];
+						mtd->oob_free[i].length =3D oobinfo.oobfree[i][1];
+						mtd->oob_available +=3D mtd->oob_free[i].length;
+					}
+				} else{
+					/* Legacy mode */
+					switch (mtd->oob_size) {
+						case 8:
+							mtd->oob_free[0].offset =3D 6;
+							mtd->oob_free[0].length =3D 2;
+							break;
+						case 16:
+							mtd->oob_free[0].offset =3D 8;
+							mtd->oob_free[0].length =3D 8;
+							break;
+						case 64:
+							mtd->oob_free[0].offset =3D 16;
+							mtd->oob_free[0].length =3D 8;
+							break;
+					}
+					mtd->oob_available =3D mtd->oob_free[0].length;
+				}
+			}
+#if defined(ECCGETLAYOUT)
+		}
+#endif/*defined(ECCGETLAYOUT)*/
+	}
+	close(fd);
+=09
+	return 0;
+}
+
 libmtd_t libmtd_open(void)
 {
 	struct libmtd *lib;
@@ -720,9 +796,12 @@
 	memset(mtd, 0, sizeof(struct mtd_dev_info));
 	mtd->mtd_num =3D mtd_num;

-	if (!lib->sysfs_supported)
-		return legacy_get_dev_info1(mtd_num, mtd);
-	else {
+	if (!lib->sysfs_supported) {
+		ret =3D legacy_get_dev_info1(mtd_num, mtd);
+		if (ret < 0)
+			return ret;
+		return mtd_get_oob_info(mtd);
+	} else {
 		char file[strlen(lib->mtd) + 10];

 		sprintf(file, lib->mtd, mtd_num);
@@ -767,6 +846,9 @@
 	mtd->eb_cnt =3D mtd->size / mtd->eb_size;
 	mtd->type =3D type_str2int(mtd->type_str);
 	mtd->bb_allowed =3D !!(mtd->type =3D=3D MTD_NANDFLASH);
+=09
+	if (mtd_get_oob_info(mtd))
+		return -1;

 	return 0;
 }
@@ -777,7 +859,12 @@
 	struct libmtd *lib =3D (struct libmtd *)desc;

 	if (!lib->sysfs_supported)
-		return legacy_get_dev_info(node, mtd);
+	{
+		int ret =3D legacy_get_dev_info(node, mtd);
+		if (ret < 0)
+			return ret;
+		return mtd_get_oob_info(mtd);
+	}

 	if (dev_node2num(lib, node, &mtd_num))
 		return -1;
