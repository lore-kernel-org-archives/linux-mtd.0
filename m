Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425BEC7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yxU35KuI3kcNkrG+UzAGuGZXHKPKzmEwGOnYr3D8AQ=; b=19AoqCXwz+X8qV
	edzuvIOakOKn8RrERi2Vc+6DNdTzXNQdZvu20xfSz9HHe4pRT9EWltSDyimAp5w7YVVfqKqRG9tfJ
	plIDWh79f9Y2Lg4bv71fmiG9wmMVD6q93eh0Z5onkaDU7IxYjm60jtUEptpWKhx6KSTIve6exqJif
	j+E+KsAaqYbToFKPqjK/NXG8YclsZjBA/DK9FD8sEyC0XNck6qOKH+mAp3hOFvUYPe7aNDWShy1xU
	76BjP0y1sU+FnmJyR2xP19x3GtG1AWjIUbiPwMIh/8nGgpOdRAYfS7k+mKgY451uXtlwbgpDNhjuv
	q8wIyoAisrAH/vjHlrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RJ5-000ZOs-0B;
	Tue, 06 Jun 2023 07:40:43 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RIh-000YuD-04;
	Tue, 06 Jun 2023 07:40:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-btrfs@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 08/31] block: share code between disk_check_media_change and disk_force_media_change
Date: Tue,  6 Jun 2023 09:39:27 +0200
Message-Id: <20230606073950.225178-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
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

Factor the common logic between disk_check_media_change and
disk_force_media_change into a helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/disk-events.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/block/disk-events.c b/block/disk-events.c
index 8b1b63225738f8..06f325662b3494 100644
--- a/block/disk-events.c
+++ b/block/disk-events.c
@@ -262,6 +262,18 @@ static unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask)
 	return pending;
 }
 
+static bool __disk_check_media_change(struct gendisk *disk, unsigned int events)
+{
+	if (!(events & DISK_EVENT_MEDIA_CHANGE))
+		return false;
+
+	if (__invalidate_device(disk->part0, true))
+		pr_warn("VFS: busy inodes on changed media %s\n",
+			disk->disk_name);
+	set_bit(GD_NEED_PART_SCAN, &disk->state);
+	return true;
+}
+
 /**
  * disk_check_media_change - check if a removable media has been changed
  * @disk: gendisk to check
@@ -274,18 +286,9 @@ static unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask)
  */
 bool disk_check_media_change(struct gendisk *disk)
 {
-	unsigned int events;
-
-	events = disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE |
-				   DISK_EVENT_EJECT_REQUEST);
-	if (!(events & DISK_EVENT_MEDIA_CHANGE))
-		return false;
-
-	if (__invalidate_device(disk->part0, true))
-		pr_warn("VFS: busy inodes on changed media %s\n",
-			disk->disk_name);
-	set_bit(GD_NEED_PART_SCAN, &disk->state);
-	return true;
+	return __disk_check_media_change(disk,
+			disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE |
+						DISK_EVENT_EJECT_REQUEST));
 }
 EXPORT_SYMBOL(disk_check_media_change);
 
@@ -303,15 +306,7 @@ EXPORT_SYMBOL(disk_check_media_change);
 bool disk_force_media_change(struct gendisk *disk, unsigned int events)
 {
 	disk_event_uevent(disk, events);
-
-	if (!(events & DISK_EVENT_MEDIA_CHANGE))
-		return false;
-
-	if (__invalidate_device(disk->part0, true))
-		pr_warn("VFS: busy inodes on changed media %s\n",
-			disk->disk_name);
-	set_bit(GD_NEED_PART_SCAN, &disk->state);
-	return true;
+	return __disk_check_media_change(disk, events);
 }
 EXPORT_SYMBOL_GPL(disk_force_media_change);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
