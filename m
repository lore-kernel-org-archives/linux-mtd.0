Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmlSs-00082T-Sz
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 14:56:27 +0000
Received: by mail-qc0-f182.google.com with SMTP id e16so896262qcx.41
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 07:56:05 -0700 (PDT)
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: Fix incompatibility with kernel UBI block ioctls
Date: Tue, 20 May 2014 16:57:00 +0200
Message-Id: <1400597820-6589-1-git-send-email-helmut.schaa@googlemail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel UBI block ioctl definition is out of sync with the one
in mtd-utils resulting in ubiblock being unusable on current kernels.

Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
---
Not sure if it is required to keep this backward compatible somehow?
Seems the definition of the ioctl is a leftover from a previous
version of the UBI block implementation.

 include/mtd/ubi-user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 2b50dad..8e7ef5d 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -197,7 +197,7 @@
 #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
 			       struct ubi_set_vol_prop_req)
 /* Create a R/O block device on top of an UBI volume */
-#define UBI_IOCVOLCRBLK _IOW(UBI_VOL_IOC_MAGIC, 7, struct ubi_blkcreate_req)
+#define UBI_IOCVOLCRBLK _IO(UBI_VOL_IOC_MAGIC, 7)
 /* Remove the R/O block device */
 #define UBI_IOCVOLRMBLK _IO(UBI_VOL_IOC_MAGIC, 8)
 
-- 
1.8.4.5
