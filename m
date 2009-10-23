Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1MeV-0000lh-UA
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 16:06:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by comm-neu.esd (Postfix) with ESMTP id 690711362DB
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Oct 2009 18:05:15 +0200 (CEST)
Received: from comm-neu.esd ([127.0.0.1])
	by localhost (comm [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 27948-03 for <linux-mtd@lists.infradead.org>;
	Fri, 23 Oct 2009 18:05:05 +0200 (CEST)
Received: from debby.esd (debby.esd [10.0.0.190])
	by comm-neu.esd (Postfix) with ESMTP id 66D3F1362CC
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Oct 2009 18:05:05 +0200 (CEST)
From: Matthias Fuchs <matthias.fuchs@esd.eu>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix crosscompilation for mkfs.ubifs
Date: Fri, 23 Oct 2009 18:05:04 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200910231805.04917.matthias.fuchs@esd.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for passing the location of the lzo
library and headers.

Also BUILDDIR must be referenced to find the libubi.a archive.

Signed-off-by: Matthias Fuchs <matthias.fuchs@esd.eu>
---
 mkfs.ubifs/Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index a678b0a..61d0e20 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -1,11 +1,13 @@
 
 CPPFLAGS += -I../include -I../ubi-utils/include
+CPPFLAGS += $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 
 ALL_SOURCES=*.[ch] hashtable/*.[ch]
 
 TARGETS = mkfs.ubifs
 
-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L../ubi-utils/ -lubi
+LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L$(BUILDDIR)/../ubi-utils/ -lubi
+LDLIBS_mkfs.ubifs += $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 
 include ../common.mk
 
-- 
1.6.1
