Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0508C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 23:11:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C051604D2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 23:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C051604D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n72Np2oxgCCoiCmG18W3cJU+YBJ+V67H9OTqAtp/zKg=; b=rPtnUIwZUhX8xe
	3Fv7ej0hR6IGe0oCXCCJTouR8Q/Bo75mrTDtB7CwRkhpXQ12aZ5+qEuWBBPdkyNb5UA8eSWL6+Tsk
	64z0LrP/WL+IxckNvHmXw+qQSBUFYjrNf0Fw0abvM6Yfd+AUrpbFKr0a8mRvJ0ynx2El0raHuiuba
	+xhqfKUae4C+xgX54114nj6jxPOJXpCIa3GhJeVR7pKnW3xT7TrJTWC0K9StdhwKTLvI6vcWKTtkX
	RSZand8ObfCKMPYlXENgJ11s5jP1fnqV8bewCz96tsHItRNnQmjEdt2ZnFAdc3Fs2MXU+BQND//Ll
	UW6JA9HgIEk9/G8pOoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miPOm-006vJI-CE; Wed, 03 Nov 2021 23:10:28 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miPJ8-006seD-EU; Wed, 03 Nov 2021 23:04:38 +0000
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
Subject: [PATCH v5 00/14] last set for add_disk() error handling
Date: Wed,  3 Nov 2021 16:04:23 -0700
Message-Id: <20211103230437.1639990-1-mcgrof@kernel.org>
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

Jens,

as requested, I've folded all pending changes into this series. This
v5 pegs on Christoph's reviewed-by tags and since I was respinning I
modified the ataprobe and floppy driver changes as he suggested.

I think this is it. The world of floppy has been exciting for v5.16.

This goes based on your axboe/for-next tree as of just a few minutes ago.

Luis Chamberlain (13):
  nvdimm/btt: use goto error labels on btt_blk_init()
  nvdimm/btt: add error handling support for add_disk()
  nvdimm/blk: avoid calling del_gendisk() on early failures
  nvdimm/blk: add error handling support for add_disk()
  nvdimm/pmem: cleanup the disk if pmem_release_disk() is yet assigned
  nvdimm/pmem: use add_disk() error handling
  z2ram: add error handling support for add_disk()
  block/sunvdc: add error handling support for add_disk()
  mtd/ubi/block: add error handling support for add_disk()
  block: update __register_blkdev() probe documentation
  ataflop: address add_disk() error handling on probe
  floppy: address add_disk() error handling on probe
  block: add __must_check for *add_disk*() callers

Tetsuo Handa (1):
  ataflop: remove ataflop_probe_lock mutex

 block/genhd.c           | 11 +++++---
 drivers/block/ataflop.c | 61 +++++++++++++++++++++++++----------------
 drivers/block/floppy.c  | 17 +++++++++---
 drivers/block/sunvdc.c  | 14 ++++++++--
 drivers/block/z2ram.c   |  7 +++--
 drivers/mtd/ubi/block.c |  8 +++++-
 drivers/nvdimm/blk.c    | 21 ++++++++++----
 drivers/nvdimm/btt.c    | 20 +++++++++-----
 drivers/nvdimm/pmem.c   | 21 ++++++++++----
 include/linux/genhd.h   |  6 ++--
 10 files changed, 127 insertions(+), 59 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
