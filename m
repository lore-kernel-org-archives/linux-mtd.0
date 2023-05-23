Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB682C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4POXP1EKD8qHCTSOurotMbAVnHmqnycs8j/JBIoaNI=; b=xW2QJZp6/h/5au
	+Ua8CqY4IpOJEA8Am5YzizVkX79kIaeYXxmfz4R9rPGff14DjeEewE4Cxgh5jvMHw+kBo4P6qyOfz
	Ew7LW+Rth02YL+MBbiuq4m5Kq6xuA9m2S4K+m20oyvshR70xGjdjBKUPjpMITTgQW5+4JFqVd+awV
	8PElIyegM+XA+8WTxC65E7iJKzPdv357yvdg7H1s9p1MgmxC13Ph01Emysd4BXGJlDNzA2MgSdS2K
	VhlZGLn6Lja8n8+femSloni73wL7EBTWmFIjyMBT4pzywcSP+/Z3lNL5D8PIDMi2wGYZrEJXkMizA
	El16rlzWls9LAjE6XwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MiV-009GgD-1v;
	Tue, 23 May 2023 07:45:59 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MiS-009Gce-39;
	Tue, 23 May 2023 07:45:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 07/24] init: refactor mount_root
Date: Tue, 23 May 2023 09:45:18 +0200
Message-Id: <20230523074535.249802-8-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
MIME-Version: 1.0
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

Provide stubs for all the lower level mount helpers, and just switch
on ROOT_DEV in the main function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 104 +++++++++++++++++++++++++----------------------
 1 file changed, 56 insertions(+), 48 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index a2c0baace0992c..e708b02d9d6566 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -453,15 +453,14 @@ void __init mount_root_generic(char *name, int flags)
 #define NFSROOT_TIMEOUT_MAX	30
 #define NFSROOT_RETRY_MAX	5
 
-static int __init mount_nfs_root(void)
+static void __init mount_nfs_root(void)
 {
 	char *root_dev, *root_data;
 	unsigned int timeout;
-	int try, err;
+	int try;
 
-	err = nfs_root_data(&root_dev, &root_data);
-	if (err != 0)
-		return 0;
+	if (nfs_root_data(&root_dev, &root_data))
+		goto fail;
 
 	/*
 	 * The server or network may not be ready, so try several
@@ -470,10 +469,8 @@ static int __init mount_nfs_root(void)
 	 */
 	timeout = NFSROOT_TIMEOUT_MIN;
 	for (try = 1; ; try++) {
-		err = do_mount_root(root_dev, "nfs",
-					root_mountflags, root_data);
-		if (err == 0)
-			return 1;
+		if (!do_mount_root(root_dev, "nfs", root_mountflags, root_data))
+			return;
 		if (try > NFSROOT_RETRY_MAX)
 			break;
 
@@ -483,9 +480,14 @@ static int __init mount_nfs_root(void)
 		if (timeout > NFSROOT_TIMEOUT_MAX)
 			timeout = NFSROOT_TIMEOUT_MAX;
 	}
-	return 0;
+fail:
+	pr_err("VFS: Unable to mount root fs via NFS.\n");
 }
-#endif
+#else
+static inline void mount_nfs_root(void)
+{
+}
+#endif /* CONFIG_ROOT_NFS */
 
 #ifdef CONFIG_CIFS_ROOT
 
@@ -495,22 +497,20 @@ extern int cifs_root_data(char **dev, char **opts);
 #define CIFSROOT_TIMEOUT_MAX	30
 #define CIFSROOT_RETRY_MAX	5
 
-static int __init mount_cifs_root(void)
+static void __init mount_cifs_root(void)
 {
 	char *root_dev, *root_data;
 	unsigned int timeout;
-	int try, err;
+	int try;
 
-	err = cifs_root_data(&root_dev, &root_data);
-	if (err != 0)
-		return 0;
+	if (cifs_root_data(&root_dev, &root_data))
+		goto fail;
 
 	timeout = CIFSROOT_TIMEOUT_MIN;
 	for (try = 1; ; try++) {
-		err = do_mount_root(root_dev, "cifs", root_mountflags,
-				    root_data);
-		if (err == 0)
-			return 1;
+		if (!do_mount_root(root_dev, "cifs", root_mountflags,
+				   root_data))
+			return;
 		if (try > CIFSROOT_RETRY_MAX)
 			break;
 
@@ -519,9 +519,14 @@ static int __init mount_cifs_root(void)
 		if (timeout > CIFSROOT_TIMEOUT_MAX)
 			timeout = CIFSROOT_TIMEOUT_MAX;
 	}
-	return 0;
+fail:
+	pr_err("VFS: Unable to mount root fs via SMB.\n");
 }
-#endif
+#else
+static inline void mount_cifs_root(void)
+{
+}
+#endif /* CONFIG_CIFS_ROOT */
 
 static bool __init fs_is_nodev(char *fstype)
 {
@@ -563,35 +568,38 @@ static int __init mount_nodev_root(void)
 	return err;
 }
 
-void __init mount_root(void)
-{
-#ifdef CONFIG_ROOT_NFS
-	if (ROOT_DEV == Root_NFS) {
-		if (!mount_nfs_root())
-			printk(KERN_ERR "VFS: Unable to mount root fs via NFS.\n");
-		return;
-	}
-#endif
-#ifdef CONFIG_CIFS_ROOT
-	if (ROOT_DEV == Root_CIFS) {
-		if (!mount_cifs_root())
-			printk(KERN_ERR "VFS: Unable to mount root fs via SMB.\n");
-		return;
-	}
-#endif
-	if (ROOT_DEV == 0 && root_device_name && root_fs_names) {
-		if (mount_nodev_root() == 0)
-			return;
-	}
 #ifdef CONFIG_BLOCK
-	{
-		int err = create_dev("/dev/root", ROOT_DEV);
+static void __init mount_block_root(void)
+{
+	int err = create_dev("/dev/root", ROOT_DEV);
+
+	if (err < 0)
+		pr_emerg("Failed to create /dev/root: %d\n", err);
+	mount_root_generic("/dev/root", root_mountflags);
+}
+#else
+static inline void mount_block_root(void)
+{
+}
+#endif /* CONFIG_BLOCK */
 
-		if (err < 0)
-			pr_emerg("Failed to create /dev/root: %d\n", err);
-		mount_root_generic("/dev/root", root_mountflags);
+void __init mount_root(void)
+{
+	switch (ROOT_DEV) {
+	case Root_NFS:
+		mount_nfs_root();
+		break;
+	case Root_CIFS:
+		mount_cifs_root();
+		break;
+	case 0:
+		if (root_device_name && root_fs_names && mount_nodev_root() == 0)
+			break;
+		fallthrough;
+	default:
+		mount_block_root();
+		break;
 	}
-#endif
 }
 
 /*
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
