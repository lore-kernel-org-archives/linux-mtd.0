Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3288A60A5BD2
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ID973X34;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4TiX6j8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UmrBjzwauRd4+yUVAH+l977BjacELSXaMtlKMZ3ceC0=; b=ID973X34MO/FbHFtwNiK1ygObA
	t6/XNmruUzvpKFS5dXmyDKU74aUDqN2UU/sLeacVB+dA1KtR+ROiXdSY+HWkvGQdbefr7M1cZuFrK
	fmP9NsA8iXPBqR3DjSRX6WUlxnj5NEXji073PeUAddIutyEESkYaTQah7EL2uSf0Cxu0zCIQQZGCl
	HldozCN40fJOFauZjW2ki3C/cn/wtRu42U/t5UDkeOO39Ioxj7+ePKg+PPhQ6KnhLVi9nOkAX4Er6
	OG0oHRnC/JGJrw4MC1EdCfZahTtFU5hLQZil2Ysz93uCnrolB89v30SCJVfY7w/fOY2Ea7eoURyDu
	Pjx1OHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcK-00000008LN7-3Cla;
	Thu, 12 Nov 2026 01:28:44 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJc9-00000008L9w-0wqj
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:40 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4f14642adb4so2036589b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446912; x=1795051712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbFky0SSz4cpGOI56glwm9g8p1up3moDDUx6ZeLHvm8=;
        b=b4TiX6j8mPfcJnxiQHBQhWEOhLeRL5HEYpbYY3mnzpMdKTeHE3Vra4qdJbzrye+kFf
         rACeq/YrRbgtI3anaMvjwcwYKs5Nt/PLKBGm2AAuZhr0TTtNlYVCJgOl/Z1LXQwl91R6
         ULhEFZTqRPUAPvfYWowbH6e2RWYin4MEPt+uWtE/qVmWVp5YfQEw4ZwvE9reWdyfPwC2
         AIDPWf7T1cjGmA6hbCwIc+TC+BB0xxRK47z4ut2PtJO5c3Jh5SRSr7bGlbYLb6zvSVnH
         TmdtU5InPBkjvvj4YB1eNSHUNJmDTrXGGiIv6Q2wMsiLh1w9/YgPF5hDM2qe3mVERyvy
         bLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446912; x=1795051712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbFky0SSz4cpGOI56glwm9g8p1up3moDDUx6ZeLHvm8=;
        b=1E+uJrvKWlv5yf5OvO9P3wkyuLkX3QNZ/X5P3o76NsWH7KhAIULpOInuA1lRtL6vz1
         uxwmlKBWpx7r8neWB4wRLHj47vd0ogV+wM5U5Ubix0TVXP4CsghLFaPlYXpyx0HvD7/J
         mEgsxROVWJinBDD/mXDY30O2mEYzbcJ/yTIErHw/amap0WPSy94cPUmivJ6tdXb1bje3
         CfMoJd7FxmIPuElK/tdqy34VmDpDsm/oiFnU1uowJqf7TwKxDEBw3MX+WOG+90QoSfB3
         mEr/cHSoBvPjRAFqrYLdS1PjN+VaVA6fSI0EOFF3oatZrcFdU+XBLv71mDgnbasgjQr3
         yZUQ==
X-Gm-Message-State: APuU4Z/JcdCaZ79gzFJGumOCmH87Ck2ULyntNPSg3s1O9hI8nz+/eEBM
	OETxAAgBKfODXtbBT7r3uCgsALuHnaWHfgUNs2yJdgm9vJ4DIB2f+7oh
X-Gm-Gg: AYBFou2n2OP3jecIU4ZKs8/e2CdPQf0ntwuBCndq2A/jLrPCnhhNbrDefVTMKZTX8Sm
	PdMBelofymC2tMTgHQrKkf0JJV97fBw2WZEwPvZvN1o5QaBEApJJpzt8z0Lq/LM2qFxlVe7fS3O
	32izwvctjycZ65NgQZdZ7pFc1CLgDa8SoDzJNEAb0nGdftp7KhFdL4TntxI3NdSOIWrp+aB+i3p
	QOVJaW2xqQTWa0AdoLV9y6PG9h7l5okHIR543CigktwNA2jgWjRVsjRx0CM8F8dheV1kre6nn5g
	PApU+6RmAyoFLmwhimK0UH4ZwDR/+KB7cttA3opuO6DBTWzcoZLuDExIE1TL6djxoR8snFcO9g6
	7ikJ15InikcFKUkkG+NmOibFyAgSbdplH7YFVSxt8kf9tUd0wKMUXM8LWrbjDsJPOtq1NPhyqXl
	zxs9NzFYv0Ps3Aay6OC9utbUUGy2Rgjz2hxscqc9YkQ18klG9x8XopPtrxOmeb8sxP1pejNNtAL
	PgZ9Oxvmnudq2IO7RpD0oFu0744xfkvdA3RTP60V36TKMbDYULpkwyIaPFyPlBN3xhEfyO8m8e2
	aCOFMdVNHLMthmf7f+G7ndcf/Lepd9Hpzwnq/h+y/T2lPlhdBFQUsv7Q+xz+fRYFVn6YA5sGnCp
	f30OE8c0d7hlEUid/ofAfy0OpjHBhnUG/mPjR7hr3RzIVpmg4TmvzCliQQ1tMgXD1qUWDcmEWlN
	dIvfmDE1aKtHsq3y1X+N8oJ/Dl+qYIc4FtKvMK2JjzHf7PPtojUklw
X-Received: by 2002:a05:6808:538a:b0:4f8:716d:793e with SMTP id 5614622812f47-56b967af72fmr3671510b6e.46.1794446911421;
        Wed, 11 Nov 2026 17:28:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:42 -0700
Subject: [PATCH v3 03/58] mtd: separate class devices from retained backing
 objects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-3-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-Spam-Note: CRM114 run bypassed due to message size (102321 bytes)
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MTD handles retain registered nodes, but not the backing allocation
owned by the controller driver. An open partition can therefore refer to
freed master metadata after unbind. Bare device references introduce
another lifetime: their final put may run after both the driver and MTD
modules have unloaded.

Allocate class devices separately from mtd_info. Delete their
interfaces, drain NVMEM access and clear module-owned pointers before
dropping MTD metadata. Keep the class object, device type, PM dispatch
and final device-data release in a small built-in component, including
when MTD is modular. A bare device reference then retains data without
requiring a callback into an unloaded module.

The PM core can retain a class device across removal. Clear its backing
association under the device lock, which also covers PM callback lookup
and execution, so active callbacks finish before metadata is released.
Later callbacks find no backing object and return without accessing it.
Keep the attribute groups on the device and detach them after
device_del() has drained their callbacks.

Add optional backing ownership initialized by mtd_set_release(). The
driver, registered nodes and acquired MTD handles each hold a reference.
Retained nested partitions also own references to their parent metadata.
Drop the driver's reference with mtd_put_master() after unregister and
hardware disconnection; final metadata cleanup must not access released
resources.

Finish driver cleanup before dropping its initial reference. Final
release belongs to the subsystem core providing the MTD operations and
only frees retained data. The existing MTD handle ownership keeps that
core resident; it does not require keeping the controller driver loaded
or waiting for userspace to close files during module removal.

Distinguish registration from retained references, rejecting new opens
of removed devices. Balance direct master opens even with
partitioned-master support disabled, independently of later publication.
Remove the IDR entry at the final MTD put, when the corresponding NVMEM
name is unregistered.

Update MTD users for the separate class device, parent and firmware-node
fields. Registration failures detach the device before returning backing
storage to the caller, including when device release is deferred.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/Makefile                                   |   2 +-
 drivers/media/pci/cobalt/cobalt-flash.c            |   2 +-
 drivers/mtd/Kconfig                                |   4 +
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/devices/bcm47xxsflash.c                |   2 +-
 drivers/mtd/devices/docg3.c                        |   4 +-
 drivers/mtd/devices/mchp23k256.c                   |   2 +-
 drivers/mtd/devices/mchp48l640.c                   |   2 +-
 drivers/mtd/devices/mtd_dataflash.c                |   2 +-
 drivers/mtd/devices/mtd_intel_dg.c                 |  30 +--
 drivers/mtd/devices/powernv_flash.c                |   4 +-
 drivers/mtd/devices/spear_smi.c                    |   2 +-
 drivers/mtd/devices/sst25l.c                       |   2 +-
 drivers/mtd/devices/st_spi_fsm.c                   |   8 +-
 drivers/mtd/hyperbus/hyperbus-core.c               |   2 +-
 drivers/mtd/lpddr/lpddr2_nvm.c                     |   2 +-
 drivers/mtd/maps/lantiq-flash.c                    |   2 +-
 drivers/mtd/maps/physmap-core.c                    |   2 +-
 drivers/mtd/maps/plat-ram.c                        |   2 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |   2 +-
 drivers/mtd/maps/sa1100-flash.c                    |   2 +-
 drivers/mtd/maps/vmu-flash.c                       |   2 +-
 drivers/mtd/mtd_blkdevs.c                          |   2 +-
 drivers/mtd/mtd_virt_concat.c                      |  10 +-
 drivers/mtd/mtdcore.c                              | 282 ++++++++++++---------
 drivers/mtd/mtdcore.h                              |   5 +
 drivers/mtd/mtddevice.c                            |  59 +++++
 drivers/mtd/mtddevice.h                            |  12 +
 drivers/mtd/mtdpart.c                              |  14 +-
 drivers/mtd/mtdpstore.c                            |  50 ++--
 drivers/mtd/nand/ecc.c                             |   3 +-
 drivers/mtd/nand/onenand/generic.c                 |   2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c           |   2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c         |   2 +-
 drivers/mtd/nand/raw/ams-delta.c                   |   4 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |   2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c       |   2 +-
 drivers/mtd/nand/raw/au1550nd.c                    |   2 +-
 drivers/mtd/nand/raw/bcm47xxnflash/main.c          |   2 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |   2 +-
 drivers/mtd/nand/raw/cadence-nand-controller.c     |   2 +-
 drivers/mtd/nand/raw/cafe_nand.c                   |   2 +-
 drivers/mtd/nand/raw/davinci_nand.c                |   2 +-
 drivers/mtd/nand/raw/denali.c                      |   2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |   2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |   2 +-
 drivers/mtd/nand/raw/fsl_upm.c                     |   2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |   2 +-
 drivers/mtd/nand/raw/gpio.c                        |   2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |   2 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |   2 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |   2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c       |   2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c    |   2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  18 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  18 +-
 drivers/mtd/nand/raw/marvell_nand.c                |   2 +-
 drivers/mtd/nand/raw/meson_nand.c                  |   2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |   2 +-
 drivers/mtd/nand/raw/mtk_nand.c                    |   4 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |   4 +-
 drivers/mtd/nand/raw/mxic_nand.c                   |   2 +-
 drivers/mtd/nand/raw/nand_base.c                   |   4 +-
 drivers/mtd/nand/raw/nand_macronix.c               |   4 +-
 drivers/mtd/nand/raw/nand_onfi.c                   |   4 +-
 drivers/mtd/nand/raw/ndfc.c                        |   2 +-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |   6 +-
 drivers/mtd/nand/raw/omap2.c                       |   2 +-
 drivers/mtd/nand/raw/orion_nand.c                  |   2 +-
 drivers/mtd/nand/raw/pasemi_nand.c                 |   2 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |   2 +-
 drivers/mtd/nand/raw/plat_nand.c                   |   2 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |   2 +-
 drivers/mtd/nand/raw/r852.c                        |   8 +-
 drivers/mtd/nand/raw/renesas-nand-controller.c     |   2 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |   4 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |   2 +-
 drivers/mtd/nand/raw/sharpsl.c                     |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |   2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |   2 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |   2 +-
 drivers/mtd/nand/raw/technologic-nand-controller.c |   2 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |   2 +-
 drivers/mtd/nand/raw/txx9ndfmc.c                   |   2 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |   2 +-
 drivers/mtd/nand/raw/xway_nand.c                   |   2 +-
 drivers/mtd/nand/spi/core.c                        |   2 +-
 drivers/mtd/nand/spi/esmt.c                        |   2 +-
 drivers/mtd/nand/spi/micron.c                      |   4 +-
 drivers/mtd/nand/spi/otp.c                         |   2 +-
 drivers/mtd/spi-nor/core.c                         |   2 +-
 drivers/mtd/ubi/build.c                            |   2 +-
 include/linux/mtd/mtd.h                            |  20 +-
 93 files changed, 435 insertions(+), 285 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..86adb803c79a 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -84,7 +84,7 @@ obj-y				+= scsi/
 obj-y				+= nvme/
 obj-$(CONFIG_ATA)		+= ata/
 obj-$(CONFIG_TARGET_CORE)	+= target/
-obj-$(CONFIG_MTD)		+= mtd/
+obj-$(CONFIG_MTD_DEVICE)		+= mtd/
 obj-$(CONFIG_SPI)		+= spi/
 obj-$(CONFIG_SPMI)		+= spmi/
 obj-$(CONFIG_HSI)		+= hsi/
diff --git a/drivers/media/pci/cobalt/cobalt-flash.c b/drivers/media/pci/cobalt/cobalt-flash.c
index 1d3c64b4cf6d..14f87cd54b9c 100644
--- a/drivers/media/pci/cobalt/cobalt-flash.c
+++ b/drivers/media/pci/cobalt/cobalt-flash.c
@@ -102,7 +102,7 @@ int cobalt_flash_probe(struct cobalt *cobalt)
 	}
 
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &cobalt->pci_dev->dev;
+	mtd->parent_dev = &cobalt->pci_dev->dev;
 	mtd_device_register(mtd, NULL, 0);
 	return 0;
 }
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 0421c6208de7..d13a065874ba 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -1,5 +1,9 @@
+config MTD_DEVICE
+	bool
+
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
+	select MTD_DEVICE
 	imply NVMEM
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 7b6dd53e8150..8bb19a6da358 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -4,6 +4,7 @@
 #
 
 # Core functionality.
+obj-$(CONFIG_MTD_DEVICE)		+= mtddevice.o
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 mtd-$(CONFIG_MTD_VIRT_CONCAT)	+= mtd_virt_concat.o
diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 2edc46741774..bb18ed449c1c 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -252,7 +252,7 @@ static void bcm47xxsflash_fill_mtd(struct bcm47xxsflash *b47s,
 	struct mtd_info *mtd = &b47s->mtd;
 
 	mtd->priv = b47s;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	mtd->name = "bcm47xxsflash";
 
 	mtd->type = MTD_NORFLASH;
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 603fd0efc2ea..9e582457f8b5 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1730,7 +1730,7 @@ static void __init doc_dbg_register(struct mtd_info *floor)
 	if (IS_ERR_OR_NULL(root)) {
 		if (IS_ENABLED(CONFIG_DEBUG_FS) &&
 		    !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-			dev_warn(floor->dev.parent,
+			dev_warn(floor->parent_dev,
 				 "CONFIG_MTD_PARTITIONED_MASTER must be enabled to expose debugfs stuff\n");
 		return;
 	}
@@ -1817,7 +1817,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 	if (!mtd)
 		goto nomem2;
 	mtd->priv = docg3;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	bbt_nbpages = DIV_ROUND_UP(docg3->max_block + 1,
 				   8 * DOC_LAYOUT_PAGE_SIZE);
 	docg3->bbt = kcalloc(DOC_LAYOUT_PAGE_SIZE, bbt_nbpages, GFP_KERNEL);
diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 66e058df4c32..65975d426973 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -193,7 +193,7 @@ static int mchp23k256_probe(struct spi_device *spi)
 		flash->caps = &mchp23k256_caps;
 
 	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
-	flash->mtd.dev.parent	= &spi->dev;
+	flash->mtd.parent_dev	= &spi->dev;
 	flash->mtd.type		= MTD_RAM;
 	flash->mtd.flags	= MTD_CAP_RAM;
 	flash->mtd.writesize	= 1;
diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index 4af9208f9690..1768a79024ea 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -340,7 +340,7 @@ static int mchp48l640_probe(struct spi_device *spi)
 		flash->caps = &mchp48l640_caps;
 
 	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
-	flash->mtd.dev.parent	= &spi->dev;
+	flash->mtd.parent_dev	= &spi->dev;
 	flash->mtd.type		= MTD_RAM;
 	flash->mtd.flags	= MTD_CAP_RAM;
 	flash->mtd.writesize	= flash->caps->page_size;
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index e766258d76f7..72158ee7518f 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -653,7 +653,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	device->_write = dataflash_write;
 	device->priv = priv;
 
-	device->dev.parent = &spi->dev;
+	device->parent_dev = &spi->dev;
 	mtd_set_of_node(device, spi->dev.of_node);
 
 	if (revision >= 'c')
diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index a566e86eb5e3..d4dc094fa170 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -510,7 +510,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 		return -EINVAL;
 
 	if (!IS_ALIGNED(info->addr, SZ_4K) || !IS_ALIGNED(info->len, SZ_4K)) {
-		dev_err(&mtd->dev, "unaligned erase %llx %llx\n",
+		dev_err(mtd->dev, "unaligned erase %llx %llx\n",
 			info->addr, info->len);
 		info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 		return -EINVAL;
@@ -521,7 +521,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 
 	ret = pm_runtime_resume_and_get(nvm->dev);
 	if (ret < 0) {
-		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
+		dev_err(mtd->dev, "rpm: get failed %d\n", ret);
 		return ret;
 	}
 
@@ -530,7 +530,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 
 	while (total_len > 0) {
 		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
-			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
+			dev_err(mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
 			info->fail_addr = addr;
 			ret = -ERANGE;
 			break;
@@ -538,7 +538,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 
 		idx = idg_nvm_get_region(nvm, addr);
 		if (idx >= nvm->nregions) {
-			dev_err(&mtd->dev, "out of range");
+			dev_err(mtd->dev, "out of range");
 			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 			ret = -ERANGE;
 			break;
@@ -550,12 +550,12 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 		if (len > nvm->regions[idx].size - from)
 			len = nvm->regions[idx].size - from;
 
-		dev_dbg(&mtd->dev, "erasing region[%d] %s from %llx len %zx\n",
+		dev_dbg(mtd->dev, "erasing region[%d] %s from %llx len %zx\n",
 			region, nvm->regions[idx].name, from, len);
 
 		bytes = idg_erase(nvm, region, from, len, &info->fail_addr);
 		if (bytes < 0) {
-			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
+			dev_dbg(mtd->dev, "erase failed with %zd\n", bytes);
 			info->fail_addr += nvm->regions[idx].offset;
 			ret = bytes;
 			break;
@@ -582,11 +582,11 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	idx = idg_nvm_get_region(nvm, from);
 
-	dev_dbg(&mtd->dev, "reading region[%d] %s from %lld len %zd\n",
+	dev_dbg(mtd->dev, "reading region[%d] %s from %lld len %zd\n",
 		nvm->regions[idx].id, nvm->regions[idx].name, from, len);
 
 	if (idx >= nvm->nregions) {
-		dev_err(&mtd->dev, "out of range");
+		dev_err(mtd->dev, "out of range");
 		return -ERANGE;
 	}
 
@@ -597,7 +597,7 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	ret = pm_runtime_resume_and_get(nvm->dev);
 	if (ret < 0) {
-		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		dev_err(mtd->dev, "rpm: get failed %zd\n", ret);
 		return ret;
 	}
 
@@ -605,7 +605,7 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	ret = idg_read(nvm, region, from, len, buf);
 	if (ret < 0) {
-		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		dev_dbg(mtd->dev, "read failed with %zd\n", ret);
 	} else {
 		*retlen = ret;
 		ret = 0;
@@ -628,11 +628,11 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	idx = idg_nvm_get_region(nvm, to);
 
-	dev_dbg(&mtd->dev, "writing region[%d] %s to %lld len %zd\n",
+	dev_dbg(mtd->dev, "writing region[%d] %s to %lld len %zd\n",
 		nvm->regions[idx].id, nvm->regions[idx].name, to, len);
 
 	if (idx >= nvm->nregions) {
-		dev_err(&mtd->dev, "out of range");
+		dev_err(mtd->dev, "out of range");
 		return -ERANGE;
 	}
 
@@ -643,7 +643,7 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	ret = pm_runtime_resume_and_get(nvm->dev);
 	if (ret < 0) {
-		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		dev_err(mtd->dev, "rpm: get failed %zd\n", ret);
 		return ret;
 	}
 
@@ -651,7 +651,7 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	ret = idg_write(nvm, region, to, len, buf);
 	if (ret < 0) {
-		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		dev_dbg(mtd->dev, "write failed with %zd\n", ret);
 	} else {
 		*retlen = ret;
 		ret = 0;
@@ -707,7 +707,7 @@ static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device
 	dev_dbg(device, "registering with mtd\n");
 
 	nvm->mtd.owner = THIS_MODULE;
-	nvm->mtd.dev.parent = device;
+	nvm->mtd.parent_dev = device;
 	nvm->mtd.flags = MTD_CAP_NORFLASH;
 	nvm->mtd.type = MTD_DATAFLASH;
 	nvm->mtd.priv = nvm;
diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index a12427d9e20f..b02e8695703e 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -47,7 +47,7 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		loff_t offset, size_t len, size_t *retlen, u_char *buf)
 {
 	struct powernv_flash *info = (struct powernv_flash *)mtd->priv;
-	struct device *dev = &mtd->dev;
+	struct device *dev = mtd->dev;
 	int token;
 	struct opal_msg msg;
 	int rc;
@@ -219,7 +219,7 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	mtd->_erase = powernv_flash_erase;
 	mtd->_read = powernv_flash_read;
 	mtd->_write = powernv_flash_write;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	mtd_set_of_node(mtd, dev->of_node);
 	return 0;
 }
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index f02f96bff450..d46610c52fae 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -885,7 +885,7 @@ static int spear_smi_setup_banks(struct platform_device *pdev,
 	else
 		flash->mtd.name = flash_devices[flash_index].name;
 
-	flash->mtd.dev.parent = &pdev->dev;
+	flash->mtd.parent_dev = &pdev->dev;
 	mtd_set_of_node(&flash->mtd, np);
 	flash->mtd.type = MTD_NORFLASH;
 	flash->mtd.writesize = 1;
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 8813994ce9f4..5d178dddab7b 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -368,7 +368,7 @@ static int sst25l_probe(struct spi_device *spi)
 	if (data && data->name)
 		flash->mtd.name = data->name;
 
-	flash->mtd.dev.parent   = &spi->dev;
+	flash->mtd.parent_dev   = &spi->dev;
 	flash->mtd.type		= MTD_NORFLASH;
 	flash->mtd.flags	= MTD_CAP_NORFLASH;
 	flash->mtd.erasesize	= flash_info->erase_size;
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index f2266145b821..83972b8ce30d 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -1669,7 +1669,7 @@ static int stfsm_write(struct stfsm *fsm, const uint8_t *buf,
 static int stfsm_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 			  size_t *retlen, u_char *buf)
 {
-	struct stfsm *fsm = dev_get_drvdata(mtd->dev.parent);
+	struct stfsm *fsm = dev_get_drvdata(mtd->parent_dev);
 	uint32_t bytes;
 
 	dev_dbg(fsm->dev, "%s from 0x%08x, len %zd\n",
@@ -1745,7 +1745,7 @@ static int stfsm_erase_chip(struct stfsm *fsm)
 static int stfsm_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 			   size_t *retlen, const u_char *buf)
 {
-	struct stfsm *fsm = dev_get_drvdata(mtd->dev.parent);
+	struct stfsm *fsm = dev_get_drvdata(mtd->parent_dev);
 
 	u32 page_offs;
 	u32 bytes;
@@ -1790,7 +1790,7 @@ static int stfsm_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
  */
 static int stfsm_mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	struct stfsm *fsm = dev_get_drvdata(mtd->dev.parent);
+	struct stfsm *fsm = dev_get_drvdata(mtd->parent_dev);
 	u32 addr, len;
 	int ret;
 
@@ -2074,7 +2074,7 @@ static int stfsm_probe(struct platform_device *pdev)
 		return ret;
 
 	fsm->mtd.name		= info->name;
-	fsm->mtd.dev.parent	= &pdev->dev;
+	fsm->mtd.parent_dev	= &pdev->dev;
 	mtd_set_of_node(&fsm->mtd, np);
 	fsm->mtd.type		= MTD_NORFLASH;
 	fsm->mtd.writesize	= 4;
diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
index 4d8047d43e48..48cdf5c031af 100644
--- a/drivers/mtd/hyperbus/hyperbus-core.c
+++ b/drivers/mtd/hyperbus/hyperbus-core.c
@@ -112,7 +112,7 @@ int hyperbus_register_device(struct hyperbus_device *hbdev)
 		return -ENODEV;
 	}
 
-	hbdev->mtd->dev.parent = dev;
+	hbdev->mtd->parent_dev = dev;
 	mtd_set_of_node(hbdev->mtd, np);
 
 	ret = mtd_device_register(hbdev->mtd, NULL, 0);
diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
index 565b71f7fdd5..447431187edf 100644
--- a/drivers/mtd/lpddr/lpddr2_nvm.c
+++ b/drivers/mtd/lpddr/lpddr2_nvm.c
@@ -457,7 +457,7 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 
 	/* Populate mtd_info data structure */
 	*mtd = lpddr2_nvm_mtd_info;
-	mtd->dev.parent		= &pdev->dev;
+	mtd->parent_dev		= &pdev->dev;
 	mtd->name		= pdev->dev.init_name;
 	mtd->priv		= map;
 	mtd->size		= resource_size(add_range);
diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 80d467eba92a..35b2c821ce3c 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -146,7 +146,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	ltq_mtd->mtd->dev.parent = &pdev->dev;
+	ltq_mtd->mtd->parent_dev = &pdev->dev;
 	mtd_set_of_node(ltq_mtd->mtd, pdev->dev.of_node);
 
 	cfi = ltq_mtd->map->fldrv_priv;
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index dcda7685fc99..e2bb14931bc8 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -568,7 +568,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 			err = -ENXIO;
 			goto err_out;
 		}
-		info->mtds[i]->dev.parent = &dev->dev;
+		info->mtds[i]->parent_dev = &dev->dev;
 	}
 
 	if (info->nmaps == 1) {
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 816111031cf1..5a7c9d1ade01 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -163,7 +163,7 @@ static int platram_probe(struct platform_device *pdev)
 		goto exit_free;
 	}
 
-	info->mtd->dev.parent = &pdev->dev;
+	info->mtd->parent_dev = &pdev->dev;
 
 	platram_setrw(info, PLATRAM_RW);
 
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index bc303a9909d4..754419d19554 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -89,7 +89,7 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 		kfree(info);
 		return -EIO;
 	}
-	info->mtd->dev.parent = &pdev->dev;
+	info->mtd->parent_dev = &pdev->dev;
 
 	mtd_device_parse_register(info->mtd, probes, NULL, flash->parts,
 				  flash->nr_parts);
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 4506b27a905e..dcddcbf18fdf 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -242,7 +242,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 			goto err;
 		}
 	}
-	info->mtd->dev.parent = &pdev->dev;
+	info->mtd->parent_dev = &pdev->dev;
 
 	if (ret == 0)
 		return info;
diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 10244e6731d0..82709a81c35c 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -547,7 +547,7 @@ static void vmu_queryblocks(struct mapleq *mq)
 	mpart->partition = card->partition;
 	mtd_cur->priv = mpart;
 	mtd_cur->owner = THIS_MODULE;
-	mtd_cur->dev.parent = &mdev->dev;
+	mtd_cur->parent_dev = &mdev->dev;
 
 	pcache = kzalloc_obj(struct vmu_cache);
 	if (!pcache)
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 4d2e7b7774e9..957087c10220 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -379,7 +379,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->readonly)
 		set_disk_ro(gd, 1);
 
-	ret = device_add_disk(&new->mtd->dev, gd, NULL);
+	ret = device_add_disk(new->mtd->dev, gd, NULL);
 	if (ret)
 		goto out_cleanup_disk;
 
diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index da4277ced4d6..0d501e1565c0 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -100,7 +100,7 @@ int mtd_virt_concat_destroy(struct mtd_info *mtd)
 
 		/* Find the concat item that hold the mtd device */
 		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
+			if (item->nodes[idx] == mtd_get_of_node(mtd)) {
 				is_mtd_found = true;
 				break;
 			}
@@ -116,7 +116,7 @@ int mtd_virt_concat_destroy(struct mtd_info *mtd)
 		 */
 		for (idx = 0; idx < concat->num_subdev; idx++) {
 			child = concat->subdev[idx];
-			if (child->dev.of_node != mtd->dev.of_node) {
+			if (mtd_get_of_node(child) != mtd_get_of_node(mtd)) {
 				ret = add_mtd_device(child);
 				if (ret)
 					goto out;
@@ -223,7 +223,7 @@ bool mtd_virt_concat_add(struct mtd_info *mtd)
 	list_for_each_entry(item, &concat_node_list, head) {
 		concat = item->concat;
 		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
+			if (item->nodes[idx] == mtd_get_of_node(mtd)) {
 				concat->subdev[concat->num_subdev++] = mtd;
 				return true;
 			}
@@ -333,8 +333,8 @@ int mtd_virt_concat_create_join(void)
 			}
 			concat->mtd = *mtd;
 			/* Arbitrary set the first device as parent */
-			concat->mtd.dev.parent = concat->subdev[0]->dev.parent;
-			concat->mtd.dev = concat->subdev[0]->dev;
+			concat->mtd.parent_dev = concat->subdev[0]->parent_dev;
+			mtd_set_of_node(&concat->mtd, mtd_get_of_node(concat->subdev[0]));
 
 			/* Add the mtd device */
 			ret = add_mtd_device(&concat->mtd);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 620326279957..5793c865f3a2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,38 +37,10 @@
 #include <linux/mtd/concat.h>
 
 #include "mtdcore.h"
+#include "mtddevice.h"
 
 struct backing_dev_info *mtd_bdi;
 
-#ifdef CONFIG_PM_SLEEP
-
-static int mtd_cls_suspend(struct device *dev)
-{
-	struct mtd_info *mtd = dev_get_drvdata(dev);
-
-	return mtd ? mtd_suspend(mtd) : 0;
-}
-
-static int mtd_cls_resume(struct device *dev)
-{
-	struct mtd_info *mtd = dev_get_drvdata(dev);
-
-	if (mtd)
-		mtd_resume(mtd);
-	return 0;
-}
-
-static SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
-#define MTD_CLS_PM_OPS (&mtd_cls_pm_ops)
-#else
-#define MTD_CLS_PM_OPS NULL
-#endif
-
-static struct class mtd_class = {
-	.name = "mtd",
-	.pm = MTD_CLS_PM_OPS,
-};
-
 static DEFINE_IDR(mtd_idr);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
@@ -78,7 +50,15 @@ EXPORT_SYMBOL_GPL(mtd_table_mutex);
 
 struct mtd_info *__mtd_next_device(int i)
 {
-	return idr_get_next(&mtd_idr, &i);
+	struct mtd_info *mtd;
+
+	while ((mtd = idr_get_next(&mtd_idr, &i))) {
+		if (mtd->registered)
+			return mtd;
+		i++;
+	}
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(__mtd_next_device);
 
@@ -87,54 +67,117 @@ static LIST_HEAD(mtd_notifiers);
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
-/* REVISIT once MTD uses the driver model better, whoever allocates
- * the mtd_info will probably want to use the release() hook...
+static void mtd_master_release(struct kref *ref)
+{
+	struct mtd_info *master = container_of(ref, struct mtd_info,
+					     master.life_refcnt);
+
+	master->master.release(master);
+}
+
+void mtd_get_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_get(&master->master.life_refcnt);
+}
+
+void mtd_put_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_put(&master->master.life_refcnt, mtd_master_release);
+}
+
+/**
+ * mtd_set_release - initialize the lifetime of a dynamically allocated master
+ * @master: master MTD device
+ * @release: core callback freeing the backing object and retained metadata
+ *
+ * Call once before registration. The driver owns the initial reference and
+ * drops it with mtd_put_master() after unregistering and disconnecting hardware.
+ * Registered MTD devices and acquired handles retain the backing object too.
+ * Driver cleanup must finish before the initial reference is dropped. The
+ * release callback only frees data and belongs to the core providing the MTD
+ * operations, identified by master->owner, not to the controller driver.
  */
-static void mtd_release(struct device *dev)
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd))
 {
-	struct mtd_info *mtd = dev_get_drvdata(dev);
-	dev_t index = MTD_DEVT(mtd->index);
+	kref_init(&master->master.life_refcnt);
+	master->master.release = release;
+}
+EXPORT_SYMBOL_GPL(mtd_set_release);
+
+/**
+ * mtd_put_master - drop the driver's initial lifetime reference
+ * @master: master initialized by mtd_set_release()
+ *
+ * Hardware access and driver callbacks must already be disconnected and
+ * drained. Unbind may return while handles retain core-owned metadata.
+ */
+void mtd_put_master(struct mtd_info *master)
+{
+	mtd_put_lifetime(master);
+}
+EXPORT_SYMBOL_GPL(mtd_put_master);
+
+static void mtd_data_release(struct kref *ref)
+{
+	struct mtd_info *mtd = container_of(ref, struct mtd_info, data_refcnt);
+	struct mtd_info *master = mtd->ref_master;
+	struct mtd_info *parent = mtd->parent;
+	struct device *dev = mtd->dev;
 
-	idr_remove(&mtd_idr, mtd->index);
 	of_node_put(mtd_get_of_node(mtd));
+	mtd->dev = NULL;
+	mtd->ref_master = NULL;
 
 	if (mtd_is_partition(mtd))
 		release_mtd_partition(mtd);
 
-	/* remove /dev/mtdXro node */
-	device_destroy(&mtd_class, index + 1);
+	if (master) {
+		if (parent && parent != master)
+			mtd_put_data(parent);
+		mtd_put_lifetime(master);
+	}
+	put_device(dev);
+	module_put(THIS_MODULE);
 }
 
-/*
- * No-op device release used in add_mtd_device() error paths.
- * Prevents mtd_release() from being called via device_release(),
- * which would free the mtd_info that the caller still manages.
- */
-static void mtd_dev_release_nop(struct device *dev)
+void mtd_get_data(struct mtd_info *mtd)
 {
+	kref_get(&mtd->data_refcnt);
+}
+
+void mtd_put_data(struct mtd_info *mtd)
+{
+	kref_put(&mtd->data_refcnt, mtd_data_release);
+}
+
+static void mtd_device_detach(struct device *dev)
+{
+	/* A queued system-sleep callback may run after device_del(). */
+	guard(device)(dev);
+
+	dev_set_drvdata(dev, NULL);
+	dev->groups = NULL;
 }
 
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
-	bool is_partition = mtd_is_partition(mtd);
+
+	/* The table mutex is held by the registration or handle put path. */
+	idr_remove(&mtd_idr, mtd->index);
+	device_destroy(&mtd_class, MTD_DEVT(mtd->index) + 1);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
 	/* Try to remove the NVMEM provider */
 	nvmem_unregister(mtd->nvmem);
 
-	device_unregister(&mtd->dev);
-
-	/*
-	 *  Clear dev so mtd can be safely re-registered later if desired.
-	 *  Should not be done for partition,
-	 *  as it was already destroyed in device_unregister().
-	 */
-	if (!is_partition)
-		memset(&mtd->dev, 0, sizeof(mtd->dev));
-
-	module_put(THIS_MODULE);
+	device_del(mtd->dev);
+	mtd_device_detach(mtd->dev);
+	mtd_put_data(mtd);
 }
 
 #define MTD_DEVICE_ATTR_RO(name) \
@@ -371,12 +414,6 @@ static struct attribute *mtd_attrs[] = {
 };
 ATTRIBUTE_GROUPS(mtd);
 
-static const struct device_type mtd_devtype = {
-	.name		= "mtd",
-	.groups		= mtd_groups,
-	.release	= mtd_release,
-};
-
 static bool mtd_expert_analysis_mode;
 
 #ifdef CONFIG_DEBUG_FS
@@ -434,7 +471,7 @@ DEFINE_SHOW_ATTRIBUTE(mtd_ooblayout_free);
 
 static void mtd_debugfs_populate(struct mtd_info *mtd)
 {
-	struct device *dev = &mtd->dev;
+	struct device *dev = mtd->dev;
 	struct mtd_oob_region region;
 
 	if (IS_ERR_OR_NULL(dfs_dir_mtd))
@@ -610,9 +647,9 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	struct nvmem_config config = {};
 
 	config.id = NVMEM_DEVID_NONE;
-	config.dev = &mtd->dev;
-	config.name = dev_name(&mtd->dev);
-	config.owner = THIS_MODULE;
+	config.dev = mtd->dev;
+	config.name = dev_name(mtd->dev);
+	config.owner = mtd_get_master(mtd)->owner;
 	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, "nvmem-cells");
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
@@ -629,7 +666,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
 			mtd->nvmem = NULL;
 		else
-			return dev_err_probe(&mtd->dev, PTR_ERR(mtd->nvmem),
+			return dev_err_probe(mtd->dev, PTR_ERR(mtd->nvmem),
 					     "Failed to register NVMEM device\n");
 	}
 
@@ -703,6 +740,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
+	struct device *dev;
 	int i, error, ofidx;
 
 	/*
@@ -710,7 +748,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	 * mtd_device_parse_register() multiple times on the same master MTD,
 	 * especially with CONFIG_MTD_PARTITIONED_MASTER=y.
 	 */
-	if (WARN_ONCE(mtd->dev.type, "MTD already registered\n"))
+	if (WARN_ONCE(mtd->dev, "MTD already registered\n"))
 		return -EEXIST;
 
 	BUG_ON(mtd->writesize == 0);
@@ -756,6 +794,13 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mtd->index = i;
 	kref_init(&mtd->refcnt);
+	kref_init(&mtd->data_refcnt);
+	if (master->master.release) {
+		mtd_get_lifetime(master);
+		mtd->ref_master = master;
+		if (mtd->parent && mtd->parent != master)
+			mtd_get_data(mtd->parent);
+	}
 
 	/* default value if not set by driver */
 	if (mtd->bitflip_threshold == 0)
@@ -793,18 +838,21 @@ int add_mtd_device(struct mtd_info *mtd)
 		error = 0;
 	}
 
-	/* Caller should have set dev.parent to match the
-	 * physical device, if appropriate.
-	 */
-	mtd->dev.type = &mtd_devtype;
-	mtd->dev.class = &mtd_class;
-	mtd->dev.devt = MTD_DEVT(i);
-	error = dev_set_name(&mtd->dev, "mtd%d", i);
-	if (error)
-		goto fail_devname;
-	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_set_of_node(mtd, mtd_find_of_node(mtd));
-	error = device_register(&mtd->dev);
+	dev = mtd_class_device_alloc(mtd_get_of_node(mtd));
+	if (!dev) {
+		error = -ENOMEM;
+		goto fail_alloc;
+	}
+	mtd->dev = dev;
+	dev->parent = mtd->parent_dev;
+	dev->groups = mtd_groups;
+	dev->devt = MTD_DEVT(i);
+	dev_set_drvdata(dev, mtd);
+	error = dev_set_name(dev, "mtd%d", i);
+	if (error)
+		goto fail_added;
+	error = device_add(dev);
 	if (error)
 		goto fail_added;
 
@@ -815,10 +863,12 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mtd_debugfs_populate(mtd);
 
-	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
+	device_create(&mtd_class, mtd->parent_dev, MTD_DEVT(i) + 1, NULL,
 		      "mtd%dro", i);
 
 	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
+	__module_get(THIS_MODULE);
+	mtd->registered = true;
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
@@ -836,27 +886,24 @@ int add_mtd_device(struct mtd_info *mtd)
 		}
 	}
 
-	/* We _know_ we aren't being removed, because
-	   our caller is still holding us here. So none
-	   of this try_ nonsense, and no bitching about it
-	   either. :) */
-	__module_get(THIS_MODULE);
 	return 0;
 
 fail_nvmem_add:
-	device_del(&mtd->dev);
+	device_del(dev);
 fail_added:
-	/*
-	 * Clear type and set nop release to prevent mtd_release() ->
-	 * release_mtd_partition() -> free_partition() from freeing mtd.
-	 * The caller handles cleanup on failure.
-	 */
-	mtd->dev.type = NULL;
-	mtd->dev.release = mtd_dev_release_nop;
-	put_device(&mtd->dev);
+	mtd_device_detach(dev);
+	put_device(dev);
+	mtd->dev = NULL;
+fail_alloc:
 	of_node_put(mtd_get_of_node(mtd));
-fail_devname:
+	mtd_set_of_node(mtd, np);
 	idr_remove(&mtd_idr, i);
+	if (mtd->ref_master) {
+		mtd->ref_master = NULL;
+		if (mtd->parent && mtd->parent != master)
+			mtd_put_data(mtd->parent);
+		mtd_put_lifetime(master);
+	}
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
 	return error;
@@ -879,7 +926,7 @@ int del_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	if (idr_find(&mtd_idr, mtd->index) != mtd) {
+	if (idr_find(&mtd_idr, mtd->index) != mtd || !mtd->registered) {
 		ret = -ENODEV;
 		goto out_error;
 	}
@@ -889,6 +936,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	list_for_each_entry(not, &mtd_notifiers, list)
 		not->remove(mtd);
 
+	mtd->registered = false;
 	kref_put(&mtd->refcnt, mtd_device_release);
 	ret = 0;
 
@@ -901,13 +949,13 @@ int del_mtd_device(struct mtd_info *mtd)
  * Set a few defaults based on the parent devices, if not provided by the
  * driver
  */
-static void mtd_set_dev_defaults(struct mtd_info *mtd)
+void mtd_set_dev_defaults(struct mtd_info *mtd)
 {
-	if (mtd->dev.parent) {
-		if (!mtd->owner && mtd->dev.parent->driver)
-			mtd->owner = mtd->dev.parent->driver->owner;
+	if (mtd->parent_dev) {
+		if (!mtd->master.release && !mtd->owner && mtd->parent_dev->driver)
+			mtd->owner = mtd->parent_dev->driver->owner;
 		if (!mtd->name)
-			mtd->name = dev_name(mtd->dev.parent);
+			mtd->name = dev_name(mtd->parent_dev);
 	} else {
 		pr_debug("mtd device won't show a device symlink in sysfs\n");
 	}
@@ -960,13 +1008,13 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	struct device_node *np;
 
 	/* DT binding is optional */
-	np = of_get_compatible_child(mtd->dev.of_node, compatible);
+	np = of_get_compatible_child(mtd_get_of_node(mtd), compatible);
 
 	/* OTP nvmem will be registered on the physical device */
-	config.dev = mtd->dev.parent;
+	config.dev = mtd->parent_dev;
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
-	config.owner = THIS_MODULE;
+	config.owner = mtd->owner;
 	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
@@ -1016,7 +1064,7 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 {
-	struct device *dev = mtd->dev.parent;
+	struct device *dev = mtd->parent_dev;
 	struct nvmem_device *nvmem;
 	ssize_t size;
 	int err;
@@ -1150,7 +1198,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		ret = 0;
 	else if (nr_parts)
 		ret = add_mtd_partitions(mtd, parts, nr_parts);
-	else if (!device_is_registered(&mtd->dev))
+	else if (!mtd->dev || !device_is_registered(mtd->dev))
 		ret = add_mtd_device(mtd);
 	else
 		ret = 0;
@@ -1184,7 +1232,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		nvmem_unregister(mtd->otp_factory_nvmem);
 	}
 
-	if (ret && device_is_registered(&mtd->dev)) {
+	if (ret && mtd->dev && device_is_registered(mtd->dev)) {
 		err = del_mtd_device(mtd);
 		if (err)
 			pr_err("Error when deleting MTD device (%d)\n", err);
@@ -1225,7 +1273,7 @@ int mtd_device_unregister(struct mtd_info *master)
 	if (err)
 		return err;
 
-	if (!device_is_registered(&master->dev))
+	if (!master->dev || !device_is_registered(master->dev))
 		return 0;
 
 	return del_mtd_device(master);
@@ -1328,7 +1376,6 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 }
 EXPORT_SYMBOL_GPL(get_mtd_device);
 
-
 /**
  * get_mtd_device_by_dev - acquire the MTD associated with a class device
  * @dev: referenced MTD class device
@@ -1342,7 +1389,7 @@ struct mtd_info *get_mtd_device_by_dev(struct device *dev)
 
 	guard(mutex)(&mtd_table_mutex);
 	mtd_for_each_device(mtd) {
-		if (&mtd->dev != dev)
+		if (mtd->dev != dev)
 			continue;
 		err = __get_mtd_device(mtd);
 		return err ? ERR_PTR(err) : mtd;
@@ -1355,8 +1402,12 @@ EXPORT_SYMBOL_GPL(get_mtd_device_by_dev);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
+	if (!mtd->registered)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
@@ -1369,13 +1420,14 @@ int __get_mtd_device(struct mtd_info *mtd)
 		return -ENODEV;
 	}
 
+	mtd_get_lifetime(master);
 	while (mtd) {
 		if (mtd != master)
 			kref_get(&mtd->refcnt);
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1460,8 +1512,10 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	/* master can be freed in _put_device */
 	struct module *owner = master->owner;
+	bool managed = master->master.release;
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1472,12 +1526,14 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
-	/* must be the last use of master */
+	/* Legacy _put_device() callbacks can free an unmanaged master. */
 	if (master->_put_device)
 		master->_put_device(master);
+	if (managed)
+		mtd_put_lifetime(master);
 
 	/* _put_device() runs code from @owner, so drop the module last */
 	module_put(owner);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index b014861a06a6..cf8f08d372a6 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -10,6 +10,11 @@ extern struct backing_dev_info *mtd_bdi;
 struct mtd_info *__mtd_next_device(int i);
 int __must_check add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
+void mtd_set_dev_defaults(struct mtd_info *mtd);
+void mtd_get_lifetime(struct mtd_info *master);
+void mtd_put_lifetime(struct mtd_info *master);
+void mtd_get_data(struct mtd_info *mtd);
+void mtd_put_data(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 void release_mtd_partition(struct mtd_info *mtd);
diff --git a/drivers/mtd/mtddevice.c b/drivers/mtd/mtddevice.c
new file mode 100644
index 000000000000..83ad70c0d202
--- /dev/null
+++ b/drivers/mtd/mtddevice.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/mtd/mtd.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#include "mtddevice.h"
+
+static int mtd_cls_suspend(struct device *dev)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return mtd ? mtd_suspend(mtd) : 0;
+}
+
+static int mtd_cls_resume(struct device *dev)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	if (mtd)
+		mtd_resume(mtd);
+	return 0;
+}
+static DEFINE_SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
+
+struct class mtd_class = {
+	.name = "mtd",
+	.pm = pm_sleep_ptr(&mtd_cls_pm_ops),
+};
+EXPORT_SYMBOL_GPL(mtd_class);
+
+static const struct device_type mtd_devtype = {
+	.name = "mtd",
+};
+
+/* Device references may outlive both the controller and the MTD module. */
+static void mtd_class_device_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(dev);
+}
+
+struct device *mtd_class_device_alloc(struct device_node *np)
+{
+	struct device *dev = kzalloc_obj(*dev);
+
+	if (!dev)
+		return NULL;
+
+	device_initialize(dev);
+	dev->release = mtd_class_device_release;
+	dev->type = &mtd_devtype;
+	dev->class = &mtd_class;
+	dev->of_node = of_node_get(np);
+	return dev;
+}
+EXPORT_SYMBOL_GPL(mtd_class_device_alloc);
diff --git a/drivers/mtd/mtddevice.h b/drivers/mtd/mtddevice.h
new file mode 100644
index 000000000000..429557dbaab1
--- /dev/null
+++ b/drivers/mtd/mtddevice.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __MTD_DEVICE_H
+#define __MTD_DEVICE_H
+
+struct device;
+struct device_node;
+struct class;
+
+extern struct class mtd_class;
+struct device *mtd_class_device_alloc(struct device_node *np);
+
+#endif
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c316cfe92c7e..eb7704a5d714 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -87,9 +87,9 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	 * parent conditional on that option. Note, this is a way to
 	 * distinguish between the parent and its partitions in sysfs.
 	 */
-	child->dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
-			    &parent->dev : parent->dev.parent;
-	child->dev.of_node = part->of_node;
+	child->parent_dev = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
+			    parent->dev : parent->parent_dev;
+	child->of_node = part->of_node;
 	child->parent = parent;
 	child->part.offset = part->offset;
 	INIT_LIST_HEAD(&child->partitions);
@@ -239,7 +239,7 @@ static const struct attribute *mtd_partition_attrs[] = {
 
 static int mtd_add_partition_attrs(struct mtd_info *new)
 {
-	int ret = sysfs_create_files(&new->dev.kobj, mtd_partition_attrs);
+	int ret = sysfs_create_files(&new->dev->kobj, mtd_partition_attrs);
 	if (ret)
 		printk(KERN_WARNING
 		       "mtd: failed to create partition attrs, err=%d\n", ret);
@@ -329,7 +329,7 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 			return err;
 	}
 
-	sysfs_remove_files(&mtd->dev.kobj, mtd_partition_attrs);
+	sysfs_remove_files(&mtd->dev->kobj, mtd_partition_attrs);
 
 	list_del_init(&mtd->part.node);
 	err = del_mtd_device(mtd);
@@ -613,10 +613,10 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	const char *fixed = "fixed-partitions";
 	int ret, err = 0;
 
-	dev = &master->dev;
+	dev = master->dev;
 	/* Use parent device (controller) if the top level MTD is not registered */
 	if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) && !mtd_is_partition(master))
-		dev = master->dev.parent;
+		dev = master->parent_dev;
 
 	np = mtd_get_of_node(master);
 	if (mtd_is_partition(master))
diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index 9cf3872e37ae..64776d434bf6 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -37,7 +37,7 @@ static int mtdpstore_block_isbad(struct mtdpstore_context *cxt, loff_t off)
 		return true;
 	ret = mtd_block_isbad(mtd, off);
 	if (ret < 0) {
-		dev_err(&mtd->dev, "mtd_block_isbad failed, aborting\n");
+		dev_err(mtd->dev, "mtd_block_isbad failed, aborting\n");
 		return ret;
 	} else if (ret > 0) {
 		set_bit(blknum, cxt->badmap);
@@ -63,7 +63,7 @@ static inline void mtdpstore_mark_used(struct mtdpstore_context *cxt,
 	struct mtd_info *mtd = cxt->mtd;
 	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
 
-	dev_dbg(&mtd->dev, "mark zone %llu used\n", zonenum);
+	dev_dbg(mtd->dev, "mark zone %llu used\n", zonenum);
 	set_bit(zonenum, cxt->usedmap);
 }
 
@@ -73,7 +73,7 @@ static inline void mtdpstore_mark_unused(struct mtdpstore_context *cxt,
 	struct mtd_info *mtd = cxt->mtd;
 	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
 
-	dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
+	dev_dbg(mtd->dev, "mark zone %llu unused\n", zonenum);
 	clear_bit(zonenum, cxt->usedmap);
 }
 
@@ -87,7 +87,7 @@ static inline void mtdpstore_block_mark_unused(struct mtdpstore_context *cxt,
 	off = ALIGN_DOWN(off, mtd->erasesize);
 	zonenum = div_u64(off, cxt->info.kmsg_size);
 	while (zonecnt > 0) {
-		dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
+		dev_dbg(mtd->dev, "mark zone %llu unused\n", zonenum);
 		clear_bit(zonenum, cxt->usedmap);
 		zonenum++;
 		zonecnt--;
@@ -142,7 +142,7 @@ static void mtdpstore_mark_removed(struct mtdpstore_context *cxt, loff_t off)
 	struct mtd_info *mtd = cxt->mtd;
 	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
 
-	dev_dbg(&mtd->dev, "mark zone %llu removed\n", zonenum);
+	dev_dbg(mtd->dev, "mark zone %llu removed\n", zonenum);
 	set_bit(zonenum, cxt->rmmap);
 }
 
@@ -187,14 +187,14 @@ static int mtdpstore_erase_do(struct mtdpstore_context *cxt, loff_t off)
 	int ret;
 
 	off = ALIGN_DOWN(off, cxt->mtd->erasesize);
-	dev_dbg(&mtd->dev, "try to erase off 0x%llx\n", off);
+	dev_dbg(mtd->dev, "try to erase off 0x%llx\n", off);
 	erase.len = cxt->mtd->erasesize;
 	erase.addr = off;
 	ret = mtd_erase(cxt->mtd, &erase);
 	if (!ret)
 		mtdpstore_block_clear_removed(cxt, off);
 	else
-		dev_err(&mtd->dev, "erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
+		dev_err(mtd->dev, "erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
 		       (unsigned long long)erase.addr,
 		       (unsigned long long)erase.len, cxt->info.device);
 	return ret;
@@ -266,8 +266,8 @@ static int mtdpstore_security(struct mtdpstore_context *cxt, loff_t off)
 	}
 
 	if (ret)
-		dev_err(&mtd->dev, "all blocks bad!\n");
-	dev_dbg(&mtd->dev, "end security\n");
+		dev_err(mtd->dev, "all blocks bad!\n");
+	dev_dbg(mtd->dev, "end security\n");
 	return ret;
 }
 
@@ -285,10 +285,10 @@ static ssize_t mtdpstore_write(const char *buf, size_t size, loff_t off)
 	if (mtdpstore_is_used(cxt, off))
 		return -ENOMSG;
 
-	dev_dbg(&mtd->dev, "try to write off 0x%llx size %zu\n", off, size);
+	dev_dbg(mtd->dev, "try to write off 0x%llx size %zu\n", off, size);
 	ret = mtd_write(cxt->mtd, off, size, &retlen, (u_char *)buf);
 	if (ret < 0 || retlen != size) {
-		dev_err(&mtd->dev, "write failure at %lld (%zu of %zu written), err %d\n",
+		dev_err(mtd->dev, "write failure at %lld (%zu of %zu written), err %d\n",
 				off, retlen, size, ret);
 		return -EIO;
 	}
@@ -317,14 +317,14 @@ static ssize_t mtdpstore_read(char *buf, size_t size, loff_t off)
 	if (mtdpstore_block_isbad(cxt, off))
 		return -ENOMSG;
 
-	dev_dbg(&mtd->dev, "try to read off 0x%llx size %zu\n", off, size);
+	dev_dbg(mtd->dev, "try to read off 0x%llx size %zu\n", off, size);
 	for (done = 0, retlen = 0; done < size; done += retlen) {
 		retlen = 0;
 
 		ret = mtd_read(cxt->mtd, off + done, size - done, &retlen,
 				(u_char *)buf + done);
 		if (mtdpstore_is_io_error(ret)) {
-			dev_err(&mtd->dev, "read failure at %lld (%zu of %zu read), err %d\n",
+			dev_err(mtd->dev, "read failure at %lld (%zu of %zu read), err %d\n",
 					off + done, retlen, size - done, ret);
 			/* the zone may be broken, try next one */
 			return -ENOMSG;
@@ -337,7 +337,7 @@ static ssize_t mtdpstore_read(char *buf, size_t size, loff_t off)
 		 * valid or not.
 		 */
 		if (mtd_is_eccerr(ret)) {
-			dev_err(&mtd->dev, "ecc error at %lld (%zu of %zu read), err %d\n",
+			dev_err(mtd->dev, "ecc error at %lld (%zu of %zu read), err %d\n",
 					off + done, retlen, size - done, ret);
 			/* driver may not set retlen when ecc error */
 			retlen = retlen == 0 ? size - done : retlen;
@@ -369,7 +369,7 @@ static ssize_t mtdpstore_panic_write(const char *buf, size_t size, loff_t off)
 
 	ret = mtd_panic_write(cxt->mtd, off, size, &retlen, (u_char *)buf);
 	if (ret < 0 || size != retlen) {
-		dev_err(&mtd->dev, "panic write failure at %lld (%zu of %zu read), err %d\n",
+		dev_err(mtd->dev, "panic write failure at %lld (%zu of %zu read), err %d\n",
 				off, retlen, size, ret);
 		return -EIO;
 	}
@@ -391,10 +391,10 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	if (mtd->index != cxt->index || cxt->index < 0)
 		return;
 
-	dev_dbg(&mtd->dev, "found matching MTD device %s\n", mtd->name);
+	dev_dbg(mtd->dev, "found matching MTD device %s\n", mtd->name);
 
 	if (mtd->size < info->kmsg_size * 2) {
-		dev_err(&mtd->dev, "MTD partition %d not big enough\n",
+		dev_err(mtd->dev, "MTD partition %d not big enough\n",
 				mtd->index);
 		return;
 	}
@@ -405,23 +405,23 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	 * is designed on it.
 	 */
 	if (mtd->erasesize < info->kmsg_size) {
-		dev_err(&mtd->dev, "eraseblock size of MTD partition %d too small\n",
+		dev_err(mtd->dev, "eraseblock size of MTD partition %d too small\n",
 				mtd->index);
 		return;
 	}
 	if (unlikely(info->kmsg_size % mtd->writesize)) {
-		dev_err(&mtd->dev, "record size %lu KB must align to write size %d KB\n",
+		dev_err(mtd->dev, "record size %lu KB must align to write size %d KB\n",
 				info->kmsg_size / 1024,
 				mtd->writesize / 1024);
 		return;
 	}
 
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, info->kmsg_size));
-	cxt->rmmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
-	cxt->usedmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
+	cxt->rmmap = devm_kcalloc(mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
+	cxt->usedmap = devm_kcalloc(mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
 
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
-	cxt->badmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
+	cxt->badmap = devm_kcalloc(mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
 
 	if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap)
 		return;
@@ -436,12 +436,12 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 
 	ret = register_pstore_device(&cxt->dev);
 	if (ret) {
-		dev_err(&mtd->dev, "mtd%d register to psblk failed\n",
+		dev_err(mtd->dev, "mtd%d register to psblk failed\n",
 				mtd->index);
 		return;
 	}
 	cxt->mtd = mtd;
-	dev_info(&mtd->dev, "Attached to MTD device %d\n", mtd->index);
+	dev_info(mtd->dev, "Attached to MTD device %d\n", mtd->index);
 }
 
 static int mtdpstore_flush_removed_do(struct mtdpstore_context *cxt,
@@ -477,7 +477,7 @@ static int mtdpstore_flush_removed_do(struct mtdpstore_context *cxt,
 		if (mtdpstore_is_used(cxt, off)) {
 			ret = mtd_write(mtd, off, zonesize, &retlen, buf);
 			if (ret)
-				dev_err(&mtd->dev, "write failure at %lld (%zu of %u written), err %d\n",
+				dev_err(mtd->dev, "write failure at %lld (%zu of %u written), err %d\n",
 						off, retlen, zonesize, ret);
 		}
 
diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 6ccdff3fc913..cd507a68aec5 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -664,7 +664,6 @@ static struct nand_ecc_engine *nand_ecc_match_on_host_hw_engine(struct device *d
 struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand)
 {
 	struct nand_ecc_engine *engine = NULL;
-	struct device *dev = &nand->mtd.dev;
 	struct platform_device *pdev;
 	struct device_node *np;
 
@@ -672,7 +671,7 @@ struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand)
 		return NULL;
 
 	/* Check for an explicit nand-ecc-engine property */
-	np = of_parse_phandle(dev->of_node, "nand-ecc-engine", 0);
+	np = of_parse_phandle(mtd_get_of_node(&nand->mtd), "nand-ecc-engine", 0);
 	if (np) {
 		pdev = of_find_device_by_node(np);
 		if (!pdev)
diff --git a/drivers/mtd/nand/onenand/generic.c b/drivers/mtd/nand/onenand/generic.c
index 3191904ced14..8f82b86b8b83 100644
--- a/drivers/mtd/nand/onenand/generic.c
+++ b/drivers/mtd/nand/onenand/generic.c
@@ -60,7 +60,7 @@ static int generic_onenand_probe(struct platform_device *pdev)
 
 	info->onenand.irq = err;
 
-	info->mtd.dev.parent = &pdev->dev;
+	info->mtd.parent_dev = &pdev->dev;
 	info->mtd.priv = &info->onenand;
 
 	if (onenand_scan(&info->mtd, 1)) {
diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index 644498187d8f..5890e13a29d0 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -513,7 +513,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 
 	c->pdev = pdev;
 	c->mtd.priv = &c->onenand;
-	c->mtd.dev.parent = dev;
+	c->mtd.parent_dev = dev;
 	mtd_set_of_node(&c->mtd, dev->of_node);
 
 	dev_info(dev, "initializing on CS%d (0x%08lx), va %p, %s mode\n",
diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index b7b7758ce4d8..a9f465f281b3 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -859,7 +859,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 	onenand->pdev = pdev;
 	onenand->type = platform_get_device_id(pdev)->driver_data;
 
diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..1afeb38145cd 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -196,7 +196,7 @@ static int gpio_nand_setup_interface(struct nand_chip *this, int csline,
 {
 	struct gpio_nand *priv = nand_get_controller_data(this);
 	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
-	struct device *dev = &nand_to_mtd(this)->dev;
+	struct device *dev = nand_to_mtd(this)->parent_dev;
 
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
@@ -258,7 +258,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	this = &priv->nand_chip;
 
 	mtd = nand_to_mtd(this);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	nand_set_controller_data(this, priv);
 	nand_set_flash_node(this, pdev->dev.of_node);
diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 865754737f5f..839aef6c460b 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1315,7 +1315,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 
 	chip = &anand->chip;
 	mtd = nand_to_mtd(chip);
-	mtd->dev.parent = nfc->dev;
+	mtd->parent_dev = nfc->dev;
 	chip->controller = &nfc->controller;
 	chip->options = NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
 			NAND_USES_DMA;
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 9a724de67624..0c79d30b9e30 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1575,7 +1575,7 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 	struct nand_chip *chip = &nand->base;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	mtd->dev.parent = nc->dev;
+	mtd->parent_dev = nc->dev;
 	nand->base.controller = &nc->base;
 
 	if (!nc->mck || !nc->caps->ops->setup_interface)
diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 6796afe9cd29..01c2c8b191eb 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -291,7 +291,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 
 	this = &ctx->chip;
 	mtd = nand_to_mtd(this);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	/* figure out which CS# r->start belongs to */
 	cs = find_nand_cs(r->start);
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4d4e185c22e5..4cccf00f67f7 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -32,7 +32,7 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
 
 	if (b47n->cc->core->bus->chipinfo.id == BCMA_CHIP_ID_BCM4706) {
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 4a1f5e736a1c..0378014da6d2 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3097,7 +3097,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 		return -ENOMEM;
 
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 	chip->ecc.read_page = brcmnand_read_page;
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index d53b35a8b3cb..05d0659e6527 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3048,7 +3048,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	nand_set_flash_node(chip, np);
 
 	mtd = nand_to_mtd(chip);
-	mtd->dev.parent = cdns_ctrl->dev;
+	mtd->parent_dev = cdns_ctrl->dev;
 
 	/*
 	 * Default to HW ECC engine mode. If the nand-ecc-mode property is given
diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f3117b031cd2..e936c9807bf8 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -685,7 +685,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	}
 
 	mtd = nand_to_mtd(&cafe->nand);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 	nand_set_controller_data(&cafe->nand, cafe);
 
 	cafe->pdev = pdev;
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3986553881d0..17c6fa73f4c3 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -958,7 +958,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->aemif		= dev_get_drvdata(pdev->dev.parent);
 
 	mtd			= nand_to_mtd(&info->chip);
-	mtd->dev.parent		= &pdev->dev;
+	mtd->parent_dev		= &pdev->dev;
 	nand_set_flash_node(&info->chip, pdev->dev.of_node);
 
 	/* options such as NAND_BBT_USE_FLASH */
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index fa2439cb4daa..9c07e4e25a27 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1216,7 +1216,7 @@ int denali_chip_init(struct denali_controller *denali,
 		}
 	}
 
-	mtd->dev.parent = denali->dev;
+	mtd->parent_dev = denali->dev;
 
 	/*
 	 * Fallback to the default name if DT did not give "label" property.
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index c655d27bc4cc..6216ffea4324 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -687,7 +687,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
 
 	/* Fill in fsl_elbc_mtd structure */
-	mtd->dev.parent = priv->dev;
+	mtd->parent_dev = priv->dev;
 	nand_set_flash_node(chip, priv->dev->of_node);
 
 	/* set timeout to maximum */
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index cc75b6a67e07..20ae012adbaa 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -868,7 +868,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	int ret;
 
 	/* Fill in fsl_ifc_mtd structure */
-	mtd->dev.parent = priv->dev;
+	mtd->parent_dev = priv->dev;
 
 	struct device_node *np __free(device_node) =
 		of_get_next_child_with_prefix(priv->dev->of_node, NULL, "nand");
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..28335dedb987 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -50,7 +50,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->chip.ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
 	fun->chip.ecc.algo = NAND_ECC_ALGO_HAMMING;
 	fun->chip.controller = &fun->base;
-	mtd->dev.parent = fun->dev;
+	mtd->parent_dev = fun->dev;
 
 	flash_np = of_get_next_child(upm_np, NULL);
 	if (!flash_np)
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..3cd25395d791 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1102,7 +1102,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(&host->nand);
 	nand_set_flash_node(nand, pdev->dev.of_node);
 
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	nand->badblockbits = 7;
 
diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..d17fb2244923 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -353,7 +353,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->controller	= &gpiomtd->base;
 
 	mtd			= nand_to_mtd(chip);
-	mtd->dev.parent		= dev;
+	mtd->parent_dev		= dev;
 
 	platform_set_drvdata(pdev, gpiomtd);
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..4822485bd512 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2714,7 +2714,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 
 	/* init the MTD data structures */
 	mtd->name		= "gpmi-nand";
-	mtd->dev.parent		= this->dev;
+	mtd->parent_dev		= this->dev;
 
 	/* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
 	nand_set_controller_data(chip, this);
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..ccc21d21c3e0 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -762,7 +762,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(host->mmio);
 
 	mtd->name		= "hisi_nand";
-	mtd->dev.parent         = &pdev->dev;
+	mtd->parent_dev         = &pdev->dev;
 
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, np);
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index f1e2c82936b3..bdda06ae0d72 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -394,7 +394,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 				   cs->bank);
 	if (!mtd->name)
 		return -ENOMEM;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 97c82e9c1af2..d8071180cc0d 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -677,7 +677,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 		goto err_cleanup_dma;
 	}
 
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	ebu_host->dev = dev;
 
 	platform_set_drvdata(pdev, ebu_host);
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..741e19f351d1 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -862,7 +862,7 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->controller = &host->controller;
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..408b2aba2fdd 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -328,7 +328,7 @@ static int lpc32xx_waitfunc_nand(struct nand_chip *chip)
 
 	while (!(readb(MLC_ISR(host->io_base)) & MLCISR_NAND_READY)) {
 		/* Seems to be delayed sometimes by controller */
-		dev_dbg(&mtd->dev, "Warning: NAND not ready.\n");
+		dev_dbg(mtd->dev, "Warning: NAND not ready.\n");
 		cpu_relax();
 	}
 
@@ -348,7 +348,7 @@ static int lpc32xx_waitfunc_controller(struct nand_chip *chip)
 
 	while (!(readb(MLC_ISR(host->io_base)) &
 		 MLCISR_CONTROLLER_READY)) {
-		dev_dbg(&mtd->dev, "Warning: Controller not ready.\n");
+		dev_dbg(mtd->dev, "Warning: Controller not ready.\n");
 		cpu_relax();
 	}
 
@@ -402,13 +402,13 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 	res = dma_map_sg(host->dma_chan->device->dev, &host->sgl, 1,
 			 DMA_BIDIRECTIONAL);
 	if (res != 1) {
-		dev_err(mtd->dev.parent, "Failed to map sg list\n");
+		dev_err(mtd->parent_dev, "Failed to map sg list\n");
 		return -ENXIO;
 	}
 	desc = dmaengine_prep_slave_sg(host->dma_chan, &host->sgl, 1, dir,
 				       flags);
 	if (!desc) {
-		dev_err(mtd->dev.parent, "Failed to prepare slave sg\n");
+		dev_err(mtd->parent_dev, "Failed to prepare slave sg\n");
 		res = -ENXIO;
 		goto out1;
 	}
@@ -472,7 +472,7 @@ static int lpc32xx_read_page(struct nand_chip *chip, uint8_t *buf,
 		mlc_isr = readl(MLC_ISR(host->io_base));
 		if (mlc_isr & MLCISR_DECODER_FAILURE) {
 			mtd->ecc_stats.failed++;
-			dev_warn(&mtd->dev, "%s: DECODER_FAILURE\n", __func__);
+			dev_warn(mtd->dev, "%s: DECODER_FAILURE\n", __func__);
 		} else if (mlc_isr & MLCISR_ERRORS_DETECTED) {
 			mtd->ecc_stats.corrected += ((mlc_isr >> 4) & 0x3) + 1;
 		}
@@ -579,9 +579,9 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 {
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
 
-	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
+	host->dma_chan = dma_request_chan(mtd->parent_dev, "rx-tx");
 	if (IS_ERR(host->dma_chan)) {
-		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+		dev_err(mtd->parent_dev, "Failed to request DMA channel\n");
 		return PTR_ERR(host->dma_chan);
 	}
 
@@ -600,7 +600,7 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 	host->dma_slave_config.src_addr = MLC_BUFF(host->io_base_phy);
 	host->dma_slave_config.dst_addr = MLC_BUFF(host->io_base_phy);
 	if (dmaengine_slave_config(host->dma_chan, &host->dma_slave_config)) {
-		dev_err(mtd->dev.parent, "Failed to setup DMA slave\n");
+		dev_err(mtd->parent_dev, "Failed to setup DMA slave\n");
 		goto out1;
 	}
 
@@ -724,7 +724,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	/* link the private data structures */
 	nand_set_controller_data(nand_chip, host);
 	nand_set_flash_node(nand_chip, pdev->dev.of_node);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	/* Get NAND clock */
 	host->clk = clk_get(&pdev->dev, NULL);
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..f75ae484ce86 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -440,7 +440,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 	/* DMA controller does flow control: */
 	host->dma_slave_config.device_fc = false;
 	if (dmaengine_slave_config(host->dma_chan, &host->dma_slave_config)) {
-		dev_err(mtd->dev.parent, "Failed to setup DMA slave\n");
+		dev_err(mtd->parent_dev, "Failed to setup DMA slave\n");
 		return -ENXIO;
 	}
 
@@ -449,13 +449,13 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 	res = dma_map_sg(host->dma_chan->device->dev, &host->sgl, 1,
 			 DMA_BIDIRECTIONAL);
 	if (res != 1) {
-		dev_err(mtd->dev.parent, "Failed to map sg list\n");
+		dev_err(mtd->parent_dev, "Failed to map sg list\n");
 		return -ENXIO;
 	}
 	desc = dmaengine_prep_slave_sg(host->dma_chan, &host->sgl, 1, dir,
 				       flags);
 	if (!desc) {
-		dev_err(mtd->dev.parent, "Failed to prepare slave sg\n");
+		dev_err(mtd->parent_dev, "Failed to prepare slave sg\n");
 		goto out1;
 	}
 
@@ -559,13 +559,13 @@ static int lpc32xx_xfer(struct mtd_info *mtd, uint8_t *buf, int eccsubpages,
 	 * safety reasons for now.
 	 */
 	if (readl(SLC_STAT(host->io_base)) & SLCSTAT_DMA_FIFO) {
-		dev_warn(mtd->dev.parent, "FIFO not empty!\n");
+		dev_warn(mtd->parent_dev, "FIFO not empty!\n");
 		timeout = jiffies + msecs_to_jiffies(LPC32XX_DMA_TIMEOUT);
 		while ((readl(SLC_STAT(host->io_base)) & SLCSTAT_DMA_FIFO) &&
 		       time_before(jiffies, timeout))
 			cpu_relax();
 		if (!time_before(jiffies, timeout)) {
-			dev_err(mtd->dev.parent, "FIFO held data too long\n");
+			dev_err(mtd->parent_dev, "FIFO held data too long\n");
 			status = -EIO;
 		}
 	}
@@ -582,7 +582,7 @@ static int lpc32xx_xfer(struct mtd_info *mtd, uint8_t *buf, int eccsubpages,
 	if (readl(SLC_STAT(host->io_base)) & SLCSTAT_DMA_FIFO ||
 	    readl(SLC_TC(host->io_base))) {
 		/* Something is left in the FIFO, something is wrong */
-		dev_err(mtd->dev.parent, "DMA FIFO failure\n");
+		dev_err(mtd->parent_dev, "DMA FIFO failure\n");
 		status = -EIO;
 	}
 
@@ -726,9 +726,9 @@ static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
 {
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
 
-	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
+	host->dma_chan = dma_request_chan(mtd->parent_dev, "rx-tx");
 	if (IS_ERR(host->dma_chan)) {
-		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+		dev_err(mtd->parent_dev, "Failed to request DMA channel\n");
 		return PTR_ERR(host->dma_chan);
 	}
 
@@ -863,7 +863,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, pdev->dev.of_node);
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	/* Get NAND clock */
 	host->clk = devm_clk_get_enabled(&pdev->dev, NULL);
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c..56350209f7e0 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2723,7 +2723,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		chip->options |= NAND_KEEP_TIMINGS;
 
 	mtd = nand_to_mtd(chip);
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	/*
 	 * Save a reference value for timing registers before
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..2a554f62a25e 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1428,7 +1428,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	nand->options |= NAND_USES_DMA;
 	mtd = nand_to_mtd(nand);
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	ret = of_property_read_u32(np, "nand-rb", &nand_rb_val);
 	if (ret == -EINVAL)
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..0aeeb6327472 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -655,7 +655,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	nand_set_controller_data(chip, prv);
 	nand_set_flash_node(chip, dn);
 	prv->dev = dev;
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..a36a82d10aa7 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1296,7 +1296,7 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 static int mtk_nfc_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct device *dev = mtd->dev.parent;
+	struct device *dev = mtd->parent_dev;
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	int len;
@@ -1407,7 +1407,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	mtd = nand_to_mtd(nand);
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
 
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..f976cf3f7210 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1398,7 +1398,7 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
-	struct device *dev = mtd->dev.parent;
+	struct device *dev = mtd->parent_dev;
 
 	chip->ecc.bytes = host->devtype_data->eccbytes;
 	host->eccsize = host->devtype_data->eccsize;
@@ -1708,7 +1708,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	/* structures must be linked */
 	this = &host->nand;
 	mtd = nand_to_mtd(this);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 	mtd->name = DRIVER_NAME;
 
 	/* 50 us command delay time */
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..ce9fe27fb4ac 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -515,7 +515,7 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 
 	nand_chip = &nfc->chip;
 	mtd = nand_to_mtd(nand_chip);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	for_each_child_of_node(np, nand_np)
 		nand_set_flash_node(nand_chip, nand_np);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f125c529c62d..f6a054919c06 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5576,8 +5576,8 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	if (ret)
 		return ret;
 
-	if (!mtd->name && mtd->dev.parent)
-		mtd->name = dev_name(mtd->dev.parent);
+	if (!mtd->name && mtd->parent_dev)
+		mtd->name = dev_name(mtd->parent_dev);
 
 	/* Set the default functions */
 	nand_set_defaults(chip);
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 4fe7036ae992..7169c014d197 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -419,11 +419,11 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 
 out_otp:
 	if (ret)
-		dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
+		dev_err(mtd->dev, "failed to perform OTP IO: %i\n", ret);
 
 	ret = macronix_30lfxg18ac_otp_disable(nand);
 	if (ret)
-		dev_err(&mtd->dev, "failed to leave OTP mode after %s\n",
+		dev_err(mtd->dev, "failed to leave OTP mode after %s\n",
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index b5e304c35738..4bacc1c89c6b 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -87,7 +87,7 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 		s = ep->sections + i;
 		section_len = s->length * 16;
 		if (section_len > remaining) {
-			dev_dbg(&mtd->dev,
+			dev_dbg(mtd->dev,
 				"ONFI extended parameter section %d exceeds page\n",
 				i);
 			goto ext_out;
@@ -95,7 +95,7 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 
 		if (s->type == ONFI_SECTION_TYPE_2) {
 			if (section_len < sizeof(*ecc)) {
-				dev_dbg(&mtd->dev,
+				dev_dbg(mtd->dev,
 					"ONFI extended parameter ECC section %d is too short\n",
 					i);
 				goto ext_out;
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..ce10fc6a41aa 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -155,7 +155,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->ecc.strength = 1;
 	nand_set_controller_data(chip, ndfc);
 
-	mtd->dev.parent = &ndfc->ofdev->dev;
+	mtd->parent_dev = &ndfc->ofdev->dev;
 
 	flash_np = of_get_next_child(node, NULL);
 	if (!flash_np)
diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index f659d3a6b9ef..23db2f4fefbb 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -235,7 +235,7 @@ static int ma35_nand_hwecc_init(struct nand_chip *chip, struct ma35_nand_info *n
 {
 	struct ma35_nand_chip *nvtnand = to_ma35_nand(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct device *dev = mtd->dev.parent;
+	struct device *dev = mtd->parent_dev;
 	u32 reg;
 
 	nand->buffer = devm_kzalloc(dev, mtd->writesize, GFP_KERNEL);
@@ -736,7 +736,7 @@ static int ma35_nand_attach_chip(struct nand_chip *chip)
 {
 	struct ma35_nand_info *nand = nand_get_controller_data(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct device *dev = mtd->dev.parent;
+	struct device *dev = mtd->parent_dev;
 	u32 reg;
 
 	if (chip->options & NAND_BUSWIDTH_16) {
@@ -900,7 +900,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 
 	mtd = nand_to_mtd(chip);
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..aee7df4d768f 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2237,7 +2237,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	nand_chip		= &info->nand;
 	mtd			= nand_to_mtd(nand_chip);
-	mtd->dev.parent		= &pdev->dev;
+	mtd->parent_dev		= &pdev->dev;
 	nand_set_flash_node(nand_chip, dev->of_node);
 
 	if (!mtd->name) {
diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..6cec25425710 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -148,7 +148,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		board = dev_get_platdata(&pdev->dev);
 	}
 
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	nand_set_controller_data(nc, board);
 	nand_set_flash_node(nc, pdev->dev.of_node);
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..b497e84636c1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -129,7 +129,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	pasemi_nand_mtd = nand_to_mtd(chip);
 
 	/* Link the private data with the MTD structure */
-	pasemi_nand_mtd->dev.parent = dev;
+	pasemi_nand_mtd->parent_dev = dev;
 
 	chip->legacy.IO_ADDR_R = of_iomap(np, 0);
 	chip->legacy.IO_ADDR_W = chip->legacy.IO_ADDR_R;
diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 26b61d856143..537387014e2a 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1082,7 +1082,7 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	chip->bbt_options = NAND_BBT_USE_FLASH;
 	chip->controller = &nfc->controller;
 	mtd = nand_to_mtd(chip);
-	mtd->dev.parent = nfc->dev;
+	mtd->parent_dev = nfc->dev;
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL,
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..a2775886e7c4 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -88,7 +88,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
 	mtd = nand_to_mtd(&data->chip);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	data->chip.legacy.IO_ADDR_R = data->io_base;
 	data->chip.legacy.IO_ADDR_W = data->io_base;
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 978fa84f051d..c2ccb999ad8d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2031,7 +2031,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 		return -ENOMEM;
 
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	/*
 	 * the bad block marker is readable only when we read the last codeword
diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index bf1c1be7f2aa..566662d45c2c 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -589,7 +589,7 @@ static void r852_update_card_detect(struct r852_device *dev)
 static ssize_t media_type_show(struct device *sys_dev,
 			       struct device_attribute *attr, char *buf)
 {
-	struct mtd_info *mtd = container_of(sys_dev, struct mtd_info, dev);
+	struct mtd_info *mtd = dev_get_drvdata(sys_dev);
 	struct r852_device *dev = r852_get_dev(mtd);
 	char *data = dev->sm ? "smartmedia" : "xd";
 
@@ -635,7 +635,7 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 	WARN_ON(dev->card_registered);
 
-	mtd->dev.parent = &dev->pci_dev->dev;
+	mtd->parent_dev = &dev->pci_dev->dev;
 
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
@@ -645,7 +645,7 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (sm_register_device(mtd, dev->sm))
 		goto error1;
 
-	if (device_create_file(&mtd->dev, &dev_attr_media_type)) {
+	if (device_create_file(mtd->dev, &dev_attr_media_type)) {
 		message("can't create media type sysfs attribute");
 		goto error3;
 	}
@@ -672,7 +672,7 @@ static void r852_unregister_nand_device(struct r852_device *dev)
 	if (!dev->card_registered)
 		return;
 
-	device_remove_file(&mtd->dev, &dev_attr_media_type);
+	device_remove_file(mtd->dev, &dev_attr_media_type);
 	WARN_ON(mtd_device_unregister(mtd));
 	nand_cleanup(dev->chip);
 	r852_engine_disable(dev);
diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..135cdb67a472 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1254,7 +1254,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 
 	mtd = nand_to_mtd(chip);
-	mtd->dev.parent = rnandc->dev;
+	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
 		return -EINVAL;
diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..1e56e5e41f79 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1028,7 +1028,7 @@ static int rk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 static int rk_nfc_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct device *dev = mtd->dev.parent;
+	struct device *dev = mtd->parent_dev;
 	struct rk_nfc *nfc = nand_get_controller_data(chip);
 	struct rk_nfc_nand_chip *rknand = rk_nfc_to_rknand(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
@@ -1175,7 +1175,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
 	mtd = nand_to_mtd(chip);
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..36ba5b3da3a0 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1153,7 +1153,7 @@ static int flctl_probe(struct platform_device *pdev)
 	nand = &flctl->chip;
 	flctl_mtd = nand_to_mtd(nand);
 	nand_set_flash_node(nand, pdev->dev.of_node);
-	flctl_mtd->dev.parent = &pdev->dev;
+	flctl_mtd->parent_dev = &pdev->dev;
 	flctl->pdev = pdev;
 	flctl->hwecc = pdata->has_hwecc;
 	flctl->holden = pdata->use_holden;
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 4154ab74f169..5aea5afd480e 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -160,7 +160,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Link the private data with the MTD structure */
 	mtd = nand_to_mtd(this);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 	mtd_set_ooblayout(mtd, data->ecc_layout);
 
 	platform_set_drvdata(pdev, sharpsl);
diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..91d4394c1137 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -164,7 +164,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	nand_set_controller_data(nand_chip, host);
 	nand_set_flash_node(nand_chip, ofdev->dev.of_node);
 	mtd->name = "socrates_nand";
-	mtd->dev.parent = &ofdev->dev;
+	mtd->parent_dev = &ofdev->dev;
 
 	nand_chip->legacy.cmd_ctrl = socrates_nand_cmd_ctrl;
 	nand_chip->legacy.read_byte = socrates_nand_read_byte;
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..78af58d87960 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2011,7 +2011,7 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	nand = &nfc->nand;
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	chip->controller = &nfc->base;
 	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..4fcb7977de02 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2514,7 +2514,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	nand_set_flash_node(nand, np);
 
 	mtd = nand_to_mtd(nand);
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a3294aaf43bd..a4de53f954e5 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -160,7 +160,7 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 
 	nand_set_flash_node(&data->chip, to_of_node(child));
 	mtd = nand_to_mtd(&data->chip);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 	platform_set_drvdata(pdev, data);
 
 	/*
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 1104d75b6cbe..ef765fa21e72 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1115,7 +1115,7 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	mtd = nand_to_mtd(chip);
 
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	mtd->owner = THIS_MODULE;
 
 	nand_set_flash_node(chip, np_nand);
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..6fd6e530c38b 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -324,7 +324,7 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 			continue;
 		chip = &txx9_priv->chip;
 		mtd = nand_to_mtd(chip);
-		mtd->dev.parent = &dev->dev;
+		mtd->parent_dev = &dev->dev;
 
 		chip->legacy.read_byte = txx9ndfmc_read_byte;
 		chip->legacy.read_buf = txx9ndfmc_read_buf;
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..57da9eab940e 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -822,7 +822,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(chip);
 
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = nfc->dev;
+	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
 	irq = platform_get_irq(pdev, 0);
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..7fcefb24fc23 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -182,7 +182,7 @@ static int xway_nand_probe(struct platform_device *pdev)
 
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
 	mtd = nand_to_mtd(&data->chip);
-	mtd->dev.parent = &pdev->dev;
+	mtd->parent_dev = &pdev->dev;
 
 	data->chip.legacy.cmd_ctrl = xway_cmd_ctrl;
 	data->chip.legacy.dev_ready = xway_dev_ready;
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 86a8d759682b..ff86b619c003 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -2046,7 +2046,7 @@ static int spinand_probe(struct spi_mem *mem)
 	spinand_set_of_node(spinand, mem->spi->dev.of_node);
 	mutex_init(&spinand->lock);
 	mtd = spinand_to_mtd(spinand);
-	mtd->dev.parent = &mem->spi->dev;
+	mtd->parent_dev = &mem->spi->dev;
 
 	ret = spinand_init(spinand);
 	if (ret)
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 8607c2fdedcf..0c08cfdc85e3 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -165,7 +165,7 @@ static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
 
 out:
 	if (spinand_upd_cfg(spinand, ESMT_F50L1G41LB_CFG_OTP_LOCK, 0)) {
-		dev_warn(&spinand_to_mtd(spinand)->dev,
+		dev_warn(spinand_to_mtd(spinand)->dev,
 			 "Can not disable OTP mode\n");
 		ret = -EIO;
 	}
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 36f6cbbd7462..888b9cff46ab 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -195,7 +195,7 @@ static int mt29f2g01abagd_otp_is_locked(struct spinand_device *spinand)
 
 	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
 			    0)) {
-		dev_warn(&spinand_to_mtd(spinand)->dev,
+		dev_warn(spinand_to_mtd(spinand)->dev,
 			 "Can not disable OTP mode\n");
 		ret = -EIO;
 	}
@@ -279,7 +279,7 @@ static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
 
 out:
 	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK, 0)) {
-		dev_warn(&spinand_to_mtd(spinand)->dev,
+		dev_warn(spinand_to_mtd(spinand)->dev,
 			 "Can not disable OTP mode\n");
 		ret = -EIO;
 	}
diff --git a/drivers/mtd/nand/spi/otp.c b/drivers/mtd/nand/spi/otp.c
index ce41bca86ea9..168bbfdc5ad8 100644
--- a/drivers/mtd/nand/spi/otp.c
+++ b/drivers/mtd/nand/spi/otp.c
@@ -116,7 +116,7 @@ static int spinand_otp_rw(struct spinand_device *spinand, loff_t ofs,
 	*retlen = copied;
 
 	if (spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0)) {
-		dev_warn(&spinand_to_mtd(spinand)->dev,
+		dev_warn(spinand_to_mtd(spinand)->dev,
 			 "Can not disable OTP mode\n");
 		ret = -EIO;
 	}
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..0f1005b96ccf 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3579,7 +3579,7 @@ static int spi_nor_set_mtd_info(struct spi_nor *nor)
 	spi_nor_set_mtd_locking_ops(nor);
 	spi_nor_set_mtd_otp_ops(nor);
 
-	mtd->dev.parent = dev;
+	mtd->parent_dev = dev;
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
 	mtd->type = MTD_NORFLASH;
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 910e6b0ff5e7..d1468a9a8917 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -951,7 +951,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	ubi->dev.release = dev_release;
 	ubi->dev.class = &ubi_class;
 	ubi->dev.groups = ubi_dev_groups;
-	ubi->dev.parent = &mtd->dev;
+	ubi->dev.parent = mtd->dev;
 
 	ubi->mtd = mtd;
 	ubi->ubi_num = ubi_num;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 745655e0d462..7c95d2ee4615 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -225,6 +225,8 @@ struct mtd_part {
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
  * @unregistering: removal has started; protected by partitions_lock
+ * @life_refcnt: optional lifetime reference count for the backing object
+ * @release: core callback freeing data after its last lifetime reference
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -235,6 +237,8 @@ struct mtd_master {
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
 	bool unregistering;
+	struct kref life_refcnt;
+	void (*release)(struct mtd_info *mtd);
 };
 
 struct mtd_info {
@@ -380,8 +384,15 @@ struct mtd_info {
 	void *priv;
 
 	struct module *owner;
-	struct device dev;
+	struct device *dev;
+	struct device *parent_dev;
+	struct device_node *of_node;
 	struct kref refcnt;
+	struct kref data_refcnt;
+	/* Protected by mtd_table_mutex; false after del_mtd_device(). */
+	bool registered;
+	/* Lifetime reference held until the MTD metadata is released. */
+	struct mtd_info *ref_master;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
 	struct nvmem_device *otp_user_nvmem;
@@ -463,14 +474,14 @@ static inline void mtd_set_pairing_scheme(struct mtd_info *mtd,
 static inline void mtd_set_of_node(struct mtd_info *mtd,
 				   struct device_node *np)
 {
-	mtd->dev.of_node = np;
+	mtd->of_node = np;
 	if (!mtd->name)
 		of_property_read_string(np, "label", &mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
 {
-	return dev_of_node(&mtd->dev);
+	return mtd->of_node;
 }
 
 static inline u32 mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
@@ -683,6 +694,9 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
 #define mtd_device_register(master, parts, nr_parts)	\
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd));
+void mtd_put_master(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 struct mtd_info *get_mtd_device_by_dev(struct device *dev);
 extern int __get_mtd_device(struct mtd_info *mtd);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
