Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bay6w-0005NE-N4
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 10:43:27 -0400
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <40D1A1F2.1000103@sysgo.com>
References: <40D1A1F2.1000103@sysgo.com>
Content-Type: text/plain; charset=iso-8859-15
Message-Id: <1087483404.27907.8.camel@icampbell-debian>
Mime-Version: 1.0
Date: Thu, 17 Jun 2004 15:43:24 +0100
Content-Transfer-Encoding: quoted-printable
Subject: Re: chip driver mar_ram.c never sets MTD_ERASE_DONE state
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-06-17 at 14:51, Oliver K=FChlert wrote:
> trying to erase on an mtd devices using the map_ram.c driver
> blocks the current process and never wakes up. (see mtdchar.c, ioctl func=
)
>=20
> I believe, that this can be fixed by adding the marked line in map_ram.c:

I believe that to be correct -- I posted a patch here quite some time
ago
http://lists.infradead.org/pipermail/linux-mtd/2002-November/006436.html

Please could someone who has CVS access commit it? Perhaps I should also
submit to the kernel list?

Ian.

%patch
Index: q/drivers/mtd/chips/map_ram.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- q.orig/drivers/mtd/chips/map_ram.c	Tue Aug  5 16:46:21 2003
+++ q/drivers/mtd/chips/map_ram.c	Tue Aug  5 16:46:37 2003
@@ -109,6 +109,8 @@
 	for (i=3D0; i<instr->len; i++)
 		map_write8(map, 0xFF, instr->addr + i);
=20
+	instr->state =3D MTD_ERASE_DONE;
+
 	if (instr->callback)
 		instr->callback(instr);
=20

%diffstat
 map_ram.c |    2 ++
 1 files changed, 2 insertions(+)


--=20
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
