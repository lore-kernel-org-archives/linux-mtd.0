Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909CBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508E860EDF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 508E860EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=76fKHktEIFyexZ3jGtDtOZTOsnQoCcqX/2kLapxWlpE=; b=V6lUDpmyXK3loQ
	3HzJE9vA8DtJCHFfhp/45kSLi3JxIADv9zH09BssQjBPMZFzDhgMGQzCLKmfa9s4p4Tzkrdde7EpX
	ybSHASaJWK1IcETKraiva3DpUPOje7IH0M+VP3Mc/KLONkjQPPRyVQbRVLvmJmw11yaIeh9iDVGeo
	ZSsiH0yZhZwGpFLF3AkZXZUpNjdtU/FPPnoWs81FA/dpzBFYS2KlA/bNV2NKKNlmQsvYuVOwDC6mU
	VQWZ4wZ/V9MF8rat+Nf2ZllH+Az5MXvm2ixi8sHImuFQUQDk+WuCYduUcyLf5bI/V18hPs5V4KW2s
	LryBSjAOS2J9ioD721FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKma-00697l-PF; Wed, 03 Nov 2021 18:14:44 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miKkt-0068X4-PK; Wed, 03 Nov 2021 18:12:59 +0000
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
Subject: [PATCH v4 0/4] last set for add_disk() error handling
Date: Wed,  3 Nov 2021 11:12:54 -0700
Message-Id: <20211103181258.1462704-1-mcgrof@kernel.org>
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

This v4 only updates the last 2 patches from my v3 series of stragglers
to account for Christoph's request to split the __register_blkdev()
probe call changes into 3 patches, one for documentation, the other 2
patches for each respective driver.

I also noticed I had a typo on the documentation, so fixed that.

Luis Chamberlain (4):
  block: update __register_blkdev() probe documentation
  ataflop: address add_disk() error handling on probe
  floppy: address add_disk() error handling on probe
  block: add __must_check for *add_disk*() callers

 block/genhd.c           | 11 +++++++----
 drivers/block/ataflop.c | 16 +++++++++++++---
 drivers/block/floppy.c  | 15 +++++++++++++--
 include/linux/genhd.h   |  6 +++---
 4 files changed, 36 insertions(+), 12 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
