Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVEaT-00056b-Ii
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 06:56:06 +0000
Message-ID: <541D24CF.1040705@huawei.com>
Date: Sat, 20 Sep 2014 14:55:11 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Align the dump messages of SB_NODE
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found the dump messages of UBIFS_SB_NODE is not aligned. This
patch remove the extra space from the line which is retracted.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/debug.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 177b015..d0bcf92 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -334,9 +334,9 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		pr_err("\tkey_fmt        %d (%s)\n",
 		       (int)sup->key_fmt, get_key_fmt(sup->key_fmt));
 		pr_err("\tflags          %#x\n", sup_flags);
-		pr_err("\t  big_lpt      %u\n",
+		pr_err("\tbig_lpt        %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
-		pr_err("\t  space_fixup  %u\n",
+		pr_err("\tspace_fixup    %u\n",
 		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
 		pr_err("\tmin_io_size    %u\n", le32_to_cpu(sup->min_io_size));
 		pr_err("\tleb_size       %u\n", le32_to_cpu(sup->leb_size));
-- 
1.6.0.2
