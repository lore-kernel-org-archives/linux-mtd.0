Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45AEC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 05:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB5420734
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 05:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWKU3HL2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MpnSJDXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABB5420734
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9zB8Ch/RG+FfK2/WqLVMRck/SUSd1bLY5fvsLpWlfM=; b=WWKU3HL2dcrlwz
	6sBuESbgtD11hUk61uZY38TPcGM+MHF+/LU5W9tadhrnQ/8texvLxIOvHqZVemwYGg1Dm3KvxaFma
	bR6QfM0ZhHDDy9OeEblr8LBG3xU8k52Q7fjYD2Wt8Mel0rwE+xt/22WMHZ/3lb5K6DclKjExy4opH
	MN22aU97G34ik4GEyBZxq8t9Yap4NBks+gQ7Ebe5lC7bz2sAMlhooI81NMw7b86+iqiuMthcE8SZp
	H2jtpUtuxeqlMPCi5UQ4BSjTag2K59fCycaFRXlbBjzeaIAzTaVH1nkERdhd+yEZPeOt+kl6TdKo8
	TD8Gdsvrkf07yQDs2o+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfdIZ-0000qc-8B; Mon, 01 Jun 2020 05:47:47 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfdIU-0000pw-SM
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 05:47:45 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0515lWtJ051113;
 Mon, 1 Jun 2020 00:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590990452;
 bh=+xhnMjSMExNbbZIrv2EL1e9uDgoMK/biJ/HMPu8hkio=;
 h=From:To:CC:Subject:Date;
 b=MpnSJDXnjVYN6jvSwA5NAgipNiaWY1pzMHTonr7Psu4fm7oN/jQW1xN0mgUOOsrCC
 I0KKAcZfkGVHkqgmZ/dKQNTDTftxd5knkO3VXpmB/rqnRXLK7IyKTREK1aEAjunZYG
 SCngOt8fhbd8o5o7SCxK1zEK8M456euyOsHqGaWc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0515lWiO078871
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jun 2020 00:47:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 00:47:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 00:47:31 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0515lRPg038289;
 Mon, 1 Jun 2020 00:47:28 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v3 0/8] mtd: spi-nor: Move cadence-qaudspi to spi-mem framework
Date: Mon, 1 Jun 2020 11:17:17 +0530
Message-ID: <20200601054725.2060-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_224742_997098_1A6ACE41 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: marex@denx.de, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series is a subset of "[PATCH v12 0/4] spi: cadence-quadspi: Add
support for the Cadence QSPI controller" by Ramuthevar,Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> that intended to move
cadence-quadspi driver to spi-mem framework

Those patches were trying to accomplish too many things in a single set
of patches and need to split into smaller patches. This is reduced
version of above series.

Changes that are intended to make migration easy are split into separate
patches. Patches 1 to 3 drop features that cannot be supported under
spi-mem at the moment (backward compatibility is maintained).
Patch 4-5 are trivial cleanups. Patch 6 does the actual conversion to
spi-mem and patch 7 moves the driver to drivers/spi folder.

I have tested both INDAC mode (used by non TI platforms like Altera
SoCFPGA) and DAC mode (used by TI platforms) on TI EVMs.

Patches to move move bindings over to
"Documentation/devicetree/bindings/spi/" directory and also conversion
of bindig doc to YAML will be posted separately.  Support for Intel
platform would follow that.

v3:
Split handling of probe deferral into separate patch (out of 5/6)
Split dropping of redundant WREN to separate patch (out of 5/6)
Fix a possible memleak due to lack of spi_master_put()
Parse all SPI slave nodes in cqspi_setup_flash()
Address misc comments from Tudor on v2
Rebase onto latest spi-nor/next

v2:
Rework patch 1/6 to keep "cdns,is-decoded-cs" property supported.

Ramuthevar Vadivel Murugan (2):
  mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework
  spi: Move cadence-quadspi driver to drivers/spi/

Vignesh Raghavendra (6):
  mtd: spi-nor: cadence-quadspi: Make driver independent of flash
    geometry
  mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
  mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on
    failure
  mtd: spi-nor: cadence-quadspi: Fix error path on failure to acquire
    reset lines
  mtd: spi-nor: cadence-quadspi: Handle probe deferral while requesting
    DMA channel
  mtd: spi-nor: cadence-quadspi: Drop redundant WREN in erase path

 drivers/mtd/spi-nor/controllers/Kconfig       |  11 -
 drivers/mtd/spi-nor/controllers/Makefile      |   1 -
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 .../spi-cadence-quadspi.c}                    | 541 +++++++-----------
 5 files changed, 222 insertions(+), 343 deletions(-)
 rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (74%)

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
