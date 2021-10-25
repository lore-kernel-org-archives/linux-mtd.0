Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46B5C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:06:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9278860F9C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9278860F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hORScqFmgfvNfiTRGtlz+njep3PSKcvpo5l99EBKof0=; b=aJFDKdGGlk3DrO
	3VGGK5Q5TL7GLT8VkD3Lj59L0PlWgi0Hk2APQj+WpxDSqnB3eTbq9c9DFvM8baOkluP/Rfxd87ewo
	Alqph79nw7JioEghtr8mEN2oFtttoTxqw+P72Bvh9AsawlR/7aqFoD08VWIpLP84rhTytkw1WM5TS
	SJx+Cgew6ZJG+kv2nxcn4qAsfgZyIQidOQnoDO64EFrqe9pgiCOzC1geqHYtE/oUeNjtj5em7Px4Y
	gwCzEtIZZh0f8VG7DlRyeQsJOHnXfRyZHrcPGxMFG61bXx/90uksX4Id8xRoxxRl3QhiERJoGAs0s
	qZmKT6PDxoyKoKdMmcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu2s-00FUOc-JB; Mon, 25 Oct 2021 07:05:22 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu2p-00FUNj-1e; Mon, 25 Oct 2021 07:05:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: move all struct request releated code out of blk-core.c
Date: Mon, 25 Oct 2021 09:05:05 +0200
Message-Id: <20211025070517.1548584-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
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

Hi Jens,

this series (against the for-5.16/passthrough-flag branch) removes the
remaining struct request related code from blk-core.c and cleans up a
few related bits around that.

Diffstat:
 b/block/Makefile                     |    2 
 b/block/blk-core.c                   |  362 ----------------------
 b/block/blk-mq.c                     |  573 +++++++++++++++++++++++++++++------
 b/block/blk-mq.h                     |    3 
 b/block/blk.h                        |   33 --
 b/drivers/block/paride/pd.c          |    4 
 b/drivers/block/pktcdvd.c            |    2 
 b/drivers/block/virtio_blk.c         |    4 
 b/drivers/md/dm-mpath.c              |    4 
 b/drivers/mmc/core/block.c           |   20 -
 b/drivers/mtd/mtd_blkdevs.c          |   10 
 b/drivers/mtd/ubi/block.c            |    6 
 b/drivers/scsi/scsi_bsg.c            |    2 
 b/drivers/scsi/scsi_error.c          |    2 
 b/drivers/scsi/scsi_ioctl.c          |    4 
 b/drivers/scsi/scsi_lib.c            |   46 ++
 b/drivers/scsi/sg.c                  |    6 
 b/drivers/scsi/sr.c                  |    2 
 b/drivers/scsi/st.c                  |    4 
 b/drivers/scsi/ufs/ufshcd.c          |   20 -
 b/drivers/scsi/ufs/ufshpb.c          |    8 
 b/drivers/target/target_core_pscsi.c |    4 
 b/include/linux/blk-mq.h             |   16 
 block/blk-exec.c                     |  116 -------
 24 files changed, 597 insertions(+), 656 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
