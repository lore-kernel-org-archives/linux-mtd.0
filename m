Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E4ED12D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nJiFxB16RG5Fr/JJtoT2IwACzazFl9C5YBpwb3Dpok=; b=MOkwopp8q5OZ0f
	H/bl5HDBZlGlDGB9otBazruYid0r4LJvrVB5oXZMKVSV3LSDvIlOY9FNWV14J4u4AKhPs8oygpz2b
	FJPeILaixqQ1xfSodBwfcRYxrBCRV/SVzaSw4+zQYOKv+L8oHCqsK3Otri/r0/lDU3Po+iQB8tFAr
	PXjwgtJBk9DhBGRJI1P2MhIxgpmXPFoyWz5vcAtOKBfrv19QQoZo8+/XXvZyAf6ZiKs7af+5oAUGF
	u+lLvhjAtWbq3sbAeGiUfx1JnSlS6SiB+1FGpPz+tdqjK+JVvRG5dy9hDSydqcvGQ3QB9F2khm263
	2M0fjEjbPucc7nxzxvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPTv-0000000Gkag-0hDl;
	Mon, 11 Nov 2024 08:09:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSp-0000000GjmY-0jAj
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 08:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nvcouXUn6hpYDqzWtNyUREoYphv5BiYQXqZWwmFf95c=; b=hZCiIhGKx+y/j4BG33Syrjc4AD
	FYU2PfsLmp52VRCQcsTr6p1LaY6jiMam2wXUjI+LnFfrJyKNt4CA6liUjhwf27bwesC1FVgWCFcD5
	COr0ka5XkNzy1NnChb7UBvLmzo3jTuVSvYDNfylPTSGrFFSKdLUbZdNV201SvEtJD0rr2dGM8Kht1
	qB4IYNl9YG11Duauy7BF4Y2ZNaLSdW2gRKErFLEfZpSYrEzF8OAO1I7ia+txlA6Frwjb80zpAWquX
	QMjV0D0dP0G5vmo4UMyVtXIBsWdVFhMUT/KvVhZtOWfOLz24Gp7Fh/e4U4NSkpOJbH+cszcVDKR15
	NXckzpyQ==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSj-0000000CnCo-2KRk
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:07:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn2F71g6CzQsrh;
	Mon, 11 Nov 2024 16:06:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A6BDE1400D8;
	Mon, 11 Nov 2024 16:07:47 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:07:47 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 055/102] fsck.ubifs: rebuild_fs: Remove deleted nodes from valid node tree
Date: Mon, 11 Nov 2024 16:06:09 +0800
Message-ID: <20241111080621.1394382-30-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_080754_874615_DD65B477 
X-CRM114-Status: GOOD (  14.85  )
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

This is the 2/12 step of rebuilding. Traverse nodes from del_inos and
del_dents trees, remove inode nodes and dentry nodes with smaller sqnum
from valid trees.

This step handles deleting case, for example, file A is deleted, deleted
inode node and deleted dentry node are written, if we ignore the deleted
nodes, file A can be recovered after rebuilding because undeleted inode
node and undeleted dentry node can be scanned. There's an exception, if
deleted inode node and deleted dentry node are reclaimed(by gc) after
deletion, file A is recovered. UBIFS rebuild_fs cannot solve it, because
the real existence information of nodes depends on TNC, but TNC should
not be depended for UBIFS rebuild_fs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 120 +++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index 3ca94869..dbb0f3bc 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -364,6 +364,117 @@ out:
 	return err;
 }
 
+static struct scanned_ino_node *
+lookup_valid_ino_node(struct ubifs_info *c, struct scanned_info *si,
+		      struct scanned_ino_node *target)
+{
+	int cmp;
+	struct scanned_ino_node *ino_node;
+	struct rb_node *p;
+
+	p = si->valid_inos.rb_node;
+	while (p) {
+		ino_node = rb_entry(p, struct scanned_ino_node, rb);
+		cmp = keys_cmp(c, &target->key, &ino_node->key);
+		if (cmp < 0) {
+			p = p->rb_left;
+		} else if (cmp > 0) {
+			p = p->rb_right;
+		} else {
+			if (target->header.sqnum > ino_node->header.sqnum)
+				return ino_node;
+			else
+				return NULL;
+		}
+	}
+
+	return NULL;
+}
+
+static struct scanned_dent_node *
+lookup_valid_dent_node(struct ubifs_info *c, struct scanned_info *si,
+		       struct scanned_dent_node *target)
+{
+	int cmp, nlen;
+	struct scanned_dent_node *dent_node;
+	struct rb_node *p;
+
+	p = si->valid_dents.rb_node;
+	while (p) {
+		dent_node = rb_entry(p, struct scanned_dent_node, rb);
+		cmp = keys_cmp(c, &target->key, &dent_node->key);
+		if (cmp < 0) {
+			p = p->rb_left;
+		} else if (cmp > 0) {
+			p = p->rb_right;
+		} else {
+			nlen = min(target->nlen, dent_node->nlen);
+			cmp = strncmp(target->name, dent_node->name, nlen) ? :
+				      target->nlen - dent_node->nlen;
+			if (cmp < 0) {
+				p = p->rb_left;
+			} else if (cmp > 0) {
+				p = p->rb_right;
+			} else {
+				if (target->header.sqnum >
+				    dent_node->header.sqnum)
+					return dent_node;
+				else
+					return NULL;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * remove_del_nodes - remove deleted nodes from valid node tree.
+ * @c: UBIFS file-system description object
+ * @si: records nodes and files information during scanning
+ *
+ * This function compares sqnum between deleted node and corresponding valid
+ * node, removes valid node from tree if the sqnum of deleted node is bigger.
+ * Deleted ino/dent nodes will be removed from @si->del_inos/@si->del_dents
+ * after this function finished.
+ */
+static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
+{
+	struct scanned_ino_node *del_ino_node, *valid_ino_node;
+	struct scanned_dent_node *del_dent_node, *valid_dent_node;
+	struct rb_node *this;
+
+	this = rb_first(&si->del_inos);
+	while (this) {
+		del_ino_node = rb_entry(this, struct scanned_ino_node, rb);
+		this = rb_next(this);
+
+		valid_ino_node = lookup_valid_ino_node(c, si, del_ino_node);
+		if (valid_ino_node) {
+			rb_erase(&valid_ino_node->rb, &si->valid_inos);
+			kfree(valid_ino_node);
+		}
+
+		rb_erase(&del_ino_node->rb, &si->del_inos);
+		kfree(del_ino_node);
+	}
+
+	this = rb_first(&si->del_dents);
+	while (this) {
+		del_dent_node = rb_entry(this, struct scanned_dent_node, rb);
+		this = rb_next(this);
+
+		valid_dent_node = lookup_valid_dent_node(c, si, del_dent_node);
+		if (valid_dent_node) {
+			rb_erase(&valid_dent_node->rb, &si->valid_dents);
+			kfree(valid_dent_node);
+		}
+
+		rb_erase(&del_dent_node->rb, &si->del_dents);
+		kfree(del_dent_node);
+	}
+}
+
 /**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
@@ -389,9 +500,16 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	/* Step 1: Scan valid/deleted nodes from volume. */
 	log_out(c, "Scan nodes");
 	err = scan_nodes(c, &si);
-	if (err)
+	if (err) {
 		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+
+	/* Step 2: Remove deleted nodes from valid node tree. */
+	log_out(c, "Remove deleted nodes");
+	remove_del_nodes(c, &si);
 
+out:
 	destroy_scanned_info(c, &si);
 	destroy_rebuild_info(c);
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
