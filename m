Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5A8EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n66faRrqAKT4Cw+AybIbDbWKLt9xVk5pq3b6KgqMq5g=; b=Tn0dA0RErLN+rv
	TkC6brvefzQlZ+8SHu0wDAJ40aNBeEz2/xtFmklyHLd06Jd16qzReJmySbGq5hWJR6/M4AiAG2492
	ZcF9U9ftBz+jfvSshpqDt88bL7HBkumEDPH/Dp6Wc01rVyhTJUdsY5LMwoEhoBYKQPkjrevUBm24w
	/9GAloppH0ogRfjwtyKTIKv1a91Ym+uP6ZJ55solwbV+LGh/ixUo7Gxw3ZqVpC0GGwqP8UYCpGduE
	HmfuYyZRbajsMJqszq7zhKIq8XDHWn0gd5xKJnRvsOY352uT5MYbHYy0iPbKreZ12euRAhH84ATF3
	crSVPIx403uo3ZwkVTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN9oZ-00GMtY-1z;
	Sat, 22 Jul 2023 10:26:19 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN9oW-00GMqH-0T
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 10:26:18 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R7Mwz0q76zVjf2;
	Sat, 22 Jul 2023 18:24:35 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 22 Jul
 2023 18:26:02 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [RFC 1/1] ubi: An interface is added for dump the mapping between LEBs and PEBs
Date: Sat, 22 Jul 2023 18:23:02 +0800
Message-ID: <20230722102302.1848135-2-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230722102302.1848135-1-wangzhaolong1@huawei.com>
References: <20230722102302.1848135-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_032616_543068_9691A515 
X-CRM114-Status: GOOD (  18.73  )
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

A debugfs interface named "detailed_eba_table_info" is added to view
the PEB and LEB mapping information of all volumes on a UBI device.

$ cat /sys/kernel/debug/ubi/ubi1/detailed_eba_table_info

=========   vol_name:"test_volA",id:2   ========
logical_block_number    physical_block_number
0                        274
1                        275
2                        276
3                        277
4                        278
......
=========   vol_name:"test_volB",id:3   ========
logical_block_number    physical_block_number
0                        619
1                        613
2                        614
3                       (unmaped)
4                        622
......

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/debug.c | 104 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/eba.c   |  24 ----------
 drivers/mtd/ubi/ubi.h   |  24 ++++++++++
 3 files changed, 128 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 27168f511d6d..c6be9450b509 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -386,6 +386,7 @@ static const struct file_operations dfs_fops = {
 	.owner  = THIS_MODULE,
 };
 
+
 /* As long as the position is less then that total number of erase blocks,
  * we still have more to print.
  */
@@ -493,6 +494,106 @@ static const struct file_operations eraseblk_count_fops = {
 	.release = eraseblk_count_release,
 };
 
+static void *eba_table_seq_start(struct seq_file *s, loff_t *pos)
+{
+	int volumes_length = UBI_MAX_VOLUMES + UBI_INT_VOL_COUNT;
+
+	if (*pos >= 0 && *pos < volumes_length)
+		return pos;
+
+	return NULL;
+}
+
+static void *eba_table_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	int volumes_length = UBI_MAX_VOLUMES + UBI_INT_VOL_COUNT;
+
+	(*pos)++;
+
+	if (*pos >= 0 && *pos < volumes_length)
+		return pos;
+
+	return NULL;
+}
+
+static void eba_table_seq_stop(struct seq_file *s, void *v)
+{
+}
+
+static int eba_table_seq_show(struct seq_file *s, void *iter)
+{
+	struct ubi_device *ubi = s->private;
+	int *vol_idx  = iter;
+	struct ubi_volume *vol;
+	int lnum, pnum, vol_id;
+
+	vol = ubi->volumes[*vol_idx];
+	if (vol == NULL)
+		return 0;
+
+	vol_id = vol->vol_id;
+	seq_printf(s, "=========   vol_name:\"%s\",id:%d   ========\n", vol->name, vol_id);
+	seq_puts(s, "logical_block_number\tphysical_block_number\n");
+	spin_lock(&ubi->volumes_lock);
+	for (lnum = 0; lnum < vol->reserved_pebs; ++lnum) {
+		pnum = vol->eba_tbl->entries[lnum].pnum;
+		if (pnum >= 0)
+			seq_printf(s, "%-22d\t %-11d\n", lnum, pnum);
+		else
+			seq_printf(s, "%-22d\t(unmaped)\n", lnum);
+	}
+	spin_unlock(&ubi->volumes_lock);
+
+	return 0;
+}
+
+static const struct seq_operations eba_table_seq_ops = {
+	.start = eba_table_seq_start,
+	.next = eba_table_seq_next,
+	.stop = eba_table_seq_stop,
+	.show = eba_table_seq_show
+};
+
+static int eba_table_open(struct inode *inode, struct file *f)
+{
+	struct seq_file *s;
+	int err;
+
+	err = seq_open(f, &eba_table_seq_ops);
+	if (err)
+		return err;
+
+	s = f->private_data;
+	s->private = ubi_get_device((unsigned long)inode->i_private);
+
+	if (!s->private)
+		return -ENODEV;
+	else
+		return 0;
+}
+
+static int eba_table_release(struct inode *inode, struct file *f)
+{
+	struct seq_file *s = f->private_data;
+	struct ubi_device *ubi = s->private;
+
+	ubi_put_device(ubi);
+
+	return seq_release(inode, f);
+}
+
+/* File operations for UBI debugfs files which to read
+ * eba_tbl to help developer get the map status of ubi
+ * volumes
+ */
+static const struct file_operations eba_table_fops = {
+	.owner = THIS_MODULE,
+	.open = eba_table_open,
+	.read = seq_read,
+	.llseek = no_llseek,
+	.release = eba_table_release,
+};
+
 /**
  * ubi_debugfs_init_dev - initialize debugfs for an UBI device.
  * @ubi: UBI device description object
@@ -556,6 +657,9 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 						   mode, d->dfs_dir,
 						   (void *)ubi_num, &dfs_fops);
 
+	debugfs_create_file("detailed_eba_table_info", S_IRUSR, d->dfs_dir,
+			    (void *)ubi_num, &eba_table_fops);
+
 	debugfs_create_file("detailed_erase_block_info", S_IRUSR, d->dfs_dir,
 			    (void *)ubi_num, &eraseblk_count_fops);
 
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 655ff41863e2..c856ea73a67c 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -36,30 +36,6 @@
 /* Number of physical eraseblocks reserved for atomic LEB change operation */
 #define EBA_RESERVED_PEBS 1
 
-/**
- * struct ubi_eba_entry - structure encoding a single LEB -> PEB association
- * @pnum: the physical eraseblock number attached to the LEB
- *
- * This structure is encoding a LEB -> PEB association. Note that the LEB
- * number is not stored here, because it is the index used to access the
- * entries table.
- */
-struct ubi_eba_entry {
-	int pnum;
-};
-
-/**
- * struct ubi_eba_table - LEB -> PEB association information
- * @entries: the LEB to PEB mapping (one entry per LEB).
- *
- * This structure is private to the EBA logic and should be kept here.
- * It is encoding the LEB to PEB association table, and is subject to
- * changes.
- */
-struct ubi_eba_table {
-	struct ubi_eba_entry *entries;
-};
-
 /**
  * ubi_next_sqnum - get next sequence number.
  * @ubi: UBI device description object
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa100..1457657901df 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -153,6 +153,30 @@ enum {
 	POWER_CUT_VID_WRITE = 0x02,
 };
 
+/**
+ * struct ubi_eba_entry - structure encoding a single LEB -> PEB association
+ * @pnum: the physical eraseblock number attached to the LEB
+ *
+ * This structure is encoding a LEB -> PEB association. Note that the LEB
+ * number is not stored here, because it is the index used to access the
+ * entries table.
+ */
+struct ubi_eba_entry {
+	int pnum;
+};
+
+/**
+ * struct ubi_eba_table - LEB -> PEB association information
+ * @entries: the LEB to PEB mapping (one entry per LEB).
+ *
+ * This structure is private to the EBA logic and should be kept here.
+ * It is encoding the LEB to PEB association table, and is subject to
+ * changes.
+ */
+struct ubi_eba_table {
+	struct ubi_eba_entry *entries;
+};
+
 /**
  * struct ubi_vid_io_buf - VID buffer used to read/write VID info to/from the
  *			   flash.
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
