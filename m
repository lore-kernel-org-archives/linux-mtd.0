Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B20C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdSvz+crifS+pP3Gunupxenp0iEJOlDQQhVd7eDI3J4=; b=uGqEcO6qo5cpeY
	WU2T2jvCXcvFi4TPuifPOrlc5omWyA3xhSUIivchh3TJdqTljLbbX+ygxk6Sc2v1mRJpXckped8tG
	xK3T00EIIKSiTkP51BoyysTiKADJ2pMIdjxlxUvq3fa6svJqFMoHCl1WOmPIlfjIb5B1sB/s2CS3L
	BGX2TBp1n5brdLLN2muOGsL4VvbtGaKomhlULKzuC2gWv/zOqw3Z1+rzcaRnd2OQu1zRL345uU/bH
	l+R+OL3xJJb3A1u5EZh034X+nd4gXOBFO07LqKcsRrxffp/yilbCnhpx+5zvMo8cUEG0FAmiKtpP0
	SbdA7SJPzOC6lCgEc8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSEO-0000000CVl5-3Pt8;
	Fri, 07 Jun 2024 05:33:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCt-0000000CHAj-2TA9
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=QE5g8RPnwusKOTRuYKyfQyTkrwluhoS5aHv/QqmVEHA=; b=fw/X/2VRRZ8KFAK7oHAmgwYFQJ
	b8MnmzRtVuxHb/Z3ahxGc070C6qijVZhWVBNq3Puho4UdV+SZrscaz2dYHBI76O1jfck57MEvEQc7
	d2LYADiG9G5oHMCEpJ1es75+Pw3PUQ0gwZWBZzvN6+ffMrdEE1ngrC/LuyTCspuRRS1Q0zKaKuWKi
	p53EsAEKnZhyzWWnEySWTGMbUaeytfRaPBBJiRnHHiR+sTEjIPyRGXHZwUjpHfg13A7tpzHdYeQY2
	iC/E6PS16PT8FU+OYDOUX90LJ+25wxkvN/+Tma0HUrCGsuREXUY6HK+BeTu6YfTUhhMESUGptFUh3
	Mmc3XQpg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCp-00000004U6b-0fMJ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSk722sLzwSGt;
	Fri,  7 Jun 2024 12:23:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 32409180AA7;
	Fri,  7 Jun 2024 12:27:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:14 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 065/110] fsck.ubifs: rebuild_fs: Add valid nodes into file
Date: Fri, 7 Jun 2024 12:25:30 +0800
Message-ID: <20240607042615.2069840-66-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052759_827491_D2D5417C 
X-CRM114-Status: GOOD (  11.72  )
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

This is the 3/12 step of rebuilding. Generate file according to left valid
inode nodes and dentry nodes. Based on the results from step 2, it is easy
to understand:

Step 2 has done:
 valid_inos - del_inos = left_inos
 valid_dents - del_dents = left_dents
Step 3 should do:
 Traverse left_inos and left_dents, insert inode/dentry nodes into
 corresponding file.

After that, all files are generated by scanning, the next thing to do is
dropping invalid files(eg. nonconsistent file type between inode node and
dentry nodes, file has no dentry nodes(excepts '/'), encrypted file has
no xattr information, etc.), which will be done in next step.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index dbb0f3bc..a86430d0 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -476,6 +476,61 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 }
 
 /**
+ * add_valid_nodes_into_file - add valid nodes into file.
+ * @c: UBIFS file-system description object
+ * @si: records nodes and files information during scanning
+ *
+ * This function adds valid nodes into corresponding file, all valid ino/dent
+ * nodes will be removed from @si->valid_inos/@si->valid_dents if the function
+ * is executed successfully.
+ */
+static int add_valid_nodes_into_file(struct ubifs_info *c,
+				     struct scanned_info *si)
+{
+	int err, type;
+	ino_t inum;
+	struct scanned_node *sn;
+	struct scanned_ino_node *ino_node;
+	struct scanned_dent_node *dent_node;
+	struct rb_node *this;
+	struct rb_root *tree = &FSCK(c)->rebuild->scanned_files;
+
+	this = rb_first(&si->valid_inos);
+	while (this) {
+		ino_node = rb_entry(this, struct scanned_ino_node, rb);
+		this = rb_next(this);
+
+		sn = (struct scanned_node *)ino_node;
+		type = key_type(c, &ino_node->key);
+		inum = key_inum(c, &ino_node->key);
+		err = insert_or_update_file(c, tree, sn, type, inum);
+		if (err)
+			return err;
+
+		rb_erase(&ino_node->rb, &si->valid_inos);
+		kfree(ino_node);
+	}
+
+	this = rb_first(&si->valid_dents);
+	while (this) {
+		dent_node = rb_entry(this, struct scanned_dent_node, rb);
+		this = rb_next(this);
+
+		sn = (struct scanned_node *)dent_node;
+		inum = dent_node->inum;
+		type = key_type(c, &dent_node->key);
+		err = insert_or_update_file(c, tree, sn, type, inum);
+		if (err)
+			return err;
+
+		rb_erase(&dent_node->rb, &si->valid_dents);
+		kfree(dent_node);
+	}
+
+	return 0;
+}
+
+/**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
  *
@@ -509,6 +564,12 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	log_out(c, "Remove deleted nodes");
 	remove_del_nodes(c, &si);
 
+	/* Step 3: Add valid nodes into file. */
+	log_out(c, "Add valid nodes into file");
+	err = add_valid_nodes_into_file(c, &si);
+	if (err)
+		exit_code |= FSCK_ERROR;
+
 out:
 	destroy_scanned_info(c, &si);
 	destroy_rebuild_info(c);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
