Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d2laa-0003i9-Af
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 21:32:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 david@sigma-star.at, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubifs: Correctly handle 0 value hashes in ubifs_lookup()
Date: Mon, 24 Apr 2017 23:31:38 +0200
Message-Id: <1493069498-19505-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use fname_name(&nm) == NULL to detect whether a double hash
lookup should be performed instead of checking for nm.hash
being non-zero. zero is a valid hash value.

Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index b777bddaa1dd..ff77a0aa2f2b 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -249,9 +249,8 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out_fname;
 	}
 
-	if (nm.hash) {
+	if (fname_name(&nm) == NULL) {
 		ubifs_assert(fname_len(&nm) == 0);
-		ubifs_assert(fname_name(&nm) == NULL);
 		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
 		err = ubifs_tnc_lookup_dh(c, &key, dent, nm.minor_hash);
 	} else {
-- 
2.7.3
