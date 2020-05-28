Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A4C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 07:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D93121475
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 07:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVZyfopM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D93121475
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LM8T9r34t+fOVV4e4SXuDXwfOhJYrxivy+S0cPWd0Ow=; b=ZVZ
	yfopMNGROplnuvNHpDSPNuQiw+GZiPXpm+ghFLA7+oDywybH1Vq06S0VbzxqK4xHB5Wug/JwJT5BK
	jQvJFk9rnv2e2+OUYrrk8KnoG4YxK4pJbZuPZCx6S956c/iSVN0CmO+U8XskjjQ9czRUttrX/tdQt
	knmxaYKj+io4TRPdGESonLZ0G9tA3LCztAfCjhRbdJkasGDB8PZ5TQIwmWI0eG5f8fgsjU+wCHFbU
	LqGlwwQEPW25R+c3Zo2mehEoZE45sxO2DoDfs1igxmMLLohI7FTabGLLIV4wW7ZGiM4puyvslqZPX
	Dz3bI1+3uyL13GoXwe61KWRwpmO3OHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDRX-0007jm-AX; Thu, 28 May 2020 07:59:11 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDRH-0007Wd-Ru
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 07:58:57 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 04S7wMHZ030973;
 Thu, 28 May 2020 15:58:22 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 matthias.bgg@gmail.com
Subject: [PATCH v3 00/14] mtd: spi-nor: add xSPI Octal DTR support 
Date: Thu, 28 May 2020 15:58:02 +0800
Message-Id: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com 04S7wMHZ030973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_005856_158081_84356F4A 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

JESD216C has defined specification for Octal 8S-8S-8S and 8D-8D-8D.
Based on JEDEC216C Basic Flash Parameter Table (BFPT) driver extract
DWORD-18: command and command extension type.
DWORD-20: Maximum operation speed of device in Octal mode.

xSPI profile 1.0 table:
DWORD-1: Read Fast command, the number of dummy cycles and address nbytes
	 for Read Status Register command.
DWORD-2: Read/Write volatile Register command for CFG Reg2.
DWORD-4 and DWORD-5: dummy cycles used for various frequencies based on
maximum speed of device from BFPT 20th DWORD.

Ccommand sequences to change to octal DTR mode:
The length of each command sequence is 8 per byte for single SPI mode and
patching driver to parse and execute these sequences for octal DTR mode.

By Vignesh's comments to patch these drivers based on Pratyush's patches
set [1].

This series adds support for Macronix mx25uw51245g works in octal DTR mode.

Tested on Macronix's Zynq PicoZed board with Macronix's SPI controller
(spi-mxic.c) driver patched on mx25uw51245g Octal flash.


[1] https://patchwork.ozlabs.org/project/linux-mtd/cover/20200525091544.17270-1-p.yadav@ti.com/


Summary of change log
v3:
Add support command sequences to change octal DTR mode and based on
part of Pratyush's patches set.

v2: 
Parse BFPT & xSPI table for Octal 8D-8D-8D mode parameters and enable Octal
mode in spi_nor_late_init_params().
Using Macros in spi_nor_spimem_read_data, spi_nor_spimem_write_data and
so on by Vignesh comments.

v1:
Without parsing BFPT & xSPI profile 1.0 table and enter Octal 8D-8D-8D
mode directly in spi_nor_fixups hooks.


thnaks for your time and review.
best regards,
Mason

--
Mason Yang (7):
  mtd: spi-nor: sfdp: get octal mode maximum speed from BFPT
  mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
  mtd: spi-nor: sfdp: parse command sequences to change octal DTR mode
  mtd: spi-nor: core: add configuration register 2 read & write support
  spi: mxic: patch for octal DTR mode support
  mtd: spi-nor: core: execute command sequences to change octal DTR mode
  mtd: spi-nor: macronix: Add Octal 8D-8D-8D supports for Macronix
    mx25uw51245g

Pratyush Yadav (7):
  spi: spi-mem: allow specifying whether an op is DTR or not
  spi: spi-mem: allow specifying a command's extension
  mtd: spi-nor: add support for DTR protocol
  mtd: spi-nor: sfdp: prepare BFPT parsing for JESD216 rev D
  mtd: spi-nor: sfdp: get command opcode extension type from BFPT
  mtd: spi-nor: core: use dummy cycle and address width info from SFDP
  mtd: spi-nor: core: enable octal DTR mode when possible

 drivers/mtd/spi-nor/core.c     | 514 +++++++++++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/core.h     |  49 ++++
 drivers/mtd/spi-nor/macronix.c |  55 +++++
 drivers/mtd/spi-nor/sfdp.c     | 278 +++++++++++++++++++++-
 drivers/mtd/spi-nor/sfdp.h     |  15 +-
 drivers/spi/spi-mem.c          |  16 +-
 drivers/spi/spi-mtk-nor.c      |   4 +-
 drivers/spi/spi-mxic.c         | 101 +++++---
 drivers/spi/spi-zynq-qspi.c    |  11 +-
 include/linux/mtd/spi-nor.h    |  51 ++--
 include/linux/spi/spi-mem.h    |  14 +-
 11 files changed, 980 insertions(+), 128 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
