Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6kUb-0004gW-9Q
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 21:42:49 +0000
Received: by mail-it0-x242.google.com with SMTP id o135so7706444itb.0
 for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2017 14:42:25 -0700 (PDT)
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
Subject: [RFC PATCH 12/25] ext4 crypto: wire up new ioctls for managing
 encryption keys
Date: Mon, 23 Oct 2017 14:40:45 -0700
Message-Id: <20171023214058.128121-13-ebiggers3@gmail.com>
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

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ioctl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index afb66d4ab5cf..b8a6765a556f 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -978,6 +978,21 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_add_key(filp, (void __user *)arg);
+
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_remove_key(filp, (const void __user *)arg);
+
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
+
 	case EXT4_IOC_FSGETXATTR:
 	{
 		struct fsxattr fa;
@@ -1102,6 +1117,9 @@ long ext4_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_SET_ENCRYPTION_POLICY:
 	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 	case EXT4_IOC_SHUTDOWN:
 	case FS_IOC_GETFSMAP:
 		break;
-- 
2.15.0.rc0.271.g36b669edcc-goog
