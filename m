Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D60C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6018E208C3
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPiim42/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1LBETw4h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6018E208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHhFM2+wba0kqOXl6kvMbtusYmwzle9FyQjQmDa9Kps=; b=dPiim42/SnUNX5
	w8zyQ2CwgA+RieWhoXWzlB/LrtmEBOUyQn2BIdtQKznmL1sDkR8JPDTpyEJRdayH9Si03+EUNVrNW
	hr62uPLlphyhQXhsYGsVIgokuAnZIvSzrLedI1IX4M23HV2ER+Uwr0SUAnjew37ns+GDvjmSuF0VO
	boAYd0DMcXQM8v6JANiSsjbetYxRoHTo70c/Jo6Hsxfe2YVCy07TEBYQ9IGqSvzaYMKoWm0iZ+lDZ
	rtiTsJ5GdHQSjXObuSaBWCg3fBtusdKpv+dFipATy/vni8R+R2Lo7sTCyWb6/TDlZK8wa+ZHpFnqO
	sLhfXjg1QLGtv+yzBIcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSm7a-0003y4-RN; Mon, 20 May 2019 17:30:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSm5l-0000Gp-Cn
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 17:29:05 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FD17217D7;
 Mon, 20 May 2019 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558373333;
 bh=t8IdncPTk+0m23maW8clJi2kvlExmwEB/pNcgFaMkTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1LBETw4h7WZ1TuVxLRjwktAKOyaK6Xj/i3r0KeCFjyiJ1xD747b3zC5TFjUyQ2SQs
 h5fU/fSxpOKI0eQ5HW+6TNmltMvyqrDZySM8J9cvwPF+e5Yhl2n6MwXqUKUqm2B7J6
 PzbLiaEKOI9VqU9Hm93vZSx78wgjuxBFj1oGyXb0=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v6 15/16] ubifs: wire up new fscrypt ioctls
Date: Mon, 20 May 2019 10:25:51 -0700
Message-Id: <20190520172552.217253-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520172552.217253-1-ebiggers@kernel.org>
References: <20190520172552.217253-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_102853_969259_01836AFE 
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
index 6b05b3ec500e1..b2a67618bef91 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -204,6 +204,18 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
 
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
@@ -221,6 +233,10 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
index 04b8ecfd34701..ae026a7bb1a62 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -330,6 +330,16 @@ static int ubifs_write_inode(struct inode *inode, struct writeback_control *wbc)
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
@@ -1980,6 +1990,7 @@ const struct super_operations ubifs_super_operations = {
 	.free_inode    = ubifs_free_inode,
 	.put_super     = ubifs_put_super,
 	.write_inode   = ubifs_write_inode,
+	.drop_inode    = ubifs_drop_inode,
 	.evict_inode   = ubifs_evict_inode,
 	.statfs        = ubifs_statfs,
 	.dirty_inode   = ubifs_dirty_inode,
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
