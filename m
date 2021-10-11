Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F948C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:47:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0770C6054F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0770C6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+g9kVGaPoCQTET2MLFA1MtHT0YmWipCEZVNQtVXLQo=; b=B7uxKOJ8ngHkhA
	uMR9ZjtHD6iFvrYY17HlihQInGk7IQa4WMHOJKpLNXlOZ5V9Qs5YQ72I1R9S7RN5EI9bQYVwPiAiP
	4iNFDdaN2/kxwxpCXUe97gS0zifWcY9yPVtMO2mABWC5lNd5IIyiDWUymhn4UXP7lDJSNeoHCtSlb
	YXs1599wd1Svy1qhIAHbhYixM5hMBvRqOUfN69/rsD0cHdlaRpiAarNMaa0O9mEgRyydl5m7Y8ymG
	W9+Q9kYqGzVczLK/WjpiqRiyH7da2lLhZhB/2AFrkFVJ1N+v8//DMR/q6ifQ3U4eosBiCHRRA0LsW
	EZ7doNMckUUhX0F/5y5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2C4-00AdQd-AL; Mon, 11 Oct 2021 20:46:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2C1-00AdPj-A3
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:46:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkRYX058438;
 Mon, 11 Oct 2021 15:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985187;
 bh=aREyONMOYnqRN8v42O2++VQ4QoXlpiSb4xj0cGMxL0U=;
 h=From:To:CC:Subject:Date;
 b=XzwSqtA7XhUvLhbISa+tUaTG5Ll0BqlsAkgQzJibz7r4dM5tYKnptnHcTBfB1XpQd
 ihj8nNbkPCiCx633voyYjudC1q3sg6QHuLh7tuK4U3wg1GAHWl72yKZ25VfNmoHLV8
 fs0M/5ILEQaf8WZarUu17WCHa3sAsLXe22MIf+F4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKkRbK104929
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:46:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:46:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:46:26 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEe069811;
 Mon, 11 Oct 2021 15:46:21 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 00/14] mtd: spinand: Add Octal DTR SPI (8D-8D-8D) mode
 support
Date: Tue, 12 Oct 2021 02:16:05 +0530
Message-ID: <20211011204619.81893-1-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134641_638297_7FEC0E93 
X-CRM114-Status: GOOD (  11.33  )
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
This series proposes patches for adding the following functionality
in SPI NAND core:

- Octal DTR SPI (8D-8D-8D) mode support

- Winbond W35N01JW SPI NAND chip support

- Power-on-Reset instruction support

This series has been tested on TI J721e EVM with the Winbond W35N01JW
flash with following test utilities:

- nandtest
  Test log: https://textbin.net/raw/fhypoz63f9

- mtd_stresstest
  Test log: https://textbin.net/raw/0xqjmqntj7

- UBIFS LTP stress test (NAND_XL_STRESS_DD_RW_UBIFS).
  Test log: https://textbin.net/raw/pyokws7wku

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

---
Changes in v2:

- Removed *_ALL_ARGS() macros from spi-mem.h, and redefined DTR macros.

- Renamed spinand_setup_op() to spinand_patch_op(). Reduced one
  conditional check from this function. Had to keep tweaking in hot-path
  to avoid complicated implementation "hacks".

- Changes in commit messages and added comments.

- Dropped "Reject 8D-8D-8D op_templates if octal_dtr_enale() is
  missing in manufacturer_op" patch.

- Reduced PoR reset delay.

- Splitted "mtd: spinand: Add support for Winbond W35N01JW SPI NAND
  flash" into 3 independent patches.

Apurva Nandan (14):
  spi: spi-mem: Add DTR templates for cmd, address, dummy and data phase
  mtd: spinand: Add enum spinand_proto to indicate current SPI IO mode
  mtd: spinand: Patch spi_mem_op for the SPI IO protocol using reg_proto
  mtd: spinand: Fix odd byte addr and data phase in read and write reg
    op for Octal DTR mode
  mtd: spinand: Add adjust_op() in manufacturer_ops to modify the ops
    for manufacturer specific changes
  mtd: spinand: Add macros for Octal DTR page read and write operations
  mtd: spinand: Allow enabling Octal DTR mode in the core
  mtd: spinand: winbond: Add support for write volatile configuration
    register op
  mtd: spinand: winbond: Add octal_dtr_enable() for manufacturer_ops
  mtd: spinand: Add support for Power-on-Reset (PoR) instruction
  mtd: spinand: Perform Power-on-Reset on the flash in mtd_suspend()
  mtd: spinand: Add adjust_op() in Winbond manufacturer_ops
  mtd: spinand: winbond: Rename cache op_variants struct variable
  mtd: spinand: winbond: Add support for Winbond W35N01JW SPI NAND flash

 drivers/mtd/nand/spi/core.c    | 187 +++++++++++++++++++++++++++++-
 drivers/mtd/nand/spi/winbond.c | 200 +++++++++++++++++++++++++++++++--
 include/linux/mtd/spinand.h    |  67 +++++++++++
 include/linux/spi/spi-mem.h    |  41 +++++++
 4 files changed, 484 insertions(+), 11 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
