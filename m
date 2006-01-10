Received: from sorrow.cyrius.com ([65.19.161.204])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EwQvt-0004lG-H3
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2006 16:21:52 -0500
Date: Tue, 10 Jan 2006 21:20:54 +0000
From: Martin Michlmayr <tbm@cyrius.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20060110212054.GA12650@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@cam.org>
Subject: [PATCH] Fix compilation errors in maps/dc21285.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the following compilation errors in maps/dc21285.c.

  CC      drivers/mtd/maps/dc21285.o
drivers/mtd/maps/dc21285.c: In function ‘dc21285_copy_to_32’:
drivers/mtd/maps/dc21285.c:113: error: invalid lvalue in increment
drivers/mtd/maps/dc21285.c: In function ‘dc21285_copy_to_16’:
drivers/mtd/maps/dc21285.c:124: error: invalid lvalue in increment
drivers/mtd/maps/dc21285.c: In function ‘dc21285_copy_to_8’:
drivers/mtd/maps/dc21285.c:134: error: invalid lvalue in increment
make[3]: *** [drivers/mtd/maps/dc21285.o] Error 1

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>

---

 dc21285.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

The patch is against 2.6.15

--- drivers/mtd/maps/dc21285.c~	2006-01-10 19:40:53.000000000 +0000
+++ drivers/mtd/maps/dc21285.c	2006-01-10 19:52:14.000000000 +0000
@@ -110,8 +110,9 @@
 {
 	while (len > 0) {
 		map_word d;
-		d.x[0] = *((uint32_t*)from)++;
+		d.x[0] = *((uint32_t*)from);
 		dc21285_write32(map, d, to);
+		from += 4;
 		to += 4;
 		len -= 4;
 	}
@@ -121,8 +122,9 @@
 {
 	while (len > 0) {
 		map_word d;
-		d.x[0] = *((uint16_t*)from)++;
+		d.x[0] = *((uint16_t*)from);
 		dc21285_write16(map, d, to);
+		from += 2;
 		to += 2;
 		len -= 2;
 	}
@@ -131,8 +133,9 @@
 static void dc21285_copy_to_8(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
 	map_word d;
-	d.x[0] = *((uint8_t*)from)++;
+	d.x[0] = *((uint8_t*)from);
 	dc21285_write8(map, d, to);
+	from++;
 	to++;
 	len--;
 }

-- 
Martin Michlmayr
http://www.cyrius.com/
