Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH6VZ-0006Of-Bg
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 10:09:59 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 richard@nod.at, david@sigma-star.at, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org
Subject: [PATCH] ubifs: Initialize fstr_real_len
Date: Wed, 14 Dec 2016 11:09:25 +0100
Message-Id: <20161214100925.10797-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While fstr_real_len is only being used under if (encrypted),
gcc-6 still warns.

Fixes this false positive:
fs/ubifs/dir.c: In function 'ubifs_readdir':
fs/ubifs/dir.c:629:13: warning: 'fstr_real_len' may be used
uninitialized in this function [-Wmaybe-uninitialized]
    fstr.len = fstr_real_len

Initialize fstr_real_len to make gcc happy.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 7f01f3d2ac3b..1c5331ac9614 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -528,7 +528,7 @@ static unsigned int vfs_dent_type(uint8_t type)
  */
 static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 {
-	int fstr_real_len, err = 0;
+	int fstr_real_len = 0, err = 0;
 	struct fscrypt_name nm;
 	struct fscrypt_str fstr = {0};
 	union ubifs_key key;
-- 
2.10.2
