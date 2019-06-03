Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4983C28CC5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 03:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80FB27B09
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 03:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0A0Q7hY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IuU9rO/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80FB27B09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0zBs2NJY1haGelMob3ekljQrw1UKcuM4JwKOJdm2xBo=; b=D0A0Q7hYtuNaGS
	MlLhkPyXqynUZ8CwfPHs1+O0Q5tpI1v+i6GCnpzjfy79yQfHxBgAQKEACrwZ2FyncVXdVppUQ52Uf
	a3N6Eo+8oNqAymfElNYIgHGu5ki98UO58iAJl1X+JOnjrK3yppfCOBYjnkH68iShxHV/MtrhUMorX
	mKgCxHBPF3ErX4qIrpEEp+UiInWL93VIf9A7SJ6iAhvjGrFINgo+e17F5ZHsZ5teglQRXiHhNcjMu
	lSl86zxxYcOMZX9oWFPm/oALFTz1tO3SbBpyYAOzJKlIjS+TpvabBbzk++m8Sx/r8VjcwkU21TKi3
	NsOG+KtpmHfRpl3Pzquw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXdR8-00085A-7b; Mon, 03 Jun 2019 03:15:02 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXdR4-00083q-6Y
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 03:14:59 +0000
Received: by mail-pf1-x442.google.com with SMTP id u17so9727387pfn.7
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jun 2019 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pY1+qGI91E0EqSa7CgP++1a1/iIqDBGnOwxUEPWKxq0=;
 b=IuU9rO/07g9vdW05EAeFWfAMfs9I3eZiQ4o/uUsSlfmTfw+76j5GVvctT8jt4EcwdA
 Uf6cQ1T0jFRcGTVqRo0Q1Hw9zkRBKkWxB8I+3eBPEstqwe4h/Y++uyKtaoBFRFcsuDa0
 EjPUvOF6xbZB9SgkBAIvfoqn4p4EySiQLjOiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pY1+qGI91E0EqSa7CgP++1a1/iIqDBGnOwxUEPWKxq0=;
 b=cou2lRm1koZKV0bKeI7kwC7rntmijQd2fTbgJlMSIBOFGuyMOLPUFsvNDSRc6lR921
 9uBIcYKL4kimmapRCXoGA7b3mdSTGfdIEGDckjQHNFLybVI1P7taTDigWe7wOcNOCkam
 id/P6h6/c/e3Lz0TDfMDm7BfTe5KdDKPKyo6VetKw/W9v+Lm7stRmvQxPORQyExjBLrv
 ZBbXPMmdekem4lyC9P7c/zpiUJMeT13A6q1Nj0pJq4l315BWydKNSBQnjs4CMF7DFpUl
 h8D2CuQtqKn/3K6u+ito52iN2aZuXOnawQvWUbYIJdNDhipuRF/rAnRMeJn3xT8K/3Ev
 dQCA==
X-Gm-Message-State: APjAAAV7I/+aohY6NkZNcX9UpvZ9Ef0HPMinD5yNq6c+97/RcMR0vlsG
 IEoKpJywGvu32/ZNathL3pN5yB7yAWQ=
X-Google-Smtp-Source: APXvYqzTNk8/pKxpNGmQys5KH221bd3QmUBqO4G3+2a3SwbXMHb69LR+TtOGrcedDQ6UD0imuqzJNA==
X-Received: by 2002:a17:90a:cb81:: with SMTP id
 a1mr1624025pju.81.1559531696539; 
 Sun, 02 Jun 2019 20:14:56 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id b128sm6473234pfa.165.2019.06.02.20.14.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 20:14:55 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 1/2] mtd: mtdcore: add debugfs nodes for querying the flash
 name and id
Date: Mon,  3 Jun 2019 11:14:50 +0800
Message-Id: <20190603031451.60749-1-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_201458_268252_CED5F7B1 
X-CRM114-Status: GOOD (  17.14  )
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
 drivers/mtd/mtdcore.c   | 88 ++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/mtd.h |  4 ++
 2 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3ef01baef9b6..b1911c21eb1a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -357,6 +357,84 @@ static const struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
+static int mtd_partid_show(struct seq_file *s, void *p)
+{
+	struct mtd_info *mtd = s->private;
+
+	if (!mtd->dbg.partid)
+		return 0;
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
+	if (!mtd->dbg.partname)
+		return 0;
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
+	dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
+				   &mtd_partid_debug_fops);
+	if (IS_ERR_OR_NULL(dent)) {
+		pr_err("cannot create debugfs entry for partid\n");
+		return;
+	}
+	dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
+				   &mtd_partname_debug_fops);
+	if (IS_ERR_OR_NULL(dent))
+		pr_err("cannot create debugfs entry for partname\n");
+}
+
 #ifndef CONFIG_MMU
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
 {
@@ -534,8 +612,6 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
-static struct dentry *dfs_dir_mtd;
-
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -621,13 +697,7 @@ int add_mtd_device(struct mtd_info *mtd)
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
index 677768b21a1d..c20f53c77899 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -203,6 +203,10 @@ struct module;	/* only needed for owner field in mtd_info */
  */
 struct mtd_debug_info {
 	struct dentry *dfs_dir;
+
+	/* debugfs stuff starts here */
+	const char *partname;
+	const char *partid;
 };
 
 struct mtd_info {
-- 
2.22.0.rc1.311.g5d7573a151-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
