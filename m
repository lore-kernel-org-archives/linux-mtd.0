Received: from nwcst337.netaddress.usa.net ([204.68.23.82])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15SPRe-0008OJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 Aug 2001 21:51:50 +0100
Message-ID: <20010802205155.1538.qmail@nwcst337.netaddress.usa.net>
Date: 2 Aug 2001 13:51:55 PDT
From: Eric <ebrower@usa.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] duplicate assignment in map_ram.c
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

dwmw2, et. al.,

There's a duplicate assignment to mtd->erasesize in =

<mtd>/drivers/mtd/chips/map_ram.c which is removed
with the following patch.  I've assumed that the later
assignment is the one you wish to keep-- this may not
be the correct assumption.

E

Index: map_ram.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/chips/map_ram.c,v
retrieving revision 1.12
diff -u -r1.12 map_ram.c
--- map_ram.c   2001/07/14 00:59:17     1.12
+++ map_ram.c   2001/08/02 20:52:38
@@ -63,7 +63,6 @@
        mtd->priv =3D map;
        mtd->name =3D map->name;
        mtd->type =3D MTD_RAM;
-       mtd->erasesize =3D 0x10000;
        mtd->size =3D map->size;
        mtd->erase =3D mapram_erase;
        mtd->read =3D mapram_read;
