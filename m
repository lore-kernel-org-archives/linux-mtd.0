Received: from cpc3-heck1-6-0-cust211.hudd.cable.ntl.com ([80.7.100.211]
	helo=gerald.kyllikki.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE4qH-0007s0-92
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 12:15:37 +0100
Received: from vince by gerald.kyllikki.org with local (Exim 3.36 #1 (Debian))
	id 1BE4qH-0006fO-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2004 12:15:37 +0100
Date: Thu, 15 Apr 2004 12:15:37 +0100
From: Vincent Sanders <vince@arm.linux.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20040415111537.GA25362@kyllikki.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
Sender: Vincent Sanders <vince@kyllikki.org>
Subject: Additional devices, jedec reset and dc21285 fixes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--z6Eq5LdranGa6ru8
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

OK
Here are a small series of patches (as discussed with dwmwmwmwmwmwmwmwm2 ;-=
)=20

The first adds two SST devices to the jedec_probe (they use the SST
page writing algor - patch to follow).

The second fixes the DC21285 mapping driver to work on all supported
footbridge systems (and yes I have personally tested this)

The third is possibly the most contentious and most
interesting...while playing with the various SST and MACRONIX devices
on the footbridge systems (second patch) I have discovered the jedec
reset sequence...doesnt reset anything but AMD/Intel devices with the
short reset sequence! - please see the patch and comment and discuss
as required.

As mentioned the SST devices above use a (currently) unimplemented
command set - when its clean enough I shall submit the driver for this
command set, it currently reads fine but writing seems to have issues
(SST seem to have been on a differing planet inventing this one).

--=20
Regards Vincent
http://www.kyllikki.org/

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-add_devices
Content-Transfer-Encoding: quoted-printable

--- linux-2.4.25/drivers/mtd/chips/jedec_probe.c	2004-03-16 22:56:20.000000=
000 +0000
+++ linux-2.4.25-mtd/drivers/mtd/chips/jedec_probe.c	2004-04-13 00:24:53.00=
0000000 +0100
@@ -100,6 +100,8 @@
 #define M29W040B	0x00E3
=20
 /* SST */
+#define SST29EE020	0x0010
+#define SST29LE020	0x0012
 #define SST29EE512	0x005d
 #define SST29LE512	0x003d
 #define SST39LF800	0x2781
@@ -839,6 +841,24 @@
 		}
         }, {
 		mfr_id: MANUFACTURER_SST,
+		dev_id: SST29EE020,
+		name: "SST 29EE020",
+		DevSize: SIZE_256KiB,
+		CmdSet: P_ID_SST_PAGE,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x01000,64),
+		}
+        }, {
+		mfr_id: MANUFACTURER_SST,
+		dev_id: SST29LE020,
+		name: "SST 29LE020",
+		DevSize: SIZE_256KiB,
+		CmdSet: P_ID_SST_PAGE,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x01000,64),
+		}
+        }, {
+		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39LF020,
 		name: "SST 39LF020",
 		DevSize: SIZE_256KiB,
--- linux-2.4.25/include/linux/mtd/cfi.h	2003-06-01 04:06:37.000000000 +0100
+++ linux-2.4.25-mtd/include/linux/mtd/cfi.h	2004-04-13 00:02:32.000000000 =
+0100
@@ -287,8 +287,10 @@
 #define P_ID_AMD_STD 2
 #define P_ID_INTEL_STD 3
 #define P_ID_AMD_EXT 4
+#define P_ID_ST_ADV 32
 #define P_ID_MITSUBISHI_STD 256
 #define P_ID_MITSUBISHI_EXT 257
+#define P_ID_SST_PAGE 258
 #define P_ID_RESERVED 65535
=20
=20

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-fixdc21285
Content-Transfer-Encoding: quoted-printable

--- linux-2.4.25/drivers/mtd/maps/dc21285.c	2003-06-01 04:06:26.000000000 +=
0100
+++ linux-2.4.25-mtd/drivers/mtd/maps/dc21285.c	2004-04-13 21:43:25.0000000=
00 +0100
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/delay.h>
=20
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
@@ -18,9 +19,9 @@
=20
 #include <asm/io.h>
 #include <asm/hardware/dec21285.h>
+#include <asm/mach-types.h>
=20
-
-static struct mtd_info *mymtd;
+static struct mtd_info *dc21285_mtd;
=20
 __u8 dc21285_read8(struct map_info *map, unsigned long ofs)
 {
@@ -44,6 +45,9 @@
=20
 void dc21285_write8(struct map_info *map, __u8 d, unsigned long adr)
 {
+	if(machine_is_netwinder()) {
+		nw_en_write();
+	}
 	*CSR_ROMWRITEREG =3D adr & 3;
 	adr &=3D ~3;
 	*(__u8*)(map->map_priv_1 + adr) =3D d;
@@ -51,6 +55,9 @@
=20
 void dc21285_write16(struct map_info *map, __u16 d, unsigned long adr)
 {
+	if(machine_is_netwinder()) {
+		nw_en_write();
+	}
 	*CSR_ROMWRITEREG =3D adr & 3;
 	adr &=3D ~3;
 	*(__u16*)(map->map_priv_1 + adr) =3D d;
@@ -58,6 +65,9 @@
=20
 void dc21285_write32(struct map_info *map, __u32 d, unsigned long adr)
 {
+	if(machine_is_netwinder()) {
+		nw_en_write();
+	}
 	*(__u32*)(map->map_priv_1 + adr) =3D d;
 }
=20
@@ -105,6 +115,27 @@
 };
=20
=20
+static void
+nw_en_write(void) {
+#ifdef CONFIG_ARCH_NETWINDER
+	extern spinlock_t gpio_lock;
+	unsigned long flags;
+
+	/*
+	 * we want to write a bit pattern XXX1 to Xilinx to enable
+	 * the write gate, which will be open for about the next 2ms.
+	 */
+	spin_lock_irqsave(&gpio_lock, flags);
+	cpld_modify(1, 1);
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	/*
+	 * let the ISA bus to catch on...
+	 */
+	udelay(25);
+#endif
+}
+
 /* Partition stuff */
 static struct mtd_partition *dc21285_parts;
 		     =20
@@ -112,6 +143,9 @@
=20
 int __init init_dc21285(void)
 {
+	int nr_parts =3D 0;
+	char *part_type =3D "none";
+
 	/* Determine buswidth */
 	switch (*CSR_SA110_CNTL & (3<<14)) {
 		case SA110_CNTL_ROMWIDTH_8:=20
@@ -137,24 +171,64 @@
 		return -EIO;
 	}
=20
-	mymtd =3D do_map_probe("cfi_probe", &dc21285_map);
-	if (mymtd) {
-		int nrparts =3D 0;
+	if(machine_is_ebsa285()) {
+		dc21285_mtd =3D do_map_probe("cfi_probe", &dc21285_map);
+	} else {
+		dc21285_mtd =3D do_map_probe("jedec_probe", &dc21285_map);
+	}
=20
-		mymtd->module =3D THIS_MODULE;
+	if (!dc21285_mtd) {
+		/* no recognised device so unmap and exit */
+		iounmap((void *)dc21285_map.map_priv_1);
+		return -ENXIO;
+	}
 		=09
-		/* partition fixup */
+	dc21285_mtd->module =3D THIS_MODULE;
=20
+	/*
+	 * Dynamic partition selection stuff (might override the static ones)
+	 */
 #ifdef CONFIG_MTD_REDBOOT_PARTS
-		nrparts =3D parse_redboot_partitions(mymtd, &dc21285_parts);
+	if (nr_parts =3D=3D 0) {
+		int ret =3D parse_redboot_partitions(dc21285_mtd, &dc21285_parts);
+
+		if (ret > 0) {
+			part_type =3D "RedBoot";
+			nr_parts =3D ret;
+		}
+		else
+		{
+			dc21285_parts=3DNULL; /* ensure partition table remains clear */
+		}
+	}
 #endif
-		if (nrparts > 0) {
-			add_mtd_partitions(mymtd, dc21285_parts, nrparts);
-		} else if (nrparts =3D=3D 0) {
-			printk(KERN_NOTICE "RedBoot partition table failed\n");
-			add_mtd_device(mymtd);
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	if (nr_parts =3D=3D 0) {
+		int ret =3D parse_cmdline_partitions(dc21285_mtd, &dc21285_parts, "sa110=
0");
+		if (ret > 0) {
+			part_type =3D "Command Line";
+			nr_parts =3D ret;
+		}
+		else
+		{
+			dc21285_parts=3DNULL; /* ensure partition table remains clear */
 		}
+	}
+#endif
=20
+	if (nr_parts =3D=3D 0) {
+		printk(KERN_NOTICE "DC21285 Flash: no partition info available, register=
ing whole flash at once\n");
+		add_mtd_device(dc21285_mtd);
+	}=20
+#ifdef CONFIG_MTD_PARTITIONS
+	else=20
+	{
+		printk(KERN_NOTICE "DC21285 Flash: Using %s partition definition\n", par=
t_type);
+		add_mtd_partitions(dc21285_mtd, &dc21285_parts, nr_parts);
+	}
+#endif
+
+	if(machine_is_ebsa285()) {
 		/*=20
 		 * Flash timing is determined with bits 19-16 of the
 		 * CSR_SA110_CNTL.  The value is the number of wait cycles, or
@@ -167,20 +241,15 @@
 		*CSR_SA110_CNTL =3D ((*CSR_SA110_CNTL & ~0x00f00000) | (7 << 20));
 		/* tristate time */
 		*CSR_SA110_CNTL =3D ((*CSR_SA110_CNTL & ~0x0f000000) | (7 << 24));
-
-		return 0;
 	}
-
-	iounmap((void *)dc21285_map.map_priv_1);
-	return -ENXIO;
 }
=20
 static void __exit cleanup_dc21285(void)
 {
-	if (mymtd) {
-		del_mtd_device(mymtd);
-		map_destroy(mymtd);
-		mymtd =3D NULL;
+	if (dc21285_mtd) {
+		del_mtd_device(dc21285_mtd);
+		map_destroy(dc21285_mtd);
+		dc21285_mtd =3D NULL;
 	}
 	if (dc21285_map.map_priv_1) {
 		iounmap((void *)dc21285_map.map_priv_1);

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-fixjedecreset

--- linux-2.4.25/drivers/mtd/chips/jedec_probe.c	2004-03-16 22:56:20.000000000 +0000
+++ linux-2.4.25-mtd/drivers/mtd/chips/jedec_probe.c	2004-04-13 00:24:53.000000000 +0100
@@ -947,7 +967,20 @@
 	struct cfi_private *cfi)
 {
 	/* Reset */
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+
+	/* after checking the datasheets for SST, MACRONIX and ATMEL
+	 * (oh and incidentaly the jedec spec - 3.5.3.3) the reset
+	 * sequence is *supposed* to be 0xaa at 0x5555, 0x55 at
+	 * 0x2aaa, 0xF0 at 0x5555 this will not affect the AMD chips
+	 * as they will ignore the writes and dont care what address
+	 * the F0 is written to */
+	if(cfi->addr_unlock1) {
+		/*printk("reset unlock called %x %x \n",cfi->addr_unlock1,cfi->addr_unlock2);*/
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	}
+
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 	/* Some misdesigned intel chips do not respond for 0xF0 for a reset,
 	 * so ensure we're in read mode.  Send both the Intel and the AMD command
 	 * for this.  Intel uses 0xff for this, AMD uses 0xff for NOP, so

--9amGYk9869ThD9tj--

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAfm7ZiUwwPOvjHvURAq56AJ4/zIMb4EumuXe1kx6JSqSSD5mVCQCfcR8q
mXaq8hDwU7FnfpAqT+1Z9bM=
=ktdh
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
