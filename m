Received: from mail-pg0-f65.google.com ([74.125.83.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePu59-00005P-RK
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 17:47:38 +0000
Received: by mail-pg0-f65.google.com with SMTP id f12so6256262pgo.5
 for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2017 09:47:10 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 24/24] fscrypt: document symlink length restriction
Date: Fri, 15 Dec 2017 09:42:25 -0800
Message-Id: <20171215174225.31583-25-ebiggers3@gmail.com>
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

Document that encryption reduces the maximum length of a symlink target
slightly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 776ddc655f79..cfbc18f0d9c9 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -448,8 +448,14 @@ astute users may notice some differences in behavior:
 
 - The st_size of an encrypted symlink will not necessarily give the
   length of the symlink target as required by POSIX.  It will actually
-  give the length of the ciphertext, which may be slightly longer than
-  the plaintext due to the NUL-padding.
+  give the length of the ciphertext, which will be slightly longer
+  than the plaintext due to NUL-padding and an extra 2-byte overhead.
+
+- The maximum length of an encrypted symlink is 2 bytes shorter than
+  the maximum length of an unencrypted symlink.  For example, on an
+  EXT4 filesystem with a 4K block size, unencrypted symlinks can be up
+  to 4095 bytes long, while encrypted symlinks can only be up to 4093
+  bytes long (both lengths excluding the terminating null).
 
 Note that mmap *is* supported.  This is possible because the pagecache
 for an encrypted file contains the plaintext, not the ciphertext.
-- 
2.15.1
