Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hcFi-0004M8-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 20:02:06 +0100
Received: from nw175.netaddress.usa.net ([204.68.24.75])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14hcFc-0004M1-00
	for mtd@infradead.org; Mon, 26 Mar 2001 20:02:04 +0100
Message-ID: <20010326190157.6036.qmail@nw175.netaddress.usa.net>
Date: 26 Mar 2001 11:01:57 PST
From: Eric <ebrower@usa.net>
To: "Alex Lennon" <ajlennon@arcom.co.uk>,
  "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [RE: CFI Devices in x8 mode ]
CC: <mtd@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

"Alex Lennon" <ajlennon@arcom.co.uk> wrote:

>> The 8-bit buswidth probe doesn't attempt to probe for a =

>> device type X16 any more. It should. Someone gave me a =

>> patch for that a few days ago, I think - but I can't find =

>> it. I've just committed what I think is the correct fix to
>> CVS.

You may be referring to my proposed patch:

--- cfi_probe.c.orig	Wed Mar 21 15:59:05 2001
+++ cfi_probe.c	Thu Mar 22 13:12:43 2001
@@ -235,6 +235,11 @@
 		cfi->device_type =3D CFI_DEVICETYPE_X8;
 		index =3D cfi_probe_chip(map,base,chips,cfi);
 		if (index>=3D0) return index;
+
+		/* if this did not work, attempt again in x16 mode */
+		cfi->device_type =3D CFI_DEVICETYPE_X16;
+		index =3D cfi_probe_chip(map,base,chips,cfi);
+		if (index>=3D0) return index;
 		break;			=

 #endif


> Sorry - I think I'm misunderstanding - I've got an eight bit =

> device here but the code looks as though its accessing it as =

> a 16-bit device from what I can see in the spec.

[ ... ]

> If I'm reading this stuff right then the cfi_cfi_probe() =

> code doesn't seems to be taking the base offset into account ?

No, I believe it attempts to calculate the offset properly in =

cfi_probe.c cfi_check_qry_or_id():

  int osf =3D cfi->interleave * cfi->device_type;	// scale factor

  [ ... ]

  cfi_read(map,base+osf*0x10)=3D=3Dcfi_build_cmd('Q',map,cfi->interleave)=
 =


So it appears the calculation is done properly.  What is NOT done =

properly as of the last cfi_probe.c revision is that cfi->device_type
is unconditionally set to DEVICETYPE_X16 for all 8-bit-wide busses in
cfi_probe_new_chip().  The above patch simply falls-back to probing
in DEVICETYPE_X8 mode if the X16 fails.  I have not seen David's
patch in CVS as of yet, but if it does the same it should be fine--
I cannot speak to whether or not this is the appropriate solution, but
it does work in my case (8-bit bus with 16-bit chip in X8 mode).

E



____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
