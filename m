Received: from arcturus.kleine-koenig.org ([2a01:4f8:d12:1f44::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dktyN-0003YP-5f
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 15:23:14 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] Add ctags files to .gitignore
Date: Thu, 24 Aug 2017 17:22:38 +0200
Message-Id: <20170824152238.30448-1-ukleinek@debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 .gitignore | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index a5547d5d4578..38bd04deb34e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -141,6 +141,8 @@ tests/ubi-tests/ubi-stress-test.sh
 patches-*
 *.patch
 
-# cscope files
+# cscope and ctag files
 cscope.*
 ncscope.*
+/TAGS
+/tags
-- 
2.14.1
