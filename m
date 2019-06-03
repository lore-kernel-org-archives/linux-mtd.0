Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEC3C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:38:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F3A25FCC
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aelKq6Wt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UNl34rSL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F3A25FCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=neXVOBqe3wpfTuNUMWfVFLpIIJcQJZESr/lWE9iFJik=; b=aelKq6WtkZxQaL
	3cMF247XECOv1DeACe2q8QKve9gpIRSkIM38EqlkMryoXPWqpo99sAqrI4YAnQmWtlqqTYqVwkpSt
	IDFBU+QdAfbrfXa1m7fWZ/FAk+QoOjwevWhdCf+h96+3eHbkZOz/kHwTakH4UPp1MI6WdBiZE1fLn
	TDUv6r4zOKR6923P3PLVzVBQt9B/zO+c/er85ZyvekyKVJLmwcBqDWqCSHSk0A5oyr4AMcwtTqIyQ
	SkkEhNcWgeU/PubPU0uSKHPAi/ZXWLZcEIb8+xxVxvxQHrMkfeH3U1HO4XOzAp3+2GMW7rrs66H6W
	8Ld7G0Ixp7bDBy/BN3bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXmEg-0001IB-Ey; Mon, 03 Jun 2019 12:38:46 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXmEd-0001Hg-2P
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:38:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id f97so6957505plb.5
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2019 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vS8OVqZe5gaAcYN4Y7CQPzPU225ksDpT3Boi/aiNNeY=;
 b=UNl34rSLrBIw9CspJiIuZSzi8PafLZVAh/nghkWKe4U3NZQUTLkPdfk6jZaXzpqeJH
 Vh98R3wFHmA2RdMzQD1/9cxqoT2f+3eBYFsmycFG23JxDNlsjQ/BAJ9XN7euOqpQV3nc
 c5wLXtzeJoOYfTEVGIN0MI1euLkGDL5FDqKXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vS8OVqZe5gaAcYN4Y7CQPzPU225ksDpT3Boi/aiNNeY=;
 b=HvDbnHDw0wZxMJ0tHhC3chknVVQoXhAqm11UwU0JFgDXGrOCUNWM6J2Pe6GLhAlQzF
 OGbtj/4zWnTFbK7jmjYsrBZ692EqOjm7k9MezM/0ulH9fHC+qdKKQwYuiLL7NV34NkDJ
 56K9weRdnen9B3i/f4E3oYMc24J6A4O3glK1SPd5lGwQQbm37KuvdiG8hGetLIqM6ima
 ItU3mdbeSN5Hr3UvYYvuwNdPZUyBgjORRBp5IS8eBzR12bibBEaFd6xB86Co669y/fIx
 7QmQPSh2PEPcJBzxX9xVeL6Aq3lriF1NwuqmhLwdUTT5JszhcWnhtx7ZGhQfKRIGulit
 2ahg==
X-Gm-Message-State: APjAAAVelaZ7es+w08W37BN3D0QB8VVOt2weajZIWTDuQWkOmLyshanE
 Lz3cXjgRItZOAmewFL5gnOyJp3DYAEQ=
X-Google-Smtp-Source: APXvYqyeH0UIyluwPYcXIreo4CvYUeEbitkMoY92hNWmM7DtvJNMxtZ4UQONe4/DIY7Bnx/QuDwnag==
X-Received: by 2002:a17:902:ba82:: with SMTP id
 k2mr20014635pls.323.1559565521642; 
 Mon, 03 Jun 2019 05:38:41 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id y7sm26907292pja.26.2019.06.03.05.38.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 05:38:41 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v7 1/2] mtd: mtdcore: add debugfs nodes for querying the flash
 name and id
Date: Mon,  3 Jun 2019 20:38:35 +0800
Message-Id: <20190603123835.65536-1-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_053843_139292_F6DA704A 
X-CRM114-Status: GOOD (  17.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, zhuohao@chromium.org, bbrezillon@kernel.org,
 richard@nod.at, briannorris@chromium.org, marek.vasut@gmail.com,
 boris.brezillon@collabora.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, we don't have vfs nodes for querying the underlying flash name
and flash id. This information is important especially when we want to
know the flash detail of the defective system. In order to support the
query, we add mtd_debugfs_populate() to create two debugfs nodes
(ie. partname and partid). The upper driver can assign the pointer to
partname and partid before calling mtd_device_register().

Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
---
Changes in V7:
- Remove unused check for partname/partid
- Previous discussion: https://patchwork.ozlabs.org/patch/1109200/
Changes in V6:
- Create the debugfs only when the partname/partid is not NULL
- Previous discussion: https://patchwork.ozlabs.org/patch/1109041/
Changes in V5:
- Move debugfs_create_dir() to mtd_debugfs_populate()
- Previous discussion: https://patchwork.ozlabs.org/patch/1107810/
Changes in V4:
- Separate the change to two patches. The first patch is adding the general
  handling for the partname and partid in the mtdcore.c. The second patch
  is enabling the two debugfs nodes for spi-nor.
- Previous discussion: https://patchwork.ozlabs.org/patch/1097377/
Changes in v3:
- Add partname and partid to mtd.h and create debugfs inside mtdcore.c
- Previous discussion: https://patchwork.ozlabs.org/patch/1095731/
Changes in v2:
- Change to use debugfs to output flash name and id
- Previous discussion: https://patchwork.ozlabs.org/patch/1067763/
---
 drivers/mtd/mtdcore.c   | 84 ++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/mtd.h |  3 ++
 2 files changed, 78 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3ef01baef9b6..d4603bc1d4eb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -357,6 +357,80 @@ static const struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
+static int mtd_partid_show(struct seq_file *s, void *p)
+{
+	struct mtd_info *mtd = s->private;
+
+	seq_printf(s, "%s\n", mtd->dbg.partid);
+
+	return 0;
+}
+
+static int mtd_partid_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtd_partid_show, inode->i_private);
+}
+
+static const struct file_operations mtd_partid_debug_fops = {
+	.open           = mtd_partid_debugfs_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
+static int mtd_partname_show(struct seq_file *s, void *p)
+{
+	struct mtd_info *mtd = s->private;
+
+	seq_printf(s, "%s\n", mtd->dbg.partname);
+
+	return 0;
+}
+
+static int mtd_partname_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtd_partname_show, inode->i_private);
+}
+
+static const struct file_operations mtd_partname_debug_fops = {
+	.open           = mtd_partname_debugfs_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
+static struct dentry *dfs_dir_mtd;
+
+static void mtd_debugfs_populate(struct mtd_info *mtd)
+{
+	struct device *dev = &mtd->dev;
+	struct dentry *root, *dent;
+
+	if (IS_ERR_OR_NULL(dfs_dir_mtd))
+		return;
+
+	root = mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev),
+						     dfs_dir_mtd);
+	if (IS_ERR_OR_NULL(root)) {
+		pr_debug("mtd device %s won't show data in debugfs\n",
+			 dev_name(dev));
+		return;
+	}
+
+	if (mtd->dbg.partid) {
+		dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
+					   &mtd_partid_debug_fops);
+		if (IS_ERR_OR_NULL(dent))
+			pr_err("cannot create debugfs entry for partid\n");
+	}
+	if (mtd->dbg.partname) {
+		dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
+					   &mtd_partname_debug_fops);
+		if (IS_ERR_OR_NULL(dent))
+			pr_err("cannot create debugfs entry for partname\n");
+	}
+}
+
 #ifndef CONFIG_MMU
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
 {
@@ -534,8 +608,6 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
-static struct dentry *dfs_dir_mtd;
-
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -621,13 +693,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (error)
 		goto fail_nvmem_add;
 
-	if (!IS_ERR_OR_NULL(dfs_dir_mtd)) {
-		mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(&mtd->dev), dfs_dir_mtd);
-		if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
-			pr_debug("mtd device %s won't show data in debugfs\n",
-				 dev_name(&mtd->dev));
-		}
-	}
+	mtd_debugfs_populate(mtd);
 
 	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
 		      "mtd%dro", i);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 677768b21a1d..b11afb85d962 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -203,6 +203,9 @@ struct module;	/* only needed for owner field in mtd_info */
  */
 struct mtd_debug_info {
 	struct dentry *dfs_dir;
+
+	const char *partname;
+	const char *partid;
 };
 
 struct mtd_info {
-- 
2.22.0.rc1.311.g5d7573a151-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
