Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071D1C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 12:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC9C610FC
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 12:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAC9C610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QDT2DHgq+EcJ8KtZZcAPCB7cx2xeMmARahVjrll6778=; b=XaFp5tPCVokquE
	4nCLYu6Hx4oZ2tDc5MQIu/Ej+O+Rln6+axmedGXLC6gn0+/BbFdD3YpiD87kjEKgJXW6D9OBqMorh
	I+kilpNLiGC//vhYsiiBBxpeeyjywscvuDa+SPAe/ICA3RDfcJkCYw02cWUNhuK/RsvpFQXACErEL
	OUXyfm0aIm2ItNEEvYuQUmix1cIsQUoaRQa0fjKUMqOXSb8NWKGqZBH0l9BV0wDPVw/3CaXe+GmxI
	XrD6zVErxN9tDiIdr7WtKrfsOpMmUoTrAFHhgiUlEkdxODo1W6oJKLaoDo9R8nOu2B/Ebal4+B7lS
	kXlyCaN160jUECb52qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miFI8-0056qo-MQ; Wed, 03 Nov 2021 12:22:56 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miFHC-0056I8-4e; Wed, 03 Nov 2021 12:21:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, efremov@linux.com, song@kernel.org,
 martin.petersen@oracle.com, hare@suse.de, jack@suse.cz,
 ming.lei@redhat.com, tj@kernel.org, mcgrof@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] block: add_disk() error handling stragglers
Date: Wed,  3 Nov 2021 05:21:44 -0700
Message-Id: <20211103122157.1215783-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
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

This is the last pending changes to address add_disk() error handling
completely. Changes on this v2 series:

  o dropped all patches which folks have said they'd pick up on their
    own trees or that I already see present on linux-next
  o rebased onto next-20211103
  o Added Reviewed-by tag by Dan Williams and addressed his recommended
    changes.
  o Re-added the nvdimm/blk changes given Dan Williams was not able to
    remove the driver in time for v5.16
  o Added new nvdimm/pmem driver changes, not sure how I missed addressing
    this before.
  o Just note that I keep Tetsuo Handa's patch in this series as it is
    a requirement for the __register_blkdev() changes.

You can find all these changes on my git tree:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20211103-for-axboe-add-disk-error-handling

Luis Chamberlain (12):
  nvdimm/btt: do not call del_gendisk() if not needed
  nvdimm/btt: use goto error labels on btt_blk_init()
  nvdimm/btt: add error handling support for add_disk()
  nvdimm/blk: avoid calling del_gendisk() on early failures
  nvdimm/blk: add error handling support for add_disk()
  nvdimm/pmem: cleanup the disk if pmem_release_disk() is yet assigned
  nvdimm/pmem: use add_disk() error handling
  z2ram: add error handling support for add_disk()
  block/sunvdc: add error handling support for add_disk()
  mtd/ubi/block: add error handling support for add_disk()
  block: make __register_blkdev() return an error
  block: add __must_check for *add_disk*() callers

Tetsuo Handa (1):
  ataflop: remove ataflop_probe_lock mutex

 block/bdev.c            |  5 +++-
 block/genhd.c           | 27 +++++++++++------
 drivers/block/ataflop.c | 66 +++++++++++++++++++++++++----------------
 drivers/block/brd.c     |  7 +++--
 drivers/block/floppy.c  | 17 ++++++++---
 drivers/block/loop.c    | 11 +++++--
 drivers/block/sunvdc.c  | 14 +++++++--
 drivers/block/z2ram.c   |  7 +++--
 drivers/md/md.c         | 12 ++++++--
 drivers/mtd/ubi/block.c |  8 ++++-
 drivers/nvdimm/blk.c    | 21 +++++++++----
 drivers/nvdimm/btt.c    | 21 ++++++++-----
 drivers/nvdimm/pmem.c   | 21 +++++++++----
 drivers/scsi/sd.c       |  3 +-
 include/linux/genhd.h   | 10 +++----
 15 files changed, 172 insertions(+), 78 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
