Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA11C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baTw/kIoXrcdmFjO4eAhrjAnrf2NeyJD5ltsChISIWw=; b=ctJsV+HDCTzjPi
	J4K+S0j+GO1lR64SkQo1EkQG1isElcyRIEg9RMGI9dHRpiao+zBqMvqcyHh6OWAwevKT/MxeFbTno
	VLSLAn+kACrVNi1grI/cKvlHURotnnHTtEouzoR8E5DSXYX/5GUs19E1NzVl6TqMO1YVTbpd174KH
	lcgvQUTCkmDHIixMYvCQwGg0dYLzVxDq7tbs5TPKmWOWelA8I4Pq6Fq+4y3PASki4mgKoNuVykPvh
	wo5UJeMN/97onn+r+LIVi49EVYKug4YozFr6FF/vUkKMQwKe4QUCIS5JZoitrLUfhaZt0iWU+aqJ+
	ijOYeR9KEAwZ+lwvuEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MNP-0004B3-2v;
	Wed, 31 May 2023 14:00:35 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LO3-00HRuM-1c;
	Wed, 31 May 2023 12:57:11 +0000
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
Subject: [PATCH 17/24] dm-snap: simplify the origin_dev == cow_dev check in snapshot_ctr
Date: Wed, 31 May 2023 14:55:28 +0200
Message-Id: <20230531125535.676098-18-hch@lst.de>
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

Use the block_device acquired in dm_get_device for the check instead
of doing an extra lookup.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Mike Snitzer <snitzer@kernel.org>
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
