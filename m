Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70CC48BF0
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9R3X3NjJEWbjcW8j4oit19mgOVW36Zuy2T/l4ZplK18=; b=f+uPfe76DPUOO+
	xTZfP9dlDb/apXoQpqEKufLJWVvPNLDxE93eIDZV7D/YpYnDDc32YfJHB21n1pFnl7jiyezfjIa+9
	8jiFJUruBxK0CXIZ/62tej6NdjgCcsnudf759B1A9LZECFTvUMAR/QtCH9RCaZBDswHlTxZjqdRFA
	tDqhQPzyY3rSR6kMbXTDFKcIb1w6vyfESgEcAj+gAgeq49w0M10R0YyI2HcF6i38e5RcRqzL8yYph
	3WlBK8h7FLDlVozd1DqMUZE5kFHXetQN1oiudZTKP0sxpekNbZOHA17dxD6ljKUofH/V5VTP9Kexs
	PS4STPg8da92vKKpeJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm5-0000000FAOj-19Nv;
	Thu, 15 Feb 2024 07:03:13 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVlz-0000000FANl-1akg;
	Thu, 15 Feb 2024 07:03:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: pass queue_limits to blk_mq_alloc_disk for simple drivers
Date: Thu, 15 Feb 2024 08:02:43 +0100
Message-Id: <20240215070300.2200308-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
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

this series converts all "simple" blk-mq drivers that don't have complex
internal layering or other oddities to pass the queue_limits to
blk_mq_alloc_disk.  None of these drivers updates the limits at runtime.


Diffstat:
 arch/um/drivers/ubd_kern.c          |    8 +-
 drivers/block/aoe/aoeblk.c          |   15 ++---
 drivers/block/floppy.c              |    6 +-
 drivers/block/mtip32xx/mtip32xx.c   |   13 ++--
 drivers/block/nbd.c                 |   13 ++--
 drivers/block/ps3disk.c             |   17 +++---
 drivers/block/rbd.c                 |   29 +++++-----
 drivers/block/rnbd/rnbd-clt.c       |   64 +++++++++--------------
 drivers/block/sunvdc.c              |   18 +++---
 drivers/block/ublk_drv.c            |   90 +++++++++++++++------------------
 drivers/cdrom/gdrom.c               |   14 ++---
 drivers/memstick/core/ms_block.c    |   14 ++---
 drivers/memstick/core/mspro_block.c |   15 ++---
 drivers/mmc/core/queue.c            |   97 +++++++++++++++++++-----------------
 drivers/mtd/mtd_blkdevs.c           |   12 ++--
 drivers/mtd/ubi/block.c             |    6 +-
 drivers/s390/block/scm_blk.c        |   17 +++---
 17 files changed, 222 insertions(+), 226 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
