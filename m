From: brian@Brian-Ubuntu-Laptop. (Brian (none))
Date: Sat, 6 Mar 2010 17:12:40 -0800
Subject: [PATCH 2/2] Spelling error of "write-through cache" in jffs2 FAQ
Message-ID: <mailman.226.1267924677.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

---
 faq/jffs2.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/faq/jffs2.xml b/faq/jffs2.xml
index 0e58398..f94efa1 100644
--- a/faq/jffs2.xml
+++ b/faq/jffs2.xml
@@ -134,7 +134,7 @@ Owing to peculiarities of flash devices, JFFS2 is very different to
 conventional HDD-oriented file system. And one of its drawbacks is that mount
 time as well as memory consumption grow linearly with growing flash size. So
 beware you may end up with tremendous amount memory eaten and huge mount time if
-your block device is very large. Also, JFFS2 implements only write-trough
+your block device is very large. Also, JFFS2 implements only write-through
 caching (while convectional FS-es have write-back) and does many thing which are
 not really needed in case of hard drives.
 </P>
-- 
1.6.3.3
