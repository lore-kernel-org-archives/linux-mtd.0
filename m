Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E079C7EE33
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoAJn89fo19Dvx5hMyhUcnukFs94MPHc1lUdSKJTdoM=; b=QLtrJObWdH/nmV
	SjgSHedL5327LLKeWHwAlWzEH20eVMsM6tWA/wUwyNFCc+bwVpi/T8qLRUGpzioLJ+7930155IuLn
	M1rxiHdrhZ7fpMr75xiLoe2E5aHff1/Rpsp7M6HrNSf1IkjddC0dMLLUGe5YkUOys/Gkls76apnzr
	CjDkuVk0wbCO5XR2dLNkvhUBedQ0LNCXjRQULl3eVyPPPUuSxIf/8zwwfGybOfrrP1kE2ZgqpX+QN
	cRfIdmCBbvmIuZ2qZAt+8sU/rdAZLH7dsjp/ZoTlXQkNQIBodOATQQL+q4zxnb/SnNF87O0aFmF8c
	kCaqFZ1cedZnTNeWzLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LN6-00HR8C-0K;
	Wed, 31 May 2023 12:56:12 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LN4-00HR5q-0p;
	Wed, 31 May 2023 12:56:10 +0000
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
	Loic Poulain <loic.poulain@linaro.org>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 06/24] init: rename mount_block_root to mount_root_generic
Date: Wed, 31 May 2023 14:55:17 +0200
Message-Id: <20230531125535.676098-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531125535.676098-1-hch@lst.de>
References: <20230531125535.676098-1-hch@lst.de>
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

mount_block_root is also used to mount non-block file systems, so give
it a better name.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c        | 6 +++---
 init/do_mounts.h        | 2 +-
 init/do_mounts_initrd.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 2fe7901b5bcfaf..a2c0baace0992c 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -391,7 +391,7 @@ static int __init do_mount_root(const char *name, const char *fs,
 	return ret;
 }
 
-void __init mount_block_root(char *name, int flags)
+void __init mount_root_generic(char *name, int flags)
 {
 	struct page *page = alloc_page(GFP_KERNEL);
 	char *fs_names = page_address(page);
@@ -589,7 +589,7 @@ void __init mount_root(void)
 
 		if (err < 0)
 			pr_emerg("Failed to create /dev/root: %d\n", err);
-		mount_block_root("/dev/root", root_mountflags);
+		mount_root_generic("/dev/root", root_mountflags);
 	}
 #endif
 }
@@ -620,7 +620,7 @@ void __init prepare_namespace(void)
 		root_device_name = saved_root_name;
 		if (!strncmp(root_device_name, "mtd", 3) ||
 		    !strncmp(root_device_name, "ubi", 3)) {
-			mount_block_root(root_device_name, root_mountflags);
+			mount_root_generic(root_device_name, root_mountflags);
 			goto out;
 		}
 		ROOT_DEV = name_to_dev_t(root_device_name);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index 7a29ac3e427bab..33623025f6951a 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -10,7 +10,7 @@
 #include <linux/root_dev.h>
 #include <linux/init_syscalls.h>
 
-void  mount_block_root(char *name, int flags);
+void  mount_root_generic(char *name, int flags);
 void  mount_root(void);
 extern int root_mountflags;
 
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 34731241377d30..686d1ff3af4bb1 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -95,7 +95,7 @@ static void __init handle_initrd(void)
 	real_root_dev = new_encode_dev(ROOT_DEV);
 	create_dev("/dev/root.old", Root_RAM0);
 	/* mount initrd on rootfs' /root */
-	mount_block_root("/dev/root.old", root_mountflags & ~MS_RDONLY);
+	mount_root_generic("/dev/root.old", root_mountflags & ~MS_RDONLY);
 	init_mkdir("/old", 0700);
 	init_chdir("/old");
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
