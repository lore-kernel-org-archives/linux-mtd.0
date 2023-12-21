Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F472C46CD4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHHeNId5nSiRkkP2qoSeULYhEBRjs0UWD/KfBCXm04U=; b=kF78viMxvN2XWD
	pqUcVIQVUAr34r6lZLZNuQVwhi8k5DIQbPLu9NqBLVCqoMW8juhki6lJKmFHEc5XIMKIGNleDX6kv
	tK25SsQ+WTcpCcZFuy5gzQBIn04XJFBrSG6ydutQn7mAYbad+tQG20i53LOIkAipZJDuFmt5EtJqh
	0K+zHUSf26Mxxy6nSCMLHaAj/kbPAj0XTPrCduH3oUomC832SgI9qwfS4oBmoHcmjwm8M7ZiyFdbR
	cppoys1uVIoCGRVGG9YL89X7UlHq56SgAih2oWDZJQsCFhyxGWWLuKOrAu405gzDmzQl6+KbrwRht
	cyAYN0MWKzCekiU1UYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEtt-0027LG-24;
	Thu, 21 Dec 2023 08:59:29 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEtp-0027HA-0I
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 08:59:26 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SwkrG0JX2z4f3khR
	for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 16:59:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id CF3ED1A0861
	for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 16:59:12 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDnNw5d_oNlEQPvEA--.24929S4;
	Thu, 21 Dec 2023 16:59:12 +0800 (CST)
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
	jack@suse.com,
	konishi.ryusuke@gmail.com,
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
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v3 for-6.8/block 00/17] block: don't access bd_inode directly from other modules
Date: Thu, 21 Dec 2023 16:56:55 +0800
Message-Id: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnNw5d_oNlEQPvEA--.24929S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw18WF43ur1kJF1xJFW8WFg_yoW5Jr4rpr
	nxKF4fGr48u34xuayS9a17t34rJa1kGayUW3W2y345ZFWrZFyfZrWktF1rJFykJrZ7Xr4k
	Xr1jyryrKr1I9aDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4U
	JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_005925_465636_3257FF67 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

Changes in v3:
 - remove bdev_associated_mapping() and patch 12 from v1;
 - add kerneldoc comments for new bdev apis;
 - rename __bdev_get_folio() to bdev_get_folio;
 - fix a problem in erofs that erofs_init_metabuf() is not always
 called.
 - add reviewed-by tag for patch 15-17;
Changes in v2:
 - remove some bdev apis that is not necessary;
 - pass in offset for bdev_read_folio() and __bdev_get_folio();
 - remove bdev_gfp_constraint() and add a new helper in fs/buffer.c to
 prevent access bd_indoe() directly from mapping_gfp_constraint() in
 ext4.(patch 15, 16);
 - remove block_device_ejected() from ext4.


Patch 1 add some bdev apis, then follow up patches will use these apis
to avoid access bd_inode directly, and hopefully the field bd_inode can
be removed eventually(after figure out a way for fs/buffer.c).

Yu Kuai (17):
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
  nilfs2: use bdev api in nilfs_attach_log_writer()
  jbd2: use bdev apis
  buffer: add a new helper to read sb block
  ext4: use new helper to read sb block
  ext4: remove block_device_ejected()
  ext4: use bdev apis

 block/bdev.c                       | 148 +++++++++++++++++++++++++++++
 block/bio.c                        |   1 +
 block/blk.h                        |   2 -
 drivers/block/xen-blkback/xenbus.c |   3 +-
 drivers/md/bcache/super.c          |  11 +--
 drivers/mtd/devices/block2mtd.c    |  81 +++++++---------
 drivers/s390/block/dasd_ioctl.c    |   5 +-
 drivers/scsi/scsicam.c             |   4 +-
 fs/bcachefs/util.h                 |   5 -
 fs/btrfs/disk-io.c                 |  71 +++++++-------
 fs/btrfs/volumes.c                 |  17 ++--
 fs/btrfs/zoned.c                   |  15 +--
 fs/buffer.c                        |  68 +++++++++----
 fs/cramfs/inode.c                  |  36 +++----
 fs/erofs/data.c                    |  18 ++--
 fs/erofs/internal.h                |   2 +
 fs/ext4/dir.c                      |   6 +-
 fs/ext4/ext4.h                     |  13 ---
 fs/ext4/ext4_jbd2.c                |   6 +-
 fs/ext4/inode.c                    |   8 +-
 fs/ext4/super.c                    |  66 +++----------
 fs/ext4/symlink.c                  |   2 +-
 fs/jbd2/journal.c                  |   3 +-
 fs/jbd2/recovery.c                 |   6 +-
 fs/nilfs2/segment.c                |   2 +-
 include/linux/blkdev.h             |  17 ++++
 include/linux/buffer_head.h        |  18 +++-
 27 files changed, 377 insertions(+), 257 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
