Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF82C63777
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:29:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF4A246CA
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZqgHGRaa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KpwyGH/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EF4A246CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PhEi8Q0Bu+bt6eSsprnfkJnyDBDxm5gyPWMuRFfAu58=; b=ZqgHGRaavb+hHXLjO4S0qNmk+
	GOWhQEyaWbDQ/UsjNdDqW5cPTHkOkd1iq7JvgEdJpzBbcn18JRcubKzKmTK0I5mwzw95HEF9ORFXp
	Pyjh0It4o3evvPwNxN9odmXELWwh/yZum5aa244eYlkMaA6FHDESUdXlUq5TXwaA0CCta4ZXRdNPF
	eH6MSCCPVRqgZzO5A/lACLd0dkahT8hpiwUE0f6mTjXhmXiXbASR5J+nVdKWp1Fm6nPdeneDjkVZL
	sHrBd5rE3H1aoFiN9nBnIkyUKAfcevRuvknfbF2PheY1GTUTEM/sT9+UWuhHBKwttw3HmAGJtTHqc
	ycBnnQx3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj36F-0000oS-8x; Sat, 28 Nov 2020 16:29:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj36C-0000nN-Oo
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fzoPvksD9LAOReawxIsj6aTzj6SYOv/6GHildfAET/w=; b=KpwyGH/doPIdPk58D+JPYieFwK
 psBGCCjsF6+OfwgHU4R/VgA/2GRwmYYp+NxIOJ3yhaPzFSXUQc8c/5PL6Y/V/AXewXaEs2eRsB8vq
 iNpacQF5ojv9cg7T0Q9SQrNJ/wScL2bkbsKeScFg7d0es1xgumqe9s8qM1ed+TTgazYoRZndfF2uv
 IAhTtuiE9uunbqefxRL8YKWkbFFBaKuiPI4LQ/7XUAswfXDjpiNBMk1C98jkkJyNw2I1PYoW5xtkt
 4juEyEBj4Tu8rw9UsUKUWjY7V9B69IXgxd711W/Em9CNRTV7LO+1uWX5uHCAZtHBQ+zOjeBfbnecH
 JKOM4vUQ==;
Received: from 089144198196.atnat0007.highway.a1.net ([89.144.198.196]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj36B-0001KR-8e; Sat, 28 Nov 2020 16:29:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 39/45] block: remove the partno field from struct hd_struct
Date: Sat, 28 Nov 2020 17:15:04 +0100
Message-Id: <20201128161510.347752-40-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just use the bd_partno field in struct block_device everywhere.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 block/genhd.c           | 12 ++++++------
 block/partitions/core.c |  9 ++++-----
 include/linux/genhd.h   |  1 -
 init/do_mounts.c        |  2 +-
 4 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 563cfa8885a42c..f4e5a892fc8208 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -581,8 +581,8 @@ int blk_alloc_devt(struct hd_struct *part, dev_t *devt)
 	int idx;
 
 	/* in consecutive minor range? */
-	if (part->partno < disk->minors) {
-		*devt = MKDEV(disk->major, disk->first_minor + part->partno);
+	if (part->bdev->bd_partno < disk->minors) {
+		*devt = MKDEV(disk->major, disk->first_minor + part->bdev->bd_partno);
 		return 0;
 	}
 
@@ -856,7 +856,7 @@ void del_gendisk(struct gendisk *disk)
 	disk_part_iter_init(&piter, disk,
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
 	while ((part = disk_part_iter_next(&piter))) {
-		invalidate_partition(disk, part->partno);
+		invalidate_partition(disk, part->bdev->bd_partno);
 		delete_partition(part);
 	}
 	disk_part_iter_exit(&piter);
@@ -1000,7 +1000,7 @@ void __init printk_all_partitions(void)
 			printk("%s%s %10llu %s %s", is_part0 ? "" : "  ",
 			       bdevt_str(part_devt(part), devt_buf),
 			       bdev_nr_sectors(part->bdev) >> 1,
-			       disk_name(disk, part->partno, name_buf),
+			       disk_name(disk, part->bdev->bd_partno, name_buf),
 			       part->bdev->bd_meta_info ?
 					part->bdev->bd_meta_info->uuid : "");
 			if (is_part0) {
@@ -1094,7 +1094,7 @@ static int show_partition(struct seq_file *seqf, void *v)
 		seq_printf(seqf, "%4d  %7d %10llu %s\n",
 			   MAJOR(part_devt(part)), MINOR(part_devt(part)),
 			   bdev_nr_sectors(part->bdev) >> 1,
-			   disk_name(sgp, part->partno, buf));
+			   disk_name(sgp, part->bdev->bd_partno, buf));
 	disk_part_iter_exit(&piter);
 
 	return 0;
@@ -1517,7 +1517,7 @@ static int diskstats_show(struct seq_file *seqf, void *v)
 			   "%lu %u"
 			   "\n",
 			   MAJOR(part_devt(hd)), MINOR(part_devt(hd)),
-			   disk_name(gp, hd->partno, buf),
+			   disk_name(gp, hd->bdev->bd_partno, buf),
 			   stat.ios[STAT_READ],
 			   stat.merges[STAT_READ],
 			   stat.sectors[STAT_READ],
diff --git a/block/partitions/core.c b/block/partitions/core.c
index c2f6721633b8d5..6db9ca8b722d66 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -184,7 +184,7 @@ static ssize_t part_partition_show(struct device *dev,
 {
 	struct hd_struct *p = dev_to_part(dev);
 
-	return sprintf(buf, "%d\n", p->partno);
+	return sprintf(buf, "%d\n", p->bdev->bd_partno);
 }
 
 static ssize_t part_start_show(struct device *dev,
@@ -274,7 +274,7 @@ static int part_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct hd_struct *part = dev_to_part(dev);
 
-	add_uevent_var(env, "PARTN=%u", part->partno);
+	add_uevent_var(env, "PARTN=%u", part->bdev->bd_partno);
 	if (part->bdev->bd_meta_info && part->bdev->bd_meta_info->volname[0])
 		add_uevent_var(env, "PARTNAME=%s",
 			       part->bdev->bd_meta_info->volname);
@@ -298,7 +298,7 @@ void delete_partition(struct hd_struct *part)
 	struct disk_part_tbl *ptbl =
 		rcu_dereference_protected(disk->part_tbl, 1);
 
-	rcu_assign_pointer(ptbl->part[part->partno], NULL);
+	rcu_assign_pointer(ptbl->part[part->bdev->bd_partno], NULL);
 	rcu_assign_pointer(ptbl->last_lookup, NULL);
 
 	kobject_put(part->bdev->bd_holder_dir);
@@ -372,7 +372,6 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 
 	bdev->bd_start_sect = start;
 	bdev_set_nr_sectors(bdev, len);
-	p->partno = partno;
 	bdev->bd_read_only = get_disk_ro(disk);
 
 	if (info) {
@@ -445,7 +444,7 @@ static bool partition_overlaps(struct gendisk *disk, sector_t start,
 
 	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter))) {
-		if (part->partno == skip_partno ||
+		if (part->bdev->bd_partno == skip_partno ||
 		    start >= part->bdev->bd_start_sect +
 			bdev_nr_sectors(part->bdev) ||
 		    start + length <= part->bdev->bd_start_sect)
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index fe6fee77e2b9df..3c13d4708e3f9d 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -54,7 +54,6 @@ struct partition_meta_info {
 struct hd_struct {
 	struct block_device *bdev;
 	struct device __dev;
-	int partno;
 };
 
 /**
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 368ccb71850126..86bef93e72ebd6 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -136,7 +136,7 @@ static dev_t devt_from_partuuid(const char *uuid_str)
 		struct hd_struct *part;
 
 		part = disk_get_part(dev_to_disk(dev),
-				     dev_to_part(dev)->partno + offset);
+				     dev_to_part(dev)->bdev->bd_partno + offset);
 		if (part) {
 			devt = part_devt(part);
 			put_device(part_to_dev(part));
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
