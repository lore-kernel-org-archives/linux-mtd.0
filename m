Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5D3C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D1C2074D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BxEOzSgB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D1C2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asTbUIasddW7jpBEP8rnEzXQHGUXc3FQd4UP9y/P6Cg=; b=BxEOzSgBY8V+FH
	Oh0YsQl6GDzWswUKU1XVXJq6ZH2L4wPvamIHIADDoy8YsNvGhhpw0pjpTfbRQDYh9gxTIFV4JlpKD
	WFqX34eUKE2w2jsDKjvsCE92aCm8mOMp5JrEIKaB6pt8mijYnoPX0dxQc35mmUIjUbrzeoVtPcfzx
	dBZzXjfPEu4arVMBl2J491MQXxiirUoErG0UmNjXMQiePRROx62uPDFBgVjoudfu7BLPJvI5go3Sy
	5ppH8jzlvVeqs89GitYAWh+JmJnZ753InuI+AL8C0ctVKB7op/XNvp6QPjB6Q8YmiDc7VQsySKXcR
	HbcFCiMjA9ELjncmd7CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl5kS-0006sa-Co; Tue, 16 Jun 2020 07:11:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl5kD-0006bk-KK
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 07:10:55 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B1425442FFD11D73E26F;
 Tue, 16 Jun 2020 15:10:38 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 15:10:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC 1/5] ubifs: Limit dumping length by size of memory which
 is allocated for the node
Date: Tue, 16 Jun 2020 15:11:42 +0800
Message-ID: <20200616071146.2607061-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200616071146.2607061-1-chengzhihao1@huawei.com>
References: <20200616071146.2607061-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_001053_838264_99DF7EF4 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: richard@nod.at, liu.song11@zte.com.cn, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To prevent memory out-of-bounds accessing in ubifs_dump_node(), actual
dumping length should be restricted by another condition(size of memory
which is allocated for the node).

This patch handles following situations (These situations may be caused
by bit flipping due to hardware error, writing bypass ubifs, unknown
bugs in ubifs, etc.):
1. bad node_len: Dumping data according to 'ch->len' which may exceed
   the size of memory allocated for node.
2. bad node content: Some kinds of node can record additional data, eg.
   index node and orphan node, make sure the size of additional data
   not beyond the node length.
3. node_type changes: Read data according to type A, but expected type
   B, before that, node is allocated according to type B's size. Length
   of type A node is greater than type B node.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/debug.c | 63 ++++++++++++++++++++++++++++++++++++++----------
 fs/ubifs/debug.h |  3 ++-
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 31288d8fa2ce..e995e553541d 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -291,9 +291,9 @@ void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 	kfree(pdent);
 }
 
-void ubifs_dump_node(const struct ubifs_info *c, const void *node)
+void ubifs_dump_node(const struct ubifs_info *c, const void *node, int node_len)
 {
-	int i, n;
+	int i, n, type, safe_len, max_node_len, min_node_len;
 	union ubifs_key key;
 	const struct ubifs_ch *ch = node;
 	char key_buf[DBG_KEY_BUF_LEN];
@@ -306,10 +306,40 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		return;
 	}
 
+	/* Skip dumping unknown type node */
+	type = ch->node_type;
+	if (type < 0 || type >= UBIFS_NODE_TYPES_CNT) {
+		pr_err("node type %d was not recognized\n", type);
+		return;
+	}
+
 	spin_lock(&dbg_lock);
 	dump_ch(node);
 
-	switch (ch->node_type) {
+	if (c->ranges[type].max_len == 0) {
+		max_node_len = min_node_len = c->ranges[type].len;
+	} else {
+		max_node_len = c->ranges[type].max_len;
+		min_node_len = c->ranges[type].min_len;
+	}
+	safe_len = le32_to_cpu(ch->len);
+	safe_len = safe_len > 0 ? safe_len : 0;
+	safe_len = min3(safe_len, max_node_len, node_len);
+	if (safe_len < min_node_len) {
+		pr_err("node len(%d) is too short for %s, left %d bytes:\n",
+		       safe_len, dbg_ntype(type),
+		       safe_len > UBIFS_CH_SZ ?
+		       safe_len - (int)UBIFS_CH_SZ : 0);
+		if (safe_len > UBIFS_CH_SZ)
+			print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1,
+				       (void *)node + UBIFS_CH_SZ,
+				       safe_len - UBIFS_CH_SZ, 0);
+		goto out_unlock;
+	}
+	if (safe_len != le32_to_cpu(ch->len))
+		pr_err("\ttruncated node length      %d\n", safe_len);
+
+	switch (type) {
 	case UBIFS_PAD_NODE:
 	{
 		const struct ubifs_pad_node *pad = node;
@@ -453,7 +483,8 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		pr_err("\tnlen           %d\n", nlen);
 		pr_err("\tname           ");
 
-		if (nlen > UBIFS_MAX_NLEN)
+		if (nlen > UBIFS_MAX_NLEN ||
+		    nlen > safe_len - UBIFS_DENT_NODE_SZ)
 			pr_err("(bad name length, not printing, bad or corrupted node)");
 		else {
 			for (i = 0; i < nlen && dent->name[i]; i++)
@@ -467,7 +498,6 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 	case UBIFS_DATA_NODE:
 	{
 		const struct ubifs_data_node *dn = node;
-		int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
 
 		key_read(c, &dn->key, &key);
 		pr_err("\tkey            %s\n",
@@ -475,10 +505,13 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		pr_err("\tsize           %u\n", le32_to_cpu(dn->size));
 		pr_err("\tcompr_typ      %d\n",
 		       (int)le16_to_cpu(dn->compr_type));
-		pr_err("\tdata size      %d\n", dlen);
-		pr_err("\tdata:\n");
+		pr_err("\tdata size      %u\n",
+		       le32_to_cpu(ch->len) - (unsigned int)UBIFS_DATA_NODE_SZ);
+		pr_err("\tdata (length = %d):\n",
+		       safe_len - (int)UBIFS_DATA_NODE_SZ);
 		print_hex_dump(KERN_ERR, "\t", DUMP_PREFIX_OFFSET, 32, 1,
-			       (void *)&dn->data, dlen, 0);
+			       (void *)&dn->data,
+			       safe_len - (int)UBIFS_DATA_NODE_SZ, 0);
 		break;
 	}
 	case UBIFS_TRUN_NODE:
@@ -495,9 +528,12 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 	case UBIFS_IDX_NODE:
 	{
 		const struct ubifs_idx_node *idx = node;
+		int max_child_cnt = (safe_len - UBIFS_IDX_NODE_SZ) /
+				    (ubifs_idx_node_sz(c, 1) -
+				    UBIFS_IDX_NODE_SZ);
 
-		n = le16_to_cpu(idx->child_cnt);
-		pr_err("\tchild_cnt      %d\n", n);
+		n = min_t(int, le16_to_cpu(idx->child_cnt), max_child_cnt);
+		pr_err("\tchild_cnt      %d\n", (int)le16_to_cpu(idx->child_cnt));
 		pr_err("\tlevel          %d\n", (int)le16_to_cpu(idx->level));
 		pr_err("\tBranches:\n");
 
@@ -525,7 +561,7 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 				le64_to_cpu(orph->cmt_no) & LLONG_MAX);
 		pr_err("\tlast node flag %llu\n",
 		       (unsigned long long)(le64_to_cpu(orph->cmt_no)) >> 63);
-		n = (le32_to_cpu(ch->len) - UBIFS_ORPH_NODE_SZ) >> 3;
+		n = (safe_len - UBIFS_ORPH_NODE_SZ) >> 3;
 		pr_err("\t%d orphan inode numbers:\n", n);
 		for (i = 0; i < n; i++)
 			pr_err("\t  ino %llu\n",
@@ -537,9 +573,10 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		break;
 	}
 	default:
-		pr_err("node type %d was not recognized\n",
-		       (int)ch->node_type);
+		pr_err("node type %d was not recognized\n", type);
 	}
+
+out_unlock:
 	spin_unlock(&dbg_lock);
 }
 
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 7763639a426b..42610fa5f3a7 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -242,7 +242,8 @@ const char *dbg_get_key_dump(const struct ubifs_info *c,
 const char *dbg_snprintf_key(const struct ubifs_info *c,
 			     const union ubifs_key *key, char *buffer, int len);
 void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode);
-void ubifs_dump_node(const struct ubifs_info *c, const void *node);
+void ubifs_dump_node(const struct ubifs_info *c, const void *node,
+		     int node_len);
 void ubifs_dump_budget_req(const struct ubifs_budget_req *req);
 void ubifs_dump_lstats(const struct ubifs_lp_stats *lst);
 void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
