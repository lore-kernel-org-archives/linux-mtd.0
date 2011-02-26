Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PtMne-0006Pc-Gx
	for linux-mtd@lists.infradead.org; Sat, 26 Feb 2011 16:15:19 +0000
Received: by vws7 with SMTP id 7so2300248vws.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Feb 2011 08:15:16 -0800 (PST)
Date: Sat, 26 Feb 2011 11:15:13 -0500
From: Tracey Dent <tdent48227@gmail.com>
To: tdent48227@gmail.com
Subject: [PATCH] fs/jffs2/xattr: Fix coding style
Message-ID: <20110226161513.GA6782@c-68-60-162-129.hsd1.mi.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the trailing white space.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 fs/jffs2/xattr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 4f9cc04..3e93cdd 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -31,7 +31,7 @@
  *   is used to release xattr name/value pair and detach from c->xattrindex.
  * reclaim_xattr_datum(c)
  *   is used to reclaim xattr name/value pairs on the xattr name/value pair cache when
- *   memory usage by cache is over c->xdatum_mem_threshold. Currently, this threshold 
+ *   memory usage by cache is over c->xdatum_mem_threshold. Currently, this threshold
  *   is hard coded as 32KiB.
  * do_verify_xattr_datum(c, xd)
  *   is used to load the xdatum informations without name/value pair from the medium.
-- 
1.7.4.1.53.ga66ce
