Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePu4k-0008Q9-Uq
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 17:47:18 +0000
Received: by mail-pg0-x243.google.com with SMTP id j9so6245804pgc.11
 for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2017 09:46:50 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 08/24] fscrypt: move fscrypt_is_dot_dotdot() to
 fs/crypto/fname.c
Date: Fri, 15 Dec 2017 09:42:09 -0800
Message-Id: <20171215174225.31583-9-ebiggers3@gmail.com>
In-Reply-To: <20171215174225.31583-1-ebiggers3@gmail.com>
References: <20171215174225.31583-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

Only fs/crypto/fname.c cares about treating the "." and ".." filenames
specially with regards to encryption, so move fscrypt_is_dot_dotdot()
from fscrypt.h to there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c       | 11 +++++++++++
 include/linux/fscrypt.h | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 305541bcd108..b8c5061553b1 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -15,6 +15,17 @@
 #include <linux/ratelimit.h>
 #include "fscrypt_private.h"
 
+static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
+{
+	if (str->len == 1 && str->name[0] == '.')
+		return true;
+
+	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
+		return true;
+
+	return false;
+}
+
 /**
  * fname_encrypt() - encrypt a filename
  *
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 2e4dce0365cf..3045fc49d3ca 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -57,17 +57,6 @@ struct fscrypt_name {
 /* Maximum value for the third parameter of fscrypt_operations.set_context(). */
 #define FSCRYPT_SET_CONTEXT_MAX_SIZE	28
 
-static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
-{
-	if (str->len == 1 && str->name[0] == '.')
-		return true;
-
-	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
-		return true;
-
-	return false;
-}
-
 #if __FS_HAS_ENCRYPTION
 #include <linux/fscrypt_supp.h>
 #else
-- 
2.15.1
