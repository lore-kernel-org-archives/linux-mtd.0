Received: from [217.111.56.18] (helo=spring.sncag.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiPOY-0005LY-Os
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 23:16:24 -0400
Received: from farside.sncag.com (localhost [127.0.0.1])
	by spring.sncag.com (8.12.11/8.12.11/Debian-5) with ESMTP id
	i683GFsS031382
	for <linux-mtd@lists.infradead.org>; Thu, 8 Jul 2004 05:16:18 +0200
Received: from farside.sncag.com (farside [127.0.0.1])
	by farside.sncag.com (8.12.11/8.12.11/Debian-5) with ESMTP id
	i683GE6U008887
	for <linux-mtd@lists.infradead.org>; Thu, 8 Jul 2004 11:16:14 +0800
To: linux-mtd@lists.infradead.org
From: Rainer Weikusat <rainer.weikusat@sncag.com>
Date: Thu, 08 Jul 2004 11:16:14 +0800
Message-ID: <87acybchoh.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: add 'static' where sensible to physmap.c [PATCH]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a small patch that changes everything in physmap.c
that does not need external linkage to static linkage (ie
everything):

----------------
Index: physmap.c
===================================================================
RCS file: /home/cvs/repo/linux-rsg/drivers/mtd/maps/physmap.c,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- physmap.c	8 Jul 2004 03:00:41 -0000	1.6
+++ physmap.c	8 Jul 2004 03:01:23 -0000	1.7
@@ -22,50 +22,50 @@
 
 static struct mtd_info *mymtd;
 
-__u8 physmap_read8(struct map_info *map, unsigned long ofs)
+static __u8 physmap_read8(struct map_info *map, unsigned long ofs)
 {
 	return __raw_readb(map->map_priv_1 + ofs);
 }
 
-__u16 physmap_read16(struct map_info *map, unsigned long ofs)
+static __u16 physmap_read16(struct map_info *map, unsigned long ofs)
 {
 	return __raw_readw(map->map_priv_1 + ofs);
 }
 
-__u32 physmap_read32(struct map_info *map, unsigned long ofs)
+static __u32 physmap_read32(struct map_info *map, unsigned long ofs)
 {
 	return __raw_readl(map->map_priv_1 + ofs);
 }
 
-void physmap_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+static void physmap_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
 	memcpy_fromio(to, map->map_priv_1 + from, len);
 }
 
-void physmap_write8(struct map_info *map, __u8 d, unsigned long adr)
+static void physmap_write8(struct map_info *map, __u8 d, unsigned long adr)
 {
 	__raw_writeb(d, map->map_priv_1 + adr);
 	mb();
 }
 
-void physmap_write16(struct map_info *map, __u16 d, unsigned long adr)
+static void physmap_write16(struct map_info *map, __u16 d, unsigned long adr)
 {
 	__raw_writew(d, map->map_priv_1 + adr);
 	mb();
 }
 
-void physmap_write32(struct map_info *map, __u32 d, unsigned long adr)
+static void physmap_write32(struct map_info *map, __u32 d, unsigned long adr)
 {
 	__raw_writel(d, map->map_priv_1 + adr);
 	mb();
 }
 
-void physmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+static void physmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
 	memcpy_toio(map->map_priv_1 + to, from, len);
 }
 
-struct map_info physmap_map = {
+static struct map_info physmap_map = {
 	name: "Physically mapped flash",
 	size: WINDOW_SIZE,
 	buswidth: BUSWIDTH,
@@ -115,7 +115,7 @@
 #endif
 #endif
 
-int __init init_physmap(void)
+static int __init init_physmap(void)
 {
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
 	const char **type;
-------------

The device I am working on here happens to be equipped w/ AMD flash
chips of different types in a not necessarily continous memory
mapping (29LV160D, 29LV320D and 29DL640D). Instead of adding yet
another board-specific driver sitting atop a generic interface, I
would rather change the physmap-driver to deal w/ multiple different
flash chips (I tried to use a naive configuration, but the results
were less than encouraging). Which leads to a question: Would it be
better to create a "multi physmap"-driver, starting with a copy of the
existing one, or to modify physmap.c to handle both
cases. Personallly, I would prefer the latter, to avoid code
duplication where possible. But the file would certainly not get
prettier by adding a lot of #ifdefs to it. Any suggestions on this?
