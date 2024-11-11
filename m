Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB15D12D7B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5vPrPpiHkOxi4jozjvPGiadamCSylX4y+DgJoOxhDY=; b=eWIpoq3G3mqL7P
	TdmBBKZgZ5MVakcjvtORD89VAkvhvQLBXM9pMER1bjE6++JzlNIC+kOnMvEj3IfOPU+56reaSKP2d
	7WpdioGW4IBeU7g7GGvg/XkvDrb3kdVJSVGH67x4tRh8E7m5yXQFIkvxW1vKSW0HJz26v/NMRECiN
	LLxbNitUSM8ZaWp37fb40JcrZT7kLt5snn6O1jX1IDWg/Lkr2BgnIRM0LCSaornESIzz2Vo2AAbP4
	ILFTmD2dQ0vQa3q1HLY3HMF/uH/JdTOuqqrIErEmv+WEdoPwjtBexkU6vFMLRCrZ0ce/xd/9SZjfM
	Xg9WWt2nbl2mMQGZqDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUs-0000000GZhi-2zzm;
	Mon, 11 Nov 2024 07:06:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUQ-0000000GZHD-0JSC
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4P0FUmXIMbm2rgpNOY3618E5zhi4ml34GKai6Rf5y7Y=; b=eWOJOhRVoTHEXk/5ByASbjOL8F
	PbWTXK3zrAXwV0iCTJ2MvsmzDy7kuS0Lv3gWJiKZSU1QfGvq2XejqBvLSqI1FMm2Qdfe8RTzQ1/L5
	sbCA4EoRHGbUTLSeWasXLjqn40/TlKtKuCVdXq0b684ZuQfgfFUMdxl9sQ/zwIa5Aa6p3pdfmBw5V
	32TVvUIXhS4JLGc5sYJr0/PRjPlHIU2wryHrXi+uWkp4xHv+7AZMasGgt86MXYU1MmGsi0GDWPUlS
	WdrvELZgiZfPhTdNUiAhISegW901BU9kSaYIWnB+BB37IaueS7NGnLg6pGNCi+eAqu4h6vYEwiT8+
	GhfHBZtQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUL-0000000CmCx-24tP
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rQ4Cbzz2Dgxt;
	Mon, 11 Nov 2024 15:03:34 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CF7721A0188;
	Mon, 11 Nov 2024 15:05:21 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:21 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 041/102] ubifs-utils: Adapt misc.h in libubifs
Date: Mon, 11 Nov 2024 15:02:44 +0800
Message-ID: <20241111070346.1314122-42-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070530_646836_C0117323 
X-CRM114-Status: GOOD (  11.55  )
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
