Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 186reN-0000Xk-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 12:08:43 +0000
Subject: [PATCH] JFFS on an MTDRAM device
From: Ian Campbell <icampbell@arcomcontrols.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-j8dcBdeZF/GTWtgRJiWs"
Date: 30 Oct 2002 12:33:57 +0000
Message-Id: <1035981237.32294.72.camel@LinuxDev>
Mime-Version: 1.0
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

--=-j8dcBdeZF/GTWtgRJiWs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I needed the attached patch to allow a JFFS2 filesystem to be mounted
using an MTDRAM driver (actually an SRAM chip).

Without it I get lots of warnings in jffs2_erase_callback: "Erase at
0x%08x finished, but state != MTD_ERASE_DONE. State is 0x%x instead."

Cheers,
Ian.

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 403465
E-Mail: icampbell@arcomcontrols.com
Web: http://www.arcomcontrols.com


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
--=-j8dcBdeZF/GTWtgRJiWs
Content-Disposition: attachment; filename=mtd.ram.erase.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=mtd.ram.erase.patch; charset=ISO-8859-1

? mtd.ram.erase.patch
? drivers/mtd/chips/.map_ram.c.swp
Index: drivers/mtd/chips/map_ram.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/chips/map_ram.c,v
retrieving revision 1.14
diff -u -r1.14 map_ram.c
--- drivers/mtd/chips/map_ram.c	2 Oct 2001 15:05:12 -0000	1.14
+++ drivers/mtd/chips/map_ram.c	30 Oct 2002 12:20:06 -0000
@@ -107,6 +107,8 @@
 	for (i=3D0; i<instr->len; i++)
 		map->write8(map, 0xFF, instr->addr + i);
=20
+	instr->state =3D MTD_ERASE_DONE;
+
 	if (instr->callback)
 		instr->callback(instr);
=20

--=-j8dcBdeZF/GTWtgRJiWs--
