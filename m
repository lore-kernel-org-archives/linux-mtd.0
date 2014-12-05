Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwpHE-0006H8-Ta
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 09:34:17 +0000
Message-ID: <54817BE2.4050601@huawei.com>
Date: Fri, 5 Dec 2014 17:33:22 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v6 3/3] ubi-utils: ubidump compile enable
References: <54817A4B.4080605@huawei.com>
In-Reply-To: <54817A4B.4080605@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enable the compile of ubidump.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 Makefile |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index eade234..9dc9645 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,8 @@ MTD_BINS = \
 	sumtool jffs2reader
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock \
+	ubidump

 BINS = $(MTD_BINS)
 BINS += mkfs.ubifs/mkfs.ubifs
@@ -115,10 +116,12 @@ obj-libiniparser.a = libiniparser.o dictionary.o
 obj-libscan.a      = libscan.o
 obj-libubi.a       = libubi.o
 obj-libubigen.a    = libubigen.o
+obj-libdump.a      = libdump.o

 obj-mtdinfo   = libubigen.a
 obj-ubinize   = libubigen.a libiniparser.a
 obj-ubiformat = libubigen.a libscan.a
+obj-ubidump   = libdump.a

-$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
+$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a libdump.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
 $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-common.o)))
-- 
1.6.0.2
