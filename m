Received: from smtprelay02.ispgateway.de ([80.67.31.36])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoWgm-0008Ke-Nz
 for linux-mtd@lists.infradead.org; Sat, 02 May 2015 12:38:39 +0000
From: Bernhard Walle <bernhard@bwalle.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: Fix build with gcc 5.1
Date: Sat,  2 May 2015 14:38:06 +0200
Message-Id: <1430570286-30434-1-git-send-email-bernhard@bwalle.de>
Cc: Bernhard Walle <bernhard@bwalle.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In gcc 5.1, the default C standard which is used to compile a C file,
has changed from gnu89 to gnu11. This changed the meaning of 'extern
inline'. See https://gcc.gnu.org/gcc-5/porting_to.html.

In mkfs.ubifs, this leads to multiple definitions of
hashtable_iterator_key and -hashtable_iterator_value. I think the most
pragmatic way to fix the issue is to replace 'extern inline' with
'static inline' here.

Signed-off-by: Bernhard Walle <bernhard@bwalle.de>
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
2.3.7
