Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A5AC7EE39
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhyv+voajTLBMsZiX1cA7xuAq6Ys1+RmcJ3Cemv8OFc=; b=gUVtRpKOeLKfRi
	sW/9iMkBtgO5Fz6p5m0euAuKbti6c0tLclIEeG13ME0p9LV2hIxXjmWnl78Vxp0l9fyvxis/q7GfU
	eJ1591tZ8ZIqjHQmaKAZrVkroLt7qWfxjb7kSTJuUwC/wnaMEDjlWiV3WCgKkCZwVOchzRv7odN2G
	2GUugRc7/pSgpFdh4W/IQQbtReqJ30nZVUmCKFLTe+8NyC5ZJxLXfHYr8juWNwb/rYAPkQtLeOLpV
	xp64oEL+3YTdEShrRAPFrifb4cIixjHrZJgcHpJDmRWs/7TWF74Bp2jxl0SGjYLTL/2vjsGEWwEtR
	kMggBRt8fPymKA5S8Hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjK-009HYL-06;
	Tue, 23 May 2023 07:46:50 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjD-009HOR-0Y;
	Tue, 23 May 2023 07:46:43 +0000
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
Subject: [PATCH 23/24] mtd: block2mtd: don't call early_lookup_bdev after the system is running
Date: Tue, 23 May 2023 09:45:34 +0200
Message-Id: <20230523074535.249802-24-hch@lst.de>
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

early_lookup_bdev is supposed to only be called from the early boot
code, but mdtblock_early_get_bdev is called as a general fallback when
lookup_bdev fails, which is problematic because early_lookup_bdev
bypasses all normal path based permission checking, and might cause
problems with certain container environments renaming devices.

Switch to only call early_lookup_bdev when dm is built-in and the system
state in not running yet.

Note that this strictly speaking changes the kernel ABI as the PARTUUID=
and PARTLABEL= style syntax is now not available during a running
systems.  They never were intended for that, but this breaks things
we'll have to figure out a way to make them available again.  But if
avoidable in any way I'd rather avoid that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/devices/block2mtd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 182eed68c75634..59e4c71cfc6f53 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -215,13 +215,23 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 	kfree(dev);
 }
 
-static struct block_device *mdtblock_early_get_bdev(const char *devname,
+/*
+ * This function is marked __ref because it calls the __init marked
+ * early_lookup_bdev when called from the early boot code.
+ */
+static struct block_device __ref *mdtblock_early_get_bdev(const char *devname,
 		fmode_t mode, int timeout, struct block2mtd_dev *dev)
 {
 	struct block_device *bdev = ERR_PTR(-ENODEV);
 #ifndef MODULE
 	int i;
 
+	/*
+	 * We can't use early_lookup_bdev from a running system.
+	 */
+	if (system_state >= SYSTEM_RUNNING)
+		return bdev;
+
 	/*
 	 * We might not have the root device mounted at this point.
 	 * Try to resolve the device name by other means.
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
