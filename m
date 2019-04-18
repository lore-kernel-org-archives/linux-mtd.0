Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC3FC10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 23:44:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5AF206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 23:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o54FsblP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnUow4Bh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5AF206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRbYC4dhiSM3sLnXGd0Jl+Ufgaamerg36lIEIosuZiU=; b=o54FsblPUHBrmL
	vu9BDF+9jxxsre1+3D4SJPgPrJnhClVNwoF7t590epn1jTdvv07lEsrioDdJ0rF9LA1G5rUhG7Tmq
	2uCEcv6d/x3SYgjq8NM09yb3C3/Aa1eF/NynBpECDC+5KG8vVSGhWM6Buiwv43UFKqdn2HXz6InLY
	XI111iE2IK6bJhqQYa+cIB8NCbLQ99mDpkTGuwv+bEpOvjOv/ZOh6FZ+6Tzl5ZDzUYBeDogMb9GIO
	9KBWwfbbNIXjFE8tKE0E7NUPA4fTFZT8LglmKKt2HZaNHwTw6djNaS0TqVoqWJ7Sgn0nGVE2NivMS
	3gAn+tTJiiM6w+8wn0Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHGhx-0005bQ-Ac; Thu, 18 Apr 2019 23:44:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHGUD-0006VL-Fc
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 23:30:46 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B72C218D3;
 Thu, 18 Apr 2019 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555630230;
 bh=PvjJ/fDeVddJuHgsxQWMlI/2ylcoj1MaOaDzW3rH+AU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mnUow4Bhb1Dj2YuO+m5m1qvyojzntMogqPMKUqXaptOM2Pa85Q2WdRsV90HHtR0e5
 dPYyAzliOC03ac1W8HxxEw/HVigSMm+XJabOAHQlBV7LVeWLfi2DC8pv/4ZWuiA3lc
 LGWmpuuWaTNJ9mFsItUpH2HIE2SB5judE5pUqBqw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v5 15/16] ubifs: wire up new fscrypt ioctls
Date: Thu, 18 Apr 2019 16:29:22 -0700
Message-Id: <20190418232923.250800-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
In-Reply-To: <20190418232923.250800-1-ebiggers@kernel.org>
References: <20190418232923.250800-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_163033_886314_CD532471 
X-CRM114-Status: GOOD (  10.73  )
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

FS_IOC_REMOVE_ENCRYPTION_KEY also required making UBIFS use
fscrypt_drop_inode().

For more details see Documentation/filesystems/fscrypt.rst and the
fscrypt patches that added the implementation of these ioctls.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/ioctl.c | 16 ++++++++++++++++
 fs/ubifs/super.c | 11 +++++++++++
 2 files changed, 27 insertions(+)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 82e4e6a30b044..c379b2505c4df 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -213,6 +213,18 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 #endif
 	}
 
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		return fscrypt_ioctl_get_policy_ex(file, (void __user *)arg);
+
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+		return fscrypt_ioctl_add_key(file, (void __user *)arg);
+
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+		return fscrypt_ioctl_remove_key(file, (const void __user *)arg);
+
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
+		return fscrypt_ioctl_get_key_status(file, (void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
@@ -230,6 +242,10 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 	case FS_IOC_SET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 19fd210987457..2d68cfd872f64 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -335,6 +335,16 @@ static int ubifs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return err;
 }
 
+static int ubifs_drop_inode(struct inode *inode)
+{
+	int drop = generic_drop_inode(inode);
+
+	if (!drop)
+		drop = fscrypt_drop_inode(inode);
+
+	return drop;
+}
+
 static void ubifs_evict_inode(struct inode *inode)
 {
 	int err;
@@ -1983,6 +1993,7 @@ const struct super_operations ubifs_super_operations = {
 	.destroy_inode = ubifs_destroy_inode,
 	.put_super     = ubifs_put_super,
 	.write_inode   = ubifs_write_inode,
+	.drop_inode    = ubifs_drop_inode,
 	.evict_inode   = ubifs_evict_inode,
 	.statfs        = ubifs_statfs,
 	.dirty_inode   = ubifs_dirty_inode,
-- 
2.21.0.392.gf8f6787159e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
