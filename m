Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3758C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5vPrPpiHkOxi4jozjvPGiadamCSylX4y+DgJoOxhDY=; b=OeLhb+VMGglH/v
	xmYFS8w7Oc2DpEgf7hkGXg7wCPmeejWkx1RMkLzc9wFoXk09dsCBqMOWpYR5j19jDHufu4C3vuj21
	M+cHbb1FbrOYVq+Tqu8r7RkXh0HYuxMcUDfjJrttor+9/Ac1kxWfhfm6VVPzxjhLL3jrnf7QCL+ox
	ZsetS5NZENa9IPY5Fxo8IZMb95jdgIkWVUR/xEvl6DjELS8VUiv/pn0i5rXN2UR7Mv1d5rT7C00iO
	2z8X7wmAFcj57VtjVlTDceLzLR5pe0SROO4FRNV09NKkQmJzJKikF+Lm8NpE/vpiwjF2uZX3XK1Rl
	WLMIPcWD1+p8Mc3NzSXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDy-0000000CI22-21C8;
	Fri, 07 Jun 2024 04:29:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCE-0000000CGd6-0rHP
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4P0FUmXIMbm2rgpNOY3618E5zhi4ml34GKai6Rf5y7Y=; b=ozuYRh4x0GpIidXkT4BEAeoYq/
	pNGV6uMkLuM5e6McO3ZadwclsQuSXP1KwLHEM4iH6gsqI+Z9g2pUo/Mbx6QuYP8RO0D5wtZXh8eP/
	8jWapwHfIE9X6bk3UfNVjhRme+Ni6qRaBRn5P+JKOuWEdvDWAmZjSyOLAf8uPvPp+02zFQ7lHl9sp
	81rv0jBITEGX1Aa6jQn3NBR72JxAAm22A0/IEFSk2oHZOeEpVhWGPgC7MmYQ5GwEYo+yJdqApqqo+
	/yr7GYaVl03jWSMJW6n3MZX3AqFKFh5auemxGiWw6cPDwqYAcHhTk0hFPxEK4fpp+tVMSPYmkpMHn
	pebs6TWw==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCA-00000004Tq9-1mTh
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSjs0zV8z1SB5N;
	Fri,  7 Jun 2024 12:23:13 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D6D50180085;
	Fri,  7 Jun 2024 12:27:11 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:03 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 050/110] ubifs-utils: Adapt misc.h in libubifs
Date: Fri, 7 Jun 2024 12:25:15 +0800
Message-ID: <20240607042615.2069840-51-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052719_151182_40947CCB 
X-CRM114-Status: GOOD (  11.51  )
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

Adapt misc.h in libubifs, compared with linux kernel implementations:
 1. Remove some functions(eg. ubifs_compr_name, ubifs_wake_up_bgt) which
    won't be used in fsck/mkfs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/misc.h | 75 +--------------------------------------------
 1 file changed, 1 insertion(+), 74 deletions(-)

diff --git a/ubifs-utils/libubifs/misc.h b/ubifs-utils/libubifs/misc.h
index 615878e8..4b718068 100644
--- a/ubifs-utils/libubifs/misc.h
+++ b/ubifs-utils/libubifs/misc.h
@@ -50,18 +50,6 @@ static inline int ubifs_zn_cow(const struct ubifs_znode *znode)
 }
 
 /**
- * ubifs_wake_up_bgt - wake up background thread.
- * @c: UBIFS file-system description object
- */
-static inline void ubifs_wake_up_bgt(struct ubifs_info *c)
-{
-	if (c->bgt && !c->need_bgt) {
-		c->need_bgt = 1;
-		wake_up_process(c->bgt);
-	}
-}
-
-/**
  * ubifs_tnc_find_child - find next child in znode.
  * @znode: znode to search at
  * @start: the zbranch index to start at
@@ -82,42 +70,6 @@ ubifs_tnc_find_child(struct ubifs_znode *znode, int start)
 }
 
 /**
- * ubifs_inode - get UBIFS inode information by VFS 'struct inode' object.
- * @inode: the VFS 'struct inode' pointer
- */
-static inline struct ubifs_inode *ubifs_inode(const struct inode *inode)
-{
-	return container_of(inode, struct ubifs_inode, vfs_inode);
-}
-
-/**
- * ubifs_compr_present - check if compressor was compiled in.
- * @compr_type: compressor type to check
- * @c: the UBIFS file-system description object
- *
- * This function returns %1 of compressor of type @compr_type is present, and
- * %0 if not.
- */
-static inline int ubifs_compr_present(struct ubifs_info *c, int compr_type)
-{
-	ubifs_assert(c, compr_type >= 0 && compr_type < UBIFS_COMPR_TYPES_CNT);
-	return !!ubifs_compressors[compr_type]->capi_name;
-}
-
-/**
- * ubifs_compr_name - get compressor name string by its type.
- * @compr_type: compressor type
- * @c: the UBIFS file-system description object
- *
- * This function returns compressor type string.
- */
-static inline const char *ubifs_compr_name(struct ubifs_info *c, int compr_type)
-{
-	ubifs_assert(c, compr_type >= 0 && compr_type < UBIFS_COMPR_TYPES_CNT);
-	return ubifs_compressors[compr_type]->name;
-}
-
-/**
  * ubifs_wbuf_sync - synchronize write-buffer.
  * @wbuf: write-buffer to synchronize
  *
@@ -135,21 +87,6 @@ static inline int ubifs_wbuf_sync(struct ubifs_wbuf *wbuf)
 }
 
 /**
- * ubifs_encode_dev - encode device node IDs.
- * @dev: UBIFS device node information
- * @rdev: device IDs to encode
- *
- * This is a helper function which encodes major/minor numbers of a device node
- * into UBIFS device node description. We use standard Linux "new" and "huge"
- * encodings.
- */
-static inline int ubifs_encode_dev(union ubifs_dev_desc *dev, dev_t rdev)
-{
-	dev->new = cpu_to_le32(new_encode_dev(rdev));
-	return sizeof(dev->new);
-}
-
-/**
  * ubifs_add_dirt - add dirty space to LEB properties.
  * @c: the UBIFS file-system description object
  * @lnum: LEB to add dirty space for
@@ -209,7 +146,7 @@ struct ubifs_branch *ubifs_idx_branch(const struct ubifs_info *c,
  * @c: the UBIFS file-system description object
  * @idx: index node
  */
-static inline void *ubifs_idx_key(const struct ubifs_info *c,
+static inline void *ubifs_idx_key(__unused const struct ubifs_info *c,
 				  const struct ubifs_idx_node *idx)
 {
 	return (void *)((struct ubifs_branch *)idx->branches)->key;
@@ -276,14 +213,4 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
 	return lnum;
 }
 
-static inline int ubifs_xattr_max_cnt(struct ubifs_info *c)
-{
-	int max_xattrs = (c->leb_size / 2) / UBIFS_INO_NODE_SZ;
-
-	ubifs_assert(c, max_xattrs < c->max_orphans);
-	return max_xattrs;
-}
-
-const char *ubifs_assert_action_name(struct ubifs_info *c);
-
 #endif /* __UBIFS_MISC_H__ */
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
