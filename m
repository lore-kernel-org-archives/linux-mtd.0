Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mscG-00040B-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 08:31:08 +0100
Message-ID: <1072F1A27E99D3119747005004B9A380EB98B3@MAIL>
From: Brett Carswell <BrettC@nulec.com.au>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Tue, 10 Apr 2001 17:30:55 +1000
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C0C190.2E1F79C0"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C0C190.2E1F79C0
Content-Type: text/plain;
	charset="iso-8859-1"

> dwmw2@infradead.org said:
> >  If we detect it's a 16-bit device in 8-bit mode, do...
> >  cfi->device_type = 1;
> >  cfi->addr_unlock1 = 0xaaa;
> >  cfi->addr_unlock2 = 0x555; 
> 
> Actually, it's probably best not to override the device_type, 
> but to change 
> the code to always use DEVICE_TYPE_X8 instead of 
> cfi->device_type when 
> doing the unlock cycles, and set addr_unlock[12] to the 
> pre-shifted value 
> when cfi->device_type != 1.
> 

OK - this seems to work well. I have attached a patch that does what I think
you are desscibing - for those who are interested.

Brett


------_=_NextPart_000_01C0C190.2E1F79C0
Content-Type: application/octet-stream;
	name="patch-unlock"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="patch-unlock"

Index: cfi_cmdset_0002.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/kernel/cfi_cmdset_0002.c,v=0A=
retrieving revision 1.42=0A=
diff -U2 -r1.42 cfi_cmdset_0002.c=0A=
--- cfi_cmdset_0002.c	2001/03/27 06:26:10	1.42=0A=
+++ cfi_cmdset_0002.c	2001/04/10 07:07:06=0A=
@@ -332,7 +332,7 @@=0A=
 	}=0A=
 	else {=0A=
-	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
+	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
 	}=0A=
 =0A=
@@ -427,7 +427,7 @@=0A=
 	=0A=
 	/* Go into unlock bypass mode */=0A=
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
 =0A=
 	/* We are now aligned, write as much as possible */=0A=
@@ -474,7 +474,7 @@=0A=
 			if (cfi->fast_prog){=0A=
 				/* Go into unlock bypass mode for next set of chips */=0A=
-				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
+				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
 			}=0A=
 		}=0A=
@@ -547,9 +547,9 @@=0A=
 	adr +=3D chip->start;=0A=
 	ENABLE_VPP(map);=0A=
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
 	cfi_write(map, CMD(0x30), adr);=0A=
 	=0A=
Index: cfi_probe.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/kernel/cfi_probe.c,v=0A=
retrieving revision 1.48=0A=
diff -U2 -r1.48 cfi_probe.c=0A=
--- cfi_probe.c	2001/04/09 13:26:21	1.48=0A=
+++ cfi_probe.c	2001/04/10 07:07:09=0A=
@@ -122,7 +122,7 @@=0A=
 	case 1:=0A=
 		/* Autoselect */=0A=
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi->interleave,=
 cfi->device_type, NULL);=0A=
-		cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, =
cfi->interleave, cfi->device_type, NULL);=0A=
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
+		cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, =
cfi->interleave, CFI_DEVICETYPE_X8, NULL);=0A=
 		break;=0A=
 	}=0A=
@@ -196,5 +196,15 @@=0A=
 	int index;=0A=
 	cfi->cfi_mode=3D0;	/* cfi mode */=0A=
-	cfi->addr_unlock1=3D0x555; cfi->addr_unlock2=3D0x2aa; =0A=
+	=0A=
+	if (cfi->device_type =3D=3D CFI_DEVICETYPE_X8)=0A=
+	{=0A=
+	  cfi->addr_unlock1=3D0x555; =0A=
+	  cfi->addr_unlock2=3D0x2aa; =0A=
+	}=0A=
+	else=0A=
+	{=0A=
+	  cfi->addr_unlock1=3D0xaaa; =0A=
+	  cfi->addr_unlock2=3D0x555; =0A=
+	}=0A=
 	index =3D cfi_probe_chip_1(map,base,chips,cfi);=0A=
 	if (index>=3D0) return index;=0A=

------_=_NextPart_000_01C0C190.2E1F79C0--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
