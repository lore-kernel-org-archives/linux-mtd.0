Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FC0C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C24020449
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NfewsCXK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jJMz70Un";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXLuDOZ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C24020449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oa5fbxhQYtVqb31a4sGnQef3oOuv/xfbABBBzFURQ5k=; b=NfewsCXKL6V2TY
	JcjL9tJdlBVeSjPtkSSqlic37fxUVeCndcSj11sZhuQSncAtHtK0Ck5b5FOBl3RfJzaDqzp27kiim
	lf4TCfcy4Bo8CO0e+EIHR4UAvWdcxUnkVQNE+d9i7Q0EVRoI+YH67WcPAQmrFqPQaQUDy2XwRsHXA
	h1XYOMUB3bAxFk8xtxNhYNeBNFjYP7JjELTB3lux++XwnX6rGlAXw5cq0mNrDHp4mCOFUE+eNzY1B
	5X8VOp6m9uAr8rRObJdaqAMxThj+QTaaQwEW+tjqlQLwi+cgiP2a25weeRQvYXxKeR8lsnhkUGLxC
	u5o1KGkX7joYO2Z4sIXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwM29-0005rp-VC; Wed, 20 Feb 2019 07:11:10 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwM1n-0005R1-92
 for linux-mtd@bombadil.infradead.org; Wed, 20 Feb 2019 07:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpNnpP8EDzbaYcaM9oFK8LLvAreNWmbZj+rNdgoQ+zU=; b=jJMz70UnWvlVwnei2z4UpUC632
 dlFawaaNNkErxZypMmr2K3/QtwddWNkymwBjO46ZmUNL9LtfWZCLxtjXEDSsA1sPVZNDCDdj1xBKb
 wEM83G1hbzcLzdG/245G2ORvj13wwBHhI1K/ArSB8Tam/Ifdw0pyIk6TWMS84YpFolw16rcXRdErU
 fhsyGbM4GA5fEy8XiEXDUfwW7NEXVJPbB44LoXOtlJHJ3yFoAUWRvNjxBst/E206g4JhbLs7R9kEW
 Yga4bFiHIBPQuTKZhFH1Gpr21SdXhMqACqujN3Gzm5rKXTDNGrXFJpn6VBFwI3wQgiGS9jR5+E61I
 VJHFAQNw==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwLmJ-0003ml-3O
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 06:54:48 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A71B32196F;
 Wed, 20 Feb 2019 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550645683;
 bh=6wITDHkKCD2vVxskyRHycH8wt4kPh2KV3XiDU2eSKPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uXLuDOZ5cgD3g7iCEwuaZYf+tIwcugspR2OEGJkICBwclV75E7EY5ezIHQAARy/2L
 R9CCtsco7hWr9DAd7r3ahGciwPVIgkks3EDNnf8IM/MJzHcRaDblvG9x8NElMeutPL
 edDtYt6a43TT7Eww3shZ/9n55qigQS52PfntSvbA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v3 16/18] f2fs: wire up new fscrypt ioctls
Date: Tue, 19 Feb 2019 22:52:47 -0800
Message-Id: <20190220065249.32099-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220065249.32099-1-ebiggers@kernel.org>
References: <20190220065249.32099-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_015447_295045_529633D2 
X-CRM114-Status: GOOD (  12.20  )
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

Wire up the new ioctls for adding and removing fscrypt keys to/from the
filesystem, and the new ioctl for retrieving v2 encryption policies.

FS_IOC_REMOVE_ENCRYPTION_KEY also required making f2fs_drop_inode() call
fscrypt_drop_inode().

For more details see Documentation/filesystems/fscrypt.rst, as well as
the fscrypt patches that added the implementation of these ioctls.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ba5954f41e14..3e6da48e0530 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2093,6 +2093,40 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
 	return err;
 }
 
+static int f2fs_ioc_get_encryption_policy_ex(struct file *filp,
+					     unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
+}
+
+static int f2fs_ioc_add_encryption_key(struct file *filp, unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_add_key(filp, (void __user *)arg);
+}
+
+static int f2fs_ioc_remove_encryption_key(struct file *filp, unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_remove_key(filp, (const void __user *)arg);
+}
+
+static int f2fs_ioc_get_encryption_key_status(struct file *filp,
+					      unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
+}
+
 static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -2998,6 +3032,14 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_get_encryption_policy(filp, arg);
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 		return f2fs_ioc_get_encryption_pwsalt(filp, arg);
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		return f2fs_ioc_get_encryption_policy_ex(filp, arg);
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+		return f2fs_ioc_add_encryption_key(filp, arg);
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+		return f2fs_ioc_remove_encryption_key(filp, arg);
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
+		return f2fs_ioc_get_encryption_key_status(filp, arg);
 	case F2FS_IOC_GARBAGE_COLLECT:
 		return f2fs_ioc_gc(filp, arg);
 	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
@@ -3117,6 +3159,10 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SET_ENCRYPTION_POLICY:
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 	case F2FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 	case F2FS_IOC_GARBAGE_COLLECT:
 	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
 	case F2FS_IOC_WRITE_CHECKPOINT:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0f3db3a8e5cb..1dcfe55ee1d4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -927,6 +927,8 @@ static int f2fs_drop_inode(struct inode *inode)
 		return 0;
 	}
 	ret = generic_drop_inode(inode);
+	if (!ret)
+		ret = fscrypt_drop_inode(inode);
 	trace_f2fs_drop_inode(inode, ret);
 	return ret;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
