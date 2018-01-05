Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXXBS-0001N3-94
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 18:57:52 +0000
Received: by mail-it0-x241.google.com with SMTP id m11so5345248iti.1
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 10:57:31 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2 08/11] fscrypt: move fscrypt_is_dot_dotdot() to
 fs/crypto/fname.c
Date: Fri,  5 Jan 2018 10:44:59 -0800
Message-Id: <20180105184502.48473-9-ebiggers3@gmail.com>
In-Reply-To: <20180105184502.48473-1-ebiggers3@gmail.com>
References: <20180105184502.48473-1-ebiggers3@gmail.com>
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
2.16.0.rc0.223.g4a4ac83678-goog
