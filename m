Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5CFC43461
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 12:45:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 655E42053B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 12:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1zXMHArk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ik5Qk+wd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 655E42053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SiE2rkfmBJTXVJgMQZD3LPlOjztoBBc6SSLt5866pek=; b=1zXMHArkvN/GL2Nq0rdIyYZfAJ
	o8TGGeMyyFKMBCxR6GP8FkQNcqBnXEXtI9QYFUCfzNULQgNjbGkGcIwKp0RHr6nS5XtztB4Qfoi6c
	X+LZM+IvgozdzE4CJNymRmCJhIKA/139pKQn/ycUH1pt2e5nutEHHUmw3wh2iZosPDNl7cV4DZo6N
	AHAlyhSVaxyP6cz0POpN7OodahMdTocwl/w4UIikdURtITQTbBFK1XU9pL99P0BVE52c0fplQ3rLN
	Hb4++8wws6Vb/32ZM5jRYMNyFBHlYyvede62BTn66MKzkN2GVptMTsnOMYugM7xkC9FFUufuMU937
	jQOyKT8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIWnX-0006gA-N4; Wed, 16 Sep 2020 12:44:31 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIWnU-0006fd-GL
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2020 12:44:29 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08GCiMMc073665;
 Wed, 16 Sep 2020 07:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600260262;
 bh=WDIhHNTtsxcPvw6tJkK9pUEGOxAkqTHbrDPx3GDJRJ0=;
 h=From:To:CC:Subject:Date;
 b=Ik5Qk+wdPKtBpIF18pHXM8oeL/Z7nUi/sq1RaQCFnf56ymN8CNi+AaWgfrema/3PF
 l/cIdXdu2+3uJFs0OUh6u3gJ+vCeLWpOfC/SJn8c9Kth+QyLQDe2C7ap2496ys95x+
 3ieccKfoCkPMXc2g3W71tIh11OoUM3Ya7yTESlKA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08GCiMTL017203;
 Wed, 16 Sep 2020 07:44:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Sep 2020 07:44:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Sep 2020 07:44:22 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08GCiIpU125391;
 Wed, 16 Sep 2020 07:44:19 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v13 00/15] mtd: spi-nor: add xSPI Octal DTR support
Date: Wed, 16 Sep 2020 18:14:03 +0530
Message-ID: <20200916124418.833-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_084428_642436_967D07DA 
X-CRM114-Status: GOOD (  31.82  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for Octal DTR flashes in the SPI NOR framework,
and then adds hooks for the Cypress Semper and Micron Xcella flashes to
allow running them in Octal DTR mode. This series assumes that the flash
is handed to the kernel in Legacy SPI mode.

Tested on TI J721E EVM with 1-bit ECC on the Cypress flash.

Changes in v13:
- Do not use multiple assignments in spi_nor_spimem_setup_op().

- Use EOPNOTSUPP instead of ENOTSUPP.

- Fix unbalanced braces around else statements.

- Fix whitespace alignment for spi_nor_set_read_settings() prototype.

Changes in v12:
- Rebase on latest master.

- Set dummy and data nbytes to 1 in spi_nor_spimem_check_readop() before
  calling spi_nor_spimem_check_op() to make sure the buswidth for them
  is properly set up. Similarly, set data nbytes to 1 for
  spi_nor_spimem_check_pp(). This makes sure we don't send the wrong
  dummy and data buswidth to the controller's supports_op().

- Enable DQS for Micron MT35XU512ABA. No reason not to.

- Update doc comment for spi_nor_parse_profile1() and
  spi_nor_cypress_octal_dtr_enable() to add missing fields.

Changes in v11:
- Add helpers spi_nor_{read,write}_reg() to make it easier to reject DTR
  ops for them.

- Add helper for spi_nor_controller_ops_erase() to make it easier to
  reject DTR ops.

- s/spi-mem/SPIMEM/ and s/spi-nor/SPI NOR/

- Avoid enabling 4-byte addressing mode for all DTR ops instead of just
  Octal DTR ops. This is based on the assumption that DTR ops can only
  use 4-byte addressing.

- Use round_up() instead of defining ROUND_UP_TO().

- Rename 'table' to 'dwords' in xSPI Profile 1.0 parsing.

- Re-order Profile 1.0 related defines by DWORD order.

- Move rdsr parameter parsing to where opcode is parsed because it is
  from the same DWORD.

- Drop local variables addr_width and dummy in spi_nor_read_sr()
  spi_nor_read_fsr().

- Allow soft reset for all protocols, not just 8D-8D-8D.

- Do not set address value to 0 is spi_nor_read_sr() and
  spi_nor_read_fsr(). It is 0 by default when we create the op.

- Do not make having command opcode extension as a reserved field fatal.

- Introduce the flag SPI_NOR_OCTAL_DTR_PP to indicate 8D page program
  support since it can't be detected from SFDP.

- Move the call to spi_nor_spimem_setup_op() in spi_nor_read_sr() to the
  commit which introduces it.

- Convert a comment in Profile 1.0 parsing from multi-line to one line.

Changes in v10:
- Rebase on latest linux-next/master. Drop a couple patches that made it
  in the  previous release.

- Move the code that sets 20 dummy cycles for MT35XU512ABA to its octal
  enable function. This way, if the controller doesn't support 8D mode
  20 dummy cycles won't be used.

Changes in v9:
- Do not use '& 0xff' to get the opcode LSB in spi-mxic and
  spi-zynq-qspi. The cast to u8 will do that anyway.

- Do not use if (opcode) as a check for whether the command phase exists
  in spi-zynq-qspi because the opcode 0 can be valid. Use the new
  cmd.nbytes instead.

Changes in v8:
- Move controller changes in spi-mxic to the commit which introduces
  2-byte opcodes to avoid problems when bisecting.

- Replace usage of sizeof(op->cmd.opcode) with op->cmd.nbytes.

- Extract opcode in spi-zynq-qspi instead of using &op->cmd.opcode.

Changes in v7:
- Reject ops with more than 1 command byte in
  spi_mem_default_supports_op().

- Reject ops with more than 1 command byte in atmel and mtk controllers.

- Reject ops with 0 command bytes in spi_mem_check_op().

- Set cmd.nbytes to 1 when using SPI_MEM_OP_CMD().

- Avoid endianness problems in spi-mxic.

Changes in v6:
- Instead of hard-coding 8D-8D-8D Fast Read dummy cycles to 20, find
  them out from the Profile 1.0 table.

Changes in v5:
- Do not enable stateful X-X-X modes if the reset line is broken.

- Instead of setting SNOR_READ_HWCAPS_8_8_8_DTR from Profile 1.0 table
  parsing, do it in spi_nor_info_init_params() instead based on the
  SPI_NOR_OCTAL_DTR_READ flag instead.

- Set SNOR_HWCAPS_PP_8_8_8_DTR in s28hs post_sfdp hook since this
  capability is no longer set in Profile 1.0 parsing.

- Instead of just checking for spi_nor_get_protocol_width() in
  spi_nor_octal_dtr_enable(), make sure the protocol is
  SNOR_PROTO_8_8_8_DTR since get_protocol_width() only cares about data
  width.

- Drop flag SPI_NOR_SOFT_RESET. Instead, discover soft reset capability
  via BFPT.

- Do not make an invalid Quad Enable BFPT field a fatal error. Silently
  ignore it by assuming no quad enable bit is present.

- Set dummy cycles for Cypress Semper flash to 24 instead of 20. This
  allows for 200MHz operation in 8D mode compared to the 166MHz with 20.

- Rename spi_nor_cypress_octal_enable() to
  spi_nor_cypress_octal_dtr_enable().

- Update spi-mtk-nor.c to reject DTR ops since it doesn't call
  spi_mem_default_supports_op().

Changes in v4:
- Refactor the series to use the new spi-nor framework with the
  manufacturer-specific bits separated from the core.

- Add support for Micron MT35XU512ABA.

- Use cmd.nbytes as the criteria of whether the data phase exists or not
  instead of cmd.buf.in || cmd.buf.out in spi_nor_spimem_setup_op().

- Update Read FSR to use the same dummy cycles and address width as Read
  SR.

- Fix BFPT parsing stopping too early for JESD216 rev B flashes.

- Use 2 byte reads for Read SR and FSR commands in DTR mode.

Changes in v3:
- Drop the DT properties "spi-rx-dtr" and "spi-tx-dtr". Instead, if
  later a need is felt to disable DTR in case someone has a board with
  Octal DTR capable flash but does not support DTR transactions for some
  reason, a property like "spi-no-dtr" can be added.

- Remove mode bits SPI_RX_DTR and SPI_TX_DTR.

- Remove the Cadence Quadspi controller patch to un-block this series. I
  will submit it as a separate patch.

- Rebase on latest 'master' and fix merge conflicts.

- Update read and write dirmap templates to use DTR.

- Rename 'is_dtr' to 'dtr'.

- Make 'dtr' a bitfield.

- Reject DTR ops in spi_mem_default_supports_op().

- Update atmel-quadspi to reject DTR ops. All other controller drivers
  call spi_mem_default_supports_op() so they will automatically reject
  DTR ops.

- Add support for both enabling and disabling DTR modes.

- Perform a Software Reset on flashes that support it when shutting
  down.

- Disable Octal DTR mode on suspend, and re-enable it on resume.

- Drop enum 'spi_mem_cmd_ext' and make command opcode u16 instead.
  Update spi-nor to use the 2-byte command instead of the command
  extension. Since we still need a "extension type", mode that enum to
  spi-nor and name it 'spi_nor_cmd_ext'.

- Default variable address width to 3 to fix SMPT parsing.

- Drop non-volatile change to uniform sector mode and rely on parsing
  SMPT.

Changes in v2:
- Add DT properties "spi-rx-dtr" and "spi-tx-dtr" to allow expressing
  DTR capabilities.

- Set the mode bits SPI_RX_DTR and SPI_TX_DTR when we discover the DT
  properties "spi-rx-dtr" and spi-tx-dtr".

- spi_nor_cypress_octal_enable() was updating nor->params.read[] with
  the intention of setting the correct number of dummy cycles. But this
  function is called _after_ selecting the read so setting
  nor->params.read[] will have no effect. So, update nor->read_dummy
  directly.

- Fix spi_nor_spimem_check_readop() and spi_nor_spimem_check_pp()
  passing nor->read_proto and nor->write_proto to
  spi_nor_spimem_setup_op() instead of read->proto and pp->proto
  respectively.

- Move the call to cqspi_setup_opcode_ext() inside cqspi_enable_dtr().
  This avoids repeating the 'if (f_pdata->is_dtr)
  cqspi_setup_opcode_ext()...` snippet multiple times.

- Call the default 'supports_op()' from cqspi_supports_mem_op(). This
  makes sure the buswidth requirements are also enforced along with the
  DTR requirements.

- Drop the 'is_dtr' argument from spi_check_dtr_req(). We only call it
  when a phase is DTR so it is redundant.

Pratyush Yadav (15):
  mtd: spi-nor: core: use EOPNOTSUPP instead of ENOTSUPP
  mtd: spi-nor: core: add spi_nor_{read,write}_reg() helpers
  mtd: spi-nor: core: add spi_nor_controller_ops_erase helper
  mtd: spi-nor: add support for DTR protocol
  mtd: spi-nor: sfdp: get command opcode extension type from BFPT
  mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
  mtd: spi-nor: core: use dummy cycle and address width info from SFDP
  mtd: spi-nor: core: do 2 byte reads for SR and FSR in DTR mode
  mtd: spi-nor: core: enable octal DTR mode when possible
  mtd: spi-nor: sfdp: detect Soft Reset sequence support from BFPT
  mtd: spi-nor: core: perform a Soft Reset on shutdown
  mtd: spi-nor: core: disable Octal DTR mode on suspend.
  mtd: spi-nor: core: expose spi_nor_default_setup() in core.h
  mtd: spi-nor: spansion: add support for Cypress Semper flash
  mtd: spi-nor: micron-st: allow using MT35XU512ABA in Octal DTR mode

 drivers/mtd/spi-nor/core.c      | 429 ++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/core.h      |  23 ++
 drivers/mtd/spi-nor/micron-st.c | 102 +++++++-
 drivers/mtd/spi-nor/sfdp.c      | 122 ++++++++-
 drivers/mtd/spi-nor/sfdp.h      |   8 +
 drivers/mtd/spi-nor/spansion.c  | 166 ++++++++++++
 include/linux/mtd/spi-nor.h     |  53 +++-
 7 files changed, 805 insertions(+), 98 deletions(-)

--
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
