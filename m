Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5DDC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FxbDT7DKESmMJxG80eZtGHLu34bTj+fRbr37NHvnTp4=; b=JDAT2nqrjkgfAE
	ey7YYRUuINhXiVy8Q+O0CiYmW4AelQTfrYS95LGAUCTPM0oWPCB6F0mrkZqpwGIg2qvmgXZfvHEDC
	tR116IsD+mo3Ff64TZ61mQktlsqPqXLNdD2PdyzxloWFqgbmAYhJfoMfhG8P/jqqoW8QR9JwQbHpM
	xtGKFW3BcxYIEtpmljxrxfu1C6s1VqotVf+RI8iREBjxQ9NdR2C4vDOfBKx5v/uAYlDB4JRh3mwA4
	OUvdPHo/DjjpwmQAGpC1E4o/wpqUub5hbyN4AEHqPECKXzozJsYZR7vgg2NTYTi5qWyQuEJMyfVpe
	XR6dAW2+J8zY7CHDws/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Z3e-006idS-Fp; Sat, 01 Jan 2022 07:44:06 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z2x-006iUe-S0
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:43:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017gv8e103728;
 Sat, 1 Jan 2022 01:42:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641022977;
 bh=pcQIy4e3o4+nMzvakDQ0s6AhMzKjUhVgfo34VY6QNfs=;
 h=From:To:CC:Subject:Date;
 b=x6ME+4rMf+8Ew7WLgjoI62z3iAeifE3tkfrVwx6xHAxgqtI58v4DPuWKAHU1z7AKz
 yNpXYTElfZGExz2feFv9Dq59p3pYXB/JGx/SqGU3NkgC+HZBhMYACdFdbrqPm6oGv7
 3E6JsqsTtXUt0L7uZ3kFzHK1bjPaV1PZCypzAT7o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017gvq4088985
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:42:57 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:42:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:42:56 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwV033162;
 Sat, 1 Jan 2022 01:42:52 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 00/17] mtd: spinand: Add Octal DTR SPI (8D-8D-8D) mode
 support
Date: Sat, 1 Jan 2022 13:12:33 +0530
Message-ID: <20220101074250.14443-1-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234324_024949_65145B73 
X-CRM114-Status: GOOD (  10.80  )
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

- ctrl_ops support

- Winbond W35N01JW SPI NAND chip support

This series has been tested on TI J721e EVM with the Winbond W35N01JW
flash with following test utilities:

- nandtest
  Test log: https://pastebin.com/raw/PusiLYVQ

- mtd_stresstest
  Test log: https://pastebin.com/raw/gBtV2CAf

- UBIFS LTP stress test (NAND_XL_STRESS_DD_RW_UBIFS).
  Test log: https://pastebin.com/raw/J8WyLsz1

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

---
Changes in v3:

- Added support for ctrl_ops, data_ops and ctrl_ops_variants.

- Made the implementation generic in terms of spinand protocol and SPI mode
  changes.

- Added option to disable Octal DTR mode.

- Removed spinand_patch_op(), adjust_op() manufacturer_op.

- Removed Power-on-Reset functionality and its call from mtd_suspend(), now 
  just disable Octal DTR at suspend.


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


Apurva Nandan (17):
  spi: spi-mem: Add DTR templates for cmd, address, dummy and data phase
  mtd: spinand: Define macros for Octal DTR ops
  mtd: spinand: Add enum spinand_protocol to indicate current SPI IO
    mode
  mtd: spinand: Rename 'op_templates' to 'data_ops'
  mtd: spinand: Define ctrl_ops for non-page read/write op templates
  mtd: spinand: Define default ctrl_ops in the core
  mtd: spinand: Switch from op macros usage to 'ctrl_ops' in the core
  mtd: spinand: Add support for manufacturer-based ctrl_ops variations
  mtd: spinand: Add change_mode() in manufacturer_ops
  mtd: spinand: Add pointer to probed flash's spinand_info
  mtd: spinand: Allow enabling/disabling Octal DTR mode in the core
  mtd: spinand: Add mtd_suspend() to disable Octal DTR mode at suspend
  mtd: spinand: winbond: Add support for write volatile configuration
    register op
  mtd: spinand: winbond: Add octal_dtr_enable/disable() in
    manufacturer_ops
  mtd: spianand: winbond: Add change_mode() manufacturer_ops
  mtd: spinand: winbond: Rename cache op_variants struct variable
  mtd: spinand: winbond: Add support for Winbond W35N01JW SPI NAND flash

 drivers/mtd/nand/spi/core.c    | 213 +++++++++++++++++++++++++----
 drivers/mtd/nand/spi/winbond.c | 242 +++++++++++++++++++++++++++++++--
 include/linux/mtd/spinand.h    | 154 +++++++++++++++++++--
 include/linux/spi/spi-mem.h    |  41 ++++++
 4 files changed, 599 insertions(+), 51 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
