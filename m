Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwsIx-0008Qx-IR
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 08:30:08 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v3 3/7] UBIFS: incorporate maximum write size
Date: Tue,  8 Mar 2011 10:32:44 +0200
Message-Id: <1299573168-27760-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
References: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Incorporate maximum write size into the UBIFS description data
structure. This patch just introduces new 'c->max_write_size'
and 'c->max_write_shift' fields as a preparation for the following
patches.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   19 +++++++++++++++++++
 fs/ubifs/ubifs.h |    5 +++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index d203c99..6a38174 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -515,6 +515,8 @@ static int init_constants_early(struct ubifs_info *c)
 	c->half_leb_size = c->leb_size / 2;
 	c->min_io_size = c->di.min_io_size;
 	c->min_io_shift = fls(c->min_io_size) - 1;
+	c->max_write_size = c->di.max_write_size;
+	c->max_write_shift = fls(c->max_write_size) - 1;
 
 	if (c->leb_size < UBIFS_MIN_LEB_SZ) {
 		ubifs_err("too small LEBs (%d bytes), min. is %d bytes",
@@ -534,6 +536,18 @@ static int init_constants_early(struct ubifs_info *c)
 	}
 
 	/*
+	 * Maximum write size has to be greater or equivalent to min. I/O
+	 * size, and be multiple of min. I/O size.
+	 */
+	if (c->max_write_size < c->min_io_size ||
+	    c->max_write_size % c->min_io_size ||
+	    !is_power_of_2(c->max_write_size)) {
+		ubifs_err("bad write buffer size %d for %d min. I/O unit",
+			  c->max_write_size, c->min_io_size);
+		return -EINVAL;
+	}
+
+	/*
 	 * UBIFS aligns all node to 8-byte boundary, so to make function in
 	 * io.c simpler, assume minimum I/O unit size to be 8 bytes if it is
 	 * less than 8.
@@ -541,6 +555,10 @@ static int init_constants_early(struct ubifs_info *c)
 	if (c->min_io_size < 8) {
 		c->min_io_size = 8;
 		c->min_io_shift = 3;
+		if (c->max_write_size < c->min_io_size) {
+			c->max_write_size = c->min_io_size;
+			c->max_write_shift = c->min_io_shift;
+		}
 	}
 
 	c->ref_node_alsz = ALIGN(UBIFS_REF_NODE_SZ, c->min_io_size);
@@ -1399,6 +1417,7 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	dbg_msg("compiled on:         " __DATE__ " at " __TIME__);
 	dbg_msg("min. I/O unit size:  %d bytes", c->min_io_size);
+	dbg_msg("max. write size:     %d bytes", c->max_write_size);
 	dbg_msg("LEB size:            %d bytes (%d KiB)",
 		c->leb_size, c->leb_size >> 10);
 	dbg_msg("data journal heads:  %d",
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index d182354..8b51949 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1024,6 +1024,9 @@ struct ubifs_debug_info;
  *
  * @min_io_size: minimal input/output unit size
  * @min_io_shift: number of bits in @min_io_size minus one
+ * @max_write_size: maximum amount of bytes the underlying flash can write at a
+ *                  time (MTD write buffer size)
+ * @max_write_shift: number of bits in @max_write_size minus one
  * @leb_size: logical eraseblock size in bytes
  * @half_leb_size: half LEB size
  * @idx_leb_size: how many bytes of an LEB are effectively available when it is
@@ -1270,6 +1273,8 @@ struct ubifs_info {
 
 	int min_io_size;
 	int min_io_shift;
+	int max_write_size;
+	int max_write_shift;
 	int leb_size;
 	int half_leb_size;
 	int idx_leb_size;
-- 
1.7.2.3
