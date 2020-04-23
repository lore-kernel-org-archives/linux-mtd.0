Return-Path: <SRS0=a0wE=6H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D17FC55191
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 02:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C33E2075A
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 02:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqTrK2RU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C33E2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XyIV4cejqE/1UwX7wY+Z64s0pGuC9Pju5UEr+v403HU=; b=kqTrK2RUjFFyn8
	hfLJQNl0GC9ge3jDvD1pCcxR65WJryOSxIO4kW3u/ENguA11M7J8g7U0Mnjp/+0FoarZUKf1UY4VR
	1MPC6J/LBefIkEao8rZpdxbARkeOpgjpelGTHPdX6yuWkf8cE4ZFjzBot/85IvBbmj4rEd1moM210
	VGm2VSE1zaYgZPKz63TRnl2Ko9LcpxTxyFqK2DNqugj/IgyPpnAeV7chpskajOsIH4y1DJv5DVdJO
	sYIcBBWQg7VQyt0dKziljuAeFqvdnw7YPZ9I6yqzg4IADBrRv0fapMvEIPEYdlXqV9iq07bCeJfqE
	f9Arka4tK94PSlxNmNGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRS4k-0006Ks-3H; Thu, 23 Apr 2020 02:58:54 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRS4e-0006J6-HC
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2020 02:58:50 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0C94AA3BB17E71F72CD4;
 Thu, 23 Apr 2020 10:58:37 +0800 (CST)
Received: from SZXY1L005141301.china.huawei.com (10.40.90.207) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 10:58:34 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] jffs2: fix jffs2 mounting failure
Date: Thu, 23 Apr 2020 10:58:27 +0800
Message-ID: <20200423025827.48736-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.40.90.207]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_195848_753936_52AA4703 
X-CRM114-Status: GOOD (  15.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mounting jffs2 on nand flash will get message "failed: I/O error"
with the steps listed below.
1.erase nand flash
2.mount jffs2 on it (this mounting operation will be successful)
3.do chown or chmod to the mount point directory
4.umount jffs2
5.mount jffs2 on nand flash
After step 5, we will get message "mount ... failed: I/O error".

Typical image of this problem is like:
Empty space found from 0x00000000 to 0x008a0000
Inode node at xx, totlen 0x00000044, #ino 1, version 1, isize 0...

The reason for this mounting failure is that at the end of function
jffs2_scan_medium(), jffs2 will check the used_size and some info
of nr_blocks.If conditions are met, it will return -EIO.

The detail is that, in the steps listed above, step 3 will write
jffs2_raw_inode into flash without jffs2_raw_dirent, which will
cause that there are some jffs2_raw_inode but no jffs2_raw_dirent
on flash. This will meet the condition at the end of function
jffs2_scan_medium() and return -EIO if we umount jffs2 and mount it
again.

This patch add a flag in struct jffs2_sb_info to identify the info of
jffs2_raw_inode on flash. The info of jffs2_raw_inode can be devided
into two type--jffs2_raw_inode with ino != 1 and ino == 1. When we
do chown or chmod to the mount point directory, jffs2_raw_inode with
ino == 1 will be written into flash. So this flag use this flag to
identify this case and return success.

Signed-off-by: Zhe Li <lizhe67@huawei.com>
---
 fs/jffs2/build.c       |  1 +
 fs/jffs2/jffs2_fs_sb.h | 26 ++++++++++++++++++++++++++
 fs/jffs2/scan.c        |  8 +++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index b288c8a..d9fda40 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -405,6 +405,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_info *c)
 	INIT_LIST_HEAD(&c->bad_used_list);
 	c->highest_ino = 1;
 	c->summary = NULL;
+	c->inode_flag = INODE_FLAG_INIT;
 
 	ret = jffs2_sum_init(c);
 	if (ret)
diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 778275f..a01b5f4 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -27,6 +27,10 @@
 #define JFFS2_SB_FLAG_SCANNING 2 /* Flash scanning is in progress */
 #define JFFS2_SB_FLAG_BUILDING 4 /* File system building is in progress */
 
+#define INODE_FLAG_INIT 0
+#define INODE_FLAG_HAS_ROOT_INODE  (0x01 << 0)
+#define INODE_FLAG_HAS_OTHER_INODE (0x01 << 1)
+
 struct jffs2_inodirty;
 
 struct jffs2_mount_opts {
@@ -157,6 +161,28 @@ struct jffs2_sb_info {
 #endif
 	/* OS-private pointer for getting back to master superblock info */
 	void *os_priv;
+	/* this flag show the contained inodes info */
+	int inode_flag;
 };
 
+static inline void set_root_inode_flag(struct jffs2_sb_info *c)
+{
+	c->inode_flag |= INODE_FLAG_HAS_ROOT_INODE;
+}
+
+static inline void set_other_inode_flag(struct jffs2_sb_info *c)
+{
+	c->inode_flag |= INODE_FLAG_HAS_OTHER_INODE;
+}
+
+static inline int has_root_inode(struct jffs2_sb_info *c)
+{
+	return (c->inode_flag & INODE_FLAG_HAS_ROOT_INODE);
+}
+
+static inline int has_other_inode(struct jffs2_sb_info *c)
+{
+	return (c->inode_flag & INODE_FLAG_HAS_OTHER_INODE);
+}
+
 #endif /* _JFFS2_FS_SB */
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 5f7e284..ec13e08 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -261,7 +261,8 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	}
 #endif
 	if (c->nr_erasing_blocks) {
-		if ( !c->used_size && ((c->nr_free_blocks+empty_blocks+bad_blocks)!= c->nr_blocks || bad_blocks == c->nr_blocks) ) {
+		if (!c->used_size && ((c->nr_free_blocks+empty_blocks+bad_blocks) != c->nr_blocks || bad_blocks == c->nr_blocks) &&
+		    !(has_root_inode(c) && !has_other_inode(c))) {
 			pr_notice("Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes\n");
 			pr_notice("empty_blocks %d, bad_blocks %d, c->nr_blocks %d\n",
 				  empty_blocks, bad_blocks, c->nr_blocks);
@@ -1036,6 +1037,11 @@ static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 		jffs2_sum_add_inode_mem(s, ri, ofs - jeb->offset);
 	}
 
+	if (likely(ino != 1))
+		set_other_inode_flag(c);
+	else
+		set_root_inode_flag(c);
+
 	return 0;
 }
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
