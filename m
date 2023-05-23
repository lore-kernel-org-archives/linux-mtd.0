Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5260FC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoRPozZ+IemGMSl8sqaLW6v4DPrhWIrh+nNz7xqUpQc=; b=IRFPpu2clBk/al
	61lzFHGdM5OGvEozFVz66oEhixOTn1LIvBo+tH78MeaeUBRh2RYZrkgF9BJG9u2rCkn8LnOOrlGZz
	ueXv7KNJdtLgwDSpLBZnkXC6z9fEmQo7eERrBzp7JgCCmcHnFw7ZqJ5ETifKWU1F6VUak3QlT15gX
	IM1DkgvZE4XvRaUq0lkPM/xA78Z7NW6WK1leZJXWQOgIKRLbnLMXEhe3M3E5KriTqWBBgSm2lnMFd
	K1F4BUEzICrIT4/FW2DdahbcV5fVo5tK6k3HP8nDpSGi0EJYWrjsgYVfvP2tUCKkvSyIqM9fOxAv9
	0dmXemcNJjHKivjIGVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Miz-009HAb-0J;
	Tue, 23 May 2023 07:46:29 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Miu-009H5F-2p;
	Tue, 23 May 2023 07:46:26 +0000
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
Subject: [PATCH 17/24] dm-snap: simplify the origin_dev == cow_dev check in snapshot_ctr
Date: Tue, 23 May 2023 09:45:28 +0200
Message-Id: <20230523074535.249802-18-hch@lst.de>
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

Use the block_device acquired in dm_get_device for the check instead
of doing an extra lookup.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-snap.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 9c49f53760d066..7832974b73eb03 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1241,7 +1241,6 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	int i;
 	int r = -EINVAL;
 	char *origin_path, *cow_path;
-	dev_t origin_dev, cow_dev;
 	unsigned int args_used, num_flush_bios = 1;
 	fmode_t origin_mode = FMODE_READ;
 
@@ -1279,24 +1278,21 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		ti->error = "Cannot get origin device";
 		goto bad_origin;
 	}
-	origin_dev = s->origin->bdev->bd_dev;
 
 	cow_path = argv[0];
 	argv++;
 	argc--;
 
-	cow_dev = dm_get_dev_t(cow_path);
-	if (cow_dev && cow_dev == origin_dev) {
-		ti->error = "COW device cannot be the same as origin device";
-		r = -EINVAL;
-		goto bad_cow;
-	}
-
 	r = dm_get_device(ti, cow_path, dm_table_get_mode(ti->table), &s->cow);
 	if (r) {
 		ti->error = "Cannot get COW device";
 		goto bad_cow;
 	}
+	if (s->cow->bdev && s->cow->bdev == s->origin->bdev) {
+		ti->error = "COW device cannot be the same as origin device";
+		r = -EINVAL;
+		goto bad_store;
+	}
 
 	r = dm_exception_store_create(ti, argc, argv, s, &args_used, &s->store);
 	if (r) {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
