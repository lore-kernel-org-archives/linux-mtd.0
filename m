Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C4DC33CB3
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 19:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11322087E
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 19:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XuvnbcB0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2o/B2tfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11322087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=itN8U0B6GQnYvfka3CNhDjNmOC9QOCm3rqc5ggT7MD4=; b=XuvnbcB0n1dyu/
	mQdftCiB0BuxQBalAmc9Ie8NuQsQansbEInWL6+wP1CzG3sOdHn2xmhCKGp9MpiLUbGRZh9vxJpXG
	GPvG5Smr9juAGL3Dmqva+2QyH2VvqJsYBsz2JFoud5Mh4it23m7ACP4rZqdZbYbqu8ngMGdhPqdOb
	PuhJtc8TthoLap99L01b3gJng05Kej0soY2FNhiTcwVD7ipy+yuyFOhTX6XLJB1xKhkQ/hI1soaYt
	yr0eub5w5fgQPM18EjvpeTdyOuJN2bY04aF1pLRZgmEvHyk9ZKNwGWlRSufzy3ziJMP/7gGrwJ6iB
	DjeKsa8rrSJroGNWqnpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isAha-0004wd-Ks; Thu, 16 Jan 2020 19:21:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isAhX-0004w3-7J
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 19:21:08 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E2D820661;
 Thu, 16 Jan 2020 19:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579202466;
 bh=rUr1wlexBA7T5J5m/OSW8iFgPsbrK8hJ/8NOCZzbZK8=;
 h=From:To:Cc:Subject:Date:From;
 b=2o/B2tfu8Tgm7+qJkztQ+IGIiSVLQQD4L+vz4mFLQQhxf/05CdxlNQXabL5dVTBRE
 kEfexecpizCN0hk37ZSmvwuUVv+OLvaeWfK50X4ddeBfHKX66XFfOlGUhdJ4n1ut+1
 uXug04sCgFEERthHjP/SNqZMkyCDOjxtcExOMNdA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH] fscrypt: reserve flags for hardware-wrapped keys feature
Date: Thu, 16 Jan 2020 11:20:08 -0800
Message-Id: <20200116192008.35766-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_112107_302962_47AF9372 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Barani Muthukumaran <bmuthuku@codeaurora.org>,
 Gaurav Kashyap <gaurkash@codeaurora.org>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Reserve flags for the hardware-wrapped keys feature which is being
worked on [1].  FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY will denote that the
encryption policy needs a hardware-wrapped key to be unlocked.
FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED will denote that the key being added is
a hardware-wrapped key.

This reservation is tentative, and these codepoints may be reused if the
feature is not upstreamed.

[1] https://android-review.googlesource.com/c/kernel/common/+/1200864

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 5 +++--
 fs/crypto/keyring.c                   | 5 ++++-
 fs/crypto/policy.c                    | 4 +++-
 include/uapi/linux/fscrypt.h          | 9 ++++++---
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 9c53336d06a438..4c443d7b1fc6b5 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -639,7 +639,8 @@ follows::
             struct fscrypt_key_specifier key_spec;
             __u32 raw_size;
             __u32 key_id;
-            __u32 __reserved[8];
+            __u32 flags;
+            __u32 __reserved[7];
             __u8 raw[];
     };
 
@@ -658,7 +659,7 @@ follows::
 
     struct fscrypt_provisioning_key_payload {
             __u32 type;
-            __u32 __reserved;
+            __u32 flags;
             __u8 raw[];
     };
 
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 098ff2e0f0bb41..fc27f5d08d7dbe 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -477,7 +477,7 @@ static int fscrypt_provisioning_key_preparse(struct key_preparsed_payload *prep)
 	    payload->type != FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER)
 		return -EINVAL;
 
-	if (payload->__reserved)
+	if (payload->flags)
 		return -EINVAL;
 
 	prep->payload.data[0] = kmemdup(payload, prep->datalen, GFP_KERNEL);
@@ -606,6 +606,9 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 	if (!valid_key_spec(&arg.key_spec))
 		return -EINVAL;
 
+	if (arg.flags)
+		return -EINVAL;
+
 	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
 		return -EINVAL;
 
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f1cff83c151acf..36a2bb077b6910 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -139,7 +139,9 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 		return false;
 	}
 
-	if (policy->flags & ~FSCRYPT_POLICY_FLAGS_VALID) {
+	if (policy->flags & ~(FSCRYPT_POLICY_FLAGS_PAD_MASK |
+			      FSCRYPT_POLICY_FLAG_DIRECT_KEY |
+			      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64)) {
 		fscrypt_warn(inode, "Unsupported encryption flags (0x%02x)",
 			     policy->flags);
 		return false;
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 0d8a6f47711c32..fad624a4c5feda 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -19,7 +19,8 @@
 #define FSCRYPT_POLICY_FLAGS_PAD_MASK		0x03
 #define FSCRYPT_POLICY_FLAG_DIRECT_KEY		0x04
 #define FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64	0x08
-#define FSCRYPT_POLICY_FLAGS_VALID		0x0F
+#define FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY	0x10
+#define FSCRYPT_POLICY_FLAGS_VALID		0x1F
 
 /* Encryption algorithms */
 #define FSCRYPT_MODE_AES_256_XTS		1
@@ -116,7 +117,7 @@ struct fscrypt_key_specifier {
  */
 struct fscrypt_provisioning_key_payload {
 	__u32 type;
-	__u32 __reserved;
+	__u32 flags;
 	__u8 raw[];
 };
 
@@ -125,7 +126,9 @@ struct fscrypt_add_key_arg {
 	struct fscrypt_key_specifier key_spec;
 	__u32 raw_size;
 	__u32 key_id;
-	__u32 __reserved[8];
+#define FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED			0x00000001
+	__u32 flags;
+	__u32 __reserved[7];
 	__u8 raw[];
 };
 

base-commit: 2d8f7f119b0b2ce5e7ff0e8024b0763bf42b99c9
-- 
2.25.0.rc1.283.g88dfdc4193-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
