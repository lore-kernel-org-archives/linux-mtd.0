Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC691C87FDE
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tNsG8LfBBaSseGeslqYl18g2aPC0xJ8JiKjJjxHcYw=; b=izdZFXRMcr5UUK
	E2pkSfyRM0LhIVEbmjPU9dn1IvjDxo1f3GwNGkY6IWwez9HPbY+WNqlducwA3AkkHoB2Bx9Tg4Len
	K4JI1ijHOuA4838lhXEjLAvwz/hDJcxbt/RLP4sInUmKwcVp+usPZpsUBCHt1RFd57gG2oFshUjUi
	JEEK5Z5qglqzr0tA0oiIav2nfwB3f8rhrvdVCO45+jJ3B5gy/ULDANNkBT+F/4Fv3s0R4J7bGth7N
	ECl5va+Xch2l8KmZPpL65pZqwQzG14Rsxf4n3p8G/kji7CaA7hfP8T6H+Os0Sdhw5/aS6/O2OmLWx
	TuN1hRlbkc3tEAxufodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mj4-009HGJ-2f;
	Tue, 23 May 2023 07:46:34 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mj1-009HBv-1X;
	Tue, 23 May 2023 07:46:31 +0000
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
Subject: [PATCH 19/24] dm: remove dm_get_dev_t
Date: Tue, 23 May 2023 09:45:30 +0200
Message-Id: <20230523074535.249802-20-hch@lst.de>
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

Open code dm_get_dev_t in the only remaining caller, and propagate the
exact error code from lookup_bdev and early_lookup_bdev.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-table.c         | 20 ++++----------------
 include/linux/device-mapper.h |  2 --
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 05aa16da43b0d5..e997f4322a9967 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -323,20 +323,6 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
 	return 0;
 }
 
-/*
- * Convert the path to a device
- */
-dev_t dm_get_dev_t(const char *path)
-{
-	dev_t dev;
-
-	if (lookup_bdev(path, &dev) &&
-	    early_lookup_bdev(path, &dev))
-		return 0;
-	return dev;
-}
-EXPORT_SYMBOL_GPL(dm_get_dev_t);
-
 /*
  * Add a device to the list, or just increment the usage count if
  * it's already present.
@@ -359,8 +345,10 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 		if (MAJOR(dev) != major || MINOR(dev) != minor)
 			return -EOVERFLOW;
 	} else {
-		dev = dm_get_dev_t(path);
-		if (!dev)
+		r = lookup_bdev(path, &dev);
+		if (r)
+			r = early_lookup_bdev(path, &dev);
+		if (r)
 			return -ENODEV;
 	}
 	if (dev == disk_devt(t->md->disk))
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index a52d2b9a68460a..c27b84002d8382 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -170,8 +170,6 @@ struct dm_dev {
 	char name[16];
 };
 
-dev_t dm_get_dev_t(const char *path);
-
 /*
  * Constructors should call these functions to ensure destination devices
  * are opened/closed correctly.
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
