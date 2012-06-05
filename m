Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbvPE-0004Gc-BG
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 15:10:49 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/5] UBI: fastmap: more nitpicks
Date: Tue,  5 Jun 2012 18:11:57 +0300
Message-Id: <1338909119-5188-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Again, I feel that this may be annoing for others, but it will make me happier
if I see UBI code having consistent style. After all, people come and go but I
stay maintaining this stuff so I want reading the code to be pleasant for me.
So please, bear with my strange requirements, I will not add this long
explanation anymore, ok? :-)

Anyway, in UBI/UBIFS we try to put identifiers of the same type on one line, if
it fits them.

Also, we do not add blank lines to the identifiers declaration block. If your
function is so huge that it has too many local variables and you need to group
it - fix the function - split it instead.

I've also added a TODO about this. If you could change this globally - it would
make me happier and I'd read your code with more pleasure.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/fastmap.c |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index b2ee872..e6900e4 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -447,6 +447,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 {
 	struct list_head used;
 	struct list_head eba_orphans;
+	/* TODO: please, try to declare variables of the same time on one line */
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
 	struct ubi_ec_hdr *ech;
@@ -458,6 +459,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	struct ubi_fm_volhdr *fmvhdr;
 	struct ubi_fm_eba *fm_eba;
 
+	/* TODO: no blank lines in the local variable declaration block
+	 * please. */
 	int ret, i, j;
 	size_t fm_pos = 0;
 	unsigned long long max_sqnum = 0;
@@ -735,8 +738,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	struct ubi_fm_sb *fmsb;
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
-	int ret, i, used_blocks, pnum;
-	int sb_pnum = 0;
+	int ret, i, used_blocks, pnum, sb_pnum = 0;
 	char *fm_raw;
 	size_t fm_size;
 	__be32 crc, tmp_crc;
@@ -961,25 +963,19 @@ out:
 static int ubi_write_fastmap(struct ubi_device *ubi,
 			     struct ubi_fastmap_layout *new_fm)
 {
-	int ret;
 	size_t fm_pos = 0;
 	char *fm_raw;
-	int i, j;
-
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmh;
 	struct ubi_fm_scan_pool *fmpl;
 	struct ubi_fm_ec *fec;
 	struct ubi_fm_volhdr *fvh;
 	struct ubi_fm_eba *feba;
-
 	struct rb_node *node;
 	struct ubi_wl_entry *wl_e;
 	struct ubi_volume *vol;
-
 	struct ubi_vid_hdr *avhdr, *dvhdr;
-
-	int free_peb_count, used_peb_count, vol_count;
+	int ret, i, j, free_peb_count, used_peb_count, vol_count;
 
 	fm_raw = vzalloc(new_fm->size);
 	if (!fm_raw) {
-- 
1.7.10
