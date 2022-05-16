Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC20C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMCTvj8nGgaNVIg9QueoP+sTyhfGRSoX2UWnB2Mgzl8=; b=Z9IzUG9c5ydOaz
	K+k+0VhtcAZo6UsqMSaB31UCmyQrCqimCsCyzSVY0V/ZH1fCE/60abUMWeDmrpTUxhzNv9JboAnox
	HTlpTTo15BpoT98+B9aINQZA0QXoyIaegRpH70ApH38hiBHOZpScQq5tO2KBPU55W2RHQHAofdsPk
	1MozDraGIE2luXktCy3rg0WzF1nEgJcdN6q/A5NyokrqaXisZv7u8cZbPDKuIfici8ZsDe7hI5dJu
	v4ieJsRmMce2+1nDsUVIeHr7UaHOM5ofepr0HKzb43dx300h8kEZuIsFeTsAZl+QcpK7FJPBV0TOg
	4hVYjzpgB4Z3L9Dqaanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUx0-006NoA-7J; Mon, 16 May 2022 07:15:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUwx-006NmV-Dd
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 07:15:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24G7FJmI068884;
 Mon, 16 May 2022 02:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652685320;
 bh=cR++IIMsHkX281dJMBwzNwRdTa5fQCYsMQcoZixdIdE=;
 h=Date:From:To:CC:Subject;
 b=IBTg0GQFynmIpfZ4UhXwNkPcTQSIZjfr4n8eaJETIqg0aDahhz6s8tavzj5xh8Sd/
 FH52x5qdjzCQD+5oPZ7x4Dpj7LfRfb2a3UIucetpmXOjRFUSYde6A0A115VROKnYUM
 LTHS0bTkb8443LKpqVUxLuCXfECrgxYfs/hCV0fc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24G7FJjN017890
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 May 2022 02:15:19 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 16
 May 2022 02:15:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 16 May 2022 02:15:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24G7FIZn061658;
 Mon, 16 May 2022 02:15:19 -0500
Date: Mon, 16 May 2022 12:45:18 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: changes for 5.19
Message-ID: <20220516071518.orf7n7k4fhtpcj3x@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_001527_667901_38C4B26E 
X-CRM114-Status: GOOD (  13.38  )
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

Hi,

This is the SPI NOR PR for 5.19.

Regards,
Pratyush Yadav
Texas Instruments Inc.

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.19

for you to fetch changes up to c47452194641b5d27c20e557c84a46c85fd7ce37:

  mtd: spi-nor: debugfs: fix format specifier (2022-05-12 17:56:44 +0530)

----------------------------------------------------------------
SPI NOR core changes:
- Read back written SR value to make sure the write was done correctly.
- Introduce a common function for Read ID that manufacturer drivers can
  use to verify the Octal DTR switch worked correctly.
- Add helpers for read/write any register commands so manufacturer
  drivers don't open code it every time.
- Clarify rdsr dummy cycles documentation.
- Add debugfs entry to expose internal flash parameters and state.

SPI NOR manufacturer drivers changes:
- Add support for Winbond W25Q512NW-IM, and Eon EN25QH256A.
- Move spi_nor_write_ear() to Winbond module since only Winbond flashes
  use it.
- Rework Micron and Cypress Octal DTR enable methods to improve
  readability.
- Use the common Read ID function to verify switch to Octal DTR mode for
  Micron and Cypress flashes.
- Skip polling status on volatile register writes for Micron and Cypress
  flashes since the operation is instant.

----------------------------------------------------------------
Chen-Tsung Hsieh (1):
      mtd: spi-nor: core: Check written SR value in spi_nor_write_16bit_sr_and_check()

Leon M. George (1):
      mtd: spi-nor: support eon en25qh256a variant

Michael Walle (5):
      mtd: spi-nor: amend the rdsr dummy cycles documentation
      mtd: spi-nor: move spi_nor_write_ear() to winbond module
      mtd: spi-nor: export spi_nor_hwcaps_pp2cmd()
      mtd: spi-nor: expose internal parameters via debugfs
      mtd: spi-nor: debugfs: fix format specifier

Shaik Sajida Bhanu (1):
      mtd: spi-nor: winbond: add support for W25Q512NW-IM

Tudor Ambarus (11):
      mtd: spi-nor: Rename method, s/spi_nor_match_id/spi_nor_match_name
      mtd: spi-nor: Introduce spi_nor_match_id()
      mtd: spi-nor: core: Use auto-detection only once
      mtd: spi-nor: core: Introduce method for RDID op
      mtd: spi-nor: manufacturers: Use spi_nor_read_id() core method
      mtd: spi-nor: core: Add helpers to read/write any register
      mtd: spi-nor: micron-st: Rework spi_nor_micron_octal_dtr_enable()
      mtd: spi-nor: spansion: Rework spi_nor_cypress_octal_dtr_enable()
      mtd: spi-nor: Introduce templates for SPI NOR operations
      mtd: spi-nor: spansion: Remove status polling on volatile registers write
      mtd: spi-nor: micron-st: Remove status polling on volatile registers write

 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      | 286 +++++++++++++++++++---------------------
 drivers/mtd/spi-nor/core.h      | 123 ++++++++++++++++-
 drivers/mtd/spi-nor/debugfs.c   | 249 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/eon.c       |   3 +-
 drivers/mtd/spi-nor/micron-st.c | 181 ++++++++++++-------------
 drivers/mtd/spi-nor/spansion.c  | 187 +++++++++++++-------------
 drivers/mtd/spi-nor/winbond.c   |  45 ++++++-
 drivers/mtd/spi-nor/xilinx.c    |  12 +-
 include/linux/mtd/spi-nor.h     |   4 +-
 10 files changed, 746 insertions(+), 345 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/debugfs.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
