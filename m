Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwsIz-0008RF-Nq
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 08:30:10 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v3 4/7] UBI: incorporate LEB offset information
Date: Tue,  8 Mar 2011 10:32:45 +0200
Message-Id: <1299573168-27760-5-git-send-email-dedekind1@gmail.com>
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

Incorporate the LEB offset information into UBIFS. We'll use this
information in one of the next patches to figure out what are the
max. write size offsets relative to the PEB. So this patch is just
a preparation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    1 +
 fs/ubifs/ubifs.h |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 6a38174..c20c6d2 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -512,6 +512,7 @@ static int init_constants_early(struct ubifs_info *c)
 
 	c->leb_cnt = c->vi.size;
 	c->leb_size = c->vi.usable_leb_size;
+	c->leb_start = c->di.leb_start;
 	c->half_leb_size = c->leb_size / 2;
 	c->min_io_size = c->di.min_io_size;
 	c->min_io_shift = fls(c->min_io_size) - 1;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 8b51949..942c1d3 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1028,6 +1028,8 @@ struct ubifs_debug_info;
  *                  time (MTD write buffer size)
  * @max_write_shift: number of bits in @max_write_size minus one
  * @leb_size: logical eraseblock size in bytes
+ * @leb_start: starting offset of logical eraseblocks within physical
+ *             eraseblocks
  * @half_leb_size: half LEB size
  * @idx_leb_size: how many bytes of an LEB are effectively available when it is
  *                used to store indexing nodes (@leb_size - @max_idx_node_sz)
@@ -1276,6 +1278,7 @@ struct ubifs_info {
 	int max_write_size;
 	int max_write_shift;
 	int leb_size;
+	int leb_start;
 	int half_leb_size;
 	int idx_leb_size;
 	int leb_cnt;
-- 
1.7.2.3
