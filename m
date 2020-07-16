Return-Path: <SRS0=qv8i=A3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238FEC433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 08:59:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A1B20760
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 08:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFJzcrrS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0A1B20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NjmSX7Eslb5XZlthcXo+Pb4RDIDfsHsW42+Ugk6rgdo=; b=fFJzcrrSV4lucqfsTGRPvMnxkv
	ZDIlKEvY1fRAqUIeK5FDQoak1fxsg/fdQ0SGet/sIbmSfwMLqJDng8HbWQb6VHVtzxuI1VopResQc
	gSESe8W0YLJ382KD9gg6iKxnOhgN9x2RKHKxd/izsEEWpCz+m7dG9bkuGryCcFvXdmgxfKLe9DF49
	nabNNv493LDt/9BYgxXQwlM8OJKxxqAB0MV1H5erXN/jMqPSIGTNNKD0rbzHH/AIs65hXntGvHsOx
	/prO6uHqTz+U2u2Ke/0n1nCpPFSo5ApWgWlqza+NiMckqp/b7fEBe7u9BuWLUgxvLLxruTGFvtlDY
	ez0T415w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvziy-0002pv-Gd; Thu, 16 Jul 2020 08:58:40 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvziv-0002nz-NK
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2020 08:58:38 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 077AA2FC830B9AA4065F;
 Thu, 16 Jul 2020 16:58:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 16:58:26 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: [PATCH -next] mtd: mtdcore: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 17:02:20 +0800
Message-ID: <20200716090220.12983-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_045838_018228_B9B7A2C6 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Yongqiang Liu <liuyongqiang13@huawei.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
---
 drivers/mtd/mtdcore.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e10ff132b..a88fe9fc0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -335,7 +335,7 @@ static const struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
-static int mtd_partid_show(struct seq_file *s, void *p)
+static int mtd_partid_debug_show(struct seq_file *s, void *p)
 {
 	struct mtd_info *mtd = s->private;
 
@@ -344,19 +344,9 @@ static int mtd_partid_show(struct seq_file *s, void *p)
 	return 0;
 }
 
-static int mtd_partid_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, mtd_partid_show, inode->i_private);
-}
-
-static const struct file_operations mtd_partid_debug_fops = {
-	.open           = mtd_partid_debugfs_open,
-	.read_iter           = seq_read_iter,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(mtd_partid_debug);
 
-static int mtd_partname_show(struct seq_file *s, void *p)
+static int mtd_partname_debug_show(struct seq_file *s, void *p)
 {
 	struct mtd_info *mtd = s->private;
 
@@ -365,17 +355,7 @@ static int mtd_partname_show(struct seq_file *s, void *p)
 	return 0;
 }
 
-static int mtd_partname_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, mtd_partname_show, inode->i_private);
-}
-
-static const struct file_operations mtd_partname_debug_fops = {
-	.open           = mtd_partname_debugfs_open,
-	.read_iter           = seq_read_iter,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
 
 static struct dentry *dfs_dir_mtd;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
