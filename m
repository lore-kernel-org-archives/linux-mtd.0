Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA60C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kds4XsrQHpmO2/F4T/M/K+t1tdhCun96ApOt2AxjB4=; b=frxXdZyerTyzt6
	qpW+PRCuGW9mb6JV/IBr4i9AXXYQnUQJGTBG7RJ5bMqscXGoArRsfyzsR5+8Ns8ziyoQbe9Fu2QfT
	ZGU69QMsF/hw4s/ffYTzT/67sqbECUHCaMBwL8PBtvPjLBDT26OVEs9JLNLZqqGA6lrrAx3qKFEic
	5vq6xRzVmNsffs0t6IB4JVwGXckPUdYJri8fk3MonBauY2vNnsXVC12EK/ya6/2K7JGiGtpvMb/pA
	+tJwJECbhlw72PzhAucDEMcY3G9wRjrOxKtX6t5AxSFJWo4RZ9o29YdQnMRcryMqIdJzSDlTLBBP7
	YNH61p6EUt1fGLLKj+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfMk-00FqRL-0q;
	Thu, 28 Dec 2023 01:39:18 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfMh-00FqON-0U
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:39:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4T0rlC2hZTz1vqJh;
	Thu, 28 Dec 2023 09:39:03 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 9877F1A0195;
	Thu, 28 Dec 2023 09:38:58 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:38:14 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 14/17] ubifs: repair: Clean up log and orphan area
Date: Thu, 28 Dec 2023 09:41:09 +0800
Message-ID: <20231228014112.2836317-15-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228014112.2836317-1-chengzhihao1@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173915_362644_0637BC58 
X-CRM114-Status: GOOD (  10.17  )
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

This is the 12/13 step of repairing. Clean up log and orphan area, all
nodes have been recovered, these two areas should be cleared, otherwise
old content in journal/orphan could be replayed in next mounting.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/repair.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/fs/ubifs/repair.c b/fs/ubifs/repair.c
index 8d40cff26f7a..42124cda5d7d 100644
--- a/fs/ubifs/repair.c
+++ b/fs/ubifs/repair.c
@@ -2367,6 +2367,43 @@ int build_lpt(struct ubifs_info *c)
 	return ubifs_create_lpt(c, c->repair->lpts, c->main_lebs, hash_lpt);
 }
 
+/**
+ * clean_log - clean up log area.
+ * @c: UBIFS file-system description object
+ *
+ * This function cleans up log area, since there is no need to do recovery
+ * in next mounting.
+ */
+static int clean_log(struct ubifs_info *c)
+{
+	int lnum, err;
+	struct ubifs_cs_node *cs;
+
+	for (lnum = UBIFS_LOG_LNUM; lnum <= c->log_last; lnum++) {
+		if (fatal_signal_pending(current))
+			return -EINTR;
+		cond_resched();
+
+		err = ubifs_leb_unmap(c, lnum);
+		if (err)
+			return err;
+	}
+
+	cs = kzalloc(ALIGN(UBIFS_CS_NODE_SZ, c->min_io_size), GFP_KERNEL);
+	if (!cs)
+		return -ENOMEM;
+
+	cs->ch.node_type = UBIFS_CS_NODE;
+	cs->cmt_no = cpu_to_le64(0);
+
+	err = ubifs_write_node(c, cs, UBIFS_CS_NODE_SZ, UBIFS_LOG_LNUM, 0);
+	kfree(cs);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static int do_repair(struct ubifs_info *c)
 {
 	int err = 0;
@@ -2416,6 +2453,16 @@ static int do_repair(struct ubifs_info *c)
 	/* Step 11. Build LPT. */
 	ubifs_msg(c, "Step 11: Build LPT");
 	err = build_lpt(c);
+	if (err)
+		goto out;
+
+	/* Step 12. Clean up log & orphan. */
+	ubifs_msg(c, "Step 12: Clean up log & orphan");
+	err = clean_log(c);
+	if (err)
+		goto out;
+
+	err = ubifs_clear_orphans(c);
 
 out:
 	destroy_scanned_info(c, &si);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
