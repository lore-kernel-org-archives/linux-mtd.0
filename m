Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CDCC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJVmm27sg7UUwz/uE9M+khD+9qL5Mz5CMpVC+WXdrZg=; b=zlg6UxAcYomiK4
	mXtuf2WqqOyTOf8z6afpdUkdHR0epQyQT3yGFLABjS4R4PCvBzoRSivnGNbi7/9gUbzWbgndTY8Pw
	kiiqPIy1AyD1phdib4UyzJoZnVfB09f86qh3lUu8XGm3kjfrhXuGjqxFDGu7ewnBkMdz0mZ4L/CEa
	0w1icCr52jCRotS173e4275DcAc8rHWinmP1Jwp6LmHmSCZcF2sLwRpXxGp/JxUbRjrNEIC1hq92M
	lQAphOkHRM0nRYtatndEUWfN4HIwhmJlLcg/Tz6Kpk4nw0egjEuS2+xEUiLtBXADrIfUl8VdbP/Dd
	LXijaAAudRYe4M5j5CwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE6gp-0037TI-0P;
	Fri, 15 Dec 2023 11:49:11 +0000
Received: from mail.infraroot.at ([54.37.73.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE6gk-0037SS-16
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 11:49:08 +0000
Received: from workstation.fritz.box (clnet-p04-043.ikbnet.co.at [83.175.81.43])
	by mail.infraroot.at (Postfix) with ESMTPSA id 151C23F0E7;
	Fri, 15 Dec 2023 12:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.infraroot.at 151C23F0E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infraroot.at;
	s=default; t=1702640937;
	bh=/h5a7HmjhkoX1bAo7H+y/gZCJO1hQ1OTIAgKd8TQeWg=;
	h=From:To:Cc:Subject:Date:From;
	b=iqO/RnevluljAjirXvzMsmSQ4zdRU7BgNsykQyhhnJwu6p8YzO6XjKMlkK/9NWrak
	 wiUKBK5sRwC9Agc0d63h9T5NYL7n9sN0h77tXvXXS3NEjxzcZDID+Z1mZJ+5xjX++1
	 ZJx7+a0Bi6GTIyyNZpT177hER5CKQA3lCYrbSge4=
From: David Oberhollenzer <goliath@infraroot.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	richard@nod.at
Subject: [PATCH] mkfs.ubifs: fix xattr scanning for builds with selinux support
Date: Fri, 15 Dec 2023 12:48:21 +0100
Message-ID: <20231215114824.15236-1-goliath@infraroot.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_034906_846024_61C5DC69 
X-CRM114-Status: GOOD (  15.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

mkfs.uibfs can add Selinux xattrs from a labeling file using
libselinux to parse it. The commit that added this feature simply
introduced a separate function, inode_add_selinux_xattr, which is
called instead of inode_add_xattr. If no --selinux argument is
specified for mkfs.ubifs, this is a no-op.

The problem is, that this breaks xattr scanning for any build with
Selinux enabled. The Selinux version is always called and it does
not scan for xattrs on the filesystem, or dispatch to the original.

This commit fixes the xattr scanning behavior. We unconditionally call
both functions (they each have no-op implementations if the feature
is missing) and in the regular xattr scanning code, we skip selinux
attributes, if the --selinux option was given.

Fixes: f1feccec5ad8 ("mkfs.ubifs: Implement selinux labelling support")

Signed-off-by: David Oberhollenzer <goliath@infraroot.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 15e6bdc..8f8d40b 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -56,7 +56,6 @@
 #ifdef WITH_SELINUX
 #define XATTR_NAME_SELINUX "security.selinux"
 static struct selabel_handle *sehnd;
-static char *secontext;
 #endif
 
 /**
@@ -1389,6 +1388,15 @@ static int inode_add_xattr(struct ubifs_ino_node *host_ino,
 			continue;
 		}
 
+#ifdef WITH_SELINUX
+		/*
+		  Ignore selinux attributes if we have a label file, they are
+		  instead provided by inode_add_selinux_xattr.
+		 */
+		if (!strcmp(name, XATTR_NAME_SELINUX) && context && sehnd)
+			continue;
+#endif
+
 		ret = add_xattr(host_ino, st, inum, name, attrbuf, attrsize);
 		if (ret < 0)
 			goto out_free;
@@ -1413,12 +1421,10 @@ static int inode_add_selinux_xattr(struct ubifs_ino_node *host_ino,
 	char *sepath = NULL;
 	char *name;
 	unsigned int con_size;
+	char *secontext;
 
-	if (!context || !sehnd) {
-		secontext = NULL;
-		con_size = 0;
+	if (!context || !sehnd)
 		return 0;
-	}
 
 	if (path_name[strlen(root)] == '/')
 		sepath = strdup(&path_name[strlen(root)]);
@@ -1595,11 +1601,11 @@ static int add_inode(struct stat *st, ino_t inum, void *data,
 	len = UBIFS_INO_NODE_SZ + data_len;
 
 	if (xattr_path) {
-#ifdef WITH_SELINUX
 		ret = inode_add_selinux_xattr(ino, xattr_path, st, inum);
-#else
+		if (ret < 0)
+			return ret;
+
 		ret = inode_add_xattr(ino, xattr_path, st, inum);
-#endif
 		if (ret < 0)
 			return ret;
 	}
-- 
2.42.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
