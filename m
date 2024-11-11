Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA2D2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2L91Rb6Rhdl8gPPp02E1Tqgk/ME7EjVe1nqk0kA34+s=; b=Br/M7xkfZU+GzT
	vGpboqiMIzUpZZ4V2D0O+9YTQsHnXT+Q3FMxLjfBIuRAn/nipC0k7AJMfIFKYOYiLXh/+DMh2+4TQ
	0nP8QO+icmpsQrWCRwdNKoUPilvM9HRV54O7ASxl0pUNbD7oa7vXGLPY8lJkGRdpWQWRTxHaZB5Pm
	giKNtURHlt3l+4MaaHgFwgrbvaWb7adD56JMQbvuxNlmRWi0WQlinFioB7iWLKeYftP2vrCLtucEC
	6H2t3BXHtARR3a7OFDodivzFb7bamOcT8xFs/abEw3hEIlLCOL1O3GGiZTz/xgtmerhsuN3Einp+i
	8NdN18G9yCcfoHgXrrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQLt-0000000GzLt-1DWa;
	Mon, 11 Nov 2024 09:04:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQJu-0000000Gxq3-0ijG
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:02:59 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn3Rq33HQzpZRM;
	Mon, 11 Nov 2024 17:00:55 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BFA11800D0;
	Mon, 11 Nov 2024 17:02:48 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:02:47 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 065/102] fsck.ubifs: rebuild_fs: Clean up log and orphan area
Date: Mon, 11 Nov 2024 17:01:19 +0800
Message-ID: <20241111090124.2070455-26-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010250_558538_7CB1298D 
X-CRM114-Status: GOOD (  11.79  )
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

This is the 11/12 step of rebuilding. Clean up log and orphan area, all
nodes have been recovered, these two areas should be cleared, otherwise
old content in journal/orphan could be replayed in next mounting.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index 085df2b9..9ea4c224 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -1312,6 +1312,39 @@ static int build_lpt(struct ubifs_info *c)
 }
 
 /**
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
+/**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
  *
@@ -1383,6 +1416,19 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	/* Step 10. Build LPT. */
 	log_out(c, "Build LPT");
 	err = build_lpt(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+
+	/* Step 11. Clean up log & orphan. */
+	log_out(c, "Clean up log & orphan");
+	err = clean_log(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+	err = ubifs_clear_orphans(c);
 	if (err)
 		exit_code |= FSCK_ERROR;
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
