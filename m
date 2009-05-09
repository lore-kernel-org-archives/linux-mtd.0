Received: from smtp23.services.sfr.fr ([93.17.128.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2jCJ-0006ik-5q
	for linux-mtd@lists.infradead.org; Sat, 09 May 2009 09:50:47 +0000
Received: from smtp23.services.sfr.fr (msfrf2324 [10.18.27.38])
	by msfrf2320.sfr.fr (SMTP Server) with ESMTP id 9FB26700005F
	for <linux-mtd@lists.infradead.org>;
	Sat,  9 May 2009 11:43:06 +0200 (CEST)
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] libubi: add ubi_is_mapped() function
Date: Sat,  9 May 2009 11:41:06 +0200
Message-Id: <1241862068-10596-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 ubi-utils/include/libubi.h |   17 +++++++++++++++++
 ubi-utils/src/libubi.c     |    5 +++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 4ffe1e8..f52904d 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -414,6 +414,23 @@ int ubi_set_property(int fd, uint8_t property, uint64_t value);
  */
 int ubi_leb_unmap(int fd, int lnum);
 
+/**
+ * ubi_is_mapped - check if logical eraseblock is mapped.
+ * @fd: volume character device file descriptor
+ * @lnum: logical eraseblock number
+ *
+ * This function checks if logical eraseblock @lnum is mapped to a physical
+ * eraseblock. If a logical eraseblock is un-mapped, this does not necessarily
+ * mean it will still be un-mapped after the UBI device is re-attached. The
+ * logical eraseblock may become mapped to the physical eraseblock it was last
+ * mapped to.
+ *
+ * This function returns %1 if the LEB is mapped, %0 if not, and %-1 in case of
+ * failure. If the volume is damaged because of an interrupted update errno
+ * set with %EBADF error code.
+ */
+int ubi_is_mapped(int fd, int lnum);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
index 5c8ce9e..a81173d 100644
--- a/ubi-utils/src/libubi.c
+++ b/ubi-utils/src/libubi.c
@@ -1255,3 +1255,8 @@ int ubi_leb_unmap(int fd, int lnum)
 {
 	return ioctl(fd, UBI_IOCEBUNMAP, &lnum);
 }
+
+int ubi_is_mapped(int fd, int lnum)
+{
+	return ioctl(fd, UBI_IOCEBISMAP, &lnum);
+}
-- 
1.6.3
