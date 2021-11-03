Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92323C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63BC860EE9
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63BC860EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdvKV/1WoSrqbI6vY4YbVRmni/Exc6KAQ0Eet4yAkH0=; b=L13pzSJ3DRPTgU
	0adcquQS7bFimiTIue2GzZ+Nzss9dZGa1Oov7kIVEsG05a32SOQYgXQbzpMQjTrYmO+Y2Xa55jFWz
	HEVqore8XfSL4lIcFwIzWYH9uPEdmA9h6ukE+4BJT+d18kvaIiC4q2htyImBESVWf62BPB7gKcbBT
	5PMZ4bL+62MSGH3z3T0ZhBcJ7BAGXBWx1AvWZbDfoy+/lSmbox4t29cSqax+OpG2IKNBVApYi9YQi
	G3c6fQ3i1XxA+TRQmsFDNBoXiia9Jn9IJPSgHh8tn6gwcvK0JIHCZ9XeBxonDzD6S+wroR3UsN5ip
	RMb/7qXAp0Uw/bVYgubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKNF-0060dc-IC; Wed, 03 Nov 2021 17:48:33 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miKKA-005z5L-0I; Wed, 03 Nov 2021 17:45:22 +0000
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
Subject: [PATCH v3 00/13] block: add_disk() error handling stragglers
Date: Wed,  3 Nov 2021 10:45:08 -0700
Message-Id: <20211103174521.1426407-1-mcgrof@kernel.org>
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

This v3 series has the following changes:

 o clarifies the nvdimm/btt fix to not call del_gendisk to be a proper
   fix regardless of kernel.
 o Adds reviewed-by tags
 o modified the __register_blkdev() changes so that we do not propagate
   the error code from add_disk() but instead we just cleanup the
   resources where needed, and update the documentation to reflect
   suggestions by Christoph

You can find these changes on tree:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20211103-for-axboe-add-disk-error-handling-v3

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
  block: fix __register_blkdev() probe add_disk() failures
  block: add __must_check for *add_disk*() callers

Tetsuo Handa (1):
  ataflop: remove ataflop_probe_lock mutex

 block/genhd.c           | 11 +++++---
 drivers/block/ataflop.c | 59 +++++++++++++++++++++++++----------------
 drivers/block/floppy.c  | 11 ++++++--
 drivers/block/sunvdc.c  | 14 +++++++---
 drivers/block/z2ram.c   |  7 +++--
 drivers/mtd/ubi/block.c |  8 +++++-
 drivers/nvdimm/blk.c    | 21 ++++++++++-----
 drivers/nvdimm/btt.c    | 21 +++++++++------
 drivers/nvdimm/pmem.c   | 21 +++++++++++----
 include/linux/genhd.h   |  6 ++---
 10 files changed, 122 insertions(+), 57 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
