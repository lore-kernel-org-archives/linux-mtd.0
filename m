Received: from [80.190.106.10] (helo=taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApsKR-0007CY-Q9
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 17:02:43 +0000
From: Florian Schirmer <jolt@tuxbox.org>
To: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 8 Feb 2004 18:02:42 +0100
References: <007301c3ebea$29f96270$9602010a@jingle>
	<200402081238.45099.jolt@tuxbox.org>
	<1076241213.12587.240.camel@imladris.demon.co.uk>
In-Reply-To: <1076241213.12587.240.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_yumJAC5+o4wVMGQ"
Message-Id: <200402081802.42325.jolt@tuxbox.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_yumJAC5+o4wVMGQ
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

> Interesting. That would be a problem in map_copy_from(), which is either
> just memcpy_fromio() or a function provided by your map driver,
> depending on whether you have CONFIG_MTD_COMPLEX_MAPPINGS enabled.
>
> Can you check what memcpy_fromio() does directly? Try changing the
> definition of map_copy_from() in include/linux/mtd/map.h or
> drivers/mtd/maps/map_funcs.c or your map driver (depending on your
> configuration) to copy a byte at a time, and see if that fixes it.

Yeah. You're absolutely right. I should have checked cmdset2 before claimin=
g=20
it is broken.

memcopy_fromio is memcpy on MIPS. I've checked the memcpy implementation in=
=20
arch/mips/lib/memcpy.S and it is using byte transfers for remaining byte=20
transfers. So i expect at least the MIPS and SH plattform to be broken for=
=20
non buswidth=3D=3D1 setups. Haven't checked other archs yet.

I'm wondering what assumptions can be made about memcpy's access patterns?=
=20
Looks like nobody even guarantees a specific access type. But we need to ma=
ke=20
sure every access to the flash matches the bus width, don't we?

My proposed solution would be to handle remaining transfers in=20
maps.h/map_funcs.c already. So that the arch code only has to handle full=20
transfers. See attached patch. I've to admit that its very hard/impossible =
to=20
detect the remaining byte size. BITS_PER_LONG / 2 seems at least the best=20
guess we can make. This will handle SH, MIPS32 and MIPS64 just fine.

> The '%zd' modifier is the correct way to print a size_t; the old %Z was
> a gcc-ism. It's supported by the 2.6 and I thought also the current 2.4
> kernels; what kernel are you using, precisely? It's a trivial patch to
> add it.

I'm still using what was provided by Broadcom/Linksys (2.4.20). So dont wor=
ry=20
about that. I've ported the Broadcom code over to current 2.4.x but went ba=
ck=20
to 2.4.20 due to the jffs2 corruption.

Regards,
=C2=A0 =C2=A0 Florian

--Boundary-00=_yumJAC5+o4wVMGQ
Content-Type: text/x-diff;
  charset="utf-8";
  name="mtd-memcpy.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mtd-memcpy.diff"

--- linux-bcm/include/linux/mtd/map.h-old	2003-05-28 14:42:22.000000000 +0200
+++ linux-bcm/include/linux/mtd/map.h	2004-02-08 17:43:55.398928752 +0100
@@ -156,7 +156,30 @@ static inline void map_write64(struct ma
 
 static inline void map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
-	memcpy_fromio(to, map->virt + from, len);
+#define MTD_ALIGN	(4 - 1)
+//#define MTD_ALIGN	((BITS_PER_LONG / 2) - 1)
+	u64 buf;
+	ssize_t transfer;
+	ssize_t done = (map->buswidth == 1) ? len : (len & ~MTD_ALIGN);
+	memcpy_fromio(to, map->virt + from, done);
+	while (done < len) {
+		switch(map->buswidth) {
+			case 2:
+				buf = map_read16(map, from + done);
+				break;
+			case 4:
+				buf = map_read32(map, from + done);
+				break;
+			case 8:
+				buf = map_read64(map, from + done);
+				break;
+		}
+		transfer = len - done;
+		if (transfer > map->buswidth)
+			transfer = map->buswidth;
+		memcpy((void *)((unsigned long)to + done), &buf, transfer);
+		done += transfer;
+	}
 }
 
 static inline void map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)

--Boundary-00=_yumJAC5+o4wVMGQ--
