Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5CC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 22:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vfPqKNb6wK7LFt6h4+5b/zMx8kes7d7A13dDdUfoi1c=; b=lGn6KBtb6f/WnI
	sYv6fo8cTNWgEd1g+PoKIreesdh/I2eqtHUFX7v+vBnaDnShYwNZbrTiBijnQyyIm81Ysb2tzlS94
	wKlI/n53UI6fgriK/qp4Fm8yRtjXE5lBR8R7SasKEo6cTluf/1+ZGTwF7CTNrcU2o8Tk54q2SPqGA
	I5bHLp1hYTMsRvMarwQZfzkeme8aibreQh8lHPcaAINXAv9enfYRvRESpUR6IBqUQvF/FB4dAviYv
	fN/vY76myoq7YTqvBBpcUa19B1jDgME0lHWl0OxQ7LR2Cz2XuXrIBJKoObIezAzOTIj0dmkcduTLi
	mRtW0cOtwhDCEGc/XCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFFs-0092jS-2Z;
	Wed, 19 Jul 2023 22:02:44 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFFq-0092io-0w
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 22:02:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMFEZ-0008I7-1O;
	Wed, 19 Jul 2023 22:01:23 +0000
Date: Wed, 19 Jul 2023 23:01:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dave Chinner <dchinner@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jan Kara <jack@suse.cz>, Daniel Golle <daniel@makrotopia.org>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	Min Li <min15.li@samsung.com>,
	Christian Loehle <CLoehle@hyperstone.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Hannes Reinecke <hare@suse.de>, Jack Wang <jinpu.wang@ionos.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Yeqi Fu <asuk4.q@gmail.com>, Avri Altman <avri.altman@wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/6] nvmem: add block device NVMEM provider
Message-ID: <cover.1689802933.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_150242_327035_1612AEAC 
X-CRM114-Status: GOOD (  15.25  )
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

On embedded devices using an eMMC it is common that one or more (hw/sw)
partitions on the eMMC are used to store MAC addresses and Wi-Fi
calibration EEPROM data.

Implement an NVMEM provider backed by block devices as typically the
NVMEM framework is used to have kernel drivers read and use binary data
from EEPROMs, efuses, flash memory (MTD), ...

In order to be able to reference hardware partitions on an eMMC, add code
to bind each hardware partition to a specific firmware subnode.

This series is meant to open the discussion on how exactly the device tree
schema for block devices and partitions may look like, and even if using
the block layer to back the NVMEM device is at all the way to go -- to me
it seemed to be a good solution because it will be reuable e.g. for NVMe.

Daniel Golle (6):
  mmc: core: set card fwnode_handle
  mmc: block: set fwnode of disk devices
  block: add new genhd flag GENHD_FL_NO_NVMEM
  mtd: blkdevs: set GENHD_FL_NO_NVMEM
  mtd: ubi: block: set GENHD_FL_NO_NVMEM
  block: implement NVMEM provider

 block/Kconfig             |   8 ++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 187 ++++++++++++++++++++++++++++++++++++++
 block/blk.h               |  13 +++
 block/genhd.c             |   2 +
 block/partitions/core.c   |   2 +
 drivers/mmc/core/block.c  |   8 ++
 drivers/mmc/core/bus.c    |   2 +
 drivers/mtd/mtd_blkdevs.c |   1 +
 drivers/mtd/ubi/block.c   |   2 +-
 include/linux/blkdev.h    |   3 +
 11 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 block/blk-nvmem.c

-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
