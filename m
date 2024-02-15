Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDABC48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8oMNrKnroJM5ipoSP54ISD44v6DDaRwBmQ/dH7BwuI=; b=kUifWvW/sFPGpC
	yCeS1bw8+NMsmIbv8eLmtVr+0OdDsFScR4C+p3UwUnne9TGKSUPperhpB6ulbfBzvLLmqxqvDbtB8
	BB4SSBmVcj7k+WoU0+yeGXCRskMXRJgCBni4JJaGpY8YADbNFSye+ZZqDzN7e0c6t+mjAUl55cJPk
	UG5t2/FUSLcpb0DxjMflMBVqNcJ3xBHy+KsY2dtXT7YFbnLrIpzkw1f05p6OCXxi28mkcZ/95Syv2
	UO2eJqQ3j5ta3RYGrNMvBxXg83Rg+M+lbsii5fDm3tMI8rsucGwKWV8PNxEljkzW4EbO3250j5Thy
	tqvv43Y2rBUqTm1ThbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm4-0000000FAOW-2KFg;
	Thu, 15 Feb 2024 07:03:12 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm2-0000000FANr-02ZR;
	Thu, 15 Feb 2024 07:03:10 +0000
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
Subject: [PATCH 01/17] ubd: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:44 +0100
Message-Id: <20240215070300.2200308-2-hch@lst.de>
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

Pass the few limits ubd imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/drivers/ubd_kern.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index 25f1b18ce7d4e9..48e11f073551b4 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -881,6 +881,10 @@ static const struct blk_mq_ops ubd_mq_ops = {
 static int ubd_add(int n, char **error_out)
 {
 	struct ubd *ubd_dev = &ubd_devs[n];
+	struct queue_limits lim = {
+		.max_segments		= MAX_SG,
+		.seg_boundary_mask	= PAGE_SIZE - 1,
+	};
 	struct gendisk *disk;
 	int err = 0;
 
@@ -906,7 +910,7 @@ static int ubd_add(int n, char **error_out)
 	if (err)
 		goto out;
 
-	disk = blk_mq_alloc_disk(&ubd_dev->tag_set, NULL, ubd_dev);
+	disk = blk_mq_alloc_disk(&ubd_dev->tag_set, &lim, ubd_dev);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_cleanup_tags;
@@ -914,8 +918,6 @@ static int ubd_add(int n, char **error_out)
 	ubd_dev->queue = disk->queue;
 
 	blk_queue_write_cache(ubd_dev->queue, true, false);
-	blk_queue_max_segments(ubd_dev->queue, MAX_SG);
-	blk_queue_segment_boundary(ubd_dev->queue, PAGE_SIZE - 1);
 	err = ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
 	if (err)
 		goto out_cleanup_disk;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
