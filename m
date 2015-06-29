Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9UqA-0005zS-MG
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2015 08:54:59 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd-utils: ubi-tests: fix a some overflows
Date: Mon, 29 Jun 2015 16:49:19 +0800
Message-ID: <1435567759-32518-2-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 tests/ubi-tests/mkvol_bad.c   | 2 +-
 tests/ubi-tests/mkvol_basic.c | 2 +-
 tests/ubi-tests/rsvol.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/ubi-tests/mkvol_bad.c b/tests/ubi-tests/mkvol_bad.c
index 27f4795..486fbab 100644
--- a/tests/ubi-tests/mkvol_bad.c
+++ b/tests/ubi-tests/mkvol_bad.c
@@ -106,7 +106,7 @@ static int test_mkvol(void)
 		return -1;
 
 	req.alignment = dev_info.leb_size - dev_info.min_io_size;
-	req.bytes = (dev_info.leb_size - dev_info.leb_size % req.alignment) *
+	req.bytes = (long long)(dev_info.leb_size - dev_info.leb_size % req.alignment) *
 		    dev_info.avail_lebs + 1;
 	ret = ubi_mkvol(libubi, node, &req);
 	if (check_failed(ret, ENOSPC, "ubi_mkvol", "bytes = %lld", req.bytes))
diff --git a/tests/ubi-tests/mkvol_basic.c b/tests/ubi-tests/mkvol_basic.c
index cda7241..2ff6ac1 100644
--- a/tests/ubi-tests/mkvol_basic.c
+++ b/tests/ubi-tests/mkvol_basic.c
@@ -55,7 +55,7 @@ static int mkvol_alignment(void)
 
 		/* Bear in mind alignment reduces EB size */
 		ebsz = dev_info.leb_size - dev_info.leb_size % req.alignment;
-		req.bytes = dev_info.avail_lebs * ebsz;
+		req.bytes = (long long)dev_info.avail_lebs * ebsz;
 
 		req.vol_type = UBI_DYNAMIC_VOLUME;
 		req.name = name;
diff --git a/tests/ubi-tests/rsvol.c b/tests/ubi-tests/rsvol.c
index 60badb0..732bcaa 100644
--- a/tests/ubi-tests/rsvol.c
+++ b/tests/ubi-tests/rsvol.c
@@ -169,7 +169,7 @@ static int test_rsvol1(struct ubi_vol_info *vol_info)
 	}
 
 	if (ubi_rsvol(libubi, node, vol_info->vol_id,
-		      vol_info->leb_size * dev_info.avail_lebs)) {
+		      (long long)vol_info->leb_size * dev_info.avail_lebs)) {
 		failed("ubi_rsvol");
 		return -1;
 	}
-- 
1.8.4.2
