Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFi-0004uh-O4
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 12/14] ubi: uapi: Add mode selector to attach request
Date: Wed, 13 Jun 2018 23:23:42 +0200
Message-Id: <20180613212344.11608-13-richard@nod.at>
In-Reply-To: <20180613212344.11608-1-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows userspace, ubiattach, to force a full scan.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/uapi/mtd/ubi-user.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 5b04a494d139..cc0e54cfa7f9 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -235,12 +235,19 @@ enum {
 	UBI_VOL_PROP_DIRECT_WRITE = 1,
 };
 
+enum {
+	UBI_ATTACH_MODE_AUTO = 0x0,
+	UBI_ATTACH_MODE_SCAN = 0x1,
+	UBI_ATTACH_MODE_MAX = UBI_ATTACH_MODE_SCAN,
+};
+
 /**
  * struct ubi_attach_req - attach MTD device request.
  * @ubi_num: UBI device number to create
  * @mtd_num: MTD device number to attach
  * @vid_hdr_offset: VID header offset (use defaults if %0)
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
+ * @attach_mode: selects the attach mode
  * @padding: reserved for future, not used, has to be zeroed
  *
  * This data structure is used to specify MTD device UBI has to attach and the
@@ -276,13 +283,18 @@ enum {
  * eraseblocks for new bad eraseblocks, but attempts to use available
  * eraseblocks (if any). The accepted range is 0-768. If 0 is given, the
  * default kernel value of %CONFIG_MTD_UBI_BEB_LIMIT will be used.
+ *
+ * @attach_mode is %UBI_ATTACH_MODE_AUTO by default, and let's the UBI
+ * implementation decide how to attach. If %UBI_ATTACH_MODE_SCAN is selected
+ * a full scan is forced.
  */
 struct ubi_attach_req {
 	__s32 ubi_num;
 	__s32 mtd_num;
 	__s32 vid_hdr_offset;
 	__s16 max_beb_per1024;
-	__s8 padding[10];
+	__s8 attach_mode;
+	__s8 padding[9];
 };
 
 /**
-- 
2.13.6
