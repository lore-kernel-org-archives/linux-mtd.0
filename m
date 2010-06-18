Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPYVH-0000cF-L0
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 10:08:53 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5IA8UAX025468
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 13:08:49 +0300
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: add new ioctl structures to be used for
	repartitioning
Date: Fri, 18 Jun 2010 13:08:28 +0300
Message-Id: <1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 include/mtd/mtd-abi.h |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..c2c6b41 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -88,6 +88,20 @@ struct otp_info {
 	__u32 locked;
 };
 
+#define MTD_MAX_PARTITION_NAME_LEN	64
+struct mtd_partition_user {
+	__u64 size;
+	__u64 offset;
+	__u32 mask_flags;
+	char name[MTD_MAX_PARTITION_NAME_LEN];
+	__u8 padding[128];	/* reserved for future, must be zero! */
+};
+
+struct mtd_partitions {
+	__u32 nparts;
+	struct mtd_partition_user __user *parts;
+};
+
 #define MEMGETINFO		_IOR('M', 1, struct mtd_info_user)
 #define MEMERASE		_IOW('M', 2, struct erase_info_user)
 #define MEMWRITEOOB		_IOWR('M', 3, struct mtd_oob_buf)
@@ -110,6 +124,7 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MTDREPARTITION		_IOW('M', 23, struct mtd_partitions)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.6.2.4
