Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0E6C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816372074D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XN87ohkj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 816372074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qj1xzs/Dfls3CxPpXtuWOMuFDsXvxRMorOAtsHgdsaQ=; b=XN87ohkjNj03Zk
	81Pe7U0v3Mx+7b8J+KpZGbRcLIgayGo81fRc7g7JnZFuR5ePFHR8o+xzbHcZQ3nTxm65F2IQFHQ3S
	coytWtQZzyrBzq5BxRaecbWQ+ihAO/RnwdnUAmbOu176SH3YWJwtkNv4e4SkqP/e/c8yCPVIyL/pp
	HsCGtTsSrQcOEbGeSCNCxMy0pYBGbt9RFX2K9KgyS994FWmIMIgPIg1QhP5fAucx5mxZriwFl/oTj
	g4yGlEMLIPTF6qttgzCNAh2qxDivx2dQM/28Gt4wx+z59gmFWLxFJb883bd1URZ/EAt4J0CTqvBxR
	o7Dvlh+5HihLaARq3sIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl5kv-0007K2-5p; Tue, 16 Jun 2020 07:11:37 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl5kF-0006bi-IF
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 07:10:56 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C4488A028FD2A23B8667;
 Tue, 16 Jun 2020 15:10:43 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 15:10:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC 5/5] ubifs: ubifs_dump_node: Dump all branches of the
 index node
Date: Tue, 16 Jun 2020 15:11:46 +0800
Message-ID: <20200616071146.2607061-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200616071146.2607061-1-chengzhihao1@huawei.com>
References: <20200616071146.2607061-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_001055_764755_2C127C4A 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

An index node can have up to c->fanout branches, all branches should be
displayed while dumping index node.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 2d07615369f9..a65f73e91b4f 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -537,7 +537,7 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node, int node_len)
 		pr_err("\tlevel          %d\n", (int)le16_to_cpu(idx->level));
 		pr_err("\tBranches:\n");
 
-		for (i = 0; i < n && i < c->fanout - 1; i++) {
+		for (i = 0; i < n && i < c->fanout; i++) {
 			const struct ubifs_branch *br;
 
 			br = ubifs_idx_branch(c, idx, i);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
