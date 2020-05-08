Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76F7C54E49
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 18:55:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D2021974
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 18:55:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jOovCTxo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EjK6Tpyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D2021974
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gTXvYJMlTbLa1vKE83oGGv1fCce4DQIDY3i/Obn5ASw=; b=jOovCTxoeTXChQ
	5DpSCCTOmgq4WYV2P6kijJTGnmGIJFyQ1bieUKd8QIBKF4L8Krgxcg5/KkgzWu22i3U1Dhs8jrsqz
	ciQuSsplIZLJ+knyDcdrsy5jmrO3nSdqKMOdgabLTfP9RLgfK6kJygBwcpVlowRTU+yOej6o2wYc0
	jEdAu6azZfycghGhfbqvIfoGoXFlRiCneh0IAbdMFTSbYq+vG/F6WCCTXN0l8iIea/JzhxXcdd7nP
	ujzmg+1KYBDf5NTKl8CifwFlJs7TRdn2d34TqzziA2QeUuk8eCmJPdnzLGQXpxlDACiBk5pKTTw5a
	2spC70dgf6XMH45TLMOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX88z-0004TT-Kk; Fri, 08 May 2020 18:54:45 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX88u-0004S1-KC
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 18:54:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 048IsMMM109512;
 Fri, 8 May 2020 13:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588964062;
 bh=vkQhbBYwxsFf8rmPeEJkV1I4wsQY6bW0mKd96d0v7sk=;
 h=From:To:CC:Subject:Date;
 b=EjK6Tpyijz9OYnAmGbBNznRY4pyzIG2R19J1RWzP4p5ZjoR6H6gsQhibBd7DGHG6w
 4x1xtPLgHOdF3yRTm4+twouWT/XIl/D5jIUtHDBw4xFlYQJnDg919/6X5sYav85PIb
 9DOUGqo/pOzw3d1gUgplpqNfyvmidqa+iIpBS+9w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 048IsLSG117434;
 Fri, 8 May 2020 13:54:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 May
 2020 13:54:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 May 2020 13:54:21 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 048IsGpS077355;
 Fri, 8 May 2020 13:54:17 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 0/6] mtd: spi-nor: Move cadence-qaudspi to spi-mem framework
Date: Sat, 9 May 2020 00:24:05 +0530
Message-ID: <20200508185411.487-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_115440_789450_24A432EF 
X-CRM114-Status: UNSURE (   9.83  )
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

Changes since v12

- Drop intel platform related changes
- Drop DT bindings movement to YAML
- Split patch moving driver to spi-mem framework framework into
  multiple patches as suggested by Tudor.

v12: https://patchwork.ozlabs.org/project/linux-mtd/list/?series=163343&state=%2A&archive=both

Vadivel,

I have maintained the additional changes needed on top of this series
for Intel platform that were part of your v12 series here (needs cleanup):

https://github.com/r-vignesh/linux.git branch: cqspi-mig

Please use above branch to test the same.

Ramuthevar Vadivel Murugan (2):
  mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework
  spi: Move cadence-quadspi driver to drivers/spi/

Vignesh Raghavendra (4):
  mtd: spi-nor: cadence-quadspi: Drop cdns,is-decoded-cs property
  mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
  mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on
    failure
  mtd: spi-nor: cadence-quadspi: Fix error path on failure to acquire
    reset lines

 drivers/mtd/spi-nor/controllers/Kconfig       |  11 -
 drivers/mtd/spi-nor/controllers/Makefile      |   1 -
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 .../spi-cadence-quadspi.c}                    | 546 +++++++-----------
 5 files changed, 215 insertions(+), 355 deletions(-)
 rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (73%)

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
