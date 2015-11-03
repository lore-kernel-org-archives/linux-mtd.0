Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztbyl-0000nN-Tc
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 13:50:29 +0000
Date: Tue, 3 Nov 2015 14:50:02 +0100
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at
Subject: [PATCH] Fix scanf() formatstring for modern C version
Message-ID: <20151103135002.GA21871@dw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mkfs.jffs2 is using an old assignment-allocation
modifier for scanf(). Add a check so this modifier
does not get confused with a float formatstring
on newer C standard (C99 onwards).

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 mkfs.jffs2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index f09c0b2..b83c1ee 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -376,7 +376,11 @@ static struct filesystem_entry *recursive_add_host_directory(
  */
 
 #ifdef __GNUC__
+#if __STDC_VERSION__ >= 199901L
+#define SCANF_PREFIX "m"
+#else
 #define SCANF_PREFIX "a"
+#endif
 #define SCANF_STRING(s) (&s)
 #define GETCWD_SIZE 0
 #else
-- 
2.6.2
