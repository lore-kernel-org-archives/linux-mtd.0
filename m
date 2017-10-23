Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6kUu-00076w-5I
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 21:43:01 +0000
Received: by mail-io0-x242.google.com with SMTP id e89so21712887ioi.11
 for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2017 14:42:41 -0700 (PDT)
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
Subject: [RFC PATCH 23/25] f2fs crypto: wire up FS_IOC_GET_ENCRYPTION_POLICY_EX
Date: Mon, 23 Oct 2017 14:40:56 -0700
Message-Id: <20171023214058.128121-24-ebiggers3@gmail.com>
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
 fs/f2fs/file.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0296a9594fe7..68b6ba732f25 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1887,11 +1887,6 @@ static int f2fs_ioc_set_encryption_policy(struct file *filp, unsigned long arg)
 	return fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
 }
 
-static int f2fs_ioc_get_encryption_policy(struct file *filp, unsigned long arg)
-{
-	return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
-}
-
 static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -2647,10 +2642,12 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_fitrim(filp, arg);
 	case F2FS_IOC_SET_ENCRYPTION_POLICY:
 		return f2fs_ioc_set_encryption_policy(filp, arg);
-	case F2FS_IOC_GET_ENCRYPTION_POLICY:
-		return f2fs_ioc_get_encryption_policy(filp, arg);
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 		return f2fs_ioc_get_encryption_pwsalt(filp, arg);
+	case F2FS_IOC_GET_ENCRYPTION_POLICY:
+		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 		return fscrypt_ioctl_add_key(filp, (void __user *)arg);
 	case FS_IOC_REMOVE_ENCRYPTION_KEY:
@@ -2737,6 +2734,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SET_ENCRYPTION_POLICY:
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 	case F2FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
-- 
2.15.0.rc0.271.g36b669edcc-goog
