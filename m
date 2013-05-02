Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXkQF-0000bb-Ce
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 03:43:07 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] UBI: document UBI_IOCVOLUP better in user header
Date: Wed,  1 May 2013 23:42:47 -0400
Message-Id: <1367466167-13087-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current ioctl define implies that this func expects to be passed a
64bit number directly rather than a pointer to a 64bit.  The code that
processes this ioctl shows that it clearly expects a pointer.

It'd be best if we could change the type to "__s64*", but that would
change the generated ioctl number thus breaking the userland ABI.  So
just add a comment for intrepid developers.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/uapi/mtd/ubi-user.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 53cae1e..723c324 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -173,7 +173,10 @@
 
 #define UBI_VOL_IOC_MAGIC 'O'
 
-/* Start UBI volume update */
+/* Start UBI volume update
+ * Note: This actually takes a pointer (__s64*), but we can't change
+ *       that without breaking the ABI on 32bit systems
+ */
 #define UBI_IOCVOLUP _IOW(UBI_VOL_IOC_MAGIC, 0, __s64)
 /* LEB erasure command, used for debugging, disabled by default */
 #define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, __s32)
-- 
1.8.2.1
