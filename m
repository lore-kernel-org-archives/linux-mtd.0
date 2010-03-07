Received: from web83905.mail.sp1.yahoo.com ([69.147.92.105])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1No57v-0004bI-PI
	for linux-mtd@lists.infradead.org; Sun, 07 Mar 2010 01:17:56 +0000
Message-ID: <829395.51053.qm@web83905.mail.sp1.yahoo.com>
Date: Sat, 6 Mar 2010 17:17:49 -0800 (PST)
From: Brian <elrond_14@yahoo.com>
Subject: JFFS2 FAQ - Spelling Error
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm sorry, apparently it doesn't accept the attachment properly. Here's a quick spelling fix.

>From daa6039bd96dec5ac191b4067cd1e46420a907d7 Mon Sep 17 00:00:00 2001
From: Brian <brian@Brian-Ubuntu-Laptop.(none)>
Date: Sat, 6 Mar 2010 17:12:40 -0800
Subject: [PATCH 2/2] Spelling error of "write-through cache" in jffs2 FAQ

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
