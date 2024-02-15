Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF43C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wz8fTaKzlr3HWiIkze7Jj3HRDue6qEz9vJAeTUYTaJo=; b=FZoFeuAzhF/E8J
	hUN1PdWrUvLlJtiZjVGUQDo1Fy6s1uxcdEjXrqxhsihBAI7E4ZuoN2k2tR3ITQlFpnDK5ZlH2NuCn
	xX7/NIoXsnmuFP/kJDytx7eMrsi6vmXFoTr4oIqav6RnfkuET+Pe+w2LhDeVE/MtbxGcboTs7geXO
	TmjrCpC+O5yG/chRy7AlvLwZGJnhjYk80hKLYcX3Vg8fknQhj3Axd92YakhOU/2HLzQJkn5KeETal
	A6uC+pQY8QLquamFINKl59PJ0j9WifR+O80Pw6PYBPE/xkZdfJPO+BNfZ+pDJqWtjaZf6/SmQfS7W
	Om1A9dqzpBsgy1KpsVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmW-0000000FAi8-3QP0;
	Thu, 15 Feb 2024 07:03:40 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmP-0000000FAb7-3OYC;
	Thu, 15 Feb 2024 07:03:34 +0000
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
Subject: [PATCH 10/17] gdrom: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:53 +0100
Message-Id: <20240215070300.2200308-11-hch@lst.de>
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

Pass the few limits gdrom imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/cdrom/gdrom.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 1d044779f5e42a..9398beeb5d1e89 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -724,11 +724,6 @@ static void probe_gdrom_setupdisk(void)
 
 static int probe_gdrom_setupqueue(void)
 {
-	blk_queue_logical_block_size(gd.gdrom_rq, GDROM_HARD_SECTOR);
-	/* using DMA so memory will need to be contiguous */
-	blk_queue_max_segments(gd.gdrom_rq, 1);
-	/* set a large max size to get most from DMA */
-	blk_queue_max_segment_size(gd.gdrom_rq, 0x40000);
 	gd.disk->queue = gd.gdrom_rq;
 	return gdrom_init_dma_mode();
 }
@@ -743,6 +738,13 @@ static const struct blk_mq_ops gdrom_mq_ops = {
  */
 static int probe_gdrom(struct platform_device *devptr)
 {
+	struct queue_limits lim = {
+		.logical_block_size		= GDROM_HARD_SECTOR,
+		/* using DMA so memory will need to be contiguous */
+		.max_segments			= 1,
+		/* set a large max size to get most from DMA */
+		.max_segment_size		= 0x40000,
+	};
 	int err;
 
 	/*
@@ -778,7 +780,7 @@ static int probe_gdrom(struct platform_device *devptr)
 	if (err)
 		goto probe_fail_free_cd_info;
 
-	gd.disk = blk_mq_alloc_disk(&gd.tag_set, NULL, NULL);
+	gd.disk = blk_mq_alloc_disk(&gd.tag_set, &lim, NULL);
 	if (IS_ERR(gd.disk)) {
 		err = PTR_ERR(gd.disk);
 		goto probe_fail_free_tag_set;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
