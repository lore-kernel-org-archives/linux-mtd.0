Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6541CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mx90kSOYLkSvt0g5/7eYUTcTb3UZ9fi8CcLSXgbMH+U=; b=qaQut+x40w2HbO
	qjWzDSy/KeYqVoLqLJ6e65A7E4xx37jfWZsyHW2ALq0bL9bjZonM8VFVhoL3h7Qfk7ZKJsqyUasDF
	aprPSEs86+1wKC/SSVxFDJGhf9CaJfCIs49PSE57d2USlvANRkPbUzx5imcdi8XPuK+BddSTsQ+wg
	sqzV/EdZJmOCFrXBdbjtt4O/0KRSGhmNUQc7lT53ybhqnODucv3nL7YKFYeHeqylar/WN3SbTHT1k
	134tmkFnn2yT9hjaLCxea7d1mH//36UbXw4pahd0kNF+kyrsAy+/vsIIyvz3K2UofkqJrGlxXj1+w
	RNEvxMDcbdC7rQAoj1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no0vO-00Dr2P-Ed; Mon, 09 May 2022 10:47:34 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no0vK-00DqzQ-2k
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 10:47:32 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1no0vD-0000FY-PM; Mon, 09 May 2022 12:47:23 +0200
Date: Mon, 9 May 2022 11:47:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 0/5] partition parser for U-Boot's uImage.FIT
Message-ID: <YnjxNcN6+7rYp9RH@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_034730_157993_5CFFCDD2 
X-CRM114-Status: GOOD (  17.97  )
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

Add uImage.FIT partition parser and wire it up to allow mounting
filesystem sub-images from uImage.FIT in GPT partitions as well as
mtdblock and ubiblock devices within Linux (e.g. as root filesystem).

Using uImage.FIT to store the root filesystem besides kernel and dtb has
several obvious advantages which are hard to obtain in any other way:
 * single image accross different storage types
 * dynamically sized partitions for kernel and rootfs
 * hash also for rootfs checked by U-Boot before launching kernel
 * images may include additional filesystems e.g. for localization or
   branding

For this to work, the image has to be created with external data and
sub-images aligned to the system's memory page boundaries, ie.
 mkimage -E -B 0x1000 -p 0x1000 ...

Booting such images has been supported by U-Boot since v2018.01.

A previous version of this partition parser is in production use on
some OpenWrt devices, eg. the BananaPi R64 where using the FIT parser
allows booting the very same image from eMMC, SD Card or SPI-NAND/UBI
and also using it as a firmware-upgrade image at the same time.
The Ubiquiti UniFi 6 LR access served as a reference board with SPI-NOR
flash and use of the partition parser on top of a mtdblock device.

Most recently U-Boot now passes down the selected configuration
node name via device tree to allow the partition parser (or userspace
process via sysfs) to identify the image configuration.

Device Tree schema for that:
https://github.com/devicetree-org/dt-schema/commit/a24d97d43491e55d4def006213213a6c4045b646

In most cases this partition parser can be used without relying on the
bootloader to pass-down the configuration node name. The default
configuration node is used then.

Changes since v1:
 * Use again #ifdef's in partitions/efi to only build against FIT
   parser symbols if it is actually selected. Otherwise the efi/gpt
   would unconditionally depend on the FTT parser to be present.

Changes since RFC:
 * fixed wrong variable used in error path
 * introduced dedicated Kconfig options to enable partition
   parsers on mtdblock and ubiblock
 * drop #ifdef'ery, use IS_ENABLED(...) where needed

Daniel Golle (5):
  block: add new flag to add partitions read-only
  block: add partition parser for U-Boot uImage.FIT
  partitions/efi: add support for uImage.FIT sub-partitions
  mtd_blkdevs: add option to enable scanning for partitions
  mtd: ubi: block: add option to enable scanning for partitions

 MAINTAINERS               |   6 +
 block/blk.h               |   1 +
 block/partitions/Kconfig  |  14 ++
 block/partitions/Makefile |   1 +
 block/partitions/check.h  |   5 +
 block/partitions/core.c   |   6 +
 block/partitions/efi.c    |   9 +
 block/partitions/efi.h    |   3 +
 block/partitions/fit.c    | 352 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/Kconfig       |  11 ++
 drivers/mtd/mtd_blkdevs.c |   4 +-
 drivers/mtd/ubi/Kconfig   |  10 ++
 drivers/mtd/ubi/block.c   |   5 +-
 13 files changed, 425 insertions(+), 2 deletions(-)
 create mode 100644 block/partitions/fit.c

-- 
2.36.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
