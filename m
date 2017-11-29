Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK9Di-0002vF-HB
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 20:44:41 +0000
Received: by mail-it0-x241.google.com with SMTP id r6so5771336itr.3
 for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2017 12:44:18 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>
Cc: linux-fscrypt@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2 2/5] ubifs: switch to fscrypt_prepare_link()
Date: Wed, 29 Nov 2017 12:43:14 -0800
Message-Id: <20171129204317.91205-3-ebiggers3@gmail.com>
In-Reply-To: <20171129204317.91205-1-ebiggers3@gmail.com>
References: <20171129204317.91205-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 417fe0b29f23..09e6c56b11bc 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -743,9 +743,9 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
 
-	if (ubifs_crypt_is_encrypted(dir) &&
-	    !fscrypt_has_permitted_context(dir, inode))
-		return -EPERM;
+	err = fscrypt_prepare_link(old_dentry, dir, dentry);
+	if (err)
+		return err;
 
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
-- 
2.15.0.531.g2ccb3012c9-goog
