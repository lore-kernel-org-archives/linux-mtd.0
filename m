Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.12 #3 (Red Hat Linux))
	id 18gNwp-0003lm-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2003 11:42:35 +0000
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Date: 05 Feb 2003 11:42:31 +0000
Message-Id: <1044445351.12802.1558.camel@LinuxDev>
Mime-Version: 1.0
Subject: [PATCH] add_mtd_device_full
Content-Type: multipart/mixed; boundary="=-2HppCcE1BUMaJOj4XeK8"
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

--=-2HppCcE1BUMaJOj4XeK8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

This patch adds a function add_mtd_device_full which works the same as
add_mtd_device except it allows you to request a particular minor number
for the new device.

I wanted this because on our boards we have Flash, SRAM and BIOS all
accessible via MTD, unfortunately the minor number of the SRAM and BIOS
devices can change depending on how many partitions exist in the main
Flash, and the BIOS minor number can additionally change depending on if
the board has SRAM fitted or not etc. I would much prefer to be able to
say that SRAM would always be mtd14 and BIOS would be mtd15.

It is also possible (and I have done this :-( ) that when booting from a
HDD or CDROM you modprobe the BIOS mapping module before the Flash
mapping module and happily overwrite the BIOS (on mtd0) thinking it is
the boot partition on the flash (which is normally mtd0).

What are the chances of this being rolled into the main MTD
distribution?

I've also attached mtd.ram.erase.patch which I sent ages ago which is
needed to mount JFFS2 on an SRAM (map_ram) device.

Ian.

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 403465
E-Mail: icampbell@arcom.com
Web: http://www.arcom.com


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
--=-2HppCcE1BUMaJOj4XeK8
Content-Disposition: attachment; filename=mtd.ram.erase.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=mtd.ram.erase.patch; charset=ISO-8859-15

? mtd.ram.erase.patch
? drivers/mtd/chips/.map_ram.c.swp
Index: drivers/mtd/chips/map_ram.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3From icampbell@arcom.com  Wed Feb  5 11:42:31 2003
From: icampbell@arcom.com (Ian Campbell)
Date: 05 Feb 2003 11:42:31 +0000
Subject: [PATCH] add_mtd_device_full
Message-ID: <1044445351.12802.1558.camel@LinuxDev>

--=-2HppCcE1BUMaJOj4XeK8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

This patch adds a function add_mtd_device_full which works the same as
add_mtd_device except it allows you to request a particular minor number
for the new device.

I wanted this because on our boards we have Flash, SRAM and BIOS all
accessible via MTD, unfortunately the minor number of the SRAM and BIOS
devices can change depending on how many partitions exist in the main
Flash, and the BIOS minor number can additionally change depending on if
the board has SRAM fitted or not etc. I would much prefer to be able to
say that SRAM would always be mtd14 and BIOS would be mtd15.

It is also possible (and I have done this :-( ) that when booting from a
HDD or CDROM you modprobe the BIOS mapping module before the Flash
mapping module and happily overwrite the BIOS (on mtd0) thinking it is
the boot partition on the flash (which is normally mtd0).

What are the chances of this being rolled into the main MTD
distribution?

I've also attached mtd.ram.erase.patch which I sent ages ago which is
needed to mount JFFS2 on an SRAM (map_ram) device.

Ian.

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 403465
E-Mail: icampbell@arcom.com
Web: http://www.arcom.com


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
--=-2HppCcE1BUMaJOj4XeK8
Content-Disposition: attachment; filename=mtd.ram.erase.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=mtd.ram.erase.patch; charset=ISO-8859-15

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

--=-2HppCcE1BUMaJOj4XeK8
Content-Disposition: attachment; filename=add_mtd_full.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=add_mtd_full.patch; charset=ISO-8859-15

Index: drivers//mtd/mtdcore.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/mtdcore.c,v
retrieving revision 1.34
diff -u -b -B -w -p -u -r1.34 mtdcore.c
--- drivers//mtd/mtdcore.c	24 Jan 2003 23:32:25 -0000	1.34
+++ drivers//mtd/mtdcore.c	5 Feb 2003 11:25:52 -0000
@@ -29,29 +29,37 @@ static struct mtd_info *mtd_table[MAX_MT
 static struct mtd_notifier *mtd_notifiers =3D NULL;
=20
 /**
- *	add_mtd_device - register an MTD device
+ *	add_mtd_device_full - register an MTD device at a particular minor numb=
er
  *	@mtd: pointer to new MTD device info structure
+ *	@minor: requested minor number. -1 to for the first free.
  *
- *	Add a device to the list of MTD devices present in the system, and
- *	notify each currently active MTD 'user' of its arrival. Returns
- *	zero on success or 1 on failure, which currently will only happen
- *	if the number of present devices exceeds MAX_MTD_DEVICES (i.e. 16)
+ *	Add a device to the list of MTD devices present in the system,
+ *	and notifies each currently active MTD 'user' of its
+ *	arrival. Returns zero on success or 1 on failure, which
+ *	currently only occurs if the requested minor number has
+ *	already been allocated or if minor exceeds MAX_MTD_DEVICES
+ *	(i.e. 16)
  */
-
-int add_mtd_device(struct mtd_info *mtd)
+int add_mtd_device_full(struct mtd_info *mtd, int minor)
 {
-	int i;
+	struct mtd_notifier *not=3Dmtd_notifiers;
=20
 	down(&mtd_table_mutex);
=20
-	for (i=3D0; i< MAX_MTD_DEVICES; i++)
-		if (!mtd_table[i])
-		{
-			struct mtd_notifier *not=3Dmtd_notifiers;
+	if ( minor =3D=3D -1 ) {
+		for (minor =3D 0; minor < MAX_MTD_DEVICES; minor++)
+			if (!mtd_table[minor])
+				break;
+	}
=20
-			mtd_table[i] =3D mtd;
-			mtd->index =3D i;
-			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
+	if ( minor >=3D MAX_MTD_DEVICES || minor < 0 || mtd_table[minor] ) {
+		up(&mtd_table_mutex);
+		return 1;
+	}
+
+	mtd_table[minor] =3D mtd;
+	mtd->index =3D minor;
+	DEBUG(0, "mtd: Giving out device %d to %s\n",minor, mtd->name);
 			while (not)
 			{
 				(*(not->add))(mtd);
@@ -62,8 +70,18 @@ int add_mtd_device(struct mtd_info *mtd)
 			return 0;
 		}
 =09
-	up(&mtd_table_mutex);
-	return 1;
+/**
+ *	add_mtd_device - register an MTD device
+ *	@mtd: pointer to new MTD device info structure
+ *
+ *	Add a device to the list of MTD devices present in the system, and
+ *	notify each currently active MTD 'user' of its arrival. Returns
+ *	zero on success or 1 on failure, which currently will only happen
+ *	if the number of present devices exceeds MAX_MTD_DEVICES (i.e. 16)
+ */
+int add_mtd_device(struct mtd_info *mtd)
+{
+	return add_mtd_device(mtd, -1);
 }
=20
 /**
Index: drivers//mtd/chips/map_ram.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/chips/map_ram.c,v
retrieving revision 1.14
diff -u -b -B -w -p -u -r1.14 map_ram.c
--- drivers//mtd/chips/map_ram.c	2 Oct 2001 15:05:12 -0000	1.14
+++ drivers//mtd/chips/map_ram.c	5 Feb 2003 11:25:52 -0000
@@ -107,6 +107,8 @@ static int mapram_erase (struct mtd_info
 	for (i=3D0; i<instr->len; i++)
 		map->write8(map, 0xFF, instr->addr + i);
=20
+	instr->state =3D MTD_ERASE_DONE;
+
 	if (instr->callback)
 		instr->callback(instr);
=20

--=-2HppCcE1BUMaJOj4XeK8--
