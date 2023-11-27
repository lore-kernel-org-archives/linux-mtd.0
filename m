Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4179EC46CC5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 06:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xuGPYBrGNHz0PBn01bdGKV+1KJNB2rwTMyDSBNdhkUI=; b=d4TKp3fWhI/oQh
	KYQl47PmH+t3wWcAKLvTKjsjOwNljmJ0aUji93MFpWTGsv4obwUjo36vkJoVIbI9HlGCkjyW6q1/m
	K1U2YJkkhtSw4oiIbpS53usLzQK1/e30jo7o2NqYBIoO2s6iV6CiR/ewBTs5M36aZjZ87oh64C14T
	tuTLYNeTz/r+W2RbC3BipQ9PUoTaVq72KVMAIf00PTaHd2ExHS2W4g+OgaW8IXpiEb2wdQlHkArlz
	8p64JQHh4lzSlm8KUud+HKmqlKnjA1VxEEHWre+0KTqs7LpXjCsyNhZOxMcG692ptnDefqReraYV6
	oRe+SYW0P6bsU4U7DiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7V0e-001Us7-0p;
	Mon, 27 Nov 2023 06:22:20 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7V0Y-001UlN-24
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 06:22:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SdwTq2XcGz4f3jZ3
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 14:21:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2DCCE1A092A
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 14:21:54 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDX2hB+NWRlrcU8CA--.57866S4;
	Mon, 27 Nov 2023 14:21:53 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: hch@infradead.org,
	ming.lei@redhat.com,
	axboe@kernel.dk,
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
	dchinner@redhat.com,
	linux@weissschuh.net,
	min15.li@samsung.com,
	yukuai3@huawei.com,
	dlemoal@kernel.org,
	willy@infradead.org,
	akpm@linux-foundation.org,
	hare@suse.de,
	p.raghav@samsung.com
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
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH block/for-next v2 00/16] block: remove field 'bd_inode' from block_device
Date: Mon, 27 Nov 2023 14:21:00 +0800
Message-Id: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDX2hB+NWRlrcU8CA--.57866S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4fKw15Jr18CF1kZr1rtFb_yoW8urWfpr
	9xKFWrJ3yjkryrua1Iqw45X345Ja1kKayxuF97Aw4ruFW8G34furWktrsxGrW0qrZrJrWj
	gF13t34DJF4xXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4U
	JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUd8n5UUUUU=
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
 - split different portions into different patches, as greg k-h
 suggested.
 - use container_of() instead of "bdev + 1" to get the address of
 bd_inode in the new helper, as grep k-h suggested.

Yu Kuai (16):
  block: add a new helper to get inode from block_device
  xen/blkback: use new helper to get inode from block_device
  bcache: use new helper to get inode from block_device
  mtd: block2mtd: use new helper to get inode from block_device
  s390/dasd: use new helper to get inode from block_device
  scsicam: use new helper to get inode from block_device
  bcachefs: use new helper to get inode from block_device
  btrfs: use new helper to get inode from block_device
  cramfs: use new helper to get inode from block_device
  erofs: use new helper to get inode from block_device
  ext4: use new helper to get inode from block_device
  gfs2: use new helper to get inode from block_device
  jbd2: use new helper to get inode from block_device
  nilfs2: use new helper to get inode from block_device
  buffer: use new helper to get inode from block_device
  block: use new helper to get inode from block_device

 block/bdev.c                       | 44 +++++++++++++++---------------
 block/blk-zoned.c                  |  4 +--
 block/fops.c                       |  4 +--
 block/genhd.c                      |  8 +++---
 block/ioctl.c                      |  8 +++---
 block/partitions/core.c            |  9 +++---
 drivers/block/xen-blkback/xenbus.c |  2 +-
 drivers/md/bcache/super.c          |  2 +-
 drivers/mtd/devices/block2mtd.c    | 12 ++++----
 drivers/s390/block/dasd_ioctl.c    |  2 +-
 drivers/scsi/scsicam.c             |  2 +-
 fs/bcachefs/util.h                 |  2 +-
 fs/btrfs/disk-io.c                 |  6 ++--
 fs/btrfs/volumes.c                 |  4 +--
 fs/btrfs/zoned.c                   |  2 +-
 fs/buffer.c                        |  8 +++---
 fs/cramfs/inode.c                  |  2 +-
 fs/erofs/data.c                    |  2 +-
 fs/ext4/dir.c                      |  2 +-
 fs/ext4/ext4_jbd2.c                |  2 +-
 fs/ext4/super.c                    |  8 +++---
 fs/gfs2/glock.c                    |  2 +-
 fs/gfs2/ops_fstype.c               |  2 +-
 fs/jbd2/journal.c                  |  3 +-
 fs/jbd2/recovery.c                 |  2 +-
 fs/nilfs2/segment.c                |  2 +-
 include/linux/blk_types.h          | 15 ++++++++--
 include/linux/blkdev.h             |  4 +--
 include/linux/buffer_head.h        |  4 +--
 29 files changed, 91 insertions(+), 78 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
