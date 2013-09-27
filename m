Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPb0o-0002Kj-OZ
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 16:35:27 +0000
Date: Fri, 27 Sep 2013 11:34:04 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd-utils: Makefile: add LDFLAGS_mkfs.ubifs
Message-ID: <a8879fac-dd29-4ed5-8977-89aec49473f2@zimbra>
In-Reply-To: <0e757815-7fea-4f97-858a-9f110851b86f@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The build rule for mkfs.ubifs was missing an LDFLAGS_* variable like
mkfs.jffs2 had. This prevented mkfs.ubifs from being built against
explicit external libraries which is needed when cross-compiling.

This also adds UUIDCPPFLAGS and UUIDLDFLAGS variables to support the
mkfs.ubifs build.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bf57a13..4ff8a49 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@
 
 VERSION = 1.5.0
 
-CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
+CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
 
 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
@@ -104,6 +104,7 @@ $(call _mkdep,lib/,libmtd.a)
 #
 obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
 	hashtable/hashtable.o hashtable/hashtable_itr.o
+LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
 $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
 
-- 
1.7.9.5
