Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43LT-0002ib-Mu
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 07:28:16 +0000
Message-ID: <53BA4BD7.5070201@huawei.com>
Date: Mon, 7 Jul 2014 15:27:19 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/7] Compile support
References: <53BA491E.8060502@huawei.com>
In-Reply-To: <53BA491E.8060502@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compile enable.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index eade234..171976c 100644
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
@@ -114,11 +115,12 @@ $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
 obj-libiniparser.a = libiniparser.o dictionary.o
 obj-libscan.a      = libscan.o
 obj-libubi.a       = libubi.o
+obj-libubifs.a     = libubifs.o
 obj-libubigen.a    = libubigen.o

 obj-mtdinfo   = libubigen.a
 obj-ubinize   = libubigen.a libiniparser.a
 obj-ubiformat = libubigen.a libscan.a

-$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
-$(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-common.o)))
+$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a libubifs,$(eval $(call _mkdep,ubi-utils/,$(v))))
+$(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a libubifs.a ubiutils-common.o)))
-- 
1.8.1.4
