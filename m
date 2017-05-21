Received: from mailrelay108.isp.belgacom.be ([195.238.20.135])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCSzZ-0005Dt-7R
 for linux-mtd@lists.infradead.org; Sun, 21 May 2017 15:42:03 +0000
From: Fabian Frederick <fabf@skynet.be>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, fabf@skynet.be
Subject: [PATCH 05/11 linux-next] ubifs: use magic.h
Date: Sun, 21 May 2017 17:41:33 +0200
Message-Id: <20170521154133.27428-1-fabf@skynet.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Filesystems generally use SUPER_MAGIC values from magic.h
instead of a local definition.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/ubifs.h           | 4 +---
 include/uapi/linux/magic.h | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 298b4d8..abc60d5 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -38,6 +38,7 @@
 #include <linux/backing-dev.h>
 #include <linux/security.h>
 #include <linux/xattr.h>
+#include <linux/magic.h>
 #ifdef CONFIG_UBIFS_FS_ENCRYPTION
 #include <linux/fscrypt_supp.h>
 #else
@@ -49,9 +50,6 @@
 /* Version of this UBIFS implementation */
 #define UBIFS_VERSION 1
 
-/* UBIFS file system VFS magic number */
-#define UBIFS_SUPER_MAGIC 0x24051905
-
 /* Number of UBIFS blocks per VFS page */
 #define UBIFS_BLOCKS_PER_PAGE (PAGE_SIZE / UBIFS_BLOCK_SIZE)
 #define UBIFS_BLOCKS_PER_PAGE_SHIFT (PAGE_SHIFT - UBIFS_BLOCK_SHIFT)
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index a83c48f..b651a02 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -70,6 +70,7 @@
 #define SYSFS_MAGIC		0x62656572
 #define TMPFS_MAGIC		0x01021994
 #define TRACEFS_MAGIC		0x74726163
+#define UBIFS_SUPER_MAGIC	0x24051905
 #define UDF_SUPER_MAGIC		0x15013346	/* Since UDF 2.01 is ISO 13346 based... */
 #define USBDEVICE_SUPER_MAGIC	0x9fa2
 #define V9FS_MAGIC		0x01021997
-- 
2.9.3
