Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B2AC388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:10:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D14320756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:10:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NnoIBqEr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="avUELUV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D14320756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fToZwNXDl5Va/uMc8GHG4lbNjLzBM94cst9G5M77V2E=; b=NnoIBqEr+8SdCUKR0fZ4Z8GF/
	VqXz1q2hff2Mf2+FpICh99Z2sk7qEoLp9ePPlgjVPG7NXQeuV5+pASezrcmF05MKzSaHHD9RLZgwy
	W53exku9qhT7EiQUANC+gpGWJ69DPHf5ksYzTDPkNM9vUlgBAjUiBZ6N/DPYmrfjqw2MrW0acffgE
	xNqpXKVAgk4jjua9kE8aBapmntXfEieXzr3vhzJOF8nM2Bpf06vB8iKHXs9rOGeopOxjMAur+DroD
	VKhgwBKW092JKuaPFpU4cNruYBtK1v71rFBLG+Vwj+P1aZPcO1iAwsGZGmYVSt88tBY6aKDrBv9yu
	upy3WcwyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmsp-0003qy-Ve; Sat, 31 Oct 2020 09:09:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmso-0003qi-Mp
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OiUmdoSHZP63qL9I/2lDrMgJxBc58lxBm3D9V3Apw8o=; b=avUELUV3Di73qF3if5rpf+y2wc
 UB4eqvw38pSjxiNRuFHaZzRQo9mfpjHNxa7Cu2Rs4DEgJiqRzJSKCTpiMuQEXSWvalYGHIZgn0u0p
 4b6fuFnrbSHSLQ+iDxiDM9FreLtjPF3fwkyAUNFbxqv9qMvVtnR2Aoj/eG60MAzL++x8kZhy+b6UJ
 Auu+SH+lV+FE04D6xP6N6igkb4+WRu7lU6NjilFN098ZCXIxQS/cfMBZpUIPRRoZzfzophy/wgT44
 Shj7YKI2kY3CfKoN4a8HRNtcpKsG8AxKdEXRcGe5KnFT8YTC6enKGNZFM0MT9wadSzYjR1v2vKDp4
 hkNVxZJA==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmsm-0007NT-8Q; Sat, 31 Oct 2020 09:09:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/11] block: add a new set_read_only method
Date: Sat, 31 Oct 2020 09:58:03 +0100
Message-Id: <20201031085810.450489-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031085810.450489-1-hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add a new method to allow driver-specific callout when setting or
clearing the block device read-only state.  This allow to replace the
cumbersome and error prone override of the whole ioctl implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c          | 5 +++++
 include/linux/blkdev.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/block/ioctl.c b/block/ioctl.c
index c6d8863f040945..a6fa16b9770593 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -389,6 +389,11 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		return ret;
 	if (get_user(n, (int __user *)arg))
 		return -EFAULT;
+	if (bdev->bd_disk->fops->set_read_only) {
+		ret = bdev->bd_disk->fops->set_read_only(bdev, n);
+		if (ret)
+			return ret;
+	}
 	set_device_ro(bdev, n);
 	return 0;
 }
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 639cae2c158b59..5c1ba8a8d2bc7e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1850,6 +1850,7 @@ struct block_device_operations {
 	void (*unlock_native_capacity) (struct gendisk *);
 	int (*revalidate_disk) (struct gendisk *);
 	int (*getgeo)(struct block_device *, struct hd_geometry *);
+	int (*set_read_only)(struct block_device *bdev, bool ro);
 	/* this callback is with swap_lock and sometimes page table lock held */
 	void (*swap_slot_free_notify) (struct block_device *, unsigned long);
 	int (*report_zones)(struct gendisk *, sector_t sector,
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
