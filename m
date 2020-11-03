Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E848C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10F7206F1
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2QspVw0H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CYW3W0EX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10F7206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mqJpHcNFsvcdI3tHRbssiuL/0jTG3kF01IixNc7VeoY=; b=2QspVw0Hk2fA7v0hcRn/YgNWw
	SFEgUJbWLeEcQPp8a0ICwjlOuoDGni0sAzSSoc9qm04VlKL2+PprUcU9ZGyZNftuycEkKL+uN1/MH
	0oobaZ2cPL4YR4Zu/SADqRwx5MsznPGPGuJo1cw2GMAWWasWx3Zab1y0O0ankzkH1VSeQwQUkWEum
	ufFFVSGSr85O2IggFbUTtncJN7gQhcMY+FTvMWpvgMDwLT69nlf9m66/w1hd1jZ+CmVXzau5qTbha
	OUAMwV/mVc8BrRYj8XGC633BMpOgUaXsg9pri3AXx81jaQNqc1vPqS+QEde0PgugI6vGtvaaSUiB9
	WcjH5Xs6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtSB-0007RH-0F; Tue, 03 Nov 2020 10:22:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtS8-0007QZ-4L
 for linux-mtd@merlin.infradead.org; Tue, 03 Nov 2020 10:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3MSvK9iNSy+DFtMSDiSadE/QmhEKeo+2u5OIDmRr7vM=; b=CYW3W0EX6i4BLQYfqDFcBpQwPq
 VeX8wi47zB+AyFZmZIVYkdisQfKVJNxIMeAD58U7p3SlmMjRZAEc2tt+vRHlw+EYYSY3Ui3ikW0wL
 gPEumcO7Pueg+t4sMcB0rstA2H663+G4DTnHHaX+ztQFu34Z/65wC8JnqRDi8d1dhu+kx39tCI9s7
 rO3UoCpLkFG/nEoOl6dvAc561sbcvoSODhV2sa56AxBpUeJNHtsAaUPDRi98WYyoCHXUhZ77jG6t5
 vyU74wpLfEn0T+Xk+pwSOXUuz3GO9Aom73iQiU0n9Y1bvvluUQbz9QHiAzAZ1iL0yJucSAKm/Pw85
 JnWnVsbg==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtS6-0001Qc-HD; Tue, 03 Nov 2020 10:22:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/10] block: remove set_device_ro
Date: Tue,  3 Nov 2020 11:00:17 +0100
Message-Id: <20201103100018.683694-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103100018.683694-1-hch@lst.de>
References: <20201103100018.683694-1-hch@lst.de>
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

Fold set_device_ro into its only remaining caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c         | 7 -------
 block/ioctl.c         | 2 +-
 include/linux/genhd.h | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 0a273211fec283..a487590b365e89 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1843,13 +1843,6 @@ static void set_disk_ro_uevent(struct gendisk *gd, int ro)
 	kobject_uevent_env(&disk_to_dev(gd)->kobj, KOBJ_CHANGE, envp);
 }
 
-void set_device_ro(struct block_device *bdev, int flag)
-{
-	bdev->bd_part->policy = flag;
-}
-
-EXPORT_SYMBOL(set_device_ro);
-
 void set_disk_ro(struct gendisk *disk, int flag)
 {
 	struct disk_part_iter piter;
diff --git a/block/ioctl.c b/block/ioctl.c
index 96cb4544736468..04255dc5f3bff3 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -371,7 +371,7 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		if (ret)
 			return ret;
 	}
-	set_device_ro(bdev, n);
+	bdev->bd_part->policy = n;
 	return 0;
 }
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 38f23d75701379..f232f26d7c777b 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -304,7 +304,6 @@ extern void del_gendisk(struct gendisk *gp);
 extern struct gendisk *get_gendisk(dev_t dev, int *partno);
 extern struct block_device *bdget_disk(struct gendisk *disk, int partno);
 
-extern void set_device_ro(struct block_device *bdev, int flag);
 extern void set_disk_ro(struct gendisk *disk, int flag);
 
 static inline int get_disk_ro(struct gendisk *disk)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
