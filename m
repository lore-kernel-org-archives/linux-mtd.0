Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3FCCD1296
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lW7sKVM+kwdqPm/9wKpS1hiNw+J5RvJWKtEHXmDEqU=; b=cT/GrmJEbwwaPk
	nLEqLJk9hj4K41mnjzt0oF2k6lFHPnS/nMkysuCJIITqy0LqrZ4c2k8sW2u5YA8hp0ckXVW4oRxAH
	GPvxFX4T0sIkQhxejKiJBOsD/Uv54NEsL4Zdpo3gNiiqTMhnDyaCcr5SjxSvugGShByXWp227roQN
	9+2k31O6NBE/cn79Xbn/WrsVKuHQgMEcVx8hh7n1buB7TNZg+ogo7BRlvhsaNYinXTpcg1gugNIRx
	VJ1jul8tanOr2vJAP4HhubS98tW4gP7zXMy8KACnJPK9l6jP3CCKrR5qlwyL7rG2yrgsN3/6LhdrV
	sjDtLAiuBKrjGQywo3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfE-00000005gHU-3EeZ;
	Wed, 10 Apr 2024 07:46:36 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf9-00000005gBt-047D
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VDvvj2SvQz1RC5R;
	Wed, 10 Apr 2024 15:43:29 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 72E8818001A;
	Wed, 10 Apr 2024 15:46:21 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 1/9] ubifs: Fix unattached xattr inode if powercut happens after deleting
Date: Wed, 10 Apr 2024 15:37:43 +0800
Message-ID: <20240410073751.2522830-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004631_441001_51EC2831 
X-CRM114-Status: GOOD (  11.27  )
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

When powercut happens after deleting file, the xattr inode could be
alone existing in TNC but its' xattr entry cannot be found in TNC.
File inode and xattr inode are added into orphan list after deleting
file, file inode's nlink is 0 but xattr inode's nlink is not 0 (PS:
zero nlink xattr inode is written on disk in evicting process by
ubifs_jnl_write_inode). So, following process could happen:
 1. touch file
 2. setxattr(file)
 3. unlink file
    // inode(nlink=0), xattr inode(nlink=1) are added into orphan list
 4. commit
    // write inode inum and xattr inum into orphan area
 5. powercut
 6. mount
    do_kill_orphans
     // inode(nlink=0) is deleted from TNC by ubifs_tnc_remove_range,
     // xattr entry is deleted too.
     // xattr inode(nlink=1) is not deleted from TNC
Finally we could see following error while debugging UBIFS:
 UBIFS error (ubi0:0 pid 1093): dbg_check_filesystem [ubifs]: inode 66
 nlink is 1, but calculated nlink is 0
 UBIFS (ubi0:0): dump of the inode 66 sitting in LEB 12:2128
   node_type      0 (inode node)
   group_type     1 (in node group)
   len            197
   key            (66, inode)
   size           37
   nlink          1
   flags          0x20
   xattr_cnt      0
   xattr_size     0
   xattr_names    0
   data len       37

Fix it by removing entire inode with it's xattrs while replaying orphan,
just replace function ubifs_tnc_remove_range by ubifs_tnc_remove_ino.

Fixes: ee1438ce5dc4 ("ubifs: Check link count of inodes when killing orphans.")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218661
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/orphan.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 4909321d84cf..ddeb125e6930 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -691,12 +691,12 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 
 		n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
 		for (i = 0; i < n; i++) {
-			union ubifs_key key1, key2;
+			union ubifs_key key;
 
 			inum = le64_to_cpu(orph->inos[i]);
 
-			ino_key_init(c, &key1, inum);
-			err = ubifs_tnc_lookup(c, &key1, ino);
+			ino_key_init(c, &key, inum);
+			err = ubifs_tnc_lookup(c, &key, ino);
 			if (err && err != -ENOENT)
 				goto out_free;
 
@@ -708,10 +708,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 				dbg_rcvry("deleting orphaned inode %lu",
 					  (unsigned long)inum);
 
-				lowest_ino_key(c, &key1, inum);
-				highest_ino_key(c, &key2, inum);
-
-				err = ubifs_tnc_remove_range(c, &key1, &key2);
+				err = ubifs_tnc_remove_ino(c, inum);
 				if (err)
 					goto out_ro;
 			}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
