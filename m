Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DBBC433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 16:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816482086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 16:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdoaJn+q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lW0p1+zW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 816482086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIohpZWVn1DM+pvgHPLXbn22pwETVIs7ayI6QPejPZQ=; b=kdoaJn+qBMrLX7
	xVkHJ2UmN51e2IXOrHQVANfOrdk5fRfwuyOllUzWNAl5MBpLw7P1sDVoxxJ8K/Exa6kMoVrHD7S2g
	v5yPMWfCDJuECY8+hbMIGCoVO7ozK4lUmwcG71td3fO/eEWhVBL9PpqKrZs+1BZVqH/yKs54/c4O6
	ajPZwtyy/Foy/nhvqbN+PiG/+nnfK9u6LPR8Tl1kw3S1T4q0fEnDkVUtrBuLp1SefehuNCCiXn7P8
	vuZtBST0NglekbOU8CTXFzjRbKV5kWtLNOtj4Xa2ajDrJfIVrkQnudwYZhZxql5WqPmJ9pngSHE1B
	LT2ML+6rATgVwZxIOXeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hufvq-0004ra-Fw; Mon, 05 Aug 2019 16:33:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hufql-0008UR-2I
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 16:28:47 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 913422189F;
 Mon,  5 Aug 2019 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022518;
 bh=LGlqB+KPcdT+yUKo4xoIMYDDnrb5wB4WY6SbGhFfsQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lW0p1+zWymvDMHw6wOnKOtMneB8HsEalwqkaNalDGdZSAkU0zL8plEW79RVqMuMWZ
 uJQAQ19TfbjmoZc/N30eT6G+Ht/asFAo+FJiVAp873vQPOT7+nlt/Ze4uOEopWHUR/
 C1PcrFC6wdi68QVrTjEwAzShIxii1ofMHdmWiS3o=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v8 17/20] ext4: wire up new fscrypt ioctls
Date: Mon,  5 Aug 2019 09:25:18 -0700
Message-Id: <20190805162521.90882-18-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_092843_687154_157A53D2 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Wire up the new ioctls for adding and removing fscrypt keys to/from the
filesystem, and the new ioctl for retrieving v2 encryption policies.

The key removal ioctls also required making ext4_drop_inode() call
fscrypt_drop_inode().

For more details see Documentation/filesystems/fscrypt.rst and the
fscrypt patches that added the implementation of these ioctls.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ioctl.c | 30 ++++++++++++++++++++++++++++++
 fs/ext4/super.c |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 442f7ef873fc36..fe5a4b13f939a2 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1115,6 +1115,31 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
+
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_add_key(filp, (void __user *)arg);
+
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_remove_key(filp, (void __user *)arg);
+
+	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_remove_key_all_users(filp,
+							  (void __user *)arg);
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
+
 	case EXT4_IOC_FSGETXATTR:
 	{
 		struct fsxattr fa;
@@ -1231,6 +1256,11 @@ long ext4_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_SET_ENCRYPTION_POLICY:
 	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 	case EXT4_IOC_SHUTDOWN:
 	case FS_IOC_GETFSMAP:
 		break;
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 4079605d437ae7..757819139b8f70 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1107,6 +1107,9 @@ static int ext4_drop_inode(struct inode *inode)
 {
 	int drop = generic_drop_inode(inode);
 
+	if (!drop)
+		drop = fscrypt_drop_inode(inode);
+
 	trace_ext4_drop_inode(inode, drop);
 	return drop;
 }
-- 
2.22.0.770.g0f2c4a37fd-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
