Received: from mga09.intel.com ([134.134.136.24])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5bzh-0001rG-Nj
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:26:38 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 4/7] jffs2reader: get rid of linker error
Date: Mon, 19 Sep 2011 14:25:21 +0300
Message-Id: <2f04ae27d2325fc2b3e6e5608691868367897579.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a linker errors:
	undefined reference to `target_endian'

This patch fixes the issue and turns on the jffs2reader build in the Makefile.

Signed-off-by: Alexey Dokuchaev <danfe@nsu.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Makefile      |    2 +-
 jffs2reader.c |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 5a0044b..f067d86 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@ MTD_BINS = \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
 	serve_image recv_image \
-	sumtool #jffs2reader
+	sumtool jffs2reader
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
diff --git a/jffs2reader.c b/jffs2reader.c
index 9aee92c..52f8d34 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -102,6 +102,8 @@ struct dir {
 	char name[256];
 };
 
+int target_endian = __BYTE_ORDER;
+
 void putblock(char *, size_t, size_t *, struct jffs2_raw_inode *);
 struct dir *putdir(struct dir *, struct jffs2_raw_dirent *);
 void printdir(char *o, size_t size, struct dir *d, char *path,
-- 
1.7.5.4
