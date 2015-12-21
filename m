Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwBN-0000ke-CB
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:51:07 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 29/38] ubifs: fix typo in ubifs_read
Date: Mon, 21 Dec 2015 16:41:52 +0800
Message-ID: <1450687321-12381-30-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/lib/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/lib/io.c b/ubifs-utils/lib/io.c
index d05cf86..c2e0d63 100644
--- a/ubifs-utils/lib/io.c
+++ b/ubifs-utils/lib/io.c
@@ -145,7 +145,7 @@ int ubifs_read(loff_t offset, int len, void *buf)
 		return sys_err_msg("lseek failed seeking %"PRIdoff_t, offset);
 
 	if (read(out_fd, buf, len) != len)
-		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
+		return sys_err_msg("read failed reading %d bytes at pos %"PRIdoff_t,
 				   len, offset);
 
 	return 0;
-- 
1.8.4.2
