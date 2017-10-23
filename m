Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6kUr-0004mh-Nq
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 21:43:10 +0000
Received: by mail-io0-x243.google.com with SMTP id p186so21681688ioe.12
 for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2017 14:42:39 -0700 (PDT)
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
Subject: [RFC PATCH 22/25] ext4 crypto: wire up FS_IOC_GET_ENCRYPTION_POLICY_EX
Date: Mon, 23 Oct 2017 14:40:55 -0700
Message-Id: <20171023214058.128121-23-ebiggers3@gmail.com>
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
 fs/ext4/ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index b8a6765a556f..954042f311dc 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -978,6 +978,9 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
+
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 		if (!ext4_has_feature_encrypt(sb))
 			return -EOPNOTSUPP;
@@ -1117,6 +1120,7 @@ long ext4_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_SET_ENCRYPTION_POLICY:
 	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
-- 
2.15.0.rc0.271.g36b669edcc-goog
