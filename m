Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24430C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACFC21773
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lm5h1i5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACFC21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jkw8YbH7ey3S2v6xW28nyww0tBiRkXFC8awCarUkbsQ=; b=Lm5h1i5GH8j+Y0
	Bnwr1zK6Pikyjp1xgqHWCMeN3s+Xbes/PEA9gJ/tCx1mDcVVykfc5KkU3IZu5q9peS7MF+lZk41bQ
	B07XnYFNsy+bAkZYBdFdmsm6iUKQyJFxsM+x1BJi1JaUnODgnnVL6ioRyCVQJg9Pv9H8k8IEXPVTv
	atY7bO1PQ/FDA8RzQIBt3Ggb8gkK+PVL4LkEUsXDj9tYAWFs7rxpsCqKSCl/NN4Wadg35K8Br4jCy
	UeyX3R7h7RjODwjXUuCc+bltXBWkcqvM1zryMQMyOmK2Vrk8F+JpI1oq5zLhnzeWG4rf8F7mz1L1O
	ehM9PrByxGsKWscBUzxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwOwu-00085K-Se; Wed, 20 Feb 2019 10:17:57 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwOwV-0007TP-0O
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 10:17:34 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 78F2AC69D46C9B889770;
 Wed, 20 Feb 2019 18:17:25 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Feb 2019
 18:17:16 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] jffs2: reset pino_nlink to 0 when inode creation failed
Date: Wed, 20 Feb 2019 18:21:32 +0800
Message-ID: <20190220102133.7878-2-houtao1@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
In-Reply-To: <20190220102133.7878-1-houtao1@huawei.com>
References: <20190220102133.7878-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_021731_612353_FD41F09B 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

So jffs2_do_clear_inode() could mark all flash nodes used by
the inode as obsolete and GC procedure will reclaim these
flash nodes, else these flash spaces will not be reclaimable
forever.

Cc: stable@vger.kernel.org
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/dir.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index f20cff1194bb..e02f85e516cb 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -156,6 +156,26 @@ static int jffs2_readdir(struct file *file, struct dir_context *ctx)
 
 /***********************************************************************/
 
+static void jffs2_iget_failed(struct jffs2_sb_info *c, struct inode *inode)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+
+	/*
+	 * Reset pino_nlink to zero, so jffs2_do_clear_inode() will mark
+	 * all flash nodes used by the inode as obsolete and GC procedure
+	 * will reclaim these flash nodes, else these flash spaces will be
+	 * unreclaimable forever.
+	 *
+	 * Update pino_nlink under inocache_lock, because no proceses could
+	 * get the inode due to I_NEW flag, and only GC procedure may try to
+	 * read pino_nlink under inocache_lock.
+	 */
+	spin_lock(&c->inocache_lock);
+	f->inocache->pino_nlink = 0;
+	spin_unlock(&c->inocache_lock);
+
+	iget_failed(inode);
+}
 
 static int jffs2_create(struct inode *dir_i, struct dentry *dentry,
 			umode_t mode, bool excl)
@@ -213,7 +233,7 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry,
 	return 0;
 
  fail:
-	iget_failed(inode);
+	jffs2_iget_failed(c, inode);
 	jffs2_free_raw_inode(ri);
 	return ret;
 }
@@ -433,7 +453,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	return 0;
 
  fail:
-	iget_failed(inode);
+	jffs2_iget_failed(c, inode);
 	return ret;
 }
 
@@ -577,7 +597,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	return 0;
 
  fail:
-	iget_failed(inode);
+	jffs2_iget_failed(c, inode);
 	return ret;
 }
 
@@ -748,7 +768,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	return 0;
 
  fail:
-	iget_failed(inode);
+	jffs2_iget_failed(c, inode);
 	return ret;
 }
 
-- 
2.16.2.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
