Received: from cmsrelay01.mx.net ([165.212.11.110])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtTHI-0007vn-QC
	for linux-mtd@lists.infradead.org; Wed, 18 Feb 2004 15:06:21 +0000
Message-ID: <01f101c3f630$b47b04d0$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: "Brian T" <btuch@usa.net>,
	<linux-mtd@lists.infradead.org>
References: 
	<06b601c3f4dd$594d1700$fd0ba8c0@briantpc><00e101c3f593$80c3f770$fd0ba8c0@briantpc>
	<01c701c3f62c$d88fc300$fd0ba8c0@briantpc>
Date: Wed, 18 Feb 2004 09:05:53 -0600
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_01EE_01C3F5FE.694F2A40"
Subject: Re: Intel 28F128 - Linux-2.4.24 broke jffs2 v2.2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_01EE_01C3F5FE.694F2A40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


>
> I found the problem, and the attached patch fixed it for me.  Not sure if

Sorry, forgot the diff attachment.

> this is the correct way to fix this though.  I took a line from
> jedec_probe.c and added it to cfi_util.c to get the Micron chip into the
> right mode. Micron requires the 0xFF (according to the specs) as do some
> Intel chips.
>
> Comments? If this is valid can it be added to CVS? If not, does someone
know
> the proper way of doing it?
>
> Thanks,
>
> -Brian

------=_NextPart_000_01EE_01C3F5FE.694F2A40
Content-Type: application/octet-stream;
	name="cfi_util.c.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_util.c.diff"

nux-2.4.x/drivers/mtd/chips/cfi_util.c.orig       Tue Feb 17 15:32:24 =
2004=0A=
+++ linux-2.4.x/drivers/mtd/chips/cfi_util.c    Tue Feb 17 16:33:03 2004=0A=
@@ -68,6 +68,14 @@=0A=
        /* Make sure it's in read mode */=0A=
        cfi_send_gen_cmd(0xf0, 0, base, map, cfi, cfi->device_type, =
NULL);=0A=
 =0A=
+        /* Some misdesigned intel chips do not respond for 0xF0 for a =
reset,=0A=
+         * so ensure we're in read mode.  Send both the Intel and the =
AMD command=0A=
+         * for this.  Intel uses 0xff for this, AMD uses 0xff for NOP, =
so=0A=
+         * this should be safe. ALSO Some Intel's Specify 0xFF, and =
Micron=0A=
+        * REQUIRES it.=0A=
+         */=0A=
+        cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, =
NULL);=0A=
+=0A=
        return extp;=0A=
 }=0A=
 =0A=

------=_NextPart_000_01EE_01C3F5FE.694F2A40--
