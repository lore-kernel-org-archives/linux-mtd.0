Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8DAC7618F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 22:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99A120657
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 22:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YStRY+VO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLKP6V9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99A120657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqMc6d22bKAal44+pX//g5gUdP+D3QT3wsEOTETHYL4=; b=YStRY+VOtiNS8O
	QPStefzGXwBBDEG4ZAaBRHjXdn1faoV0GhTaqtlt/kNvHPGP9Y3BpCwEeZyDNzevciNhji/upzj1Z
	yaMn+MJNF181s0pQR8uDnb17QTkCTcXJuN/mw6rMY2rIOmrTqxJ0eYzo75xrRUQJly5R8HeMkWqhi
	7aU67N5jwvojc86Gz6fUBnvPW5siGf4VXI1puVZLxY2sLY8BvBTgSM2KOx6HQ4W3AEJ4qo46tA0oR
	TtafFq6LaGZ4Ks2Darjj0elw+AAKuZw3QHYB+kC2FvgNY4RnYJXbXQ6nEc06PrxNQWzXFcoeudfjs
	k0G5+j7kQNEdKwjlLqdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hr8z3-0006RW-DC; Fri, 26 Jul 2019 22:46:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr8yL-0005YX-66
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 22:46:00 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C63422CB9;
 Fri, 26 Jul 2019 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564181156;
 bh=ezWmir2rjCNGji+iNBq+3urZx0fmdyzIqxGmz6HduxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BLKP6V9uTWJIlOQwuK8ZSL3NO5pwlMHlpwjFuEgHmRPlY1v3jbqT4y5+oVuLq0tK6
 MUXuJvvvi/fkAZDeI6K9yvYU6z5jvnNSsKU6T7Kfxnn4lk6dokVJcbnxN4HuIJl/zz
 4Ot3pZzYXXDTKRjVREDJem9Y/EmXiaWpmg7EX3Io=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v7 02/16] fscrypt: use FSCRYPT_ prefix for uapi constants
Date: Fri, 26 Jul 2019 15:41:27 -0700
Message-Id: <20190726224141.14044-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726224141.14044-1-ebiggers@kernel.org>
References: <20190726224141.14044-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_154557_253824_FF20A31E 
X-CRM114-Status: GOOD (  15.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Prefix all filesystem encryption UAPI constants except the ioctl numbers
with "FSCRYPT_" rather than with "FS_".  This namespaces the constants
more appropriately and makes it clear that they are related specifically
to the filesystem encryption feature, and to the 'fscrypt_*' structures.
With some of the old names like "FS_POLICY_FLAGS_VALID", it was not
immediately clear that the constant had anything to do with encryption.

This is also useful because we'll be adding more encryption-related
constants, e.g. for the policy version, and we'd otherwise have to
choose whether to use unclear names like FS_POLICY_V1 or inconsistent
names like FS_ENCRYPTION_POLICY_V1.

For source compatibility with existing userspace programs, keep the old
names defined as aliases to the new names.

Finally, as long as new names are being defined anyway, I skipped
defining new names for the fscrypt mode numbers that aren't actually
used: INVALID (0), AES_256_GCM (2), AES_256_CBC (3), SPECK128_256_XTS
(7), and SPECK128_256_CTS (8).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 36 +++++++--------
 include/uapi/linux/fscrypt.h          | 65 +++++++++++++++++----------
 2 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 82efa41b0e6c0..2c4b6e56b81c5 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -225,9 +225,10 @@ a little endian number, except that:
   is encrypted with AES-256 where the AES-256 key is the SHA-256 hash
   of the file's data encryption key.
 
-- In the "direct key" configuration (FS_POLICY_FLAG_DIRECT_KEY set in
-  the fscrypt_policy), the file's nonce is also appended to the IV.
-  Currently this is only allowed with the Adiantum encryption mode.
+- In the "direct key" configuration (FSCRYPT_POLICY_FLAG_DIRECT_KEY
+  set in the fscrypt_policy), the file's nonce is also appended to the
+  IV.  Currently this is only allowed with the Adiantum encryption
+  mode.
 
 Filenames encryption
 --------------------
@@ -274,14 +275,14 @@ empty directory or verifies that a directory or regular file already
 has the specified encryption policy.  It takes in a pointer to a
 :c:type:`struct fscrypt_policy`, defined as follows::
 
-    #define FS_KEY_DESCRIPTOR_SIZE  8
+    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
 
     struct fscrypt_policy {
             __u8 version;
             __u8 contents_encryption_mode;
             __u8 filenames_encryption_mode;
             __u8 flags;
-            __u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+            __u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
     };
 
 This structure must be initialized as follows:
@@ -290,18 +291,17 @@ This structure must be initialized as follows:
 
 - ``contents_encryption_mode`` and ``filenames_encryption_mode`` must
   be set to constants from ``<linux/fs.h>`` which identify the
-  encryption modes to use.  If unsure, use
-  FS_ENCRYPTION_MODE_AES_256_XTS (1) for ``contents_encryption_mode``
-  and FS_ENCRYPTION_MODE_AES_256_CTS (4) for
-  ``filenames_encryption_mode``.
+  encryption modes to use.  If unsure, use FSCRYPT_MODE_AES_256_XTS
+  (1) for ``contents_encryption_mode`` and FSCRYPT_MODE_AES_256_CTS
+  (4) for ``filenames_encryption_mode``.
 
 - ``flags`` must contain a value from ``<linux/fs.h>`` which
   identifies the amount of NUL-padding to use when encrypting
-  filenames.  If unsure, use FS_POLICY_FLAGS_PAD_32 (0x3).
-  In addition, if the chosen encryption modes are both
-  FS_ENCRYPTION_MODE_ADIANTUM, this can contain
-  FS_POLICY_FLAG_DIRECT_KEY to specify that the master key should be
-  used directly, without key derivation.
+  filenames.  If unsure, use FSCRYPT_POLICY_FLAGS_PAD_32 (0x3).  In
+  addition, if the chosen encryption modes are both
+  FSCRYPT_MODE_ADIANTUM, this can contain
+  FSCRYPT_POLICY_FLAG_DIRECT_KEY to specify that the master key should
+  be used directly, without key derivation.
 
 - ``master_key_descriptor`` specifies how to find the master key in
   the keyring; see `Adding keys`_.  It is up to userspace to choose a
@@ -401,11 +401,11 @@ followed by the 16-character lower case hex representation of the
 ``master_key_descriptor`` that was set in the encryption policy.  The
 key payload must conform to the following structure::
 
-    #define FS_MAX_KEY_SIZE 64
+    #define FSCRYPT_MAX_KEY_SIZE 64
 
     struct fscrypt_key {
             u32 mode;
-            u8 raw[FS_MAX_KEY_SIZE];
+            u8 raw[FSCRYPT_MAX_KEY_SIZE];
             u32 size;
     };
 
@@ -574,7 +574,7 @@ much confusion if an encryption policy were to be added to or removed
 from anything other than an empty directory.)  The struct is defined
 as follows::
 
-    #define FS_KEY_DESCRIPTOR_SIZE  8
+    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
     #define FS_KEY_DERIVATION_NONCE_SIZE 16
 
     struct fscrypt_context {
@@ -582,7 +582,7 @@ as follows::
             u8 contents_encryption_mode;
             u8 filenames_encryption_mode;
             u8 flags;
-            u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+            u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
             u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
     };
 
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 26f6d2c19afd3..674b0452ef575 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -10,35 +10,30 @@
 
 #include <linux/types.h>
 
-#define FS_KEY_DESCRIPTOR_SIZE	8
+#define FSCRYPT_KEY_DESCRIPTOR_SIZE	8
 
 /* Encryption policy flags */
-#define FS_POLICY_FLAGS_PAD_4		0x00
-#define FS_POLICY_FLAGS_PAD_8		0x01
-#define FS_POLICY_FLAGS_PAD_16		0x02
-#define FS_POLICY_FLAGS_PAD_32		0x03
-#define FS_POLICY_FLAGS_PAD_MASK	0x03
-#define FS_POLICY_FLAG_DIRECT_KEY	0x04	/* use master key directly */
-#define FS_POLICY_FLAGS_VALID		0x07
+#define FSCRYPT_POLICY_FLAGS_PAD_4		0x00
+#define FSCRYPT_POLICY_FLAGS_PAD_8		0x01
+#define FSCRYPT_POLICY_FLAGS_PAD_16		0x02
+#define FSCRYPT_POLICY_FLAGS_PAD_32		0x03
+#define FSCRYPT_POLICY_FLAGS_PAD_MASK		0x03
+#define FSCRYPT_POLICY_FLAG_DIRECT_KEY		0x04	/* use master key directly */
+#define FSCRYPT_POLICY_FLAGS_VALID		0x07
 
 /* Encryption algorithms */
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
+#define FSCRYPT_MODE_AES_256_XTS		1
+#define FSCRYPT_MODE_AES_256_CTS		4
+#define FSCRYPT_MODE_AES_128_CBC		5
+#define FSCRYPT_MODE_AES_128_CTS		6
+#define FSCRYPT_MODE_ADIANTUM			9
 
 struct fscrypt_policy {
 	__u8 version;
 	__u8 contents_encryption_mode;
 	__u8 filenames_encryption_mode;
 	__u8 flags;
-	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 };
 
 #define FS_IOC_SET_ENCRYPTION_POLICY	_IOR('f', 19, struct fscrypt_policy)
@@ -46,16 +41,40 @@ struct fscrypt_policy {
 #define FS_IOC_GET_ENCRYPTION_POLICY	_IOW('f', 21, struct fscrypt_policy)
 
 /* Parameters for passing an encryption key into the kernel keyring */
-#define FS_KEY_DESC_PREFIX		"fscrypt:"
-#define FS_KEY_DESC_PREFIX_SIZE		8
+#define FSCRYPT_KEY_DESC_PREFIX		"fscrypt:"
+#define FSCRYPT_KEY_DESC_PREFIX_SIZE		8
 
 /* Structure that userspace passes to the kernel keyring */
-#define FS_MAX_KEY_SIZE			64
+#define FSCRYPT_MAX_KEY_SIZE			64
 
 struct fscrypt_key {
 	__u32 mode;
-	__u8 raw[FS_MAX_KEY_SIZE];
+	__u8 raw[FSCRYPT_MAX_KEY_SIZE];
 	__u32 size;
 };
+/**********************************************************************/
+
+/* old names; don't add anything new here! */
+#define FS_KEY_DESCRIPTOR_SIZE		FSCRYPT_KEY_DESCRIPTOR_SIZE
+#define FS_POLICY_FLAGS_PAD_4		FSCRYPT_POLICY_FLAGS_PAD_4
+#define FS_POLICY_FLAGS_PAD_8		FSCRYPT_POLICY_FLAGS_PAD_8
+#define FS_POLICY_FLAGS_PAD_16		FSCRYPT_POLICY_FLAGS_PAD_16
+#define FS_POLICY_FLAGS_PAD_32		FSCRYPT_POLICY_FLAGS_PAD_32
+#define FS_POLICY_FLAGS_PAD_MASK	FSCRYPT_POLICY_FLAGS_PAD_MASK
+#define FS_POLICY_FLAG_DIRECT_KEY	FSCRYPT_POLICY_FLAG_DIRECT_KEY
+#define FS_POLICY_FLAGS_VALID		FSCRYPT_POLICY_FLAGS_VALID
+#define FS_ENCRYPTION_MODE_INVALID	0	/* never used */
+#define FS_ENCRYPTION_MODE_AES_256_XTS	FSCRYPT_MODE_AES_256_XTS
+#define FS_ENCRYPTION_MODE_AES_256_GCM	2	/* never used */
+#define FS_ENCRYPTION_MODE_AES_256_CBC	3	/* never used */
+#define FS_ENCRYPTION_MODE_AES_256_CTS	FSCRYPT_MODE_AES_256_CTS
+#define FS_ENCRYPTION_MODE_AES_128_CBC	FSCRYPT_MODE_AES_128_CBC
+#define FS_ENCRYPTION_MODE_AES_128_CTS	FSCRYPT_MODE_AES_128_CTS
+#define FS_ENCRYPTION_MODE_SPECK128_256_XTS	7	/* removed */
+#define FS_ENCRYPTION_MODE_SPECK128_256_CTS	8	/* removed */
+#define FS_ENCRYPTION_MODE_ADIANTUM	FSCRYPT_MODE_ADIANTUM
+#define FS_KEY_DESC_PREFIX		FSCRYPT_KEY_DESC_PREFIX
+#define FS_KEY_DESC_PREFIX_SIZE		FSCRYPT_KEY_DESC_PREFIX_SIZE
+#define FS_MAX_KEY_SIZE			FSCRYPT_MAX_KEY_SIZE
 
 #endif /* _UAPI_LINUX_FSCRYPT_H */
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
