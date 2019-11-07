Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EECFFA372C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3327D20679
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mNxCwfpD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y0HgH5ux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3327D20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EjVQ4mHgGOUjJsoPgA6W/VsbF30eBiPvEswIGIGwWqk=; b=mNxCwfpDVUwMDx
	PFoZgxfFSa7ycqTFxtTvLqkd9BhIALt6wgRPTbzvT8wsoIYst7scGQ2uYSBuAH4pypPBA5yDXlLb3
	XMI46XxscRUYH1zk4q6esiGPlOavfL8KJvV1+lT/NVb+edKW95Z2AfTJOA176pggOSZWVhBRkhj8p
	pv+feiy7LFiCopC0KGSO1Mxv8EmNSID0KWONYeEz897f59EFqDPBHxOkVJitV7Fan4edVprBVBEgx
	OJcwALXC0i99HrTdPdkYLYnXyFZsvHLyO8GVcR3X8+x1mXXQ2oG16VEhDIfRakckvGywAgc5qT1Xs
	pSvSShWLX/5brOuvGcpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdVe-0004vv-MY; Thu, 07 Nov 2019 08:51:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdVa-0004vM-UQ
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 08:51:16 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A5D82053B;
 Thu,  7 Nov 2019 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573116674;
 bh=8kanmn+RkMfo0K4nKLhPEwPa32ckCOn18hc8EN/WItw=;
 h=Date:From:To:Cc:Subject:From;
 b=y0HgH5uxr6nUEK3OE2ja1ID+XEBTYoRgjfLCPUSw5LE5o+RbsJuUri1ZnPjXoA1kr
 SlbLfTzwPDy13RdN3HjxmOwm7HUJQbFN4Q0RxRWPiT2tZAT0RfNCskLPM9JVEchwff
 tXVSOzq+Y+zixXbeBil0XJuUCgfJlZK9hRKideQ4=
Date: Thu, 7 Nov 2019 09:51:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: no need to check return value of debugfs_create functions
Message-ID: <20191107085111.GA1274176@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_005115_023529_A37D0906 
X-CRM114-Status: GOOD (  18.79  )
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

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/mtdcore.c   |  26 +++-----
 drivers/mtd/mtdswap.c   |   8 +--
 drivers/mtd/ubi/debug.c | 128 +++++++++++++---------------------------
 3 files changed, 49 insertions(+), 113 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6cc7ecb0c788..5fac4355b9c2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -382,33 +382,21 @@ static struct dentry *dfs_dir_mtd;
 static void mtd_debugfs_populate(struct mtd_info *mtd)
 {
 	struct device *dev = &mtd->dev;
-	struct dentry *root, *dent;
+	struct dentry *root;
 
 	if (IS_ERR_OR_NULL(dfs_dir_mtd))
 		return;
 
 	root = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
-	if (IS_ERR_OR_NULL(root)) {
-		dev_dbg(dev, "won't show data in debugfs\n");
-		return;
-	}
-
 	mtd->dbg.dfs_dir = root;
 
-	if (mtd->dbg.partid) {
-		dent = debugfs_create_file("partid", 0400, root, mtd,
-					   &mtd_partid_debug_fops);
-		if (IS_ERR_OR_NULL(dent))
-			dev_err(dev, "can't create debugfs entry for partid\n");
-	}
+	if (mtd->dbg.partid)
+		debugfs_create_file("partid", 0400, root, mtd,
+				    &mtd_partid_debug_fops);
 
-	if (mtd->dbg.partname) {
-		dent = debugfs_create_file("partname", 0400, root, mtd,
-					   &mtd_partname_debug_fops);
-		if (IS_ERR_OR_NULL(dent))
-			dev_err(dev,
-				"can't create debugfs entry for partname\n");
-	}
+	if (mtd->dbg.partname)
+		debugfs_create_file("partname", 0400, root, mtd,
+				    &mtd_partname_debug_fops);
 }
 
 #ifndef CONFIG_MMU
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index f92414eb4c86..58eefa43af14 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1257,7 +1257,6 @@ DEFINE_SHOW_ATTRIBUTE(mtdswap);
 static int mtdswap_add_debugfs(struct mtdswap_dev *d)
 {
 	struct dentry *root = d->mtd->dbg.dfs_dir;
-	struct dentry *dent;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
@@ -1265,12 +1264,7 @@ static int mtdswap_add_debugfs(struct mtdswap_dev *d)
 	if (IS_ERR_OR_NULL(root))
 		return -1;
 
-	dent = debugfs_create_file("mtdswap_stats", S_IRUSR, root, d,
-				&mtdswap_fops);
-	if (!dent) {
-		dev_err(d->dev, "debugfs_create_file failed\n");
-		return -1;
-	}
+	debugfs_create_file("mtdswap_stats", S_IRUSR, root, d, &mtdswap_fops);
 
 	return 0;
 }
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index a1dff92ceedf..bdf65646f092 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -511,8 +511,6 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 {
 	int err, n;
 	unsigned long ubi_num = ubi->ubi_num;
-	const char *fname;
-	struct dentry *dent;
 	struct ubi_debug_info *d = &ubi->dbg;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
@@ -522,95 +520,51 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 		     ubi->ubi_num);
 	if (n == UBI_DFS_DIR_LEN) {
 		/* The array size is too small */
-		fname = UBI_DFS_DIR_NAME;
-		dent = ERR_PTR(-EINVAL);
-		goto out;
+		return -EINVAL;
 	}
 
-	fname = d->dfs_dir_name;
-	dent = debugfs_create_dir(fname, dfs_rootdir);
-	if (IS_ERR_OR_NULL(dent))
-		goto out;
-	d->dfs_dir = dent;
-
-	fname = "chk_gen";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_gen = dent;
-
-	fname = "chk_io";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_io = dent;
-
-	fname = "chk_fastmap";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_chk_fastmap = dent;
-
-	fname = "tst_disable_bgt";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_disable_bgt = dent;
-
-	fname = "tst_emulate_bitflips";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_emulate_bitflips = dent;
-
-	fname = "tst_emulate_io_failures";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_emulate_io_failures = dent;
-
-	fname = "tst_emulate_power_cut";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_emulate_power_cut = dent;
-
-	fname = "tst_emulate_power_cut_min";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_power_cut_min = dent;
-
-	fname = "tst_emulate_power_cut_max";
-	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
-				   &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
-	d->dfs_power_cut_max = dent;
-
-	fname = "detailed_erase_block_info";
-	dent = debugfs_create_file(fname, S_IRUSR, d->dfs_dir, (void *)ubi_num,
-				   &eraseblk_count_fops);
-	if (IS_ERR_OR_NULL(dent))
-		goto out_remove;
+	d->dfs_dir = debugfs_create_dir(d->dfs_dir_name, dfs_rootdir);
 
-	return 0;
+	d->dfs_chk_gen = debugfs_create_file("chk_gen", S_IWUSR, d->dfs_dir,
+					     (void *)ubi_num, &dfs_fops);
 
-out_remove:
-	debugfs_remove_recursive(d->dfs_dir);
-out:
-	err = dent ? PTR_ERR(dent) : -ENODEV;
-	ubi_err(ubi, "cannot create \"%s\" debugfs file or directory, error %d\n",
-		fname, err);
-	return err;
+	d->dfs_chk_io = debugfs_create_file("chk_io", S_IWUSR, d->dfs_dir,
+					    (void *)ubi_num, &dfs_fops);
+
+	d->dfs_chk_fastmap = debugfs_create_file("chk_fastmap", S_IWUSR,
+						 d->dfs_dir, (void *)ubi_num,
+						 &dfs_fops);
+
+	d->dfs_disable_bgt = debugfs_create_file("tst_disable_bgt", S_IWUSR,
+						 d->dfs_dir, (void *)ubi_num,
+						 &dfs_fops);
+
+	d->dfs_emulate_bitflips = debugfs_create_file("tst_emulate_bitflips",
+						      S_IWUSR, d->dfs_dir,
+						      (void *)ubi_num,
+						      &dfs_fops);
+
+	d->dfs_emulate_io_failures = debugfs_create_file("tst_emulate_io_failures",
+							 S_IWUSR, d->dfs_dir,
+							 (void *)ubi_num,
+							 &dfs_fops);
+
+	d->dfs_emulate_power_cut = debugfs_create_file("tst_emulate_power_cut",
+						       S_IWUSR, d->dfs_dir,
+						       (void *)ubi_num,
+						       &dfs_fops);
+	d->dfs_power_cut_min = debugfs_create_file("tst_emulate_power_cut_min",
+						   S_IWUSR, d->dfs_dir,
+						   (void *)ubi_num, &dfs_fops);
+
+	d->dfs_power_cut_max = debugfs_create_file("tst_emulate_power_cut_max",
+						   S_IWUSR, d->dfs_dir,
+						   (void *)ubi_num, &dfs_fops);
+
+	debugfs_create_file("detailed_erase_block_info", S_IRUSR, d->dfs_dir,
+			    (void *)ubi_num, &eraseblk_count_fops);
+
+	return 0;
 }
 
 /**
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
