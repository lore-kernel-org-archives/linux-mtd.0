Received: from mx10.radisys.com ([206.102.10.36])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DyJO-0003UL-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2001 01:35:54 +0000
To: Babic Stefano <Stefano.Babic@icn.siemens.de>,
	linux-mtd@lists.infradead.org
Subject: Re: BUSWIDTH > 4 (64 bit support on PPC) Here's one more fix to add
MIME-Version: 1.0
Message-ID: <OFD750E5FE.501F226E-ON85256B20.00061314@radisys.com>
From: Jan.Rovins@radisys.com
Date: Tue, 11 Dec 2001 20:37:40 -0500
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi  Stefano,

Here is one more fix to add to that patch,
what you have will work on most of your boards, but fail on a few,
I wasn't checking the 2nd half of the 64 bit bank to see if it was ready.

the following patch should fix:
(put this fix on top of my original patch)

I will re post the whole patch including this fix, against the latest MTD=20
as soon as I get a chance
to re-sync  to the latest myself. (Maybe end of this week)
I don't know if the official MTD folk are planing to include this in the=20
main code base.

Jan

Index: cfi=5Fcmdset=5F0002.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file:=20
/cvs/embeded/kernels/src/mot765/linux-2.2.17/drivers/mtd/chips/cfi=5Fcmdset=
=5F0002.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- cfi=5Fcmdset=5F0002.c   2001/06/07 13:30:00     1.4
+++ cfi=5Fcmdset=5F0002.c   2001/09/04 16:48:50     1.5
@@ -8,7 +8,7 @@
  *
  * This code is GPL
  *
- * $Id: cfi=5Fcmdset=5F0002.c,v 1.4 2001/06/07 13:30:00 jrovins Exp $
+ * $Id: cfi=5Fcmdset=5F0002.c,v 1.5 2001/09/04 16:48:50 jrovins Exp $
  *
  */
=20
@@ -22,10 +22,11 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/interrupt.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
=20
-#define AMD=5FBOOTLOC=5FBUG
+//#define AMD=5FBOOTLOC=5FBUG
=20
 static int cfi=5Famdstd=5Fread (struct mtd=5Finfo *, loff=5Ft, size=5Ft, s=
ize=5Ft *,=20
u=5Fchar *);
 static int cfi=5Famdstd=5Fwrite(struct mtd=5Finfo *, loff=5Ft, size=5Ft, s=
ize=5Ft *,=20
const u=5Fchar *);
@@ -91,6 +92,7 @@
        {
                cfi=5Fsend=5Fgen=5Fcmd(0x98, 0x55, 0, map, cfi,=20
cfi->device=5Ftype, NULL);
                bootloc =3D cfi=5Fread=5Fquery(map, (adr+15)*ofs=5Ffactor);
+                printk("AMD=5FBOOTLOC=5FBUG: Default Path bootloc: %d\n", =

bootloc);
        }
        if (bootloc =3D=3D 3 && cfi->cfiq->NumEraseRegions > 1) {
                printk(KERN=5FWARNING "%s: Swapping erase regions for broke=
n=20
CFI table.\n", map->name);
@@ -624,7 +626,12 @@
        /* FIXME. Use a timer to check this, and return immediately. */
        /* Once the state machine's known to be working I'll do that */
=20
+#if (BITS=5FPER=5FLONG < 64) && ( CFIDEV=5FBUSWIDTH =3D=3D 8)
+       while ( (( (status =3D cfi=5Fread(map,adr)) & rdy=5Fmask ) !=3D rdy=
=5Fmask )=20
||=20
+       ( ( (status =3D cfi=5Fread(map,adr + 0x04)) & rdy=5Fmask ) !=3D rdy=
=5Fmask )=20
) {
+#else
        while ( ( (status =3D cfi=5Fread(map,adr)) & rdy=5Fmask ) !=3D rdy=
=5Fmask )=20
{
+#endif
                static int z=3D0;
=20
                if (chip->state !=3D FL=5FERASING) {






Babic Stefano <Stefano.Babic@icn.siemens.de>
Sent by: linux-mtd-admin@lists.infradead.org
12/11/01 08:35 AM

=20
        To:     linux-mtd@lists.infradead.org
        cc:=20
        Subject:        BUSWIDTH > 4 (64 bit support on PPC)


Hi,

I have on my target (Motorola MPC 755, 64 bit bus width) the necessity to=20
use BUSWIDTH =3D 8. I have seen in the mailing list that the same case=20
occurred and Jan (Jan Rovins <jrovins@ss7-link.com>) provided some patches =

to=20
support it, mainly for cfi=5Fcmdset=5F000x.c. I inserted the modifications =
in=20
a newer mtd-snapshot and, following the suggestion by David, my system=20
works.
I checked if these changes are applied in latest MTD=B4s versions and I hav=
e=20
seen they are not. I=B4d like to ask if there are some plans to apply these=
=20
patches. I know, using a 32 bit processor (and 32 bit OS) with a 64 bit=20
bus seems quite weird, but it is probably not so unusual in embedded=20
systems with PowerPC and 60x bus.

Thanks=20

Stefano

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
