Received: from mail-qy0-f204.google.com ([209.85.221.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8czT-0008GK-Fq
	for linux-mtd@lists.infradead.org; Thu, 12 Nov 2009 16:57:52 +0000
Received: by qyk42 with SMTP id 42so1081366qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Nov 2009 08:57:45 -0800 (PST)
Message-ID: <4AFC415C.6040305@gmail.com>
Date: Thu, 12 Nov 2009 18:09:48 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] jffs2: Fix error return in jffs2_do_read_inode_internal()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The returned error should stay negative

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 fs/jffs2/readinode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1a80301..9c26738 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1284,7 +1284,7 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 				f->target = NULL;
 				mutex_unlock(&f->sem);
 				jffs2_do_clear_inode(c, f);
-				return -ret;
+				return ret;
 			}
 
 			f->target[je32_to_cpu(latest_node->csize)] = '\0';
