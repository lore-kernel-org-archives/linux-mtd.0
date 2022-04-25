Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA05FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2wgoPnEbz7WB5rrAvBZIEzIcEk3f+5MYHXWVlnjJ5sg=; b=yd05OoTUWWM6SZ
	H9W1Gl3nQM/tGeHRK5tYu+Mh8W8hhsZXZadpbiYNZEFaSIbi4eNj3JPTr4U/qfp6jjZF5GG9oSSeg
	t0oNTFZvHXVtretJjPE0fJ0HpodZIYnwfJdlcGhceIWXXQn66KcTe+BtCQs4LkCkzYya+BoJmhYLF
	HP5RY+lccs2ERHfp+5WAORA1YrB+QRDMfunxI+WwhUFN8dcoBLyFutfHqpQSFdd1sxhBXRO7FTNqR
	skd5tiARz3aaOsBNAPtnB9+EUAB9jmTNDcqE9SDCzubmxUgphnLqTTYqOe8J4Dtl2er21bMdNI+BN
	+j7txzes1FfE6zAkA06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj09i-00A0EM-3x; Mon, 25 Apr 2022 14:57:38 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj09e-00A0C4-6z
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 14:57:36 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nj09V-0000nn-AS; Mon, 25 Apr 2022 16:57:25 +0200
Date: Mon, 25 Apr 2022 15:57:19 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [RFC PATCH 0/5] partition parser for U-Boot's uImage.FIT
Message-ID: <Yma2zxtH/Ot3iADM@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_075734_288418_E61FE6F2 
X-CRM114-Status: GOOD (  13.88  )
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
   brandinge

For this to work, the image has to be created with external data and
sub-images aligned to the system's memory page boundaries, ie.
 mkimage -E -B 0x1000 -p 0x1000 ...

Booting such images has been supported by U-Boot since v2018.01.

A previous version of this partition parser is in production use on
some OpenWrt devices, eg. the BananaPi R64 where using the FIT parser
allows booting the very same image from eMMC, SD Card or SPI-NAND/UBI
and also using it as a firmware-upgrade image at the same time.

Most recently U-Boot now also passes down the selected configuration
node name via device tree to allow the partition parser (or userspace
process via sysfs) to identify the image configuration.

Device Tree schema for that:
https://github.com/devicetree-org/dt-schema/commit/a24d97d43491e55d4def006213213a6c4045b646

Daniel Golle (5):
  block: add new flag to add partitions read-only
  block: add partition parser for U-Boot uImage.FIT
  partitions/efi: add support for uImage.FIT sub-partitions
  mtd_blkdevs: scan partitions on mtdblock if FIT_PARTITION is set
  mtd/ubi/block: scan for partitions in case FIT_PARTITION is set

 MAINTAINERS               |   6 +
 block/blk.h               |   1 +
 block/partitions/Kconfig  |  14 ++
 block/partitions/Makefile |   1 +
 block/partitions/check.h  |   5 +
 block/partitions/core.c   |   6 +
 block/partitions/efi.c    |   9 +
 block/partitions/efi.h    |   3 +
 block/partitions/fit.c    | 352 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtd_blkdevs.c |   2 +
 drivers/mtd/ubi/block.c   |   2 +
 11 files changed, 401 insertions(+)
 create mode 100644 block/partitions/fit.c

-- 
2.36.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
