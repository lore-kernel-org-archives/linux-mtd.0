Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B99C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hlgGiofH3CGQfgt+aUzO8mmg+KfmPk/EDetBHvR3XaE=; b=l9G1c1Xz9ABzsY
	Q+Anu28CxQ9nEuNunzH2uyERdpRzh/BRl5z8SmUV62hHer5cUFmBwr4tpf1zn0dJ5edoE9XeDrWjo
	Z3Y0RrdUonozJurBfffdbaI2sGq5LZqv+x+AJzk3mw8VMoLj09kVY3eNwP191l92mGFXYvuSxLX3a
	AOSfgrhjRdC2l98txA7dzWqqYv20itsW/lYVtS4E11yT+B2iSb4xb3umG4uR9GYjbhG+uKLN5S7Ut
	7Wjqug2UE6bp8Lu0EF9OL9DPJ//NdODAPBTrtBehpMtmaXdux10Z+kIrhyDojL2i+s6bZwjTsGU8L
	4mMKuIjTdEHcRkqYu4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaKv-00AN4u-2U; Fri, 26 Nov 2021 12:28:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB6-00AKHA-FN
 for linux-mtd@bombadil.infradead.org; Fri, 26 Nov 2021 12:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Xa7hqASrrdIfGtS8qaD3qdcF3OYpNGlFpwwMebmiLrE=; b=fI5pv/RH+6N3RO2WI1bmtIPlGd
 ZDq9FMvDyvuuFP6RO8GNEx5tLSQOdgcaQOmIJTmOPzJOrWsEulis4zqVUMb9Knf9cOgsuRq/N+4we
 evxfnOe51eFgOs3Dbc14pfx5WKzfG5BhTvCHWnfQtf5iLYJulF1XgIGzoIN9HCGK9jaylpfwhCIxG
 2+r2DF2WZEe9UGELBF5Z+RntIJokJnxfVpmAEK132BPGg9K00G2ZRwXNvDEgwMNUtpIeE1i9hk/mM
 RzBrQ67t9P27ZWVW95iHz6mDsmIyO1OuJb3APm1kNtPx/XMW324YzOii54uuTWMvBB2A7wUJ11dfM
 huamnjTw==;
Received: from [2001:4bb8:191:f9ce:bae8:5658:102a:5491] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB1-00AWFm-0W; Fri, 26 Nov 2021 12:18:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
Subject: remove ->rq_disk v2
Date: Fri, 26 Nov 2021 13:17:57 +0100
Message-Id: <20211126121802.2090656-1-hch@lst.de>
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

Changes since v1:
 - rebased to the latests for-5.17/block tree

Diffstat:
 block/blk-flush.c                  |    3 --
 block/blk-merge.c                  |    7 ------
 block/blk-mq.c                     |   24 +++++++-------------
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
 drivers/scsi/ufs/ufshpb.c          |    4 +--
 drivers/scsi/virtio_scsi.c         |    2 -
 drivers/target/target_core_pscsi.c |    2 -
 drivers/usb/storage/transport.c    |    2 -
 include/linux/blk-mq.h             |   11 ++-------
 include/scsi/scsi_cmnd.h           |    2 -
 include/scsi/scsi_device.h         |    4 +--
 include/scsi/scsi_ioctl.h          |    4 +--
 include/trace/events/block.h       |    8 +++---
 kernel/trace/blktrace.c            |    2 -
 47 files changed, 124 insertions(+), 157 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
