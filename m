Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772EAC76186
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 03:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C60621841
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 03:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OhfVVcf6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHhbTm1T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C60621841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qSnvOO74cpelO94rM0OKsr5Xt5fRo6hlAM9Rev2fc8c=; b=OhfVVcf6AkB7+/mqebjdKTY4Q/
	5QjiVytzRBIP/RZkkDe2WeiMsAAFqUAnWaoydbYc6mGYr3ugUC8WYyBKPc6Cf77px9DybR4yR7EHM
	TC4lHm8fiLzHdEoSs+wStDnM6Vp01RimqtoxH2kkp1FjUuPZRRXGKuW3qQPZqf/nW5De6aFQm8mFt
	BlC9ELMOTn74XXGYp5OPJ4G62sKVk1ZvZ3TUb1MbN2HDbaxVzTG81m/4/cmxt9ObX4piMnwq6XCCG
	2TucIaVju25b7TETVpumey+crKmukXno+ahxLu7S6c5RFAx1gHcnBjRcTOAyStJSp6C6mjdv1exGu
	mgA2naMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsINY-00059L-G9; Tue, 30 Jul 2019 03:00:44 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsHHL-0008AU-IO
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 01:50:17 +0000
Received: by mail-pg1-x543.google.com with SMTP id r22so1564848pgk.10
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 18:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L/HD57pd50ajIUsHODxhnXGWHejzLDOdwJEP3n72SQw=;
 b=QHhbTm1TZgOm6WvfrheJvUVNeDXD58E3pX5WUEvt1BP91bmPiq5Zxlwe0W7TOYXoCN
 MkNfx9qLLj8fyaP3b7IF4i6G6Mkgb23PHdlgaNIJRlu3NM6Es13SefEmhkB3J1UfIWGK
 soB7NWNFa20U8NYgNzlRF3WMC88RtL7qe0bTbQ1cvIhorC2b8kqE/RY85zKTkCEyBsQh
 BdKev0yI9rY4xF4cPnJ6NS8ZwaRWLLgKzkuAdtPNzcv+sltC90b1jYaaBMcLW3gtpjT0
 lcILku6POE4fQfSb3rTDmKTDv0Qjk9tMvj5rB3uc2hsoyfEIeJojb/BRzbD01DDJWzF+
 eymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L/HD57pd50ajIUsHODxhnXGWHejzLDOdwJEP3n72SQw=;
 b=fTZKdQPxV4k8IqEVx4q5qdMCg95sd08iICwUblApbWEbNGdTlRmIl5VHIot+uuCLYB
 ph9xiL9V+FRldEqaJVaw+QhLVSu5RL94Eg09U4Zwzw/wOQyySvHWUe2BFKC++nOmTN9I
 LxC5MOe9HNsHa5SvAuhZ/oDR43keWdfWhFrGG8e2kWGRRT75VGdUY63X30Tfs2Rgotkb
 yxGCElOjA9Oju7dAxxe35vc5G8qKkrstnQ7XCxyAuod9tvt8dz57CMcF5wMapQymbghY
 ddVLHviW0HayNFYBbBNE5oqE8k2WumeBZ31jQqxHIRkVezuQ/DHQUKCEIIyIEXH5eNt9
 OyRg==
X-Gm-Message-State: APjAAAWrLR0pR3yN32SEj2kpFV9yuvUeW+EueT9RRHy+5gcuL9LdmDLL
 viXpWwWugd16kfuEB3582tsIg1SzoUI=
X-Google-Smtp-Source: APXvYqymlfxXZkLKDbtTqqG4gNF0mEEFbRBNU2budVpRI6cIsHbCtGHUYAgZi7Jxv18tF300c570QQ==
X-Received: by 2002:a17:90a:bd0b:: with SMTP id
 y11mr109382806pjr.141.1564451414701; 
 Mon, 29 Jul 2019 18:50:14 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id r6sm138807156pjb.22.2019.07.29.18.50.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 18:50:14 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/20] timestamp_truncate: Replace users of timespec64_trunc
Date: Mon, 29 Jul 2019 18:49:07 -0700
Message-Id: <20190730014924.2193-4-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730014924.2193-1-deepa.kernel@gmail.com>
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_185015_613176_4DDB3764 
X-CRM114-Status: GOOD (  13.44  )
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
 linux-mtd@lists.infradead.org, hirofumi@mail.parknet.co.jp, richard@nod.at,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, hch@lst.de, anton@tuxera.com,
 jlbec@evilplan.org
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
Cc: anton@tuxera.com
Cc: dedekind1@gmail.com
Cc: gregkh@linuxfoundation.org
Cc: hch@lst.de
Cc: hirofumi@mail.parknet.co.jp
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
 fs/fat/misc.c       |  5 +++--
 fs/kernfs/inode.c   |  6 +++---
 fs/ntfs/inode.c     | 21 ++++++++++++---------
 fs/ubifs/file.c     | 21 ++++++++++++---------
 7 files changed, 60 insertions(+), 47 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index d22e8187477f..df28035aa23e 100644
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
index 45b45f37d347..faf1e160961b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -744,15 +744,18 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
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
 
diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 1e08bd54c5fb..53bb7c6bf993 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
 		inode->i_atime = (struct timespec64){ seconds, 0 };
 	}
 	if (flags & S_CTIME) {
-		if (sbi->options.isvfat)
-			inode->i_ctime = timespec64_trunc(*now, 10000000);
+		if (sbi->options.isvfat) {
+			inode->i_ctime = timestamp_truncate(*now, inode);
+		}
 		else
 			inode->i_ctime = fat_timespec64_trunc_2secs(*now);
 	}
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index f3f3984cce80..892a58cfe7a1 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -161,9 +161,9 @@ static inline void set_inode_attr(struct inode *inode,
 	struct super_block *sb = inode->i_sb;
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
