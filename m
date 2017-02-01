Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cZ1hg-0004uD-KZ
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2017 20:40:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, david@sigma-star.at,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: fix data node size for truncating uncompressed nodes
Date: Wed,  1 Feb 2017 21:40:00 +0100
Message-Id: <20170201204000.17890-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Currently, the function truncate_data_node only updates the
destination data node size if compression is used. For
uncompressed nodes, the old length is incorrectly retained.

This patch makes sure that the length is correctly set when
compression is disabled.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 294519b98874..f3b620cbdda4 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1298,7 +1298,9 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 			goto out;
 	}
 
-	if (compr_type != UBIFS_COMPR_NONE) {
+	if (compr_type == UBIFS_COMPR_NONE) {
+		out_len = *new_len;
+	} else {
 		err = ubifs_decompress(c, &dn->data, dlen, buf, &out_len, compr_type);
 		if (err)
 			goto out;
-- 
2.10.2
