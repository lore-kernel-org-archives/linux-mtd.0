Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3AFC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIEvJhqtypH3Bwn5h0ILlVIQiz1Pfep/2G8njL5kVRc=; b=TVAymOIXGJpfZ6
	4MleFbfFi2ot8DqNl4kOUeuvJWOgya/bfNIrfAzK5/cR+4STIZWYsxMjGcTA5cOtkv52+rRw5eqDC
	786hosQlupY/9zmcjZWCn5oMlxT5ui/rnHZkpbqYwYW8Y6Vn8oQmexUPwjB1gbX6RiwSnNPgWqBNl
	E49hVxN7HhsLs2Qis9xcrnzhyGmiXEE92ZSeVThXt03ZutLKgb9qEKrU6LPOI2nSZDu6APM7BMWRh
	hwuj5A62hFz3+vcQ1D5mlJtJDPS+Wwsg7RW3GAU3Ie+eq4itKdp/3zDn0IBFI7NynXVrvaAinbp2c
	C98FXDwFjgQvNvMqsE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm6-0000000FAPC-3zkQ;
	Thu, 15 Feb 2024 07:03:14 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm4-0000000FANy-1sSl;
	Thu, 15 Feb 2024 07:03:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 02/17] aoe: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:45 +0100
Message-Id: <20240215070300.2200308-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
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

Pass the few limits aoe imposes directly to blk_mq_alloc_disk instead
of setting them one at a time and improve the way the default
max_hw_sectors is initialized while we're at it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/aoe/aoeblk.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index 2ff6e2da8cc41c..b6dac8cee70fe1 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -24,8 +24,8 @@ static DEFINE_MUTEX(aoeblk_mutex);
 static struct kmem_cache *buf_pool_cache;
 static struct dentry *aoe_debugfs_dir;
 
-/* GPFS needs a larger value than the default. */
-static int aoe_maxsectors;
+/* random default picked from the historic block max_sectors cap */
+static int aoe_maxsectors = 2560;
 module_param(aoe_maxsectors, int, 0644);
 MODULE_PARM_DESC(aoe_maxsectors,
 	"When nonzero, set the maximum number of sectors per I/O request");
@@ -334,6 +334,10 @@ aoeblk_gdalloc(void *vp)
 	mempool_t *mp;
 	struct blk_mq_tag_set *set;
 	sector_t ssize;
+	struct queue_limits lim = {
+		.max_hw_sectors		= aoe_maxsectors,
+		.io_opt			= SZ_2M,
+	};
 	ulong flags;
 	int late = 0;
 	int err;
@@ -371,7 +375,7 @@ aoeblk_gdalloc(void *vp)
 		goto err_mempool;
 	}
 
-	gd = blk_mq_alloc_disk(set, NULL, d);
+	gd = blk_mq_alloc_disk(set, &lim, d);
 	if (IS_ERR(gd)) {
 		pr_err("aoe: cannot allocate block queue for %ld.%d\n",
 			d->aoemajor, d->aoeminor);
@@ -384,14 +388,9 @@ aoeblk_gdalloc(void *vp)
 	WARN_ON(d->flags & DEVFL_TKILL);
 	WARN_ON(d->gd);
 	WARN_ON(d->flags & DEVFL_UP);
-	/* random number picked from the history block max_sectors cap */
-	blk_queue_max_hw_sectors(gd->queue, 2560u);
-	blk_queue_io_opt(gd->queue, SZ_2M);
 	d->bufpool = mp;
 	d->blkq = gd->queue;
 	d->gd = gd;
-	if (aoe_maxsectors)
-		blk_queue_max_hw_sectors(gd->queue, aoe_maxsectors);
 	gd->major = AOE_MAJOR;
 	gd->first_minor = d->sysminor;
 	gd->minors = AOE_PARTITIONS;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
