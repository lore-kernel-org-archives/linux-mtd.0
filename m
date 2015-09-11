Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaD32-0004d5-Kn
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 01:22:43 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <yangds.fnst@cn.fujitsu.com>,
 <linux-fsdevel@vger.kernel.org>
Subject: [RFC PATCH v3 5/5] UBIFS: ACL: add ACL config option
Date: Fri, 11 Sep 2015 09:09:57 +0000
Message-ID: <1441962597-13543-6-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add CONFIG_UBIFS_FS_POSIX_ACL to select ACL for UBIFS.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/Kconfig  | 11 +++++++++++
 fs/ubifs/Makefile |  1 +
 2 files changed, 12 insertions(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index ba66d50..3ca8e8d 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -35,3 +35,14 @@ config UBIFS_FS_ZLIB
 	default y
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
+
+config UBIFS_FS_POSIX_ACL
+	bool "UBIFS POSIX Access Control Lists"
+	depends on UBIFS_FS
+	select FS_POSIX_ACL
+	help
+	  Posix Access Control Lists (ACLs) support permissions for users and
+	  groups beyond the owner/group/world scheme.
+
+	  To learn more about Access Control Lists, visit the Posix ACLs for
+	  Linux website <http://acl.bestbits.at/>.
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 2c6f0cb..ab8aea5 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -4,3 +4,4 @@ ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
+ubifs-$(CONFIG_UBIFS_FS_POSIX_ACL) += acl.o
-- 
1.9.1
