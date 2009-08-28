Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgwSQ-00074t-FT
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 08:05:19 +0000
Received: by fxm26 with SMTP id 26so1479442fxm.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Aug 2009 01:05:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <62cbdcd90908270313i5a45cb4aw6f34477a798bdbfe@mail.gmail.com>
References: <62cbdcd90908270313i5a45cb4aw6f34477a798bdbfe@mail.gmail.com>
Date: Fri, 28 Aug 2009 10:05:10 +0200
Message-ID: <62cbdcd90908280105w73941da1p211b1b9248bbd275@mail.gmail.com>
Subject: Re: [PATCH] [MTD] CHIPS: buffer size adjustment for M29EW Numonyx
	devices
From: massimo cirillo <maxcir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Massimo Cirillo <maxcir@gmail.com>

Please, consider this new version of the patch, that leaves unchanged
the cfi->id value for AMD devices.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
old mode 100644
new mode 100755
index e63e674..e4c5790
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -158,6 +158,9 @@ static int __xipram cfi_chip_setup(struct map_info *map=
,
 	__u32 base =3D 0;
 	int num_erase_regions =3D cfi_read_query(map, base + (0x10 + 28)*ofs_fact=
or);
 	int i;
+    int extendedId1 =3D 0;
+    int extendedId2 =3D 0;
+    int extendedId3 =3D 0;

 	xip_enable(base, map, cfi);
 #ifdef DEBUG_CFI
@@ -195,6 +198,15 @@ static int __xipram cfi_chip_setup(struct map_info *ma=
p,
 	cfi->mfr =3D cfi_read_query16(map, base);
 	cfi->id =3D cfi_read_query16(map, base + ofs_factor);

+	/* Get device ID cycle 1,2,3 for Numonyx/ST devices */
+	if ((cfi->mfr =3D=3D CFI_MFR_NMX || cfi->mfr =3D=3D CFI_MFR_ST)
+		&& ((cfi->id & 0xff) =3D=3D 0x7e)
+		&& (le16_to_cpu(cfi->cfiq->P_ID) =3D=3D 0x0002)) {
+		extendedId1 =3D cfi_read_query16(map, base + 0x1 * ofs_factor);
+		extendedId2 =3D cfi_read_query16(map, base + 0xe * ofs_factor);
+		extendedId3 =3D cfi_read_query16(map, base + 0xf * ofs_factor);
+	}
+
 	/* Get AMD/Spansion extended JEDEC ID */
 	if (cfi->mfr =3D=3D CFI_MFR_AMD && (cfi->id & 0xff) =3D=3D 0x7e)
 		cfi->id =3D cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
@@ -203,16 +215,25 @@ static int __xipram cfi_chip_setup(struct map_info *m=
ap,
 	/* Put it back into Read Mode */
 	cfi_qry_mode_off(base, map, cfi);
 	xip_allowed(base, map);
-
-	/* Do any necessary byteswapping */
+
+	/* Do any necessary byteswapping */
 	cfi->cfiq->P_ID =3D le16_to_cpu(cfi->cfiq->P_ID);
-
 	cfi->cfiq->P_ADR =3D le16_to_cpu(cfi->cfiq->P_ADR);
 	cfi->cfiq->A_ID =3D le16_to_cpu(cfi->cfiq->A_ID);
 	cfi->cfiq->A_ADR =3D le16_to_cpu(cfi->cfiq->A_ADR);
 	cfi->cfiq->InterfaceDesc =3D le16_to_cpu(cfi->cfiq->InterfaceDesc);
 	cfi->cfiq->MaxBufWriteSize =3D le16_to_cpu(cfi->cfiq->MaxBufWriteSize);

+	/* If the device is a M29EW used in 8-bit mode, adjust buffer size */
+	if ((cfi->cfiq->MaxBufWriteSize > 0x8) && (cfi->mfr =3D=3D CFI_MFR_NMX ||
+		cfi->mfr =3D=3D CFI_MFR_ST) && (extendedId1 =3D=3D 0x7E) &&
+		(extendedId2 =3D=3D 0x22 || extendedId2 =3D=3D 0x23 || extendedId2 =3D=
=3D 0x28) &&
+		(extendedId3 =3D=3D 0x01)) {
+		cfi->cfiq->MaxBufWriteSize =3D 0x8;
+		pr_warning("Adjusted buffer size on Numonyx flash M29EW family");
+		pr_warning("in 8 bit mode\n");
+    }
+
 #ifdef DEBUG_CFI
 	/* Dump the information therein */
 	print_cfi_ident(cfi->cfiq);
@@ -228,6 +249,8 @@ static int __xipram cfi_chip_setup(struct map_info *map=
,
 #endif
 	}

+
+
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
 	       map->bankwidth*8);
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
old mode 100644
new mode 100755
index 88d3d8f..43d6a77
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -522,6 +522,7 @@ struct cfi_fixup {
 #define CFI_MFR_ATMEL 0x001F
 #define CFI_MFR_SAMSUNG 0x00EC
 #define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
+#define CFI_MFR_NMX 0x0089 /* Numonyx */

 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);

--



2009/8/27 massimo cirillo <maxcir@gmail.com>:
> From: Massimo Cirillo <maxcir@gmail.com>
>
> The buffer size fot M29EW Numonyx flash devices used in 8bit configuratio=
n
> is 256 bytes sized, while the CFI contains a wrong value (1024 bytes).
> The following patch fixes this hardware bug.
> The following patch applies to 2.6.30 kernel.
>
> Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
> ---
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.=
c
> old mode 100644
> new mode 100755
> index e63e674..1281920
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -158,6 +158,9 @@ static int __xipram cfi_chip_setup(struct map_info *m=
ap,
> =A0 =A0 =A0 =A0__u32 base =3D 0;
> =A0 =A0 =A0 =A0int num_erase_regions =3D cfi_read_query(map, base + (0x10=
 + 28)*ofs_factor);
> =A0 =A0 =A0 =A0int i;
> + =A0 =A0 =A0 int extendedId1 =3D 0;
> + =A0 =A0 =A0 int extendedId2 =3D 0;
> + =A0 =A0 =A0 int extendedId3 =3D 0;
>
> =A0 =A0 =A0 =A0xip_enable(base, map, cfi);
> =A0#ifdef DEBUG_CFI
> @@ -196,23 +199,39 @@ static int __xipram cfi_chip_setup(struct map_info =
*map,
> =A0 =A0 =A0 =A0cfi->id =3D cfi_read_query16(map, base + ofs_factor);
>
> =A0 =A0 =A0 =A0/* Get AMD/Spansion extended JEDEC ID */
> - =A0 =A0 =A0 if (cfi->mfr =3D=3D CFI_MFR_AMD && (cfi->id & 0xff) =3D=3D =
0x7e)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfi->id =3D cfi_read_query(map, base + 0xe =
* ofs_factor) << 8 |
> + =A0 =A0 =A0 if ((cfi->mfr =3D=3D CFI_MFR_NMX || cfi->mfr =3D=3D CFI_MFR=
_ST ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfi->mfr =3D=3D CFI_MFR_AMD) && ((cfi->id &=
 0xff) =3D=3D 0x7e)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 && (le16_to_cpu(cfi->cfiq->P_ID) =3D=3D 0x0=
002)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 extendedId1 =3D cfi_read_query16(map, base =
+ 0x1 * ofs_factor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 extendedId2 =3D cfi_read_query16(map, base =
+ 0xe * ofs_factor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 extendedId3 =3D cfi_read_query16(map, base =
+ 0xf * ofs_factor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* compatibility with previous versions */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfi->id =3D cfi_read_query(map, base + 0xe =
* ofs_factor) << 8 |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cfi_read_query(map, ba=
se + 0xf * ofs_factor);
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/* Put it back into Read Mode */
> =A0 =A0 =A0 =A0cfi_qry_mode_off(base, map, cfi);
> =A0 =A0 =A0 =A0xip_allowed(base, map);
> -
> - =A0 =A0 =A0 /* Do any necessary byteswapping */
> +
> + =A0 =A0 =A0 /* Do any necessary byteswapping */
> =A0 =A0 =A0 =A0cfi->cfiq->P_ID =3D le16_to_cpu(cfi->cfiq->P_ID);
> -
> =A0 =A0 =A0 =A0cfi->cfiq->P_ADR =3D le16_to_cpu(cfi->cfiq->P_ADR);
> =A0 =A0 =A0 =A0cfi->cfiq->A_ID =3D le16_to_cpu(cfi->cfiq->A_ID);
> =A0 =A0 =A0 =A0cfi->cfiq->A_ADR =3D le16_to_cpu(cfi->cfiq->A_ADR);
> =A0 =A0 =A0 =A0cfi->cfiq->InterfaceDesc =3D le16_to_cpu(cfi->cfiq->Interf=
aceDesc);
> =A0 =A0 =A0 =A0cfi->cfiq->MaxBufWriteSize =3D le16_to_cpu(cfi->cfiq->MaxB=
ufWriteSize);
>
> + =A0 =A0 =A0 /* If the device is a M29EW used in 8-bit mode, adjust buff=
er size */
> + =A0 =A0 =A0 if ((cfi->cfiq->MaxBufWriteSize > 0x8) && (cfi->mfr =3D=3D =
CFI_MFR_NMX ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfi->mfr =3D=3D CFI_MFR_ST) && (extendedId1=
 =3D=3D 0x7E) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (extendedId2 =3D=3D 0x22 || extendedId2 =3D=
=3D 0x23 || extendedId2 =3D=3D 0x28) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (extendedId3 =3D=3D 0x01)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfi->cfiq->MaxBufWriteSize =3D 0x8;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("Adjusted buffer size on Numonyx=
 flash M29EW family");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning(" in 8 bit mode\n");
> + =A0 =A0 =A0 }
> +
> =A0#ifdef DEBUG_CFI
> =A0 =A0 =A0 =A0/* Dump the information therein */
> =A0 =A0 =A0 =A0print_cfi_ident(cfi->cfiq);
> @@ -228,6 +247,8 @@ static int __xipram cfi_chip_setup(struct map_info *m=
ap,
> =A0#endif
> =A0 =A0 =A0 =A0}
>
> +
> +
> =A0 =A0 =A0 =A0printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-b=
it bank\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 map->name, cfi->interleave, cfi->device_type*=
8, base,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 map->bankwidth*8);
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> old mode 100644
> new mode 100755
> index 88d3d8f..43d6a77
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -522,6 +522,7 @@ struct cfi_fixup {
> =A0#define CFI_MFR_ATMEL 0x001F
> =A0#define CFI_MFR_SAMSUNG 0x00EC
> =A0#define CFI_MFR_ST =A00x0020 =A0 =A0 /* STMicroelectronics */
> +#define CFI_MFR_NMX 0x0089 /* Numonyx */
>
> =A0void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
>
