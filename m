Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB5AC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7180161073
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7180161073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PqD7l9mLiuTM6+hsF0z9ffd4RZ3/94mS7v0xcWsV1nw=; b=hPfEaLUCLFZYCD
	dKoEOPr/ey/vSC4yUwFIW2wQyWTNEMuHRjNt0OS88T0SrUMkmOUldICsdx61FuGB9wonYT+tbSo4E
	WOSwF4n5AtIStJkfBSYYO9Bj/WAaxnGESL8n6oQ9dBNAlNy5DH0VEIuzykOv6Ry0oW7MGmC8MiYbz
	qhjEBsgAKDtuwuFF+2VI93qH2eZvtUCol1HkmM3QiNDE851CybH4rmMiD8bCyoHOhZAfY4LnJzk3j
	7+iBmlADTa1Q4ZfK8BdNOFN1/BciSTI7GBip3denHBjZvCmvFScauXMu2CIE7uwbn8DmXPdombqrt
	Ai9MjqhZqPyL6WKWCcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I6q-00ASEr-GZ; Tue, 13 Jul 2021 13:06:00 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I6m-00ASE8-SW
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:05:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5jfI073235;
 Tue, 13 Jul 2021 08:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181545;
 bh=bv2q0ax7MknWkffZXc/s0ufmW/fG8UgHIGCH2D4ZhGU=;
 h=From:To:CC:Subject:Date;
 b=u+Gy9JzrYY6G9gLLKZsPJTjUkBT8Yomgt3O4skcTo+PS7YE9HUSq+GWTp4Kde4QPj
 CO4A8ACZkGoMdFU5XtzJvzQmy6aI1L7llYqtrymL61rrtyWHeFHdnhB5/j05zrWv5F
 RiocUxptyAtnLEuVDL2BfsIrTXa+tMJqfvO78iAE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD5jOR090842
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:05:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:05:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:05:44 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daA109825;
 Tue, 13 Jul 2021 08:05:40 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 00/13] mtd: spinand: Add Octal DTR SPI (8D-8D-8D) mode support
Date: Tue, 13 Jul 2021 13:05:25 +0000
Message-ID: <20210713130538.646-1-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060557_046994_DF4DB4A3 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Apurva Nandan (13):
  spi: spi-mem: Add DTR templates for cmd, address, dummy and data phase
  mtd: spinand: Add enum spinand_proto to indicate current SPI IO mode
  mtd: spinand: Setup spi_mem_op for the SPI IO protocol using reg_proto
  mtd: spinand: Fix odd byte addr and data phase in read/write reg op
    and write VCR op for Octal DTR mode
  mtd: spinand: Add adjust_op() in manufacturer_ops to modify the ops
    for manufacturer specific changes
  mtd: spinand: Add macros for Octal DTR page read and write operations
  mtd: spinand: Allow enabling Octal DTR mode in the core
  mtd: spinand: Reject 8D-8D-8D op_templates if octal_dtr_enale() is
    missing in manufacturer_op
  mtd: spinand: Add support for write volatile configuration register op
  mtd: spinand: Add octal_dtr_enable() for Winbond manufacturer_ops
  mtd: spinand: Add support for Power-on-Reset (PoR) instruction
  mtd: spinand: Perform Power-on-Reset when runtime_pm suspend is issued
  mtd: spinand: Add support for Winbond W35N01JW SPI NAND flash

 drivers/mtd/nand/spi/core.c    | 196 +++++++++++++++++++++++++++++++--
 drivers/mtd/nand/spi/winbond.c | 186 +++++++++++++++++++++++++++++--
 include/linux/mtd/spinand.h    |  67 +++++++++++
 include/linux/spi/spi-mem.h    |  87 ++++++++++-----
 4 files changed, 494 insertions(+), 42 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
