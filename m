Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDA6C04E87
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B43217F4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qsfH9Ios";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9r5Fd0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B43217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3Q20Zl036wjWnAaDq/k+WgM7+d6QDJNDUg3FjFMI/k=; b=qsfH9IosJG573K
	eHwTOi7ZC74qb9LdGhstEbX+BOfqQg3z2XkILhrp+6RrVOhMMlv+wvpQJMfodU7RWnmteYaN3dufW
	VWO+T7kMGBLDTQ4TuHKnkI4q+NYOrKx2K2oTM+fAy0kVMlQbG9xUXCqW+8M8clXuzVJTAL18PYtBe
	8Hhv5TJsKESk0SHQYblKDSaqMT2L3OjwDxU660OZn/L6Yfb57zz6UrP6bvUJGMnn1sUz3ogzyGjt0
	GRSngiaPMnJsUd9zqnyVaMHwSKX+opvpRP3p8RVaLUNhB5g7+6q+gddncaMMAZIHWJ3RnkaAM1pss
	4kK/Npp228roUFczjFNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSm5i-0000D7-9a; Mon, 20 May 2019 17:28:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSm5e-0000Ap-B9
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 17:28:47 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB829214DA;
 Mon, 20 May 2019 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558373326;
 bh=kEs3z2bxHH/LOYENg/QLUwH3aQgoxFpT4QgOJVMMhJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I9r5Fd0HozL79xx07IbkXPuc/jTVv3cZ34MAdXjHg2cmXpNx/3unU/Rr2LGfnGk0s
 DKUGAVgw/M7QF2qxtjKXTa/sv1AWrsdkPhJCkt9inFB0SHY6H2B1gtprbfseoxlShr
 TIi1eOyHFQqyB33YQpA26K2s6FrJ9xCgBhuM5C30=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v6 01/16] fs,
 fscrypt: move uapi definitions to new header <linux/fscrypt.h>
Date: Mon, 20 May 2019 10:25:37 -0700
Message-Id: <20190520172552.217253-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520172552.217253-1-ebiggers@kernel.org>
References: <20190520172552.217253-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_102846_462234_4387C99D 
X-CRM114-Status: GOOD (  13.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

More fscrypt definitions are being added, and we shouldn't use a
disproportionate amount of space in <linux/fs.h> for fscrypt stuff.
So move the fscrypt definitions to a new header <linux/fscrypt.h>.

For source compatibility with existing userspace programs, <linux/fs.h>
still includes the new header.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS                  |  1 +
 include/linux/fscrypt.h      |  1 +
 include/uapi/linux/fs.h      | 54 ++-------------------------------
 include/uapi/linux/fscrypt.h | 58 ++++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 51 deletions(-)
 create mode 100644 include/uapi/linux/fscrypt.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4ce5750..b55acde12f65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6475,6 +6475,7 @@ T:	git git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 S:	Supported
 F:	fs/crypto/
 F:	include/linux/fscrypt*.h
+F:	include/uapi/linux/fscrypt.h
 F:	Documentation/filesystems/fscrypt.rst
 
 FSI-ATTACHED I2C DRIVER
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index f7680ef1abd2d..a2b2ceaf33a85 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -16,6 +16,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <uapi/linux/fscrypt.h>
 
 #define FS_CRYPTO_BLOCK_SIZE		16
 
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 59c71fa8c553a..41bd84d25a980 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -13,6 +13,9 @@
 #include <linux/limits.h>
 #include <linux/ioctl.h>
 #include <linux/types.h>
+#ifndef __KERNEL__
+#include <linux/fscrypt.h>
+#endif
 
 /* Use of MS_* flags within the kernel is restricted to core mount(2) code. */
 #if !defined(__KERNEL__)
@@ -212,57 +215,6 @@ struct fsxattr {
 #define FS_IOC_GETFSLABEL		_IOR(0x94, 49, char[FSLABEL_MAX])
 #define FS_IOC_SETFSLABEL		_IOW(0x94, 50, char[FSLABEL_MAX])
 
-/*
- * File system encryption support
- */
-/* Policy provided via an ioctl on the topmost directory */
-#define FS_KEY_DESCRIPTOR_SIZE	8
-
-#define FS_POLICY_FLAGS_PAD_4		0x00
-#define FS_POLICY_FLAGS_PAD_8		0x01
-#define FS_POLICY_FLAGS_PAD_16		0x02
-#define FS_POLICY_FLAGS_PAD_32		0x03
-#define FS_POLICY_FLAGS_PAD_MASK	0x03
-#define FS_POLICY_FLAG_DIRECT_KEY	0x04	/* use master key directly */
-#define FS_POLICY_FLAGS_VALID		0x07
-
-/* Encryption algorithms */
-#define FS_ENCRYPTION_MODE_INVALID		0
-#define FS_ENCRYPTION_MODE_AES_256_XTS		1
-#define FS_ENCRYPTION_MODE_AES_256_GCM		2
-#define FS_ENCRYPTION_MODE_AES_256_CBC		3
-#define FS_ENCRYPTION_MODE_AES_256_CTS		4
-#define FS_ENCRYPTION_MODE_AES_128_CBC		5
-#define FS_ENCRYPTION_MODE_AES_128_CTS		6
-#define FS_ENCRYPTION_MODE_SPECK128_256_XTS	7 /* Removed, do not use. */
-#define FS_ENCRYPTION_MODE_SPECK128_256_CTS	8 /* Removed, do not use. */
-#define FS_ENCRYPTION_MODE_ADIANTUM		9
-
-struct fscrypt_policy {
-	__u8 version;
-	__u8 contents_encryption_mode;
-	__u8 filenames_encryption_mode;
-	__u8 flags;
-	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-};
-
-#define FS_IOC_SET_ENCRYPTION_POLICY	_IOR('f', 19, struct fscrypt_policy)
-#define FS_IOC_GET_ENCRYPTION_PWSALT	_IOW('f', 20, __u8[16])
-#define FS_IOC_GET_ENCRYPTION_POLICY	_IOW('f', 21, struct fscrypt_policy)
-
-/* Parameters for passing an encryption key into the kernel keyring */
-#define FS_KEY_DESC_PREFIX		"fscrypt:"
-#define FS_KEY_DESC_PREFIX_SIZE		8
-
-/* Structure that userspace passes to the kernel keyring */
-#define FS_MAX_KEY_SIZE			64
-
-struct fscrypt_key {
-	__u32 mode;
-	__u8 raw[FS_MAX_KEY_SIZE];
-	__u32 size;
-};
-
 /*
  * Inode flags (FS_IOC_GETFLAGS / FS_IOC_SETFLAGS)
  *
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
new file mode 100644
index 0000000000000..193339cb53fdb
--- /dev/null
+++ b/include/uapi/linux/fscrypt.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_FSCRYPT_H
+#define _UAPI_LINUX_FSCRYPT_H
+
+#include <linux/types.h>
+
+/*
+ * File system encryption support
+ */
+/* Policy provided via an ioctl on the topmost directory */
+#define FS_KEY_DESCRIPTOR_SIZE	8
+
+#define FS_POLICY_FLAGS_PAD_4		0x00
+#define FS_POLICY_FLAGS_PAD_8		0x01
+#define FS_POLICY_FLAGS_PAD_16		0x02
+#define FS_POLICY_FLAGS_PAD_32		0x03
+#define FS_POLICY_FLAGS_PAD_MASK	0x03
+#define FS_POLICY_FLAG_DIRECT_KEY	0x04	/* use master key directly */
+#define FS_POLICY_FLAGS_VALID		0x07
+
+/* Encryption algorithms */
+#define FS_ENCRYPTION_MODE_INVALID		0
+#define FS_ENCRYPTION_MODE_AES_256_XTS		1
+#define FS_ENCRYPTION_MODE_AES_256_GCM		2
+#define FS_ENCRYPTION_MODE_AES_256_CBC		3
+#define FS_ENCRYPTION_MODE_AES_256_CTS		4
+#define FS_ENCRYPTION_MODE_AES_128_CBC		5
+#define FS_ENCRYPTION_MODE_AES_128_CTS		6
+#define FS_ENCRYPTION_MODE_SPECK128_256_XTS	7 /* Removed, do not use. */
+#define FS_ENCRYPTION_MODE_SPECK128_256_CTS	8 /* Removed, do not use. */
+#define FS_ENCRYPTION_MODE_ADIANTUM		9
+
+struct fscrypt_policy {
+	__u8 version;
+	__u8 contents_encryption_mode;
+	__u8 filenames_encryption_mode;
+	__u8 flags;
+	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+};
+
+#define FS_IOC_SET_ENCRYPTION_POLICY	_IOR('f', 19, struct fscrypt_policy)
+#define FS_IOC_GET_ENCRYPTION_PWSALT	_IOW('f', 20, __u8[16])
+#define FS_IOC_GET_ENCRYPTION_POLICY	_IOW('f', 21, struct fscrypt_policy)
+
+/* Parameters for passing an encryption key into the kernel keyring */
+#define FS_KEY_DESC_PREFIX		"fscrypt:"
+#define FS_KEY_DESC_PREFIX_SIZE		8
+
+/* Structure that userspace passes to the kernel keyring */
+#define FS_MAX_KEY_SIZE			64
+
+struct fscrypt_key {
+	__u32 mode;
+	__u8 raw[FS_MAX_KEY_SIZE];
+	__u32 size;
+};
+
+#endif /* _UAPI_LINUX_FSCRYPT_H */
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
