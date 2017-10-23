Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6kUz-0004Wx-SA
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 21:43:06 +0000
Received: by mail-io0-x241.google.com with SMTP id m81so21686657ioi.13
 for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2017 14:42:43 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org, keyrings@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 Ryo Hashimoto <hashimoto@chromium.org>,
 Sarthak Kukreti <sarthakkukreti@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michael Halcrow <mhalcrow@google.com>, Eric Biggers <ebiggers@google.com>
Subject: [RFC PATCH 24/25] ubifs crypto: wire up
 FS_IOC_GET_ENCRYPTION_POLICY_EX
Date: Mon, 23 Oct 2017 14:40:57 -0700
Message-Id: <20171023214058.128121-25-ebiggers3@gmail.com>
In-Reply-To: <20171023214058.128121-1-ebiggers3@gmail.com>
References: <20171023214058.128121-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

FS_IOC_GET_ENCRYPTION_POLICY_EX allows filesystem encryption users to
retrieve the encryption policy for files and directories that use a v2
encryption policy.  Unlike the original FS_IOC_GET_ENCRYPTION_POLICY,
FS_IOC_GET_ENCRYPTION_POLICY_EX is also extensible to new versions of
the policy struct that may be added in the future.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/ioctl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 09ede2d1898f..2064c01ac864 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -197,13 +197,12 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return -EOPNOTSUPP;
 #endif
 	}
-	case FS_IOC_GET_ENCRYPTION_POLICY: {
-#ifdef CONFIG_UBIFS_FS_ENCRYPTION
+
+	case FS_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
-#else
-		return -EOPNOTSUPP;
-#endif
-	}
+
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		return fscrypt_ioctl_get_policy_ex(file, (void __user *)arg);
 
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 		return fscrypt_ioctl_add_key(file, (void __user *)arg);
@@ -231,6 +230,7 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 	case FS_IOC_SET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
-- 
2.15.0.rc0.271.g36b669edcc-goog
