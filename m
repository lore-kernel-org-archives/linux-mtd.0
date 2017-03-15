Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cnxpE-0008Ho-GC
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 01:34:06 +0000
From: Hyunchul Lee <cheol.lee@lge.com>
To: Richard Weinberger <richard@nod.at>
CC: <kernel-team@lge.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 <adrian.hunter@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Hyunchul
 Lee <hyc.lee@gmail.com>, Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 3/3] ubifs: fix debug messages for an invalid filename in
 ubifs_dump_inode
Date: Wed, 15 Mar 2017 10:31:05 +0900
Message-ID: <1489541465-25663-3-git-send-email-cheol.lee@lge.com>
In-Reply-To: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
References: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
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

instead of filenames, print inode numbers, file types, and length.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index b14c06f..718b749 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -287,8 +287,10 @@ void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 			break;
 		}
 
-		pr_err("\t%d: %s (%s)\n",
-		       count++, dent->name, get_dent_type(dent->type));
+		pr_err("\t%d: inode %llu, type %s, len %d\n",
+		       count++, (unsigned long long) le64_to_cpu(dent->inum),
+		       get_dent_type(dent->type),
+		       le16_to_cpu(dent->nlen));
 
 		fname_name(&nm) = dent->name;
 		fname_len(&nm) = le16_to_cpu(dent->nlen);
-- 
1.9.1
