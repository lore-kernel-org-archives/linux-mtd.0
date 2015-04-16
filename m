Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yimjn-0001rH-2W
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2015 16:34:00 +0000
From: James Cowgill <james410@cowgill.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: make hashtable_iterator functions static inline
Date: Thu, 16 Apr 2015 17:32:56 +0100
Message-Id: <1429201976-13558-1-git-send-email-james410@cowgill.org.uk>
Cc: James Cowgill <james410@cowgill.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GCC 5 changed the default C standard to gnu11 which changed the behavior of the
inline keyword. This causes mtd-utils to fail to build with duplicate
definition errors involving hashtable_iterator_key and
hashtable_iterator_value.

This patch fixes the build by making the functions static inline and removing
the extra definitions in hashtable_itr.c.

Signed-off-by: James Cowgill <james410@cowgill.org.uk>
---
 mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
 mkfs.ubifs/hashtable/hashtable_itr.h |  4 ++--
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/mkfs.ubifs/hashtable/hashtable_itr.c
index 24f4dde..d102453 100644
--- a/mkfs.ubifs/hashtable/hashtable_itr.c
+++ b/mkfs.ubifs/hashtable/hashtable_itr.c
@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
 }
 
 /*****************************************************************************/
-/* key      - return the key of the (key,value) pair at the current position */
-/* value    - return the value of the (key,value) pair at the current position */
-
-void *
-hashtable_iterator_key(struct hashtable_itr *i)
-{ return i->e->k; }
-
-void *
-hashtable_iterator_value(struct hashtable_itr *i)
-{ return i->e->v; }
-
-/*****************************************************************************/
 /* advance - advance the iterator to the next element
  *           returns zero if advanced to end of table */
 
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/mkfs.ubifs/hashtable/hashtable_itr.h
index 87a97eb..5c94a04 100644
--- a/mkfs.ubifs/hashtable/hashtable_itr.h
+++ b/mkfs.ubifs/hashtable/hashtable_itr.h
@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
 /* hashtable_iterator_key
  * - return the value of the (key,value) pair at the current position */
 
-extern inline void *
+static inline void *
 hashtable_iterator_key(struct hashtable_itr *i)
 {
     return i->e->k;
@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_itr *i)
 /*****************************************************************************/
 /* value - return the value of the (key,value) pair at the current position */
 
-extern inline void *
+static inline void *
 hashtable_iterator_value(struct hashtable_itr *i)
 {
     return i->e->v;
-- 
2.1.4
