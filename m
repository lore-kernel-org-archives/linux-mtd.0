Return-Path: <SRS0=Slyc=WO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D262C3A589
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 16:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0C52184D
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 16:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sbezv15F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlw3BTHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D0C52184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7rObGH+sy77COuuxgCgcw2lGcAXyG/IRfp9ghngVgvg=; b=Sbezv15FXunGhTwuChFmL8wfTs
	zL4bf5RjCAVNFqRl+4QZLu/jUHKbZhE+oN+cXQePloHSojR02smgIkABjV5SoIfmsGj7syLTLloRe
	HPpw+5gfWgFMUOTUGGZTVTYltvc3AkyQT5Y21n0FL1eGFTN57uaMmg+xLwGkGQhr9mUm22jQhotbH
	2gEBSNkDNj7eHThsEXUxa/qYMF7I+juJiTfI6XwGdAPNpjzaBuNj+fH2wFdodfwfFaZKXV+1d9aE5
	FroAu6z+c34Aqx4US9xvv3jguT4PXGuYIvxi2YnEzz/KnJrBxS8FeZeCuFu5Q3o5E9sDqhpcEVetR
	lcbYEzeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzOWr-0007bF-OT; Sun, 18 Aug 2019 16:59:41 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzOWo-0007ZV-P8
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2019 16:59:40 +0000
Received: by mail-pf1-x443.google.com with SMTP id 129so5727211pfa.4
 for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2019 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XBoGugkhUC7RzEVn8NEyVinAwt3h5A3UJUwpo03Y32I=;
 b=mlw3BTHmR65CECBGBfXGXHjTZ5nyHwdI6R8Rp5DQ3oO8pXG6+/TVmoY/X1eUUe7m4M
 NywGeGa506MTS3HvJq+RKK7t3qeBzAy0zkmEjQJUw3iRS7ZGFvkA54/44d4skmg4mKPp
 9BM+1IdlEpQwrbDb0bEN9VuGlPsG04Lgn7VDjI80Je7xwzN/p4ERNoksd0iHF6EWwxJ9
 yscfg30lVzUcx3ZCiC0DGkrfUzoJicdlyogkoyW98sWY9bVjzwIJaV4mduy5FAvxqsxn
 +J4B9McSFexn31/NZCFP74SXSJo58mjK/ALWOZExwDIlSqEGlWhsWa+t49PyLth6Z1T9
 fn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XBoGugkhUC7RzEVn8NEyVinAwt3h5A3UJUwpo03Y32I=;
 b=gnqOMjMDzmbCHFc2IKyQSNUs+aIGi/cT6ENXIV6I8FFqVDBEuUlpDEyhMB338oM37J
 fzQrQVEZfF/IR8/9gzfAllwvHWE/VohuCsR6vznHcpfaUkkBwMS35siabggzp2UdyeeT
 reY0ALDbSHENWO2QZNZ2PUN078xlRTeDZeZUZhnm8gj8K5WayyGi7U+82lBRzgdxWy3Q
 37WWoN+nUWBkdx/HN5auQa+AaHFWy2tqMUmARp3/RB1OlteRON3wJO882tDnFCnJWjmJ
 3qY8sh3XTSrc1k7YOiQVKhf3nsqpI8fqthG0FgctwVkqhAFKWVs2wlcZGFufYErdXmN+
 Awhw==
X-Gm-Message-State: APjAAAWKSpRZYwXIj3oaqULDcnXz8onTptfeS5s3SVMtFy0P4K3U64Qb
 /H9n2l8Oh22W5b1qdZ5pQ0E=
X-Google-Smtp-Source: APXvYqyMocWQPnOEOvETytOVzxJTuHH9RsqGxnRaQNh5G1nPmvEKz71Glx/Lb38BKq0xU4X4UktRWA==
X-Received: by 2002:a63:e20a:: with SMTP id q10mr16098732pgh.24.1566147577789; 
 Sun, 18 Aug 2019 09:59:37 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id b136sm15732831pfb.73.2019.08.18.09.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 09:59:37 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/20] timestamp_truncate: Replace users of timespec64_trunc
Date: Sun, 18 Aug 2019 09:58:00 -0700
Message-Id: <20190818165817.32634-4-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_095938_816055_EED90330 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: arnd@arndb.de, dedekind1@gmail.com, y2038@lists.linaro.org,
 gregkh@linuxfoundation.org, yuchao0@huawei.com, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, tj@kernel.org,
 linux-mtd@lists.infradead.org, jlbec@evilplan.org, richard@nod.at,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, hch@lst.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update the inode timestamp updates to use timestamp_truncate()
instead of timespec64_trunc().

The change was mostly generated by the following coccinelle
script.

virtual context
virtual patch

@r1 depends on patch forall@
struct inode *inode;
identifier i_xtime =~ "^i_[acm]time$";
expression e;
@@

inode->i_xtime =
- timespec64_trunc(
+ timestamp_truncate(
...,
- e);
+ inode);

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: adrian.hunter@intel.com
Cc: dedekind1@gmail.com
Cc: gregkh@linuxfoundation.org
Cc: hch@lst.de
Cc: jaegeuk@kernel.org
Cc: jlbec@evilplan.org
Cc: richard@nod.at
Cc: tj@kernel.org
Cc: yuchao0@huawei.com
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: linux-mtd@lists.infradead.org
---
 fs/attr.c           | 21 ++++++++++++---------
 fs/configfs/inode.c | 12 ++++++------
 fs/f2fs/file.c      | 21 ++++++++++++---------
 fs/kernfs/inode.c   |  7 +++----
 fs/ntfs/inode.c     | 21 ++++++++++++---------
 fs/ubifs/file.c     | 21 ++++++++++++---------
 6 files changed, 57 insertions(+), 46 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 1fcfdcc5b367..97b60ad7f419 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -183,15 +183,18 @@ void setattr_copy(struct inode *inode, const struct iattr *attr)
 		inode->i_uid = attr->ia_uid;
 	if (ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
-	if (ia_valid & ATTR_ATIME)
-		inode->i_atime = timespec64_trunc(attr->ia_atime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_MTIME)
-		inode->i_mtime = timespec64_trunc(attr->ia_mtime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_CTIME)
-		inode->i_ctime = timespec64_trunc(attr->ia_ctime,
-						  inode->i_sb->s_time_gran);
+	if (ia_valid & ATTR_ATIME) {
+		inode->i_atime = timestamp_truncate(attr->ia_atime,
+						  inode);
+	}
+	if (ia_valid & ATTR_MTIME) {
+		inode->i_mtime = timestamp_truncate(attr->ia_mtime,
+						  inode);
+	}
+	if (ia_valid & ATTR_CTIME) {
+		inode->i_ctime = timestamp_truncate(attr->ia_ctime,
+						  inode);
+	}
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
 
diff --git a/fs/configfs/inode.c b/fs/configfs/inode.c
index ab0284321912..884dcf06cfbe 100644
--- a/fs/configfs/inode.c
+++ b/fs/configfs/inode.c
@@ -76,14 +76,14 @@ int configfs_setattr(struct dentry * dentry, struct iattr * iattr)
 	if (ia_valid & ATTR_GID)
 		sd_iattr->ia_gid = iattr->ia_gid;
 	if (ia_valid & ATTR_ATIME)
-		sd_iattr->ia_atime = timespec64_trunc(iattr->ia_atime,
-						      inode->i_sb->s_time_gran);
+		sd_iattr->ia_atime = timestamp_truncate(iattr->ia_atime,
+						      inode);
 	if (ia_valid & ATTR_MTIME)
-		sd_iattr->ia_mtime = timespec64_trunc(iattr->ia_mtime,
-						      inode->i_sb->s_time_gran);
+		sd_iattr->ia_mtime = timestamp_truncate(iattr->ia_mtime,
+						      inode);
 	if (ia_valid & ATTR_CTIME)
-		sd_iattr->ia_ctime = timespec64_trunc(iattr->ia_ctime,
-						      inode->i_sb->s_time_gran);
+		sd_iattr->ia_ctime = timestamp_truncate(iattr->ia_ctime,
+						      inode);
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = iattr->ia_mode;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 89a9ee22296d..af8cdd345f3d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -749,15 +749,18 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
 		inode->i_uid = attr->ia_uid;
 	if (ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
-	if (ia_valid & ATTR_ATIME)
-		inode->i_atime = timespec64_trunc(attr->ia_atime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_MTIME)
-		inode->i_mtime = timespec64_trunc(attr->ia_mtime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_CTIME)
-		inode->i_ctime = timespec64_trunc(attr->ia_ctime,
-						  inode->i_sb->s_time_gran);
+	if (ia_valid & ATTR_ATIME) {
+		inode->i_atime = timestamp_truncate(attr->ia_atime,
+						  inode);
+	}
+	if (ia_valid & ATTR_MTIME) {
+		inode->i_mtime = timestamp_truncate(attr->ia_mtime,
+						  inode);
+	}
+	if (ia_valid & ATTR_CTIME) {
+		inode->i_ctime = timestamp_truncate(attr->ia_ctime,
+						  inode);
+	}
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
 
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index f3f3984cce80..f3eaa8869f42 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -158,12 +158,11 @@ static inline void set_default_inode_attr(struct inode *inode, umode_t mode)
 static inline void set_inode_attr(struct inode *inode,
 				  struct kernfs_iattrs *attrs)
 {
-	struct super_block *sb = inode->i_sb;
 	inode->i_uid = attrs->ia_uid;
 	inode->i_gid = attrs->ia_gid;
-	inode->i_atime = timespec64_trunc(attrs->ia_atime, sb->s_time_gran);
-	inode->i_mtime = timespec64_trunc(attrs->ia_mtime, sb->s_time_gran);
-	inode->i_ctime = timespec64_trunc(attrs->ia_ctime, sb->s_time_gran);
+	inode->i_atime = timestamp_truncate(attrs->ia_atime, inode);
+	inode->i_mtime = timestamp_truncate(attrs->ia_mtime, inode);
+	inode->i_ctime = timestamp_truncate(attrs->ia_ctime, inode);
 }
 
 static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 8baa34baf548..6c7388430ad3 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2899,15 +2899,18 @@ int ntfs_setattr(struct dentry *dentry, struct iattr *attr)
 			ia_valid |= ATTR_MTIME | ATTR_CTIME;
 		}
 	}
-	if (ia_valid & ATTR_ATIME)
-		vi->i_atime = timespec64_trunc(attr->ia_atime,
-					       vi->i_sb->s_time_gran);
-	if (ia_valid & ATTR_MTIME)
-		vi->i_mtime = timespec64_trunc(attr->ia_mtime,
-					       vi->i_sb->s_time_gran);
-	if (ia_valid & ATTR_CTIME)
-		vi->i_ctime = timespec64_trunc(attr->ia_ctime,
-					       vi->i_sb->s_time_gran);
+	if (ia_valid & ATTR_ATIME) {
+		vi->i_atime = timestamp_truncate(attr->ia_atime,
+					       vi);
+	}
+	if (ia_valid & ATTR_MTIME) {
+		vi->i_mtime = timestamp_truncate(attr->ia_mtime,
+					       vi);
+	}
+	if (ia_valid & ATTR_CTIME) {
+		vi->i_ctime = timestamp_truncate(attr->ia_ctime,
+					       vi);
+	}
 	mark_inode_dirty(vi);
 out:
 	return err;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 400970d740bb..cd52585c8f4f 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1078,15 +1078,18 @@ static void do_attr_changes(struct inode *inode, const struct iattr *attr)
 		inode->i_uid = attr->ia_uid;
 	if (attr->ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
-	if (attr->ia_valid & ATTR_ATIME)
-		inode->i_atime = timespec64_trunc(attr->ia_atime,
-						  inode->i_sb->s_time_gran);
-	if (attr->ia_valid & ATTR_MTIME)
-		inode->i_mtime = timespec64_trunc(attr->ia_mtime,
-						  inode->i_sb->s_time_gran);
-	if (attr->ia_valid & ATTR_CTIME)
-		inode->i_ctime = timespec64_trunc(attr->ia_ctime,
-						  inode->i_sb->s_time_gran);
+	if (attr->ia_valid & ATTR_ATIME) {
+		inode->i_atime = timestamp_truncate(attr->ia_atime,
+						  inode);
+	}
+	if (attr->ia_valid & ATTR_MTIME) {
+		inode->i_mtime = timestamp_truncate(attr->ia_mtime,
+						  inode);
+	}
+	if (attr->ia_valid & ATTR_CTIME) {
+		inode->i_ctime = timestamp_truncate(attr->ia_ctime,
+						  inode);
+	}
 	if (attr->ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
