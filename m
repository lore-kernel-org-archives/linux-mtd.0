From: Roger Quadros <rogerq@ti.com>
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
CC: <akinobu.mita@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2] mtd: mtd_oobtest: Fix the address offset with vary_offset
 case
Date: Wed, 8 Jul 2015 14:50:19 +0300
Message-ID: <1436356219-5085-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When vary_offset is set (e.g. test case 3), the offset is not always
zero so memcmpshow() will show the wrong offset in the print message.
To fix this we introduce a new function memcmpshowoffset() which takes
offset as a parameter and displays the right offset and use it in
the case where offset is non zero.

The old memcmpshow() functionality is preserved by converting it into
a macro with offset preset to 0.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/tests/oobtest.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 8e8525f..3176212 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -125,7 +125,8 @@ static int write_whole_device(void)
  * Display the address, offset and data bytes at comparison failure.
  * Return number of bitflips encountered.
  */
-static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t count)
+static size_t memcmpshowoffset(loff_t addr, loff_t offset, const void *cs,
+			       const void *ct, size_t count)
 {
 	const unsigned char *su1, *su2;
 	int res;
@@ -135,8 +136,9 @@ static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t cou
 	for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--, i++) {
 		res = *su1 ^ *su2;
 		if (res) {
-			pr_info("error @addr[0x%lx:0x%zx] 0x%x -> 0x%x diff 0x%x\n",
-				(unsigned long)addr, i, *su1, *su2, res);
+			pr_info("error @addr[0x%lx:0x%lx] 0x%x -> 0x%x diff 0x%x\n",
+				(unsigned long)addr, (unsigned long)offset + i,
+				*su1, *su2, res);
 			bitflips += hweight8(res);
 		}
 	}
@@ -144,6 +146,9 @@ static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t cou
 	return bitflips;
 }
 
+#define memcmpshow(addr, cs, ct, count) memcmpshowoffset((addr), 0, (cs), (ct),\
+							 (count))
+
 /*
  * Compare with 0xff and show the address, offset and data bytes at
  * comparison failure. Return number of bitflips encountered.
@@ -228,9 +233,10 @@ static int verify_eraseblock(int ebnum)
 				errcnt += 1;
 				return err ? err : -1;
 			}
-			bitflips = memcmpshow(addr, readbuf + use_offset,
-					      writebuf + (use_len_max * i) + use_offset,
-					      use_len);
+			bitflips = memcmpshowoffset(addr, use_offset,
+						    readbuf + use_offset,
+						    writebuf + (use_len_max * i) + use_offset,
+						    use_len);
 
 			/* verify pre-offset area for 0xff */
 			bitflips += memffshow(addr, 0, readbuf, use_offset);
-- 
2.1.4
