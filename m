Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB4CC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Nov 2022 21:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fk/AxQCoKasC7724tGADxXSZYii2sXz1Co4nAaMmScM=; b=Y5FLaWMe4OnWMq
	NtGpFvAnjbb2b4hQVIFm8/UDZJZ+IhsDKYT8ZEuf/28RgrsdreW6AxVvUvpYnbSCuRrC2gCt3y3sz
	mFxVaZhkvTfOyNgWReKk7TIForJ+caDpaaGB70szbWAMZPGv5vUEVaByqcWVxyt9I36j+5Jf07NDp
	3Qweon94jnIGD5RBx265/AZ9GvpS3x5AKNRYBWF60CypIqM/pxMRiv+oMq1Chw1KO5tlJ0E8Ystu0
	EOL32vgX14jV74IJ+TxYD35YMgYXmqUEJNfzvBbRs6BMijG1nGEmKIWj2gKh0i0+07SjCL3keRWFt
	Ncpz5uZVGuPOnlzMEPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov3lg-00FBgw-3H; Tue, 15 Nov 2022 21:46:56 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov3ld-00FBfj-De
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2022 21:46:54 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ov3lH-0005HO-0k; Tue, 15 Nov 2022 22:46:31 +0100
Date: Tue, 15 Nov 2022 21:45:05 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthew Wilcox <willy@infradead.org>,
	Daniel Golle <daniel@makrotopia.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v5 0/4] partition parser for U-Boot's uImage.FIT
Message-ID: <cover.1668548123.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_134653_467447_7A4A3FB7 
X-CRM114-Status: GOOD (  18.82  )
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

A previous version of this partition parser is in production use on some
OpenWrt devices, eg. the BananaPi R64 where using the FIT parser allows
booting the very same image from eMMC, SD Card or SPI-NAND/UBI and also
using it as a firmware-upgrade image at the same time.
The Ubiquiti UniFi 6 LR access point served as a reference board with
SPI-NOR flash and use of the partition parser on top of a mtdblock
device.

As U-Boot by now also passes down the selected configuration node name
via device tree this allows the partition parser (or userspace process
via sysfs) to identify the selected image configuration.

Device Tree schema for that:
https://github.com/devicetree-org/dt-schema/commit/a24d97d43491e55d4def006213213a6c4045b646

In most cases this partition parser can be used without relying on the
bootloader to pass-down the configuration node name. The default
configuration node is used then.

Changes since v4:
 * use folio instead of page (requested by Matthew Wilcox)
 * remove unneeded checks (requested by Matthew Wilcox)
 * use strscpy instead of strlcpy (strlcpy is deprecated)
 * fix off-by-one string size limit label_min (discovered during tests)
 * use only a single config symbol MTD_BLOCK_PARTITION affecting both
   ubiblock and mtdblock (requested by Richard Weinberger)

Changes since v3:
 * use min_t(size_t, ...)

Changes since v2:
 * use returned length to limit all strings read from fit/dt
 * use __be32 type for 32-bit values read from fit/dt
Reported-by: kernel test robot <lkp@intel.com>
 * Kconfig: select LIBFDT for FIT_PARTITION
Reported-by: kernel test robot <lkp@intel.com>

Changes since v1:
 * Use again #ifdef's in partitions/efi to only build against FIT
   parser symbols if it is actually selected. Otherwise the efi/gpt
   would unconditionally depend on the FTT parser to be present.

Changes since RFC:
 * fixed wrong variable used in error path
 * introduced dedicated Kconfig options to enable partition
   parsers on mtdblock and ubiblock
 * drop #ifdef'ery, use IS_ENABLED(...) where needed

Daniel Golle (4):
  block: add new flag to add partitions read-only
  block: add partition parser for U-Boot uImage.FIT
  partitions/efi: add support for uImage.FIT sub-partitions
  mtd: add option to enable scanning for partitions

 MAINTAINERS               |   6 +
 block/blk.h               |   1 +
 block/partitions/Kconfig  |  15 ++
 block/partitions/Makefile |   1 +
 block/partitions/check.h  |   4 +
 block/partitions/core.c   |   6 +
 block/partitions/efi.c    |   9 +
 block/partitions/efi.h    |   3 +
 block/partitions/fit.c    | 346 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/Kconfig       |  11 ++
 drivers/mtd/mtd_blkdevs.c |   4 +-
 drivers/mtd/ubi/block.c   |   5 +-
 12 files changed, 409 insertions(+), 2 deletions(-)
 create mode 100644 block/partitions/fit.c

-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
