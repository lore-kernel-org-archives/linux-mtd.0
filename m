Message-Id: <200903042001.n24K1f2p028801@imap1.linux-foundation.org>
Subject: [patch 15/15] jffs2_acl_count() tests < 0 on unsigned
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:41 -0800
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

size_t s is unsigned and cannot be less than 0.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/acl.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN fs/jffs2/acl.c~jffs2_acl_count-tests-0-on-unsigned fs/jffs2/acl.c
--- a/fs/jffs2/acl.c~jffs2_acl_count-tests-0-on-unsigned
+++ a/fs/jffs2/acl.c
@@ -38,12 +38,12 @@ static int jffs2_acl_count(size_t size)
 	size_t s;
 
 	size -= sizeof(struct jffs2_acl_header);
-	s = size - 4 * sizeof(struct jffs2_acl_entry_short);
-	if (s < 0) {
+	if (size < 4 * sizeof(struct jffs2_acl_entry_short)) {
 		if (size % sizeof(struct jffs2_acl_entry_short))
 			return -1;
 		return size / sizeof(struct jffs2_acl_entry_short);
 	} else {
+		s = size - 4 * sizeof(struct jffs2_acl_entry_short);
 		if (s % sizeof(struct jffs2_acl_entry))
 			return -1;
 		return s / sizeof(struct jffs2_acl_entry) + 4;
_
