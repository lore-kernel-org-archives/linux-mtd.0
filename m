Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB2CC48291
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mGYEWu7nbSVHFlKs/uXyQvS89rGdmMG9sVCI5xpbczc=; b=BLyEB0hPmnmaTW
	tzIW4wn6PEivbzz4VMBvk29dxqYNaoX7PbFvggH51GZq2viSPgZFqa9VYZvxBIm6MxLmM9YhjnO6m
	mqrPzecRqdg8TWTuc1wjhaWR1SLfcaVelD+tfxlw+cDtJdE9MhggF9nx+k1QHoZwgMwUDWa2WdRVk
	yoLD5poHpsfCX1t8linYS7e8t9Uv05Uh2OrlCB+u9Dk4EcE+iNvGHttyd0sg8/ig26M/5CkzW7X4U
	3BsREQFrxWJpjNXCmqi297Mrba6ztmBYvwpD6xjw8IjpCPp5vOqgkScUGEKVM5cnQlvbUsurWpQzR
	5P90Hqisn3sl2GNzljYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWtm4-00000002MMa-3uHj;
	Mon, 05 Feb 2024 07:52:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWtm2-00000002MK3-2urx
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 07:52:16 +0000
X-UUID: f919dcbcbb4b43f9abf1b544be7db836-20240205
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d3ad5f33-cdb8-4c57-a427-73bda7883833,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:d3ad5f33-cdb8-4c57-a427-73bda7883833,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:442c2180-4f93-4875-95e7-8c66ea833d57,B
	ulkID:2402051551570XL61VY3,BulkQuantity:0,Recheck:0,SF:44|66|38|24|17|19|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: f919dcbcbb4b43f9abf1b544be7db836-20240205
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1038818982; Mon, 05 Feb 2024 15:51:56 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4A4E1E000EBC;
	Mon,  5 Feb 2024 15:51:56 +0800 (CST)
X-ns-mid: postfix-65C0939C-2060462
Received: from kernel.. (unknown [172.20.15.254])
	by mail.kylinos.cn (NSMail) with ESMTPA id 80BCAE000EBC;
	Mon,  5 Feb 2024 15:51:53 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] jffs2: Simplify the allocation of slab caches
Date: Mon,  5 Feb 2024 15:51:44 +0800
Message-Id: <20240205075144.431567-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_235215_068281_F1A903BE 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
to simplify the creation of SLAB caches.
And change cache name from 'jffs2_tmp_dnode' to 'jffs2_tmp_dnode_info'.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 fs/jffs2/malloc.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index ce1189793288..411de8b361b2 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -33,27 +33,19 @@ static struct kmem_cache *xattr_ref_cache;
 
 int __init jffs2_create_slab_caches(void)
 {
-	full_dnode_slab = kmem_cache_create("jffs2_full_dnode",
-					    sizeof(struct jffs2_full_dnode),
-					    0, 0, NULL);
+	full_dnode_slab = KMEM_CACHE(jffs2_full_dnode, 0);
 	if (!full_dnode_slab)
 		goto err;
 
-	raw_dirent_slab = kmem_cache_create("jffs2_raw_dirent",
-					    sizeof(struct jffs2_raw_dirent),
-					    0, SLAB_HWCACHE_ALIGN, NULL);
+	raw_dirent_slab = KMEM_CACHE(jffs2_raw_dirent, SLAB_HWCACHE_ALIGN);
 	if (!raw_dirent_slab)
 		goto err;
 
-	raw_inode_slab = kmem_cache_create("jffs2_raw_inode",
-					   sizeof(struct jffs2_raw_inode),
-					   0, SLAB_HWCACHE_ALIGN, NULL);
+	raw_inode_slab = KMEM_CACHE(jffs2_raw_inode, SLAB_HWCACHE_ALIGN);
 	if (!raw_inode_slab)
 		goto err;
 
-	tmp_dnode_info_slab = kmem_cache_create("jffs2_tmp_dnode",
-						sizeof(struct jffs2_tmp_dnode_info),
-						0, 0, NULL);
+	tmp_dnode_info_slab = KMEM_CACHE(jffs2_tmp_dnode_info, 0);
 	if (!tmp_dnode_info_slab)
 		goto err;
 
@@ -63,28 +55,20 @@ int __init jffs2_create_slab_caches(void)
 	if (!raw_node_ref_slab)
 		goto err;
 
-	node_frag_slab = kmem_cache_create("jffs2_node_frag",
-					   sizeof(struct jffs2_node_frag),
-					   0, 0, NULL);
+	node_frag_slab = KMEM_CACHE(jffs2_node_frag, 0);
 	if (!node_frag_slab)
 		goto err;
 
-	inode_cache_slab = kmem_cache_create("jffs2_inode_cache",
-					     sizeof(struct jffs2_inode_cache),
-					     0, 0, NULL);
+	inode_cache_slab = KMEM_CACHE(jffs2_inode_cache, 0);
 	if (!inode_cache_slab)
 		goto err;
 
 #ifdef CONFIG_JFFS2_FS_XATTR
-	xattr_datum_cache = kmem_cache_create("jffs2_xattr_datum",
-					     sizeof(struct jffs2_xattr_datum),
-					     0, 0, NULL);
+	xattr_datum_cache = KMEM_CACHE(jffs2_xattr_datum, 0);
 	if (!xattr_datum_cache)
 		goto err;
 
-	xattr_ref_cache = kmem_cache_create("jffs2_xattr_ref",
-					   sizeof(struct jffs2_xattr_ref),
-					   0, 0, NULL);
+	xattr_ref_cache = KMEM_CACHE(jffs2_xattr_ref, 0);
 	if (!xattr_ref_cache)
 		goto err;
 #endif
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
