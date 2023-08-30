Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039B0C83F14
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+UgGhsut6COpLSkvaClJWtZJB5pOmm4cqq0/48GU6g=; b=yniDRcycL+oLX/
	NIvAx52wPW7Thk9zGyvOmFdoQwK1fJ3GfsZZJhk+U2jcxu20N6gndf4A3nV6y1ZnApL9hb3gRPxfm
	v2pgW+F6LqExYUIzWonEZbvJeMVgtQGFnfNoqLWBDV5cticqnALBdCq92DVOJXEwvp3mouIGS0oiO
	oQ8jJ/EH+gamKdWehay7yuQIaugjXSIi+QyCzu6Lyga+xHCYZYZ4xkPg3nY5YEHmwEXNKaDxB5RrU
	bKRAKJqlYI3nH0pvZhlYjfN11srb/NzVu19XtmuJPAaTkJg2/iqvC0jZSLLPJN0gzl+7kSZprfvc/
	OnSTn9KfMOkcgG//KKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbI2K-00DBcb-13;
	Wed, 30 Aug 2023 10:02:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbI2H-00DBcE-0h
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 10:02:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69F9C60EAA;
	Wed, 30 Aug 2023 10:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F44C433C7;
	Wed, 30 Aug 2023 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693389771;
	bh=21KpJvsxmen+6ltxslnavLUss7C8n6CYIrpV8T6qub8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/m6uqfPOwtPSKlaXs9m67r/QL9JLEqrF9sLTeU3bDqWTeD4GBm93iknTCupun88O
	 ZAPieOkVfWTo0CDEK0Pq1K+dFKJ94bgt0AAxpMc86JDAbRcpK+/4UaOPvreJeuuXbx
	 UZz6hrKzHbv/27R6uuYCzaiGWndIVJYrkPBOleEB5mAFhes3VGudZnwDa1ormIYJlu
	 Q8ktSHnNmM1FwTKpDGBlMyYDMNrXeGLL8tb8HTujAodzvirPOT5PuwW7LdpcxTQcaW
	 ajOhFlCCIh/IhYlUdFSbmznUu2TpEWJm+fNpkjmwMuJp1YUnw8+lq6AeHSiJomudAe
	 MpMr0MJngJe7Q==
Date: Wed, 30 Aug 2023 12:02:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830-theater-quizsendung-4ba64e87df36@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
 <20230830061409.GB17785@lst.de>
 <20230830-befanden-geahndet-2f084125d861@brauner>
 <20230830093851.uwdgpt645niysuji@quack3>
 <20230830-ohnedies-umland-fb2b1a45db10@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830-ohnedies-umland-fb2b1a45db10@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_030253_384856_F5F2A8D4 
X-CRM114-Status: GOOD (  16.26  )
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

> Yeah, good point. Done.

From fe40c7fe1a87814f92f9b1d0b9fb78ac69404c33 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 29 Aug 2023 15:05:28 +0200
Subject: [PATCH 1/2] fs: export sget_dev()

They will be used for mtd devices as well.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/super.c         | 64 ++++++++++++++++++++++++++++++++--------------
 include/linux/fs.h |  1 +
 2 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index ad7ac3a24d38..d27d80bf7c43 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1371,6 +1371,50 @@ int get_tree_keyed(struct fs_context *fc,
 }
 EXPORT_SYMBOL(get_tree_keyed);
 
+static int set_bdev_super(struct super_block *s, void *data)
+{
+	s->s_dev = *(dev_t *)data;
+	return 0;
+}
+
+static int super_s_dev_set(struct super_block *s, struct fs_context *fc)
+{
+	return set_bdev_super(s, fc->sget_key);
+}
+
+static int super_s_dev_test(struct super_block *s, struct fs_context *fc)
+{
+	return !(s->s_iflags & SB_I_RETIRED) &&
+		s->s_dev == *(dev_t *)fc->sget_key;
+}
+
+/**
+ * sget_dev - Find or create a superblock by device number
+ * @fc: Filesystem context.
+ * @dev: device number
+ *
+ * Find or create a superblock using the provided device number that
+ * will be stored in fc->sget_key.
+ *
+ * If an extant superblock is matched, then that will be returned with
+ * an elevated reference count that the caller must transfer or discard.
+ *
+ * If no match is made, a new superblock will be allocated and basic
+ * initialisation will be performed (s_type, s_fs_info, s_id, s_dev will
+ * be set). The superblock will be published and it will be returned in
+ * a partially constructed state with SB_BORN and SB_ACTIVE as yet
+ * unset.
+ *
+ * Return: an existing or newly created superblock on success, an error
+ *         pointer on failure.
+ */
+struct super_block *sget_dev(struct fs_context *fc, dev_t dev)
+{
+	fc->sget_key = &dev;
+	return sget_fc(fc, super_s_dev_test, super_s_dev_set);
+}
+EXPORT_SYMBOL(sget_dev);
+
 #ifdef CONFIG_BLOCK
 /*
  * Lock a super block that the callers holds a reference to.
@@ -1429,23 +1473,6 @@ const struct blk_holder_ops fs_holder_ops = {
 };
 EXPORT_SYMBOL_GPL(fs_holder_ops);
 
-static int set_bdev_super(struct super_block *s, void *data)
-{
-	s->s_dev = *(dev_t *)data;
-	return 0;
-}
-
-static int set_bdev_super_fc(struct super_block *s, struct fs_context *fc)
-{
-	return set_bdev_super(s, fc->sget_key);
-}
-
-static int test_bdev_super_fc(struct super_block *s, struct fs_context *fc)
-{
-	return !(s->s_iflags & SB_I_RETIRED) &&
-		s->s_dev == *(dev_t *)fc->sget_key;
-}
-
 int setup_bdev_super(struct super_block *sb, int sb_flags,
 		struct fs_context *fc)
 {
@@ -1523,8 +1550,7 @@ int get_tree_bdev(struct fs_context *fc,
 	}
 
 	fc->sb_flags |= SB_NOSEC;
-	fc->sget_key = &dev;
-	s = sget_fc(fc, test_bdev_super_fc, set_bdev_super_fc);
+	s = sget_dev(fc, dev);
 	if (IS_ERR(s))
 		return PTR_ERR(s);
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ca8ceccde3d6..8a8d1cd5b0a9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2274,6 +2274,7 @@ struct super_block *sget(struct file_system_type *type,
 			int (*test)(struct super_block *,void *),
 			int (*set)(struct super_block *,void *),
 			int flags, void *data);
+struct super_block *sget_dev(struct fs_context *fc, dev_t dev);
 
 /* Alas, no aliases. Too much hassle with bringing module.h everywhere */
 #define fops_get(fops) \
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
