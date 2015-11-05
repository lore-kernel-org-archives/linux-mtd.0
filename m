Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTWA-0006zp-Q0
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 23:00:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Daniel Walter <dwalter@sigma-star.at>, Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/4] Include new ioctls and struct in ubi-user.h
Date: Fri,  6 Nov 2015 00:00:01 +0100
Message-Id: <1446764403-22742-3-git-send-email-richard@nod.at>
In-Reply-To: <1446764403-22742-1-git-send-email-richard@nod.at>
References: <1446764403-22742-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Daniel Walter <dwalter@sigma-star.at>

Add ioctls and struct definitions for ubi
statistic interface and PEB read/scrub calls

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/mtd/ubi-user.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 2b50dad..f805d89 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -168,6 +168,10 @@
 /* Re-name volumes */
 #define UBI_IOCRNVOL _IOW(UBI_IOC_MAGIC, 3, struct ubi_rnvol_req)
 
+#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, int32_t)
+#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, int32_t)
+#define UBI_IOCSTATS _IOW(UBI_IOC_MAGIC, 6, struct ubi_stats_req)
+
 /* ioctl commands of the UBI control character device */
 
 #define UBI_CTRL_IOC_MAGIC 'o'
@@ -437,4 +441,18 @@ struct ubi_blkcreate_req {
 	int8_t  padding[128];
 }  __attribute__((packed));
 
+struct ubi_stats_entry {
+       int32_t pnum;
+       int32_t ec;
+       int32_t rc;
+       int32_t padding;
+} __attribute__((packed));
+
+struct ubi_stats_req {
+       int32_t req_len;
+       int32_t req_pnum;
+       int32_t padding[2];
+       struct ubi_stats_entry stats[0];
+} __attribute__((packed));
+
 #endif /* __UBI_USER_H__ */
-- 
2.5.0
