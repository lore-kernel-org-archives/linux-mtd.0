Received: from www84.your-server.de ([213.133.104.84])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf7TQ-0004sn-Rq
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 09:03:37 +0000
From: stefani@seibold.net
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Artem.Bityutskiy@nokia.com
Subject: [PATCH 1/2] Rename mkfs.ubifs into ubifs-utils
Date: Tue, 18 Jan 2011 10:04:24 +0100
Message-Id: <1295341465-2468-2-git-send-email-stefani@seibold.net>
In-Reply-To: <1295341465-2468-1-git-send-email-stefani@seibold.net>
References: <1295341465-2468-1-git-send-email-stefani@seibold.net>
Cc: Stefani Seibold <stefani@seibold.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stefani Seibold <stefani@seibold.net>

This patch is necessary for the adding new ubi-filesystem commands, like
the new tuneubifs utility.

Signed-off-by: Stefani Seibold <stefani@seibold.net>
---
 Makefile                                           |    2 +-
 {mkfs.ubifs => ubifs-utils}/.gitignore             |    0
 {mkfs.ubifs => ubifs-utils}/COPYING                |    0
 {mkfs.ubifs => ubifs-utils}/Makefile               |    0
 {mkfs.ubifs => ubifs-utils}/README                 |    0
 {mkfs.ubifs => ubifs-utils}/compr.c                |    0
 {mkfs.ubifs => ubifs-utils}/compr.h                |    0
 {mkfs.ubifs => ubifs-utils}/crc16.c                |    0
 {mkfs.ubifs => ubifs-utils}/crc16.h                |    0
 {mkfs.ubifs => ubifs-utils}/defs.h                 |    0
 {mkfs.ubifs => ubifs-utils}/devtable.c             |    0
 {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.c  |    0
 {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.h  |    0
 .../hashtable/hashtable_itr.c                      |    0
 .../hashtable/hashtable_itr.h                      |    0
 .../hashtable/hashtable_private.h                  |    0
 {mkfs.ubifs => ubifs-utils}/key.h                  |    0
 {mkfs.ubifs => ubifs-utils}/lpt.c                  |    0
 {mkfs.ubifs => ubifs-utils}/lpt.h                  |    0
 {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.c           |    0
 {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.h           |    0
 {mkfs.ubifs => ubifs-utils}/ubifs-media.h          |    0
 {mkfs.ubifs => ubifs-utils}/ubifs.h                |    0
 23 files changed, 1 insertions(+), 1 deletions(-)
 rename {mkfs.ubifs => ubifs-utils}/.gitignore (100%)
 rename {mkfs.ubifs => ubifs-utils}/COPYING (100%)
 rename {mkfs.ubifs => ubifs-utils}/Makefile (100%)
 rename {mkfs.ubifs => ubifs-utils}/README (100%)
 rename {mkfs.ubifs => ubifs-utils}/compr.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/compr.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/crc16.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/crc16.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/defs.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/devtable.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable_itr.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable_itr.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable_private.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/key.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/lpt.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/lpt.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/ubifs-media.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/ubifs.h (100%)

diff --git a/Makefile b/Makefile
index 7ab9743..0ec43a4 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
 endif
 
-SUBDIRS = lib ubi-utils mkfs.ubifs
+SUBDIRS = lib ubi-utils ubifs-utils
 
 TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
diff --git a/mkfs.ubifs/.gitignore b/ubifs-utils/.gitignore
similarity index 100%
rename from mkfs.ubifs/.gitignore
rename to ubifs-utils/.gitignore
diff --git a/mkfs.ubifs/COPYING b/ubifs-utils/COPYING
similarity index 100%
rename from mkfs.ubifs/COPYING
rename to ubifs-utils/COPYING
diff --git a/mkfs.ubifs/Makefile b/ubifs-utils/Makefile
similarity index 100%
rename from mkfs.ubifs/Makefile
rename to ubifs-utils/Makefile
diff --git a/mkfs.ubifs/README b/ubifs-utils/README
similarity index 100%
rename from mkfs.ubifs/README
rename to ubifs-utils/README
diff --git a/mkfs.ubifs/compr.c b/ubifs-utils/compr.c
similarity index 100%
rename from mkfs.ubifs/compr.c
rename to ubifs-utils/compr.c
diff --git a/mkfs.ubifs/compr.h b/ubifs-utils/compr.h
similarity index 100%
rename from mkfs.ubifs/compr.h
rename to ubifs-utils/compr.h
diff --git a/mkfs.ubifs/crc16.c b/ubifs-utils/crc16.c
similarity index 100%
rename from mkfs.ubifs/crc16.c
rename to ubifs-utils/crc16.c
diff --git a/mkfs.ubifs/crc16.h b/ubifs-utils/crc16.h
similarity index 100%
rename from mkfs.ubifs/crc16.h
rename to ubifs-utils/crc16.h
diff --git a/mkfs.ubifs/defs.h b/ubifs-utils/defs.h
similarity index 100%
rename from mkfs.ubifs/defs.h
rename to ubifs-utils/defs.h
diff --git a/mkfs.ubifs/devtable.c b/ubifs-utils/devtable.c
similarity index 100%
rename from mkfs.ubifs/devtable.c
rename to ubifs-utils/devtable.c
diff --git a/mkfs.ubifs/hashtable/hashtable.c b/ubifs-utils/hashtable/hashtable.c
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable.c
rename to ubifs-utils/hashtable/hashtable.c
diff --git a/mkfs.ubifs/hashtable/hashtable.h b/ubifs-utils/hashtable/hashtable.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable.h
rename to ubifs-utils/hashtable/hashtable.h
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/ubifs-utils/hashtable/hashtable_itr.c
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_itr.c
rename to ubifs-utils/hashtable/hashtable_itr.c
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/ubifs-utils/hashtable/hashtable_itr.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_itr.h
rename to ubifs-utils/hashtable/hashtable_itr.h
diff --git a/mkfs.ubifs/hashtable/hashtable_private.h b/ubifs-utils/hashtable/hashtable_private.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_private.h
rename to ubifs-utils/hashtable/hashtable_private.h
diff --git a/mkfs.ubifs/key.h b/ubifs-utils/key.h
similarity index 100%
rename from mkfs.ubifs/key.h
rename to ubifs-utils/key.h
diff --git a/mkfs.ubifs/lpt.c b/ubifs-utils/lpt.c
similarity index 100%
rename from mkfs.ubifs/lpt.c
rename to ubifs-utils/lpt.c
diff --git a/mkfs.ubifs/lpt.h b/ubifs-utils/lpt.h
similarity index 100%
rename from mkfs.ubifs/lpt.h
rename to ubifs-utils/lpt.h
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs.c
similarity index 100%
rename from mkfs.ubifs/mkfs.ubifs.c
rename to ubifs-utils/mkfs.ubifs.c
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs.h
similarity index 100%
rename from mkfs.ubifs/mkfs.ubifs.h
rename to ubifs-utils/mkfs.ubifs.h
diff --git a/mkfs.ubifs/ubifs-media.h b/ubifs-utils/ubifs-media.h
similarity index 100%
rename from mkfs.ubifs/ubifs-media.h
rename to ubifs-utils/ubifs-media.h
diff --git a/mkfs.ubifs/ubifs.h b/ubifs-utils/ubifs.h
similarity index 100%
rename from mkfs.ubifs/ubifs.h
rename to ubifs-utils/ubifs.h
-- 
1.7.4.rc2
