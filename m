Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bReJw-0000xa-3P
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 11:45:16 +0000
Date: Mon, 25 Jul 2016 13:44:50 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: richard@nod.at, linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] ubifs: update comment for ubifs_errc
Message-ID: <20160725114446.GA8083@makrotopia.org>
References: <578E1D02.3000109@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578E1D02.3000109@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 fs/ubifs/ubifs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ddf9f6b9..4617d45 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1783,8 +1783,8 @@ void ubifs_err(const struct ubifs_info *c, const char *fmt, ...);
 __printf(2, 3)
 void ubifs_warn(const struct ubifs_info *c, const char *fmt, ...);
 /*
- * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
- * object as an argument.
+ * A conditional variant of 'ubifs_err()' which doesn't output anything
+ * if probing (ie. MS_SILENT set).
  */
 #define ubifs_errc(c, fmt, ...)						\
 do {									\
-- 
2.9.0
