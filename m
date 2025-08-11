Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC9CA0EDB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FU5iytd3fiGCAsJS6gjLV3vXdZreJSbn4kx02pLAESo=; b=MvKl25iism2TKg
	ohEdDV9eqxAp0M6+fZ5s3glIwXfcnT4J4rCjiU9V+olrpMggSbECu9jOgJlNpDxV5GWkmngcWQsoz
	M3U1Gxde//pytg7HgJpm26yJhqKDM0WvjkV3nCUmV1VM7v5/7sIjHgXa2NSEsav5rstaxxf6Rt9FN
	juC5GQZaC5QnMbtYemNaClmQtGwVglzYCjj2xRwdHKiz/7jxee66cfhfNOo245NCe1/3wZZ0ypuLG
	XfQNzfMcLPfKN+NlXuToKx4N3542HKLqFm5nP/3CW1CiwU5skS8ZfoyHINalXqQAzIDKLbFW0Y2eX
	CX6JU5y1Wg0YolP7FuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad2-00000009DJk-34Hq;
	Mon, 11 Aug 2025 22:04:28 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGY-00000008vy5-46K0
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:08 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJWwlT1609347;
	Mon, 11 Aug 2025 14:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940778;
	bh=G8Kby90UsAQLrUgV/PU9XSM9vV3CObRxk/OXLyHe7pE=;
	h=From:To:CC:Subject:Date;
	b=IZbqyB/co7KVIMDsC1EMUvqYsAfI/RRV6N6jrQ9UrFmffhH3TTo721azBc43WVwxC
	 FFWwvdeRS1ZZv2U4I/t6IoWukJqvb0p1cGSJgm08iQYTIsDdr39g2W8Zn8h9x9mHQN
	 a9KsLq3oMqEvhlt6OQAENHs7mdlEI2y1ZyCJXr3c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJWvjS3895668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:32:57 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:32:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:32:57 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1n3690681;
	Mon, 11 Aug 2025 14:32:53 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 00/10] SPINAND PHY Tuning Series
Date: Tue, 12 Aug 2025 01:02:09 +0530
Message-ID: <20250811193219.731851-1-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_123307_222765_6920C82D 
X-CRM114-Status: GOOD (  13.25  )
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

High-speed operation of certain SPI NAND/NOR controllers, such as the
Cadence OSPI controller, requires execution of a PHY tuning sequence
after switching the device to the appropriate mode (SDR or DDR).
Without PHY, the controller in SDR mode can operate only at one-fourth
of the reference clock. This series introduces an SDR-based PHY tuning
procedure to enable higher-speed operation in SDR mode.

A new _execute_tuning() hook is added to the mtd_info structure for
each MTD device. This hook is invoked when a flash partition named
'ospi.phypattern' is detected. The flash-specific _execute_tuning()
implementation retrieves the PHY tuning parameters-such as the
pre-defined tuning pattern and its size-and uses them to perform a
readback/compare operation against the known pre-flashed data in
'ospi.phypattern' as part of the tuning process.

From the flash driver, spi_mem_execute_tuning() is called with an
appropriate read_op. This function invokes cqspi_execute_tuning(),
which contains the PHY tuning algorithm. These APIs are flash-agnostic,
relying only on the correct read_op being passed. DDR mode tuning with
DQS support will be implemented in a future series.

In the NOR driver, _execute_tuning() follows the same approach of
pre-flashing a known pattern into the target partition and reading it
back during tuning. For NAND flashes, the tuning pattern can be written
directly to the cache via write_to_cache() and subsequently read back
using read_from_cache() during the tuning procedure. This support will
be added in a later phase.

At present, the series does not implement fallback handling for tuning
failures (e.g., reducing maximum frequency or adjusting dummy cycles).
Future enhancements will add fallback mechanisms to select a lower
operating frequency and optimal dummy cycle configuration.

Device Tree updates required for this functionality will be submitted
in a separate patch series after this one is merged.

This series was tested on TI's AM62A SK with W35N01JW OSPI NAND flash.
The read and write throughput with and without PHY:

Without PHY:
     READ: 7.1 MB/s
     WRITE: 6 MB/s
     
Wth PHY:
     READ: 35.1 MB/s
     WRITE: 9.2 MB/s
     
Repo: https://github.com/santhosh21/linux/commits/spinand_phy_rfc_v1
Test log: https://gist.github.com/santhosh21/d2d52cc03d2423200971b0ab9c3b9365

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Pratyush Yadav (2):
  spi: spi-mem: Introduce support for tuning controller
  spi: cadence-quadspi: Enable PHY for aligned DAC reads

Santhosh Kumar K (8):
  spi: spi-mem: Define spi_mem_tuning_params and
    spi_mem_get_tuning_params()
  mtd: nand: spi: Introduce _execute_tuning for mtd devices
  mtd: mtdcore: Call mtd_execute_tuning during mtd_register
  spi: cadence-quadspi: Move cqspi_readdata_capture() above all
    operations
  spi: cadence-quadspi: Use BIT() macro for CQSPI_REG_READCAPTURE_BYPASS
  spi: cadence-quadspi: Enable PHY for data writes
  spi: cadence-quadspi: Implement PHY for higher frequencies in SDR mode
  spi: cadence-quadspi: Define cqspi_get_tuning_params()

 drivers/mtd/mtdcore.c             |  19 +
 drivers/mtd/mtdcore.h             |   1 +
 drivers/mtd/nand/spi/core.c       |  61 +++
 drivers/spi/spi-cadence-quadspi.c | 727 ++++++++++++++++++++++++++++--
 drivers/spi/spi-mem.c             |  22 +
 include/linux/mtd/mtd.h           |   1 +
 include/linux/spi/spi-mem.h       |  23 +
 7 files changed, 823 insertions(+), 31 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
