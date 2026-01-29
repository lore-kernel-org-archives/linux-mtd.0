Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A973D61011
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2V5Gf7MUly6Z5EFqwKLz0Y4RIKNdQ9LW7JVZ5oeqr50=; b=Rlwh5r2YQl7Xp2
	fcian5mvsz1pAiQiz5tA2qVWKkLxt1yEOhAdUR2Sc79+ijQcIMRfxkuEFv0F1G3dOLygFOOeDSzeJ
	i1EiOVDzAf7Ezmdht3tH0vOE3rYKeJ9FLSVDvTHX5LJYwC1MMH9P+++9skMadx3beLzeUcC1b7jnz
	G3L5ffB5y85ZPfYNhBDa4tEaOTTGmVjoRNCop72mcao3RaAPNbK4Jsm9XwO+pXUt/tiXzSDg51d/E
	tr1hfe68qODuF6LQYWMSbB8wJZF5d06m3Wjk5vbD7ooHILknCf1xXMuUR50dZT7UYcAGLPWAveWW3
	litubQ/27snd8BIlrMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqU-0000000053z-3cke;
	Thu, 29 Jan 2026 12:09:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqQ-0000000052y-2AOi
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 12:09:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0C251A2AFD;
	Thu, 29 Jan 2026 12:09:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5A2E606B6;
	Thu, 29 Jan 2026 12:09:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4481C119A868D;
	Thu, 29 Jan 2026 13:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769688586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YpcAJWUwlbU2/sLbRMg/jTIQ3TQpq0/bwe7+cDWQP/4=;
	b=oFjQr2AuD1U6/CzYUsZgJnjIDwuAx4w4zCzzvdikiCBUln/jaOFX/GN4avE4wqNd1Ni6CE
	X6WHGjVILiToiZBG2fL6xCTBV4qETA3o/Mj9hN3SKXHB5Y6tkmkk6CvWXrFIlOD1DkEMAt
	+OSR+QkcLOxEtVAC953ZWranvJoMZx/3mr6f8ZH9DAEU17bIy8SBE3I76FxfvsXW6n5PDO
	QZ5k8+dd26sytnKKji5pQ3M3J6h5FEK03K+SbJupKvcyeHcRcwRDkT6S3oVN5Ab154YyJQ
	VgGHjsirdulJK9BTT/z/NUJKCSjxFkhhF+GRwLMi9xKiB2VCzfuDr+m9WxWuvQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v15 0/3] mtd: Add support for stacked memories
Date: Thu, 29 Jan 2026 13:09:26 +0100
Message-Id: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPZNe2kC/x2MQQqAIBAAvxJ7bkGNkvpKdDDdag9pqEgQ/T3pO
 AMzDySKTAmm5oFIhRMHX0H2bQP2MH4nZFcFKKEGIdWIZ3ZYOGa0wVuTUemhs0JL2bsVanVF2vj
 +l/Pyvh9mXfhCYgAAAA==
X-Change-ID: 20260129-mtd-virt-concat-2763c07115db
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Michal Simek <monstr@monstr.eu>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_040955_051301_66AAA58B 
X-CRM114-Status: GOOD (  29.11  )
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

[TL;DR for v15: as agreed with Amit I'm sending a new iteration of his
patches to fix the build-time failure due to a module dependency
loop. Original cover follows.]

This patch series adds stacked support by enhancing the existing mtd-concat 
driver to be more generic.

As background, a few years ago, Bernhard Frauendienst initiated an effort 
[2] to achieve the same, which was later adapted by Miquel [1] to introduce 
stacked mode support. In this approach, partitions to be concatenated were 
specified using a DT property "part-concat" within the partitions 
definition, allowing two MTD devices to function as a single larger one in 
order to be able to define partitions across chip boundaries. However, the 
bindings were not accepted. As a result, the mtd-concat approach was 
dropped, and alternative DT bindings were introduced [3][4][5], describing 
the two flash devices as one. Corresponding SPI core changes to support 
these bindings were later added [6].

While integrating stacked mode support into SPI-NOR, Tudor provided 
additional feedback, leading to discussions about updating the existing 
DT bindings. To address this, I sent an RFC [7] to initiate discussions on 
adapting the DT bindings as suggested by Miquel in [1]. Following that, 
I am now submitting this patch series that updates the virtual concat DT
bindings and the driver referenced in [1], along with some minor mtdcore 
changes. 
Since I have taken ownership of this effort, I have included Bernhard and 
Miquel under the "Suggested-by" tag.

[1] https://lore.kernel.org/linux-mtd/20191127105522.31445-1-miquel.raynal@bootlin.com/
[2] https://lwn.net/ml/linux-kernel/20180907173515.19990-1-kernel@nospam.obeliks.de/
[3] https://github.com/torvalds/linux/commit/f89504300e94524d5d5846ff8b728592ac72cec4
[4] https://github.com/torvalds/linux/commit/eba5368503b4291db7819512600fa014ea17c5a8
[5] https://github.com/torvalds/linux/commit/e2edd1b64f1c79e8abda365149ed62a2a9a494b4
[6]https://github.com/torvalds/linux/commit/4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
[7] https://lore.kernel.org/all/20241026075347.580858-1-amit.kumar-mahapatra@amd.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
BRANCH: spi-nor/next

Changes in v15:
 - Make mtd_virt_concat built into the mtd module, not a separate
   module. This fixes the build failure [8] caused by the interdependency
   of virt_concat and mtdcore. Keep VIRT_CONCAT an optional feature though.
   [8] https://lore.kernel.org/all/874it99f9i.fsf@bootlin.com/
 - Remove 'default n' line from Kconfig
 - Link to v14: https://lore.kernel.org/linux-mtd/20250623105445.2394825-1-amit.kumar-mahapatra@amd.com/

Changes in v14:
 - Updated 1/3 to address review comments.
 - Updated 3/3 to add mtd_virt_concat_destroy() API that would remove a concat
   incase one of the mtd device, which is part of the concat, is removed.
 
Changes in v13:
 - Updated 1/3 to modify the Device Tree binding to support multiple concatenated devices.
 - Added Rob's "Suggested-by" tag in 1/3.
 - Updated 3/3 to define CONFIG_MTD_VIRT_CONCAT as a boolean and depended on CONFIG_MTD_PARTITIONED_MASTER.
 - Updated 3/3 to remove late_initcall and invoke the API directly from mtdcore instead.
 - Updated 3/3 to add support for concatenating more than two MTD partitions.
 - Updated 3/3 to add support for multiple sets of concatenated devices.

Changes in v12:
 - Add stacked mode support throught mtd-concat driver.

Changes in v11:
- Rebased patch series on top of latest for-next branch.
- Added a new patch(1/10) to replace spi->chip_select with
  spi_get_chipselect() call in tps6594-spi.c.
- Added a new patch(2/10) to replace spi->chip_select with
  spi_get_chipseletc() call in cs35l56_hda_spi.c.
- In spi.c initialized unused CS[] to 0xff and spi->cs_index_mask
  to 0x01 in all flows.
- Updated spi_dev_check() to compare the CS of old spi device with
  the new spi device CS.
- Updated cover letter description to add information regarding GPIO CS
  testing and added Stefen's Tested-by tag in 3/10 patch.

Changes in v10:
 - Rebased patch series on top of latest for-next branch and fixed
   merge conflicts.

Changes in v9:
- Updated 1/8 patch description to add an high-level overview of
  parallel(multi-cs) & stacked design.
- Initialized all unused CS to 0xFF.
- Moved CS check from spi_add_device() to __spi_add_device().
- Updated __spi_add_device() to check to make sure that multiple logical CS
  don't map to the same physical CS and same physical CS doesn't map to
  different logical CS.
- Updated 1/8, 5/8 & 7/8 to support arbitrary number of flash devices
  connected in parallel or stacked mode.
- Updated documentation for chip_select.
- Added a new spi-nor structure member nor->num_flash to keep track of the
  number of flashes connected.
- Added a new patch in the series 4/8 to move write_enable call just before
  spi_mem ops call in SPI-NOR.
- Added comments in SPI core & SPI-NOR.
- Rebased the patch series on top of the latest for-next branch.

Changes in v8:
- Updated __spi_add_device() and spi_set_cs() to fix spi driver failure
  with GPIO CS.
- Rebased the patch series on top of latest for-next branch and fixed
  merge conflicts.
- Updated cover letter description to add information regarding GPIO CS
  testing and request Stefan to provide his Tested-by tag for 1/7 patch.
- Updated 1/7 patch description.

Changes in v7:
- Updated spi_dev_check() to avoid failures for spi driver GPIO CS and
  moved the error message from __spi_add_device() to spi_dev_check().
- Resolved code indentation issue in spi_set_cs().
- In spi_set_cs() call spi_delay_exec( ) once if the controller supports
  multi cs with both the CS backed by GPIO.
- Updated __spi_validate()to add checks for both the GPIO CS.
- Replaced cs_index_mask bit mask with SPI_CS_CNT_MAX.
- Updated struct spi_controller to represent multi CS capability of the
  spi controller through a flag bit SPI_CONTROLLER_MULTI_CS instead of
  a boolen structure member "multi_cs_cap".
- Updated 1/7 patch description .

Changes in v6:
- Rebased on top of latest v6.3-rc1 and fixed merge conflicts in
  spi-mpc512x-psc.c, sfdp.c, spansion.c files and removed spi-omap-100k.c.
- Updated spi_dev_check( ) to reject new devices if any one of the
  chipselect is used by another device.

Changes in v5:
- Rebased the patches on top of v6.3-rc1 and fixed the merge conflicts.
- Fixed compilation warnings in spi-sh-msiof.c with shmobile_defconfig

Changes in v4:
- Fixed build error in spi-pl022.c file - reported by Mark.
- Fixed build error in spi-sn-f-ospi.c file.
- Added Reviewed-by: Serge Semin <fancer.lancer@gmail.com> tag.
- Added two more patches to replace spi->chip_select with API calls in
  mpc832x_rdb.c & cs35l41_hda_spi.c files.

Changes in v3:
- Rebased the patches on top of
  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
- Added a patch to convert spi_nor_otp_region_len(nor) &
  spi_nor_otp_n_regions(nor) macros into inline functions
- Added Reviewed-by & Acked-by tags

Changes in v2:
- Rebased the patches on top of v6.2-rc1
- Created separate patch to add get & set APIs for spi->chip_select &
  spi->cs_gpiod, and replaced all spi->chip_select and spi->cs_gpiod
  references with the API calls.
- Created separate patch to add get & set APIs for nor->params.

---
Amit Kumar Mahapatra (3):
      dt-bindings: mtd: Describe MTD partitions concatenation
      mtd: Move struct mtd_concat definition to header file
      mtd: Add driver for concatenating devices

 .../bindings/mtd/partitions/partition.yaml         |  20 ++
 drivers/mtd/Kconfig                                |   9 +
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/mtd_virt_concat.c                      | 363 +++++++++++++++++++++
 drivers/mtd/mtdconcat.c                            |  12 -
 drivers/mtd/mtdcore.c                              |  19 ++
 drivers/mtd/mtdpart.c                              |   6 +
 include/linux/mtd/concat.h                         |  63 +++-
 8 files changed, 480 insertions(+), 13 deletions(-)
---
base-commit: 5a74a464797585e09561e8e367b62c8b4c289ba1
change-id: 20260129-mtd-virt-concat-2763c07115db

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
