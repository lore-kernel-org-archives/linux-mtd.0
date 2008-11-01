Received: from out01.mta.xmission.com ([166.70.13.231])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwEb9-0008P5-RH
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 11:25:08 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
	<1225524813.16774.140.camel@macbook.infradead.org>
	<m1skqbhmh2.fsf@frodo.ebiederm.org>
	<1225529384.16774.162.camel@macbook.infradead.org>
	<m1d4hfhhim.fsf@frodo.ebiederm.org>
	<m163n7hh8i.fsf_-_@frodo.ebiederm.org>
Date: Sat, 01 Nov 2008 04:19:11 -0700
In-Reply-To: <m163n7hh8i.fsf_-_@frodo.ebiederm.org> (Eric W. Biederman's
	message of "Sat, 01 Nov 2008 03:29:17 -0700")
Message-ID: <m1r65vg0cw.fsf_-_@frodo.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [PATCH] mtd: Fix cfi_send_gen_cmd the handling of x16 devices in x8
	mode v4
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	Corinna Schultz <cschultz@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


cfi_send_gen_cmd is only passed in the addresses:
0, 0x55, 0x2aa, 0x555 and the addresses addr_unlock1 and addr_unlock2
from jeded_probe.  The address 0, 0x55, and 0x555 will not be
effected by this patch.

For 16bit devices in 8bit compatibility mode we need to use the
byte address:  0xaaa and 0x555.  Which effectively match
the word address 0x555 and 0x2aa.  Except the last has it's low byte
set.  We need to set the low bit to maintain the alternating bit
sequence.

Likewise the addresses in jedec_probe whose word address ends
in the bits 10 also need their low bit set.

So generically modify cfi_build_cmd_addr to extend alternating bit
sequences in addresses.  And every current cfi_send_gen_cmd that
assumes cfi_cmd_set_0002 (i.e. uses addresses 0x2aa and 0x555)
needs to be updated.

v4: Fix  stupid typo in cfi_build_cmd_addr that failed to compile
    I'm writing this patch way to late at night.
v3: Bring all of the work back into cfi_build_cmd_addr
    including calling of map_bankwidth(map) and cfi_interleave(cfi)
    So every caller doesn't need to.
v2: Only modified the address if we our device_type is larger than our
    bus width.

Signed-off-by: Eric W. Biederman <ebiederm@maxwell.arastra.com>
---

 drivers/mtd/chips/cfi_cmdset_0002.c |   13 -------------
 drivers/mtd/chips/jedec_probe.c     |   10 ++++------
 include/linux/mtd/cfi.h             |   22 +++++++++++++++++++---
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a972cc6..9e7a236 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -362,19 +362,6 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 		/* Set the default CFI lock/unlock addresses */
 		cfi->addr_unlock1 = 0x555;
 		cfi->addr_unlock2 = 0x2aa;
-		/* Modify the unlock address if we are in compatibility mode */
-		if (	/* x16 in x8 mode */
-			((cfi->device_type == CFI_DEVICETYPE_X8) &&
-				(cfi->cfiq->InterfaceDesc ==
-					CFI_INTERFACE_X8_BY_X16_ASYNC)) ||
-			/* x32 in x16 mode */
-			((cfi->device_type == CFI_DEVICETYPE_X16) &&
-				(cfi->cfiq->InterfaceDesc ==
-					CFI_INTERFACE_X16_BY_X32_ASYNC)))
-		{
-			cfi->addr_unlock1 = 0xaaa;
-			cfi->addr_unlock2 = 0x555;
-		}
 
 	} /* CFI mode */
 	else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index f84ab61..2f3f2f7 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1808,9 +1808,7 @@ static inline u32 jedec_read_mfr(struct map_info *map, uint32_t base,
 	 * several first banks can contain 0x7f instead of actual ID
 	 */
 	do {
-		uint32_t ofs = cfi_build_cmd_addr(0 + (bank << 8),
-						  cfi_interleave(cfi),
-						  cfi->device_type);
+		uint32_t ofs = cfi_build_cmd_addr(0 + (bank << 8), map, cfi);
 		mask = (1 << (cfi->device_type * 8)) - 1;
 		result = map_read(map, base + ofs);
 		bank++;
@@ -1824,7 +1822,7 @@ static inline u32 jedec_read_id(struct map_info *map, uint32_t base,
 {
 	map_word result;
 	unsigned long mask;
-	u32 ofs = cfi_build_cmd_addr(1, cfi_interleave(cfi), cfi->device_type);
+	u32 ofs = cfi_build_cmd_addr(1, map, cfi);
 	mask = (1 << (cfi->device_type * 8)) -1;
 	result = map_read(map, base + ofs);
 	return result.x[0] & mask;
@@ -2067,8 +2065,8 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 
 	}
 	/* Ensure the unlock addresses we try stay inside the map */
-	probe_offset1 = cfi_build_cmd_addr(cfi->addr_unlock1, cfi_interleave(cfi), cfi->device_type);
-	probe_offset2 = cfi_build_cmd_addr(cfi->addr_unlock2, cfi_interleave(cfi), cfi->device_type);
+	probe_offset1 = cfi_build_cmd_addr(cfi->addr_unlock1, map, cfi);
+	probe_offset2 = cfi_build_cmd_addr(cfi->addr_unlock2, map, cfi);
 	if (	((base + probe_offset1 + map_bankwidth(map)) >= map->size) ||
 		((base + probe_offset2 + map_bankwidth(map)) >= map->size))
 		goto retry;
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d6fb115..52d2e11 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -281,9 +281,25 @@ struct cfi_private {
 /*
  * Returns the command address according to the given geometry.
  */
-static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs, int interleave, int type)
+static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs,
+				struct map_info *map, struct cfi_private *cfi)
 {
-	return (cmd_ofs * type) * interleave;
+	unsigned bankwidth = map_bankwidth(map);
+	unsigned interleave = cfi_interleave(cfi);
+	unsigned type = cfi->device_type;
+	uint32_t addr;
+	
+	addr = (cmd_ofs * type) * interleave;
+
+	/* Modify the unlock address if we are in compatiblity mode.
+	 * For 16bit devices on 8 bit busses
+	 * and 32bit devices on 16 bit busses
+	 * set the low bit of the alternating bit sequence of the address.
+	 */
+	if (((type * interleave) > bankwidth) && (cmd_ofs & 2))
+		addr |= (type >> 1)*interleave;
+
+	return  addr;
 }
 
 /*
@@ -429,7 +445,7 @@ static inline uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t
 				int type, map_word *prev_val)
 {
 	map_word val;
-	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, cfi_interleave(cfi), type);
+	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, map, cfi);
 
 	val = cfi_build_cmd(cmd, map, cfi);
 
-- 
1.5.6.5
