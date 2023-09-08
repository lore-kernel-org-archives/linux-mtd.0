Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17457EE57F3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Typ7Yv59GIjtgm4bT4Qk5Z925K4Ki1zi0JsSG+ure2M=; b=0PCznh1HQTWuWj
	aj1+pAS7C28CJh2DXRHWKvk1Kd5wMVo6gVCfbvmo3TzDknk/Xf3LbDHPxXYONRauJ/G5aJF6i83K6
	IE4Htq24jhOk066RPlLdfzpis4uR7FGzmnwlAGC6fztqWrHq1Ztb9dZJDtIvk3Q4ptFoL2kzt0yFU
	hLKIhe5K8szt9da/FTvLWdz3efjfuShpq7S/5R7aUX185uK80g/g45Q0Ab3boEK9oM2wkdg3uX6oC
	d83M1YdmAvYdAwF5cC7nuCQOvL2PHbdNPe/KwrD14f9wKq1VR0PPTGIQXmtnPZbdmnbjArLOEArWr
	xxK2VpD07EiNeqov7gtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXW-00DSot-1h;
	Fri, 08 Sep 2023 10:16:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXR-00DSly-1X
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 449A5CE1B70;
	Fri,  8 Sep 2023 10:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96CFC433C7;
	Fri,  8 Sep 2023 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168188;
	bh=S/q4smJJ7/INJBrXh4MRxKgr/QAJ7megxoPk+A6O628=;
	h=From:Subject:Date:To:Cc:From;
	b=tDy1edtog4fiOy7637bCFNdRpelP9vqCOOqd/Dap8xJiXPQVnJfidYOKtHyU8fFIY
	 24Eum4QllGvr3BxbNeB5QOqTSRb6f+zETAeDMoF3AZog0YZnn9CgLEqfXl8cG7Ykfe
	 l9DBwzP05anaz/W0brsrXqsibIHGlczSy/gSdMQjY6kjpXyeJuBfnNTvYRUZ+WgNxa
	 De3Wvtk+TEtgU3J8SS78ri4d7fsNMI81yzwUEFwz2rK0QVzwIf53eWRk7iy2JWzSiS
	 twZpOSB8ThCMPEx7xqLb5uQahjltovgtFa0tDX2HTEvsbwnnfRKfOGLLecFAdORXRv
	 isRkWPVhv3omQ==
From: Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 00/41] mtd: spi-nor: clean the flash_info database up
Date: Fri, 08 Sep 2023 12:16:18 +0200
Message-Id: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHL0+mQC/42OQQ6CMBBFr0K6dkxpQcGV9zAuWjqFBmzNlKCGc
 HcLOxcmLN/k/zd/ZhHJYWSXbGaEk4su+ATykLGmU75FcCYxE1xIXvEzPEYDdlCxA+dtAKOB8BW
 oh0qVwpy45SnJUl2riKBJ+aZbBf96a/RJaN17W3G7J+5cHAN9tlFTvl53/J9y4CCNNKVGW2hVX
 Hskj8MxUMtW6yT2mkQyiTpX3MraVqb6MS3L8gXU6GC5NgEAAA==
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031633_873456_7B1D78D1 
X-CRM114-Status: GOOD (  20.75  )
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

The goal is to have slim entries for *new* entries and to have a
flexible macro to specify the flash ID and get rid of the former
INFOx() macros with the hardcoded ID length.

Here is are some examples how an entry of flash_info will look like
after the conversion:
  {
    .id = SNOR_ID(0xef, 0x80, 0x20),
    .name = "w25q512nwm",
    .otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
  }

  {
    .id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x80),
    .name = "s25fl256s0",
    .size = SZ_32M,
    .sector_size = SZ_256K,
    .no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
    .mfr_flags = USE_CLSR,
  }

Please note that the second entry might even be slimmed down if the
flash supports SFDP, which is very likely. But apart from one
exception, this patchset shouldn't change any information in the
flash_info database.

The exception is the removal of very old SPI EEPROMs and a Fujitsu MRAM.
Both should use the at25 EEPROM driver. The latter even has device tree
bindings for the at25 driver.

To make the entries as slim as possible, we introduce sane default
values so the actual flash_info entries, doesn't need to specify them.
This mostly applies to old non-SFDP flashes anyway.

Patches 01-02 remove the old catalyst EEPROMs and the Fujitsu MRAM.

Patches 03-16 are preparation patches to either convert properties
(like .n_sectors) or to make properties optional. These patches will
also modify the old INFOx() macros. This is important because with this
we can actually make sure, the conversion doesn't have any unwanted
changes. We can compare the .rodata segment before and after the
conversion to make sure, there are no mistakes in the patches, because
they are impossible to review.

To make sure there are no changes you can compare the output of
  objdump -j.rodata -s drivers/mtd/spi-nor/built-in.a

(or individual objects like drivers/mtd/spi-nor/winbond.o) before and
after the conversion, that is before patch 17 and after patch 30.

FWIW, before the conversion it was impossible to use coccinelle, eg.
"spatch --parse-c winbond.c" flagged almost all lines in the flash_info
structure as bad.

Now after the conversion is completed, patches 31-39 sort the
entries by their IDs.

Patch 40 removes a duplicate entry in atmel which surfaced during the
sorting.

Patch 41 then finally removes the old INFOx() macros.

Tested with the following flashes:
 - w25q32dw/layerscape spi
 - w25q32dw (with empty size and empty no_sfdp_flags)/layerscape spi
 - w25q16dw/mediatek spi

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Changes in v3:
- rebase to latest next
- collected tags
- fixed parse_sfdp logic
- also see individual patches for changes
- Link to v2: https://lore.kernel.org/r/20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org

Changes in v1:
- rebase to latest next, esp. include the sst26vf032b changes
- fixed the makefiles found by the kernel test robot
- fixed small typos and nitpicks noticed by Miquel
- collected Rb tags
- Link to v1: https://lore.kernel.org/r/20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org

---
Michael Walle (41):
      mtd: spi-nor: remove catalyst 'flashes'
      mtd: spi-nor: remove Fujitsu MB85RS1MT support
      mtd: spi-nor: xilinx: use SPI_NOR_ID() in S3AN_INFO()
      mtd: spi-nor: xilinx: remove addr_nbytes from S3AN_INFO()
      mtd: spi-nor: convert .n_sectors to .size
      mtd: spi-nor: default page_size to 256 bytes
      mtd: spi-nor: store .n_banks in struct spi_nor_flash_parameter
      mtd: spi-nor: default .n_banks to 1
      mtd: spi-nor: push 4k SE handling into spi_nor_select_uniform_erase()
      mtd: spi-nor: make sector_size optional
      mtd: spi-nor: drop .parse_sfdp
      mtd: spi-nor: introduce (temporary) INFO0()
      mtd: spi-nor: move the .id and .id_len into an own structure
      mtd: spi-nor: rename .otp_org to .otp and make it a pointer
      mtd: spi-nor: add SNOR_ID() and SNOR_OTP()
      mtd: spi-nor: remove or move flash_info comments
      mtd: spi-nor: atmel: convert flash_info to new format
      mtd: spi-nor: eon: convert flash_info to new format
      mtd: spi-nor: esmt: convert flash_info to new format
      mtd: spi-nor: everspin: convert flash_info to new format
      mtd: spi-nor: gigadevice: convert flash_info to new format
      mtd: spi-nor: intel: convert flash_info to new format
      mtd: spi-nor: issi: convert flash_info to new format
      mtd: spi-nor: macronix: convert flash_info to new format
      mtd: spi-nor: micron-st: convert flash_info to new format
      mtd: spi-nor: spansion: convert flash_info to new format
      mtd: spi-nor: sst: convert flash_info to new format
      mtd: spi-nor: winbond: convert flash_info to new format
      mtd: spi-nor: xilinx: use new macros in S3AN_INFO()
      mtd: spi-nor: xmc: convert flash_info to new format
      mtd: spi-nor: atmel: sort flash_info database
      mtd: spi-nor: eon: sort flash_info database
      mtd: spi-nor: gigadevice: sort flash_info database
      mtd: spi-nor: issi: sort flash_info database
      mtd: spi-nor: macronix: sort flash_info database
      mtd: spi-nor: micron-st: sort flash_info database
      mtd: spi-nor: spansion: sort flash_info database
      mtd: spi-nor: sst: sort flash_info database
      mtd: spi-nor: winbond: sort flash_info entries
      mtd: spi-nor: atmel: drop duplicate entry
      mtd: spi-nor: core: get rid of the INFOx() macros

 drivers/mtd/spi-nor/Makefile     |   2 -
 drivers/mtd/spi-nor/atmel.c      | 116 +++++++----
 drivers/mtd/spi-nor/catalyst.c   |  24 ---
 drivers/mtd/spi-nor/core.c       |  63 +++---
 drivers/mtd/spi-nor/core.h       | 138 ++++++-------
 drivers/mtd/spi-nor/eon.c        |  74 +++++--
 drivers/mtd/spi-nor/esmt.c       |  29 ++-
 drivers/mtd/spi-nor/everspin.c   |  34 +++-
 drivers/mtd/spi-nor/fujitsu.c    |  21 --
 drivers/mtd/spi-nor/gigadevice.c |  82 ++++----
 drivers/mtd/spi-nor/intel.c      |  23 ++-
 drivers/mtd/spi-nor/issi.c       | 118 +++++++----
 drivers/mtd/spi-nor/macronix.c   | 220 ++++++++++++++-------
 drivers/mtd/spi-nor/micron-st.c  | 411 ++++++++++++++++++++++++++-------------
 drivers/mtd/spi-nor/spansion.c   | 389 ++++++++++++++++++++++--------------
 drivers/mtd/spi-nor/sst.c        | 164 ++++++++++------
 drivers/mtd/spi-nor/swp.c        |  13 +-
 drivers/mtd/spi-nor/sysfs.c      |   6 +-
 drivers/mtd/spi-nor/winbond.c    | 288 +++++++++++++++++----------
 drivers/mtd/spi-nor/xilinx.c     |  32 ++-
 drivers/mtd/spi-nor/xmc.c        |  19 +-
 21 files changed, 1394 insertions(+), 872 deletions(-)
---
base-commit: 66d9573193967138cd12e232d4b5bc2b57e0d1ac
change-id: 20230807-mtd-flash-info-db-rework-8a52d60f0023


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
