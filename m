Received: from chfdns02.ch.intel.com ([143.182.246.25] helo=melete.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tTQS-0000yC-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 13:34:28 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by melete.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.44 2001/10/01 19:10:43 root Exp $) with SMTP id MAA12496
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 12:43:39 GMT
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E419F@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "David Woodhouse (E-mail)" <dwmw2@infradead.org>,
        "'Larry Doolittle'"<ldoolitt@recycle.lbl.gov>,
        linux-mtd@lists.infradead.org
Subject: Bug in chip alias detection! (jedec_probe, possibly cfi_probe)
Date: Tue, 16 Oct 2001 14:43:32 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C15640.29D5FCF0"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C15640.29D5FCF0
Content-Type: text/plain;
	charset="ISO-8859-1"

Hi again,

I was testing the new support for Boot Block via jedec_probe.
I have 2 4MB boot block parts in 16 bit mode (no interleaving)
mapped over dc21285 (selected using A22)

The jedec_probe alias detection code misdetected an alias for a 3rd chip!

I think I have found the problem. When scanning over previously found
chips *THEY* (chips[i].start) should be checked if they also 
switched to autoselect mode when we switched the one we are checking now
(base)

        for (i=0; i<cfi->numchips; i++) {
                /* This chip should be in read mode if it's one
                   we've already touched. */
HERE --->>      if (jedec_read_mfr(map, base, osf) == cfi->mfr &&
HERE --->>          jedec_read_id(map, base, osf) == cfi->id) {
                        /* Eep. This chip also looks like it's in autoselect
mode.
                           Is it an alias for the new one? */

It should be 'chips[i].start' instead of 'base' in those lines. The current
one is
always in autoselect mode at this point.

I'm attaching a patch that fixed it for me (against cvs from yesterday Oct.
15).
The patch also includes a fix for a non critical bug -- the first
 chip is not reported and is not put back in read-array mode!

I think there is a somewhat similar bug in cfi_probe code, but I couldn't
verify this.

		if (qry_present(map,chips[i].start,cfi)) {
			/* Eep. This chip also had the QRY marker. 
			 * Is it an alias for the new one? */
			cfi_send_gen_cmd(0xF0, 0, chips[i].start, map, cfi,
cfi->device_type, NULL);

			/* If the QRY marker goes away, it's an alias */
HERE --->>>		if (!qry_present(map, chips[i].start, cfi)) {
				printk(KERN_DEBUG "%s: Found an alias at
0x%x for the chip at 0x%lx\n",
				       map->name, base, chips[i].start);
				return 0;
			}

when chips[i] is switched to read-array, the current one should be checked
(base),
not the chips[i], which was put in read-array mode in the previous line.

Kreso


------_=_NextPart_000_01C15640.29D5FCF0
Content-Type: application/octet-stream;
	name="mtd-jedec-alias.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd-jedec-alias.patch"

--- mtd/drivers/mtd/chips/jedec_probe.c	Sat Oct  6 17:56:57 2001=0A=
+++ mtd-fix/drivers/mtd/chips/jedec_probe.c	Tue Oct 16 14:06:20 2001=0A=
@@ -584,7 +584,17 @@=0A=
 		for (i=3D0; i<sizeof(jedec_table)/sizeof(jedec_table[0]); i++) {=0A=
 			if (mfr =3D=3D jedec_table[i].mfr_id &&=0A=
 			    id =3D=3D jedec_table[i].dev_id)=0A=
-				return cfi_jedec_setup(cfi, i);=0A=
+			      {=0A=
+				    /* Put it back into Read Mode */=0A=
+				    cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, =
NULL);=0A=
+				    cfi_send_gen_cmd(0xff, 0, base, map, cfi, cfi->device_type, =
NULL);=0A=
+=0A=
+				    printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit =
mode\n",=0A=
+					   map->name, cfi->interleave, cfi->device_type*8, base, =0A=
+					   map->buswidth*8);=0A=
+				    =0A=
+				    return cfi_jedec_setup(cfi, i);=0A=
+			      }=0A=
 		}=0A=
 		if (!retried++) {=0A=
 			/* Deal with whichever strange chips these were */=0A=
@@ -599,8 +609,8 @@=0A=
 	for (i=3D0; i<cfi->numchips; i++) {=0A=
 		/* This chip should be in read mode if it's one=0A=
 		   we've already touched. */=0A=
-		if (jedec_read_mfr(map, base, osf) =3D=3D cfi->mfr &&=0A=
-		    jedec_read_id(map, base, osf) =3D=3D cfi->id) {=0A=
+		if (jedec_read_mfr(map, chips[i].start, osf) =3D=3D cfi->mfr &&=0A=
+		    jedec_read_id(map, chips[i].start, osf) =3D=3D cfi->id) {=0A=
 			/* Eep. This chip also looks like it's in autoselect mode.=0A=
 			   Is it an alias for the new one? */=0A=
 			=0A=

------_=_NextPart_000_01C15640.29D5FCF0--
