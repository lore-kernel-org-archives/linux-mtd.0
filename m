Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A9C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JynZpXCkvZPz40W8trTsz3nEBNmpRfKf/SIndgaGTis=; b=bg0zlMBiIIheZp
	34szHOWBxLBD1KBvo6ISB2VSPL9yekViPXLkgZPM9yIkDYyHY2LDpZt14VS/Wx7MSR+ptBtBQ32j6
	3UbEpPws9enMG8QxSIonlW2Y6PoxEmTuT7XJBoDak9scnkxbRf7NmR7/2y1NR56Psu7Ik9R8j7ckm
	Gzit6Oz75xKebASpwuYB9PaJv7kCqfuDDP7GbzCgWgiMMrCp7G0utqrkiVV02aEb64DdD7gepONEq
	ZPoM82g+m1+z8fnxCdN49NS2sDSvhhl7dpOAgHkAGiw3rzR+JzYir9xFHH1Vmo9KyPPPAX93eRHSP
	bxwPOD/77DLrytisK0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVn2-0000000FBD9-0oxV;
	Thu, 15 Feb 2024 07:04:12 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmb-0000000FAll-1XVj;
	Thu, 15 Feb 2024 07:03:46 +0000
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
Subject: [PATCH 14/17] ubiblock: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:57 +0100
Message-Id: <20240215070300.2200308-15-hch@lst.de>
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

Pass the few limits ubiblock imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/ubi/block.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 9be87c231a2eba..5c8fdcc088a0df 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -348,6 +348,9 @@ static int calc_disk_capacity(struct ubi_volume_info *vi, u64 *disk_capacity)
 
 int ubiblock_create(struct ubi_volume_info *vi)
 {
+	struct queue_limits lim = {
+		.max_segments		= UBI_MAX_SG_COUNT,
+	};
 	struct ubiblock *dev;
 	struct gendisk *gd;
 	u64 disk_capacity;
@@ -393,7 +396,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 
 	/* Initialize the gendisk of this ubiblock device */
-	gd = blk_mq_alloc_disk(&dev->tag_set, NULL, dev);
+	gd = blk_mq_alloc_disk(&dev->tag_set, &lim, dev);
 	if (IS_ERR(gd)) {
 		ret = PTR_ERR(gd);
 		goto out_free_tags;
@@ -416,7 +419,6 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->gd = gd;
 
 	dev->rq = gd->queue;
-	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
 
 	list_add_tail(&dev->list, &ubiblock_devices);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
