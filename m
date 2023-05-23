Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20679C7EE26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4V3EhQcCHUNACcTsMM+29oUD+1lRtqcBRcn2Y1TDtCg=; b=Ctbp3/vIMp5zBS
	8rbXOoiPm0ww2wZt/lFlKw0YP5o+WPORrBhAwXc0Mu9QYAvjuD6tZpLCq+TOYD2bMv5GnTdCbrPlP
	XvQxqL++yL9EIg0escn/sQUS7ycNz/HyK/C+JCY2VlwAJ0vXvReGVxdIcu5+XjUqDlPjGKXVE02Zz
	BbjXvRXrk7QjPWY9/GIxJYvCyqJxwDzLdXhQsBumiV8gLkBfPCKaZhuErTgCw6xuIH+mjvQHn7Zl2
	o6wTdGHdo5pD94xaoOv9hKTaXZxpGeMmo+ACR6WiAXQIeOYjd2mFmzORIG5sBC6D6VVpdgvGXjPvS
	QpasAgUfyOzaKg/Kz3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mic-009Gmr-34;
	Tue, 23 May 2023 07:46:06 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mib-009Gjq-0W;
	Tue, 23 May 2023 07:46:05 +0000
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
Subject: [PATCH 10/24] init: handle ubi/mtd root mounting like all other root types
Date: Tue, 23 May 2023 09:45:21 +0200
Message-Id: <20230523074535.249802-11-hch@lst.de>
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

Assign a Root_Generic magic value for UBI/MTD root and handle the root
mounting in mount_root like all other root types.  Besides making the
code more clear this also means that UBI/MTD root can be used together
with an initrd (not that anyone should care).

Also factor parsing of the root name into a helper now that it can
be easily done and will get more complicated with subsequent patches.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/root_dev.h |  1 +
 init/do_mounts.c         | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index ed3ea8da642972..847c9a06101b76 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -9,6 +9,7 @@
 enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
+	Root_Generic = MKDEV(UNNAMED_MAJOR, 253),
 	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
 };
 
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 74cc96bffbdd71..be6d14733ba02f 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -591,6 +591,10 @@ void __init mount_root(char *root_device_name)
 	case Root_CIFS:
 		mount_cifs_root();
 		break;
+	case Root_Generic:
+		mount_root_generic(root_device_name, root_device_name,
+				   root_mountflags);
+		break;
 	case 0:
 		if (root_device_name && root_fs_names &&
 		    mount_nodev_root(root_device_name) == 0)
@@ -602,6 +606,14 @@ void __init mount_root(char *root_device_name)
 	}
 }
 
+static dev_t __init parse_root_device(char *root_device_name)
+{
+	if (!strncmp(root_device_name, "mtd", 3) ||
+	    !strncmp(root_device_name, "ubi", 3))
+		return Root_Generic;
+	return name_to_dev_t(root_device_name);
+}
+
 /*
  * Prepare the namespace - decide what/where to mount, load ramdisks, etc.
  */
@@ -624,15 +636,8 @@ void __init prepare_namespace(void)
 
 	md_run_setup();
 
-	if (saved_root_name[0]) {
-		if (!strncmp(saved_root_name, "mtd", 3) ||
-		    !strncmp(saved_root_name, "ubi", 3)) {
-			mount_root_generic(saved_root_name, saved_root_name,
-					   root_mountflags);
-			goto out;
-		}
-		ROOT_DEV = name_to_dev_t(saved_root_name);
-	}
+	if (saved_root_name[0])
+		ROOT_DEV = parse_root_device(saved_root_name);
 
 	if (initrd_load(saved_root_name))
 		goto out;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
