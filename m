Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVsw-0001bU-1F
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:56:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 richard@nod.at, stable@vger.kernel.org,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>
Subject: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
Date: Thu, 30 Mar 2017 10:56:21 +0200
Message-Id: <1490864181-2192-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is perfectly fine to link a tmpfile back using linkat().
Since tmpfiles are created with a link count of 0 they appear
on the orphan list, upon re-linking the inode has to be removed
from the orphan list again.

Cc: <stable@vger.kernel.org>
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com
Reported-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Reported-by: Amir Goldstein <amir73il@gmail.com
Fixes: 474b93704f321 ("ubifs: Implement O_TMPFILE")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 0858213a4e63..0139155045fe 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -748,6 +748,11 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 		goto out_fname;
 
 	lock_2_inodes(dir, inode);
+
+	/* Handle O_TMPFILE corner case, it is allowed to link a O_TMPFILE. */
+	if (inode->i_nlink == 0)
+		ubifs_delete_orphan(c, inode->i_ino);
+
 	inc_nlink(inode);
 	ihold(inode);
 	inode->i_ctime = ubifs_current_time(inode);
-- 
2.7.3
