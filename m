Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE92C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Ft40md/EHF5eNVIKA4SVZ4f3ANA8ZjtIMK+F3ubMeE=; b=YyRVnVQEknMe+b
	fgN/a7ruZfgm0L3WNzlagCh9QobuFZTmlvO0iJlD7kXR1T2vXw0oLlM4N4F44V7oCME9niRRlt2zm
	koeqfmxqzQM5GzfRmnz3y2YuWFpaTwbFRHPxYlt3PeyMKaJ5WhHwJJLQpKsLRHMszQk+Z244k0Ncb
	IGr1ZKm1ztB8v+lT1pwl7Sl1jQOFiEVPdoH/kWa0utFj2aeKSrI0Rc/ZCjYwBLrIItpXHsx7gWCKJ
	/6/ohyYd39sjd9a1doTfn6Dj82DOx+b7C7X2Xzv6sHyS2UT3W6gVSQXiGmYHi7R/DEIuAU9bqLWSg
	DwnxRgNG4OiQnhI+T72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgwi-005611-0e;
	Mon, 11 Dec 2023 14:07:44 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgwY-0055wm-1c
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 14:07:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Spk8N0R34z4f3kFS
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:07:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7B4531A0499
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:07:18 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDn6xGTF3dlDYFxDQ--.28013S4;
	Mon, 11 Dec 2023 22:07:17 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	sth@linux.ibm.com,
	hoeppner@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	p.raghav@samsung.com,
	hare@suse.de
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v2 for-6.8/block 00/18] block: don't access bd_inode directly from other modules
Date: Mon, 11 Dec 2023 22:05:34 +0800
Message-Id: <20231211140552.973290-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDn6xGTF3dlDYFxDQ--.28013S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXr48Ww4Utw47JFWDWFW7Arb_yoW5XFWfpr
	13KF4fGr1UWryxZaya9a17tw1rG3WkGayUWFnIy34rZFW5AryfZrWktF1rJa4kXryxXr4k
	Xw17JryrKr1jgaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4U
	JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	fUojjgUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
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

From: Yu Kuai <yukuai3@huawei.com>

Changes in v2:
 - remove some bdev apis that is not necessary;
 - pass in offset for bdev_read_folio() and __bdev_get_folio();
 - remove bdev_gfp_constraint() and add a new helper in fs/buffer.c to
 prevent access bd_indoe() directly from mapping_gfp_constraint() in
 ext4.(patch 15, 16);
 - remove block_device_ejected() from ext4.

Noted that following is not changed yet since v1:
- Chirstoph suggested to remove invalidate_inode_pages2() from
xen_update_blkif_status(), however, this sync_bdev() + invalidate_bdev()
is used from many modules, and I'll leave this for later if we want to
kill all of them.
- Matthew suggested that pass in valid file_ra_state for cramfs,
however, I don't see an easy way to do this for cramfs_lookup() and
cramfs_read_super().

Patch 1 add some bdev apis, then follow up patches will use these apis
to avoid access bd_inode directly, and hopefully the field bd_inode can
be removed eventually(after figure out a way for fs/buffer.c).

Yu Kuai (18):
  block: add some bdev apis
  xen/blkback: use bdev api in xen_update_blkif_status()
  bcache: use bdev api in read_super()
  mtd: block2mtd: use bdev apis
  s390/dasd: use bdev api in dasd_format()
  scsicam: use bdev api in scsi_bios_ptable()
  bcachefs: remove dead function bdev_sectors()
  bio: export bio_add_folio_nofail()
  btrfs: use bdev apis
  cramfs: use bdev apis in cramfs_blkdev_read()
  erofs: use bdev api
  gfs2: use bdev api
  nilfs2: use bdev api in nilfs_attach_log_writer()
  jbd2: use bdev apis
  buffer: add a new helper to read sb block
  ext4: use new helper to read sb block
  ext4: remove block_device_ejected()
  ext4: use bdev apis

 block/bdev.c                       | 70 ++++++++++++++++++++++++++
 block/bio.c                        |  1 +
 block/blk.h                        |  2 -
 drivers/block/xen-blkback/xenbus.c |  3 +-
 drivers/md/bcache/super.c          | 11 ++--
 drivers/mtd/devices/block2mtd.c    | 81 +++++++++++++-----------------
 drivers/s390/block/dasd_ioctl.c    |  5 +-
 drivers/scsi/scsicam.c             |  4 +-
 fs/bcachefs/util.h                 |  5 --
 fs/btrfs/disk-io.c                 | 71 ++++++++++++--------------
 fs/btrfs/volumes.c                 | 17 +++----
 fs/btrfs/zoned.c                   | 15 +++---
 fs/buffer.c                        | 68 +++++++++++++++++--------
 fs/cramfs/inode.c                  | 36 +++++--------
 fs/erofs/data.c                    | 18 ++++---
 fs/erofs/internal.h                |  2 +
 fs/ext4/dir.c                      |  6 +--
 fs/ext4/ext4.h                     | 13 -----
 fs/ext4/ext4_jbd2.c                |  6 +--
 fs/ext4/inode.c                    |  8 +--
 fs/ext4/super.c                    | 66 ++++--------------------
 fs/ext4/symlink.c                  |  2 +-
 fs/gfs2/glock.c                    |  2 +-
 fs/gfs2/ops_fstype.c               |  2 +-
 fs/jbd2/journal.c                  |  3 +-
 fs/jbd2/recovery.c                 |  6 +--
 fs/nilfs2/segment.c                |  2 +-
 include/linux/blkdev.h             | 17 +++++++
 include/linux/buffer_head.h        | 18 ++++++-
 29 files changed, 301 insertions(+), 259 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
