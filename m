Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FA1C7EE3A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emX4t7eMIXyXbkXxf85AEWdnxbU9nqC/qFT2yw/WJI0=; b=EAylpKdFsHtA8v
	v/fsWQMyF87SwW6MWr1dmLTWgcmHPcwaD/h/5QYwXDz1b277/kG2uX4KzH7/MUSCeakdpKKpJlSXp
	mZLVVfn0NweDUDlMWn4GQ2gBvbyeSl3hgcCPsfCEX5wl8UF/Jm4XnFqaqUrMtf8jMFSXZuGLA/0Yh
	eYBMWZwZW2JUhSFds7Hbq9ASJcNtX2oqZRFaOrPqZ/emnIIijVPgjkJyGao5rxvbV8yd99OV9CpfR
	X1Y901nW64UE6y5jKGKskcDz51huTjpMfOfYO+RtRhh6rzTgkZrTUgbpOznCO4rzZfxuU7EO+/SUa
	yPSMmMxuI2Ry/7zfevVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNP-00HRLz-11;
	Wed, 31 May 2023 12:56:31 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LNM-00HRHM-2B;
	Wed, 31 May 2023 12:56:29 +0000
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
Subject: [PATCH 09/24] init: don't remove the /dev/ prefix from error messages
Date: Wed, 31 May 2023 14:55:20 +0200
Message-Id: <20230531125535.676098-10-hch@lst.de>
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

Remove the code that drops the /dev/ prefix from root_device_name, which
is only used for error messages when mounting the root device fails.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 1405ee7218bf00..74cc96bffbdd71 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -607,8 +607,6 @@ void __init mount_root(char *root_device_name)
  */
 void __init prepare_namespace(void)
 {
-	char *root_device_name;
-
 	if (root_delay) {
 		printk(KERN_INFO "Waiting %d sec before mounting root device...\n",
 		       root_delay);
@@ -627,19 +625,16 @@ void __init prepare_namespace(void)
 	md_run_setup();
 
 	if (saved_root_name[0]) {
-		root_device_name = saved_root_name;
-		if (!strncmp(root_device_name, "mtd", 3) ||
-		    !strncmp(root_device_name, "ubi", 3)) {
-			mount_root_generic(root_device_name, root_device_name,
+		if (!strncmp(saved_root_name, "mtd", 3) ||
+		    !strncmp(saved_root_name, "ubi", 3)) {
+			mount_root_generic(saved_root_name, saved_root_name,
 					   root_mountflags);
 			goto out;
 		}
-		ROOT_DEV = name_to_dev_t(root_device_name);
-		if (strncmp(root_device_name, "/dev/", 5) == 0)
-			root_device_name += 5;
+		ROOT_DEV = name_to_dev_t(saved_root_name);
 	}
 
-	if (initrd_load(root_device_name))
+	if (initrd_load(saved_root_name))
 		goto out;
 
 	/* wait for any asynchronous scanning to complete */
@@ -652,7 +647,7 @@ void __init prepare_namespace(void)
 		async_synchronize_full();
 	}
 
-	mount_root(root_device_name);
+	mount_root(saved_root_name);
 out:
 	devtmpfs_mount();
 	init_mount(".", "/", NULL, MS_MOVE, NULL);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
