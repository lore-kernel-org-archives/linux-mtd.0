Return-Path: <SRS0=l9qW=T6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E676EC28CC0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 15:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5A9425CCB
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 15:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCyqxL4z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PMC8FY/M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5A9425CCB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7z4p5w8F7Ww4KrhqvRLZgaK6zZLNZ3p8Q+b6EfvpHWM=; b=RCyqxL4zKTpUTM
	6ooKOsxXkEfzu09u4B8sgAgCCm050PcEGGMyQrsJ+9HmckHSIh5zf90MhrdmQ6pGysvvow5w9sBU/
	h5vVp9qKAHv8ujhDsflfQlLZ7EkgBbk2x16vRch9OT3RqheRYgd8ylgNXadsfK4zHQCaHfCIpup9B
	JcdGpC+Jlo/0Y5h1QAlWih0e2a8OLPuGXLSi/2qDXp5cV3SJAlVjsp6cVLOsP8Ml6NYT4b+CPCpY3
	s9DtkKToAWb6NwJOUZwxPequG0m+rVXlIs608qCcA4KDKFtsg8d+JtGRL+oOq6xSANwiwUJ4uWv50
	YHbh5LSG0lxt3DPDRvQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWMrn-0007Zs-Lc; Thu, 30 May 2019 15:21:19 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWMrk-0007ZU-HR
 for linux-mtd@lists.infradead.org; Thu, 30 May 2019 15:21:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id c14so1764190pfi.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 May 2019 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRjvhoqF+poq2aNfNtjW3hCXw5XIgD2Cm81ruqRXoTQ=;
 b=PMC8FY/MuPFdoNQRgkjDPUDp0cNcXVUYScaGTSinnr+I8YebzKQtj1DrqPe28qgTG9
 xtdSnv0irLupZSrsfdZchykLFG7M4hlyMyZLA+x8ypC9OiXlDQJzbVVWqkxCoyek9VTT
 jDfsLc1U2CXGneMLhl/oxC7KRtHnjFT/lBnDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRjvhoqF+poq2aNfNtjW3hCXw5XIgD2Cm81ruqRXoTQ=;
 b=FHdBPhOk9fyfxv+YeynqDT5Dev3s+IVuZtBmkmkPsVInaY2gGWiENbHqDGGTq7TBRR
 Xw5HJKqY4hdwv+w6dUFuxS/MmxSlTWnbWL9uyubcokWvuGiyF7ouRZPEX+KipcEZuFrE
 H/Fgf5FIM24u2ZXEyi5iSvNlAvqduUvyM5deq3JtKCkiKmYmA4AJoNmmxHmLOF+m0EFa
 V7sYZAmi4IIoNd3Ze1B5OLcar8CKXbq3cgP3yb093q/IiclEc/2GRjYrv3qDiJF3KlX4
 k6jwE+UTXOs98y8fdLlv6R5BWXm2yC0LLzU8IXvMHPxgdYwt+zP3Ihm9a4rGsDB605NW
 P1Ng==
X-Gm-Message-State: APjAAAXB1XebCjs9zbZJ0+Me+MzTu/Tx8//ZZMcRXgtOz0KLqPT3CZfR
 n7+bRi8NS5imXzN/P+R4/Pz4ty964PI=
X-Google-Smtp-Source: APXvYqwEs9wuzeGKeY2PhQiyD2jO6JUkmikVqzEdRrR/JqY8kGpfDMSGJseSQ6HZ9LvbyuAJEtdrMg==
X-Received: by 2002:a62:3145:: with SMTP id x66mr4290394pfx.223.1559229674754; 
 Thu, 30 May 2019 08:21:14 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id j22sm3198663pfh.71.2019.05.30.08.21.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 08:21:14 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 1/2] mtd: mtdcore: add debugfs nodes for querying the flash
 name and id
Date: Thu, 30 May 2019 23:21:00 +0800
Message-Id: <20190530152101.176431-1-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_082116_600075_AD2EDA7D 
X-CRM114-Status: GOOD (  14.77  )
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
 drivers/mtd/mtdcore.c   | 72 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  4 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3ef01baef9b6..b53b40cb2f04 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -357,6 +357,75 @@ static const struct device_type mtd_devtype = {
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
+static int mtd_debugfs_populate(struct mtd_info *mtd)
+{
+	struct dentry *root = mtd->dbg.dfs_dir;
+	struct dentry *dent;
+
+	dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
+				   &mtd_partid_debug_fops);
+	if (IS_ERR_OR_NULL(dent)) {
+		pr_err("cannot create debugfs entry for partid\n");
+		return -ENODEV;
+	}
+	dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
+				   &mtd_partname_debug_fops);
+	if (IS_ERR_OR_NULL(dent)) {
+		pr_err("cannot create debugfs entry for partname\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 #ifndef CONFIG_MMU
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
 {
@@ -626,6 +695,9 @@ int add_mtd_device(struct mtd_info *mtd)
 		if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
 			pr_debug("mtd device %s won't show data in debugfs\n",
 				 dev_name(&mtd->dev));
+		} else if (mtd_debugfs_populate(mtd)) {
+			pr_debug("mtd device %s can't create debugfs\n",
+				 dev_name(&mtd->dev));
 		}
 	}
 
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
2.22.0.rc1.257.g3120a18244-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
