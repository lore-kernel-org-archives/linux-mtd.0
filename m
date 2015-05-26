Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBni-0006wz-Bi
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:09:38 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH v2 3/6] UBI: Fastmap: Rename variables to make them
 meaningful
Date: Tue, 26 May 2015 10:07:07 +0000
Message-ID: <1432634830-129590-4-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
References: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s/fmpl1/fmpl
s/fmpl2/fmpl_wl

Add "WL" to the error message when wrong WL pool magic number is detected.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 58 +++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 696a4f9..e3d8294 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -601,7 +601,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmhdr;
-	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
+	struct ubi_fm_scan_pool *fmpl, *fmpl_wl;
 	struct ubi_fm_ec *fmec;
 	struct ubi_fm_volhdr *fmvhdr;
 	struct ubi_fm_eba *fm_eba;
@@ -631,30 +631,30 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		goto fail_bad;
 	}
 
-	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
-	fm_pos += sizeof(*fmpl1);
+	fmpl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl);
 	if (fm_pos >= fm_size)
 		goto fail_bad;
-	if (be32_to_cpu(fmpl1->magic) != UBI_FM_POOL_MAGIC) {
+	if (be32_to_cpu(fmpl->magic) != UBI_FM_POOL_MAGIC) {
 		ubi_err(ubi, "bad fastmap pool magic: 0x%x, expected: 0x%x",
-			be32_to_cpu(fmpl1->magic), UBI_FM_POOL_MAGIC);
+			be32_to_cpu(fmpl->magic), UBI_FM_POOL_MAGIC);
 		goto fail_bad;
 	}
 
-	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
-	fm_pos += sizeof(*fmpl2);
+	fmpl_wl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl_wl);
 	if (fm_pos >= fm_size)
 		goto fail_bad;
-	if (be32_to_cpu(fmpl2->magic) != UBI_FM_POOL_MAGIC) {
-		ubi_err(ubi, "bad fastmap pool magic: 0x%x, expected: 0x%x",
-			be32_to_cpu(fmpl2->magic), UBI_FM_POOL_MAGIC);
+	if (be32_to_cpu(fmpl_wl->magic) != UBI_FM_POOL_MAGIC) {
+		ubi_err(ubi, "bad fastmap WL pool magic: 0x%x, expected: 0x%x",
+			be32_to_cpu(fmpl_wl->magic), UBI_FM_POOL_MAGIC);
 		goto fail_bad;
 	}
 
-	pool_size = be16_to_cpu(fmpl1->size);
-	wl_pool_size = be16_to_cpu(fmpl2->size);
-	fm->max_pool_size = be16_to_cpu(fmpl1->max_size);
-	fm->max_wl_pool_size = be16_to_cpu(fmpl2->max_size);
+	pool_size = be16_to_cpu(fmpl->size);
+	wl_pool_size = be16_to_cpu(fmpl_wl->size);
+	fm->max_pool_size = be16_to_cpu(fmpl->max_size);
+	fm->max_wl_pool_size = be16_to_cpu(fmpl_wl->max_size);
 
 	if (pool_size > UBI_FM_MAX_POOL_SIZE || pool_size < 0) {
 		ubi_err(ubi, "bad pool size: %i", pool_size);
@@ -796,11 +796,11 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		}
 	}
 
-	ret = scan_pool(ubi, ai, fmpl1->pebs, pool_size, &max_sqnum, &free);
+	ret = scan_pool(ubi, ai, fmpl->pebs, pool_size, &max_sqnum, &free);
 	if (ret)
 		goto fail;
 
-	ret = scan_pool(ubi, ai, fmpl2->pebs, wl_pool_size, &max_sqnum, &free);
+	ret = scan_pool(ubi, ai, fmpl_wl->pebs, wl_pool_size, &max_sqnum, &free);
 	if (ret)
 		goto fail;
 
@@ -1083,7 +1083,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	void *fm_raw;
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmh;
-	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
+	struct ubi_fm_scan_pool *fmpl, *fmpl_wl;
 	struct ubi_fm_ec *fec;
 	struct ubi_fm_volhdr *fvh;
 	struct ubi_fm_eba *feba;
@@ -1141,25 +1141,25 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	erase_peb_count = 0;
 	vol_count = 0;
 
-	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
-	fm_pos += sizeof(*fmpl1);
-	fmpl1->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
-	fmpl1->size = cpu_to_be16(ubi->fm_pool.size);
-	fmpl1->max_size = cpu_to_be16(ubi->fm_pool.max_size);
+	fmpl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl);
+	fmpl->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
+	fmpl->size = cpu_to_be16(ubi->fm_pool.size);
+	fmpl->max_size = cpu_to_be16(ubi->fm_pool.max_size);
 
 	for (i = 0; i < ubi->fm_pool.size; i++) {
-		fmpl1->pebs[i] = cpu_to_be32(ubi->fm_pool.pebs[i]);
+		fmpl->pebs[i] = cpu_to_be32(ubi->fm_pool.pebs[i]);
 		set_seen(ubi, ubi->fm_pool.pebs[i], seen_pebs);
 	}
 
-	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
-	fm_pos += sizeof(*fmpl2);
-	fmpl2->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
-	fmpl2->size = cpu_to_be16(ubi->fm_wl_pool.size);
-	fmpl2->max_size = cpu_to_be16(ubi->fm_wl_pool.max_size);
+	fmpl_wl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl_wl);
+	fmpl_wl->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
+	fmpl_wl->size = cpu_to_be16(ubi->fm_wl_pool.size);
+	fmpl_wl->max_size = cpu_to_be16(ubi->fm_wl_pool.max_size);
 
 	for (i = 0; i < ubi->fm_wl_pool.size; i++) {
-		fmpl2->pebs[i] = cpu_to_be32(ubi->fm_wl_pool.pebs[i]);
+		fmpl_wl->pebs[i] = cpu_to_be32(ubi->fm_wl_pool.pebs[i]);
 		set_seen(ubi, ubi->fm_wl_pool.pebs[i], seen_pebs);
 	}
 
-- 
1.8.3.4
