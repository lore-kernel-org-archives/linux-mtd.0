Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC1AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 05:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4FB60F4F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 05:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C4FB60F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l84mK0wAZW/O7ResksgTd5r7ERM7kifPld++CLTGQtA=; b=S+ide/T553enwU
	3LlNAdOXp6rrK7tUxgcdeyV517tM79e7K1Z4xAxlT9iLvMUalqvhYIRvBBgIeo4x03sXJUm+MFYcA
	ysA4u9xw67hW/ijDYJGL/c/cVnNWf16Tf7vvOMW4xkwaUgNtqgtvxSKiam+QWISLUNDEn9mT2qK6p
	vixVAEbFrh/nPB6gd/KVPKVFN+/UeRoQEt6ODCle+5u1e/6/zg/xsWZ6uZ1F+Hm8Jump9t78/rTAL
	uQlItnvJXcTmk5j8vbZCeI5Sakm8bnBec8EZEOyVoyvNqPyunD8V+ZQjMzLwE7MA4vKw6dGLrtsif
	XGpI9KP0YX6eNRoiojMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV5Zl-005cH6-PA; Tue, 28 Sep 2021 05:22:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV5Zj-005cGy-HT
 for linux-mtd@bombadil.infradead.org; Tue, 28 Sep 2021 05:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=A04dM+Vo9/Fetf7krH0dGPC++Y24iPZldsb1IcuSrY8=; b=aRY4V1sGCTesXudqb9o16TDrY4
 So7uD86nqB92AiLd9otKv6X6MfWgkOAeId/QuKEULs9GPk8juifoFzT1FcrlwMsQ7ZRhUI8kmCE+c
 Yli36oAEOytrjPeUgbZNvzCjU2EzP9rba/ZlJ006Z+tuNmvc9v3TUlHcc8qJ/K2P6yp3IY1ADaqjS
 J4NXRo7VuTMbjV8iDjYIIul09I5WL+RdhOTGjuJBq9NS8v9mf0g6z3H5Tny0BOZ/4hSyNzwEawg9e
 5eekUuS6ByryxDk1zzvY4nLWDB3xOU1vOs8rgt5f3Z8GKkntaFhrkCAQwL1iiiMTbmdpmGkBYAAPD
 vjp2zNNg==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV5ZG-00AW6O-LM; Tue, 28 Sep 2021 05:22:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
Subject: remove ->rq_disk
Date: Tue, 28 Sep 2021 07:22:06 +0200
Message-Id: <20210928052211.112801-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Hi Jens,

this series removes the rq_disk field in struct request, which isn't
needed now that we can get the disk from the request_queue.

Diffstat:
 block/blk-core.c                   |   10 ++++----
 block/blk-exec.c                   |   10 ++------
 block/blk-flush.c                  |    3 --
 block/blk-merge.c                  |    7 ------
 block/blk-mq.c                     |    1 
 block/blk.h                        |    2 -
 block/bsg-lib.c                    |    2 -
 drivers/block/amiflop.c            |    2 -
 drivers/block/ataflop.c            |    6 ++---
 drivers/block/floppy.c             |    6 ++---
 drivers/block/mtip32xx/mtip32xx.c  |    2 -
 drivers/block/null_blk/trace.h     |    2 -
 drivers/block/paride/pcd.c         |    2 -
 drivers/block/paride/pd.c          |    6 ++---
 drivers/block/paride/pf.c          |    4 +--
 drivers/block/pktcdvd.c            |    2 -
 drivers/block/rnbd/rnbd-clt.c      |    4 +--
 drivers/block/sunvdc.c             |    2 -
 drivers/block/sx8.c                |    4 +--
 drivers/block/virtio_blk.c         |    2 -
 drivers/md/dm-mpath.c              |    1 
 drivers/mmc/core/block.c           |   12 +++++-----
 drivers/mtd/mtd_blkdevs.c          |   10 +-------
 drivers/nvme/host/core.c           |    4 +--
 drivers/nvme/host/fault_inject.c   |    2 -
 drivers/nvme/host/pci.c            |    7 ++----
 drivers/nvme/host/trace.h          |    6 ++---
 drivers/nvme/target/passthru.c     |    3 --
 drivers/scsi/ch.c                  |    2 -
 drivers/scsi/scsi_bsg.c            |    2 -
 drivers/scsi/scsi_error.c          |    2 -
 drivers/scsi/scsi_ioctl.c          |   43 ++++++++++++++-----------------------
 drivers/scsi/scsi_lib.c            |    5 ++--
 drivers/scsi/scsi_logging.c        |    4 ++-
 drivers/scsi/sd.c                  |   26 +++++++++++-----------
 drivers/scsi/sd_zbc.c              |    8 +++---
 drivers/scsi/sg.c                  |    6 ++---
 drivers/scsi/sr.c                  |   11 ++++-----
 drivers/scsi/st.c                  |    4 +--
 drivers/scsi/ufs/ufshcd.c          |    3 --
 drivers/scsi/ufs/ufshpb.c          |    5 +---
 drivers/scsi/virtio_scsi.c         |    2 -
 drivers/target/target_core_pscsi.c |    2 -
 drivers/usb/storage/transport.c    |    2 -
 fs/nfsd/blocklayout.c              |    2 -
 include/linux/blk-mq.h             |   11 ++-------
 include/scsi/scsi_cmnd.h           |    2 -
 include/scsi/scsi_device.h         |    4 +--
 include/scsi/scsi_ioctl.h          |    4 +--
 include/trace/events/block.h       |    8 +++---
 kernel/trace/blktrace.c            |    2 -
 51 files changed, 125 insertions(+), 159 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
