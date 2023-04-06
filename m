Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA58BC77B6E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PlT+OaCBk4fD45ZJnlDqgTDNyrR810QLCt4X8dTp30=; b=DLuiKgtVImKl5m
	dqYqNgQ/aDlP11DJ8iSAq/pImUxXD2D48w24o/3UksxHujKzT29jHF2mpbVAsf+d6ZHcFsE/AWuQF
	Uver3UQ1T80s9txZoTcB2FBeDbdGV0Q2KTEzyOLlb2X67a9GXHTTteTMAANtS6bmtkV5wwpESDkde
	Wza+XzL0Xx9oszi1SWHvg0AvNJG6R155pY/uGMF6kxgVB4/mOJs07LTbKGQFBL4L6ZcH7YtEtRI6y
	7Ny9yGx6RkOblg9BTOTbAADUuYLzbCp97klbn6nCdKmyaxrVIg2bcNuRotc3MpnNu5gw+oWMMhu4U
	F6yO3e+g2dnEkc046dSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkNqi-007A8f-0P;
	Thu, 06 Apr 2023 11:32:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkNqe-007A6S-0r
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 11:32:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B601D64656;
	Thu,  6 Apr 2023 11:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FCDC433EF;
	Thu,  6 Apr 2023 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680780731;
	bh=6nVlqJwBRNC1O9r0E4RzWVTpTGevWx/EOmM2z249EZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UqcGvugzX4cfXfbQlMrldoKWnCtaXg/g9Wbu6l71EsiA6FvNjHdOc2eRRDqV8HKd4
	 hoUmTpx9r1EDwP6LVaHsokt+eOWdjJL5pmQR472omiuZM5aVyUQk+hAah68Egwt/1t
	 xgu7/27rsghGBAjiTbLRw0FgZHSL2+s5vWSOi7UzFSDoGGyKH9xcs6RwzP6jBhunmp
	 gVwVuWDxfVE6i7wWEZGkM6uwPYWGPBUnRYpd+KmDuB/644NRIajT05eccTGaaXloqP
	 9+nns0UlDYXtVVTzgt+YVCcFYVQtyfb1utVhR1S5QpdL78McQL0SswmP55d1UqNF5S
	 TIfyk8UKidxjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	Sasha Levin <sashal@kernel.org>,
	tudor.ambarus@linaro.org
Subject: [PATCH AUTOSEL 6.2 17/17] mtd: spi-nor: fix memory leak when using debugfs_lookup()
Date: Thu,  6 Apr 2023 07:31:31 -0400
Message-Id: <20230406113131.648213-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113131.648213-1-sashal@kernel.org>
References: <20230406113131.648213-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_043212_386690_7581451E 
X-CRM114-Status: GOOD (  15.40  )
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit ec738ca127d07ecac6afae36e2880341ec89150e ]

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  To solve this, remove the
lookup and create the directory on the first device found, and then
remove it when the module is unloaded.

Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Reviewed-by: Michael Walle <michael@walle.cc>
Link: https://lore.kernel.org/r/20230208160230.2179905-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/spi-nor/core.c    | 14 +++++++++++++-
 drivers/mtd/spi-nor/core.h    |  2 ++
 drivers/mtd/spi-nor/debugfs.c | 11 ++++++++---
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2ef2660f58180..4244c6fd98111 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3344,7 +3344,19 @@ static struct spi_mem_driver spi_nor_driver = {
 	.remove = spi_nor_remove,
 	.shutdown = spi_nor_shutdown,
 };
-module_spi_mem_driver(spi_nor_driver);
+
+static int __init spi_nor_module_init(void)
+{
+	return spi_mem_driver_register(&spi_nor_driver);
+}
+module_init(spi_nor_module_init);
+
+static void __exit spi_nor_module_exit(void)
+{
+	spi_mem_driver_unregister(&spi_nor_driver);
+	spi_nor_debugfs_shutdown();
+}
+module_exit(spi_nor_module_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 958cd143c9346..f4246c52a1def 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -714,8 +714,10 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 
 #ifdef CONFIG_DEBUG_FS
 void spi_nor_debugfs_register(struct spi_nor *nor);
+void spi_nor_debugfs_shutdown(void);
 #else
 static inline void spi_nor_debugfs_register(struct spi_nor *nor) {}
+static inline void spi_nor_debugfs_shutdown(void) {}
 #endif
 
 #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index ff895f6758ea1..558ffecf8ae6d 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -226,13 +226,13 @@ static void spi_nor_debugfs_unregister(void *data)
 	nor->debugfs_root = NULL;
 }
 
+static struct dentry *rootdir;
+
 void spi_nor_debugfs_register(struct spi_nor *nor)
 {
-	struct dentry *rootdir, *d;
+	struct dentry *d;
 	int ret;
 
-	/* Create rootdir once. Will never be deleted again. */
-	rootdir = debugfs_lookup(SPI_NOR_DEBUGFS_ROOT, NULL);
 	if (!rootdir)
 		rootdir = debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);
 
@@ -247,3 +247,8 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
 	debugfs_create_file("capabilities", 0444, d, nor,
 			    &spi_nor_capabilities_fops);
 }
+
+void spi_nor_debugfs_shutdown(void)
+{
+	debugfs_remove(rootdir);
+}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
