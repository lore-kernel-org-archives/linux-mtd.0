Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cnxnO-0007eQ-Sb
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 01:32:13 +0000
From: Hyunchul Lee <cheol.lee@lge.com>
To: Richard Weinberger <richard@nod.at>
CC: <kernel-team@lge.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 <adrian.hunter@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Hyunchul
 Lee <hyc.lee@gmail.com>, Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 1/3] ubifs: remove filename from debug messages in
 ubifs_readdir
Date: Wed, 15 Mar 2017 10:31:03 +0900
Message-ID: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
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

if filename is encrypted, filename could have no printable characters.
so remove it.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/dir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 528369f..b2c8beb 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -606,8 +606,8 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 	}
 
 	while (1) {
-		dbg_gen("feed '%s', ino %llu, new f_pos %#x",
-			dent->name, (unsigned long long)le64_to_cpu(dent->inum),
+		dbg_gen("ino %llu, new f_pos %#x",
+			(unsigned long long)le64_to_cpu(dent->inum),
 			key_hash_flash(c, &dent->key));
 		ubifs_assert(le64_to_cpu(dent->ch.sqnum) >
 			     ubifs_inode(dir)->creat_sqnum);
-- 
1.9.1
