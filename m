Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9I-0001Hr-Op
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:16:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 02/11] ubifs: fix typo in ubifs_read
Date: Sat, 31 Oct 2015 12:15:51 +0100
Message-Id: <1446290160-30696-3-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
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
2.5.0
