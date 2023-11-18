Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06107C5ACB3
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Nov 2023 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xS+TOpfstS0GJYPt4/Xmox+eICWPZ0MSgFGL8mpnFd4=; b=vmmtciaskwxy4L
	CoPDuRcWIM8GNky5LSEq6VU/17PFSEGmj3B+yjvVY5n+OfNZe3oTU+UvOhfZEvlAtRDPx3FKys/ID
	XCNjz+3yrIpYL55fXZXATbFXpf1J067Fuk6JY8J7PR3GMFeCRKs9QK1sX49Ivk+1g6koFM0w7phk0
	M/Gz+UP4/Ivm4ew4E5EsL6WFyFZVPsmbWgPrK3g0Oqa84W7UqRB22q+YuKmA5yeXg+aTHhji770w0
	UbQcfYv6egUu1k9IGLqZmtVfcwopDcx/NGnBxoaBbsj2lS2P1a5CWbBtmLha9uC4Y5Op857QX2gaG
	7R1GB3HWxRWgawuLMQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Lmz-008an8-1O;
	Sat, 18 Nov 2023 13:55:13 +0000
Received: from mail-dm6nam12on20610.outbound.protection.outlook.com ([2a01:111:f400:fe59::610] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Lmu-008alY-1P;
	Sat, 18 Nov 2023 13:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yvtmsq5npZLCmW2Pv6tGH5UlulOEHZZiuRVff2G/xCPrG5pKryJxvbEJ6gB0qMr0bwUriCxaXF1MTwWcxOlBBLXaooByB5MwIqPtlxLqO/CSfMP3mm/k1ohpBZikPrcnasjkh5uWB4vv5GNOarq6hg8Nn1nVFOvsrcoEzjoqud0dUH/O7jdkzIRLTrihPgYRC7FEwp5zfVYMRCu8K94AjDHDwVNlqSnPpsKMSOnQy+f82FCfJU8qSW9aQuCXWZIidkXAYNUs7VFex1VU8oeTke3dcKPiCnoW3fsQj3T9AgfTqYVmf3/G1kaYRN8U2aG3rWeU75It2velh/nI6hQJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYyonUaW76Vu+omy17T4VRP6tmFp5uhPhH6dAMvUzNA=;
 b=LFbakIBSo7Kj4sBXUrJRAC1CyrYiUMpcYWoUIbmjsfeTWsfPxkxOS6Eckx+p5CVdJE+boWwDrNwQ0TnQexbGZLI6D6LJAFnPJ68mJHmdMHV7lZ7k4VIK+N9gfFxr5bwUm21ONo7GXUBRu+PycT6iK8oiAjR8c8HTPvebDsQYvKfGPekM1M6KXuo5zY/cBr9V+EIjs33Fp6CTjnau79Oavacs2TBGIzuwzzP1AgdsK0/dF1389i9+E43tH4Y9S4ODCl0M/W/evjQOy0VJc3oBBQ5F81RQnoxv/RjClyBZTYKqwC12HcV0PEMVlqHszPpQ4lBeJM3778xEZnhugj4Thg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYyonUaW76Vu+omy17T4VRP6tmFp5uhPhH6dAMvUzNA=;
 b=gAunWlbyQqh/NzvxgyFG8R1q9V0Pqusm1DuaycTxFoxrlY75MxW0+VB34GsPBQA616krXremWYvCn3Rhi72GkPEzTtAWwObsb9GViIr56UsUKOr3qjfiSCdMhtyyBQBxF95zMSrfTOOyQftWzY8gol6rYPW3xnBDmRjx9EnpmWM=
Received: from DM6PR06CA0041.namprd06.prod.outlook.com (2603:10b6:5:54::18) by
 DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.25; Sat, 18 Nov 2023 13:54:53 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:54:cafe::8f) by DM6PR06CA0041.outlook.office365.com
 (2603:10b6:5:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26 via Frontend
 Transport; Sat, 18 Nov 2023 13:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Sat, 18 Nov 2023 13:54:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 18 Nov
 2023 07:54:52 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 18 Nov 2023 07:54:48 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<sbinding@opensource.cirrus.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v10 0/8] spi: Add support for stacked/parallel memories
Date: Sat, 18 Nov 2023 19:24:38 +0530
Message-ID: <20231118135446.52783-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|DS7PR12MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0e9b43-8583-4340-331c-08dbe83df0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2Pn0EjEp6+PwCRxgRfXKmnSHbkJVAO4Jr/YmHwbqLpV79gYPqBFUjNrBJuM4Erv3MhXcV9xJ0I1Hg6wBqar9/GrFAC6CSrI6fuZLnTSccn5mdOV5LxZFFXq4W/WgWae0fuz/L+N8p+j5fYLTVp7rhRsDE4AFD5m0l8Z55uHKMMxvpKZc9ETkO0VVcx6cYCpZDyTQafkvhqp9Z4U0VVZuE2idQEXgxR15h9BFffTRBiTGLv+WR9p0vD5+NXgsVlHyeOR2UiIm17Lwu6BwN2cGNfJupJcg+ne/dDJRMa1xbvduzqANRHX1Xk7rLabGFir/7FFXTeqTVuQWLlOThWSeVD7a48p/bODEeKBmGOlirOUdV/vTLB2XyGOgp0QZoZZI1LdTEo83tCNoz1aP40Jj+z/AxVrvI6PUaqkMhxDnnQYQl70edqjN++x9zWcZGj3lpHZLVkWJ78+W4cocTQLS6/mrFLLx/bapr9KR/NaFTwrkL6bLZ/hl/WR4yXi/tSm66IlRnMwolL536ecqxR+qghRvDQIYMjxtGrsp4+g6nz7Dvs8t1cBUM13GHwas/rJ+JvOXoOo8V4MmT9UtE0haNJyy5d8Mrr8DyUcBBV0Owy3uuNlmzJgW+kzv8SXZbIXxgVd0lvUiCDYMhgwEwaFDXRvDOgFTjWPiDFVTXtd/kEeOT+6zJXYzJ1k0aAmFfrDPoI+D6HxxZp7u7wwLZ4BCClGt4f4Rysq7MrtQUphtR8QLobZmXQE+gNrqnooXN1l58q2C57az/7rD14xpOTanJaTd0I51V1Fe6gWsNE0NZYV0+5mBgWA+yS84uEMDHvdU+b9zmeAroAN2r1Dl2IbVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(47076005)(1076003)(81166007)(2616005)(356005)(40460700003)(36860700001)(41300700001)(426003)(336012)(83380400001)(36756003)(26005)(82740400003)(4326008)(8676002)(8936002)(40480700001)(7416002)(5660300002)(478600001)(86362001)(966005)(70206006)(70586007)(6666004)(2906002)(110136005)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 13:54:53.3822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0e9b43-8583-4340-331c-08dbe83df0db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_055508_501966_4F0D4BDE 
X-CRM114-Status: GOOD (  23.07  )
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

This patch is in the continuation to the discussions which happened on
'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
adding dt-binding support for stacked/parallel memories.

This patch series updated the spi-nor, spi core and the AMD-Xilinx GQSPI 
driver to add stacked and parallel memories support.

The first nine patches
https://lore.kernel.org/all/20230119185342.2093323-1-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-2-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-3-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-4-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-5-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-6-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-7-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-8-amit.kumar-mahapatra@amd.com/
https://lore.kernel.org/all/20230310173217.3429788-9-amit.kumar-mahapatra@amd.com/
of the previous series got applied to
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
But the rest of the patches in the series did not get applied as failure 
was reported for spi driver with GPIO CS, so send the remaining patches 
in the series after rebasing it on top of for-next branch and fixing the 
issue.

CS GPIO is not tested due to unavailability of necessary hardware setup.
---
BRANCH: for-next

Changes in v10:
 - Rebased patch series on top of latest for-next branch and fixed
   merge conflicts.

Changes in v9:
- Updated 1/8 patch description to add an high-level overview of 
  parallel(multi-cs) & stacked design.
- Initialized all unused CS to 0xFF.
- Moved CS check from spi_add_device() to __spi_add_device().
- Updated __spi_add_device() to check to make sure that multiple logical CS 
  don't map to the same physical CS and same physical CS doesn't map to
  different logical CS.
- Updated 1/8, 5/8 & 7/8 to support arbitrary number of flash devices 
  connected in parallel or stacked mode.
- Updated documentation for chip_select.
- Added a new spi-nor structure member nor->num_flash to keep track of the 
  number of flashes connected.
- Added a new patch in the series 4/8 to move write_enable call just before 
  spi_mem ops call in SPI-NOR.
- Added comments in SPI core & SPI-NOR.
- Rebased the patch series on top of the latest for-next branch.

Changes in v8:
- Updated __spi_add_device() and spi_set_cs() to fix spi driver failure
  with GPIO CS.
- Rebased the patch series on top of latest for-next branch and fixed 
  merge conflicts.
- Updated cover letter description to add information regarding GPIO CS
  testing and request Stefan to provide his Tested-by tag for 1/7 patch. 
- Updated 1/7 patch description.

Changes in v7:
- Updated spi_dev_check() to avoid failures for spi driver GPIO CS and
  moved the error message from __spi_add_device() to spi_dev_check().
- Resolved code indentation issue in spi_set_cs().
- In spi_set_cs() call spi_delay_exec( ) once if the controller supports 
  multi cs with both the CS backed by GPIO.
- Updated __spi_validate()to add checks for both the GPIO CS.
- Replaced cs_index_mask bit mask with SPI_CS_CNT_MAX.
- Updated struct spi_controller to represent multi CS capability of the
  spi controller through a flag bit SPI_CONTROLLER_MULTI_CS instead of 
  a boolen structure member "multi_cs_cap".
- Updated 1/7 patch description .

Changes in v6:
- Rebased on top of latest v6.3-rc1 and fixed merge conflicts in
  spi-mpc512x-psc.c, sfdp.c, spansion.c files and removed spi-omap-100k.c.
- Updated spi_dev_check( ) to reject new devices if any one of the
  chipselect is used by another device.

Changes in v5:
- Rebased the patches on top of v6.3-rc1 and fixed the merge conflicts.
- Fixed compilation warnings in spi-sh-msiof.c with shmobile_defconfig

Changes in v4:
- Fixed build error in spi-pl022.c file - reported by Mark.
- Fixed build error in spi-sn-f-ospi.c file.
- Added Reviewed-by: Serge Semin <fancer.lancer@gmail.com> tag.
- Added two more patches to replace spi->chip_select with API calls in
  mpc832x_rdb.c & cs35l41_hda_spi.c files.

Changes in v3:
- Rebased the patches on top of
  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
- Added a patch to convert spi_nor_otp_region_len(nor) &
  spi_nor_otp_n_regions(nor) macros into inline functions
- Added Reviewed-by & Acked-by tags

Changes in v2:
- Rebased the patches on top of v6.2-rc1
- Created separate patch to add get & set APIs for spi->chip_select &
  spi->cs_gpiod, and replaced all spi->chip_select and spi->cs_gpiod
  references with the API calls.
- Created separate patch to add get & set APIs for nor->params.
---
Amit Kumar Mahapatra (8):
  spi: Add multi-cs memories support in SPI core
  mtd: spi-nor: Convert macros with inline functions
  mtd: spi-nor: Add APIs to set/get nor->params
  mtd: spi-nor: Move write enable inside specific write & erase APIs
  mtd: spi-nor: Add stacked memories support in spi-nor
  spi: spi-zynqmp-gqspi: Add stacked memories support in GQSPI driver
  mtd: spi-nor: Add parallel memories support in spi-nor
  spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver

 drivers/mtd/spi-nor/atmel.c      |  17 +-
 drivers/mtd/spi-nor/core.c       | 683 +++++++++++++++++++++++++------
 drivers/mtd/spi-nor/core.h       |   8 +
 drivers/mtd/spi-nor/debugfs.c    |   4 +-
 drivers/mtd/spi-nor/gigadevice.c |   4 +-
 drivers/mtd/spi-nor/issi.c       |  11 +-
 drivers/mtd/spi-nor/macronix.c   |  10 +-
 drivers/mtd/spi-nor/micron-st.c  |  35 +-
 drivers/mtd/spi-nor/otp.c        |  48 ++-
 drivers/mtd/spi-nor/sfdp.c       |  33 +-
 drivers/mtd/spi-nor/spansion.c   |  57 +--
 drivers/mtd/spi-nor/sst.c        |   7 +-
 drivers/mtd/spi-nor/swp.c        |  25 +-
 drivers/mtd/spi-nor/winbond.c    |   2 +-
 drivers/mtd/spi-nor/xilinx.c     |  18 +-
 drivers/spi/spi-zynqmp-gqspi.c   |  58 ++-
 drivers/spi/spi.c                | 192 +++++++--
 include/linux/mtd/spi-nor.h      |  21 +-
 include/linux/spi/spi.h          |  51 ++-
 19 files changed, 1016 insertions(+), 268 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
