Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BXht-0002hA-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 09:51:41 +0000
Subject: [PATCH] small fix for drivers/mtd/chips/map_ram.c in 2.4
From: Ian Campbell <icampbell@arcomcontrols.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="=-39AjHi75UaKQMA+eFzTk"
Date: 12 Nov 2002 10:22:03 +0000
Message-Id: <1037096523.26466.26.camel@LinuxDev>
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

--=-39AjHi75UaKQMA+eFzTk
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi, 

The attached one-liner was necessary to allow me to mount a JFFS2 file
system using an MTD device based on the map_ram map driver. 

It sets the state to MTD_ERASE_DONE in mapram_erase, if memory serves (I
did it a couple of weeks ago) not having this was causing badness in
jffs2_erase_callback.

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
--=-39AjHi75UaKQMA+eFzTk
Content-Disposition: attachment; filename=mtd.map_ram.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=mtd.map_ram.patch; charset=ISO-8859-1

--- kernel-2.4.18.orig/drivers/mtd/chips/map_ram.c
+++ kernel-2.4.18/drivers/mtd/chips/map_ram.c
@@ -107,5 +107,7 @@
 	for (i=3D0; i<instr->len; i++)
 		map->write8(map, 0xFF, instr->addr + i);
=20
+	instr->state =3D MTD_ERASE_DONE;
+
 	if (instr->callback)
 		instr->callback(instr);

--=-39AjHi75UaKQMA+eFzTk--
