Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezSPT-0000j7-HW
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 19:31:49 +0000
Received: by mail-pg0-x241.google.com with SMTP id m15so4960130pgc.1
 for <linux-mtd@lists.infradead.org>; Fri, 23 Mar 2018 12:31:21 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH 10/14] fscrypt: remove unnecessary check for non-logon key type
Date: Fri, 23 Mar 2018 12:23:54 -0700
Message-Id: <20180323192358.95691-11-ebiggers3@gmail.com>
In-Reply-To: <20180323192358.95691-1-ebiggers3@gmail.com>
References: <20180323192358.95691-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

We're passing 'key_type_logon' to request_key(), so the found key is
guaranteed to be of type "logon".  Thus, there is no reason to check
later that the key is really a "logon" key.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyinfo.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index 1435a1c81010..4913a4d5204f 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -89,12 +89,6 @@ static int validate_user_key(struct fscrypt_info *crypt_info,
 		return PTR_ERR(keyring_key);
 	down_read(&keyring_key->sem);
 
-	if (keyring_key->type != &key_type_logon) {
-		printk_once(KERN_WARNING
-				"%s: key type must be logon\n", __func__);
-		res = -ENOKEY;
-		goto out;
-	}
 	ukp = user_key_payload_locked(keyring_key);
 	if (!ukp) {
 		/* key was revoked before we acquired its semaphore */
-- 
2.17.0.rc0.231.g781580f067-goog
