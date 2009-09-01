Received: from mail-bw0-f222.google.com ([209.85.218.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MiSxD-0002G5-SG
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 12:59:25 +0000
Received: by bwz22 with SMTP id 22so3591987bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Sep 2009 05:59:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1251795796.3514.22.camel@localhost>
References: <62cbdcd90908270313i5a45cb4aw6f34477a798bdbfe@mail.gmail.com>
	<62cbdcd90908280105w73941da1p211b1b9248bbd275@mail.gmail.com>
	<1251795796.3514.22.camel@localhost>
Date: Tue, 1 Sep 2009 14:59:16 +0200
Message-ID: <62cbdcd90909010559k7976ca65g15203d0de511b604@mail.gmail.com>
Subject: Re: [PATCH] [MTD] CHIPS: buffer size adjustment for M29EW Numonyx
	devices
From: massimo cirillo <maxcir@gmail.com>
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

2009/9/1 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2009-08-28 at 10:05 +0200, massimo cirillo wrote:
>> From: Massimo Cirillo <maxcir@gmail.com>
>>
>> Please, consider this new version of the patch, that leaves unchanged
>> the cfi->id value for AMD devices.
>>
>> Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
>
> Please, resend a patch with proper descriptions, without indentation
> problems (see int extendedId1) and without adding junk \n lines:
>
>> +
>> +
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

From: Massimo Cirillo <maxcir@gmail.com>

This patch fixes a problem related to an incorrect value contained in the C=
FI
of M29EW devices family. The incorrect CFI field is MaxBufWriteSize that
should be 0x8 if the device is used in 8bit mode, whereas the value read
out from CFI is 0xA.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
old mode 100644
new mode 100755
index e63e674..5730201
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -158,6 +158,9 @@ static int __xipram cfi_chip_setup(struct map_info *map=
,
 	__u32 base =3D 0;
 	int num_erase_regions =3D cfi_read_query(map, base + (0x10 + 28)*ofs_fact=
or);
 	int i;
+	int extendedId1 =3D 0;
+	int extendedId2 =3D 0;
+	int extendedId3 =3D 0;

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
@@ -213,6 +225,16 @@ static int __xipram cfi_chip_setup(struct map_info *ma=
p,
 	cfi->cfiq->InterfaceDesc =3D le16_to_cpu(cfi->cfiq->InterfaceDesc);
 	cfi->cfiq->MaxBufWriteSize =3D le16_to_cpu(cfi->cfiq->MaxBufWriteSize);

+   /* If the device is a M29EW used in 8-bit mode, adjust buffer size */
+	if ((cfi->cfiq->MaxBufWriteSize > 0x8) && (cfi->mfr =3D=3D CFI_MFR_NMX ||
+		 cfi->mfr =3D=3D CFI_MFR_ST) && (extendedId1 =3D=3D 0x7E) &&
+		 (extendedId2 =3D=3D 0x22 || extendedId2 =3D=3D 0x23 || extendedId2 =3D=
=3D 0x28) &&
+		 (extendedId3 =3D=3D 0x01)) {
+		cfi->cfiq->MaxBufWriteSize =3D 0x8;
+		pr_warning("Adjusted buffer size on Numonyx flash M29EW family");
+		pr_warning("in 8 bit mode\n");
+    }
+
 #ifdef DEBUG_CFI
 	/* Dump the information therein */
 	print_cfi_ident(cfi->cfiq);
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
Best Regards,
Massimo Cirillo <maxcir@gmail.com>
