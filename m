Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC4CC4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A3DF2467D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8wfQFJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A3DF2467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=M95ZWhhIlfuvywRNKS3SRmAGy17HHJYmvSSOkc9Ms0k=; b=a8w
	fQFJwQjn32JV+bOXoeKmYw5xQE69BZTH5sfrWAr4uOvmcmmEN7xZE4cMn1j7zexdRd9kHFDP5apSp
	DdnEejcx9DZxb9UtwgQZ45npr+HIGsLn+1RiUf6Cnxo035q+3TsXCTnQVURvkySWBD8vc+rmu7K56
	WbYPeweMWTNoasDV1DsvZxOloqJM69Ri+/U+WMHQVqQ/E8tH9FPV7MyF3N+e+PcjLtJ4cqzCnjCQY
	PcaJdyQw8nEQuWL5qbqppcE6rgIloUN0Lt5kAbotmiOJN46F5unqYEHJYLkJjQkgZ8NC/9Mr0HuLG
	i1Ch0/uu1AXd702cwXvXS2T7uZRvjhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Cdp-0005dA-RR; Thu, 27 Feb 2020 06:27:25 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Cdm-0005cV-4B
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 06:27:23 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 22:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="241942349"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga006.jf.intel.com with ESMTP; 26 Feb 2020 22:27:15 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, vigneshr@ti.com, robh+dt@kernel.org
Subject: [PATCH v11 0/2] spi: cadence-quadspi: Add support for the Cadence
 QSPI controller
Date: Thu, 27 Feb 2020 14:27:06 +0800
Message-Id: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_222722_181842_5DD5582F 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, tien.fong.chee@intel.com,
 tudor.ambarus@gmail.com, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 boris.brezillon@free-electrons.com, richard@nod.at, qi-ming.wu@intel.com,
 simon.k.r.goldschmidt@gmail.com, david.oberhollenzer@sigma-star.at,
 dinguyen@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cheol.yong.kim@intel.com, mark.rutland@arm.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for the Cadence QSPI controller. This controller is
present in the Intel Lightning Mountain(LGM) SoCs, Altera and TI SoCs.
This driver has been tested on the Intel LGM SoCs.

This driver does not support generic SPI and also the implementation
only supports spi-mem interface to replace the existing driver in
mtd/spi-nor/cadence-quadspi.c, the existing driver only support SPI-NOR
flash memory.

Thanks Mark Brown, Vignesh and Rob for the review, suggestion to optimize the patch.
Tested with mx25u12835f on LGM platform.

changes from v10
 -- Rob's review comments update in dt_schema yaml.
 -- add valid contraints constraints. 

changes from v9:
 -- Mark's review comments address
 -- add check to shared interrupt handler
 -- add check decoder if present
 -- add error check for quirks capability data
 -- remove the existing cadence_quadspi.c from drivers/mtd/spi-nor path
 -- remove CONFIG macro from Kconfig in the above path
 -- remove cadence_quadspi.o build option from Makefile in the above path

changes from v8:
 -- remove the depends MTD macro
 -- comment into C++ style
 -- remove spaces and tabs where not applicable.
 -- align the macro string as same as existing one.
 -- replace QUAD to op->data.buswidth variable.
 -- add CQSPI_NEEDS_ADDR_SWAP instead of soc_selection variable

changes from v7:
 -- remove addr_buf kept like as original
 -- drop bus-num, chipselect variable
 -- add soc_selection varible to differetiate the features
 -- replace dev->ddev in dma function
 -- add seperate function to handle the 24bit slave device address
    translation for lgm soc
 -- correct sentence seems incomplete in Kconfig
 -- add cqspi->soc_selection check to keep the original TI platform
    working code.

changes from v6:
 -- Add the Signed-off-by Vignesh in commit message
 -- bus_num, num_chipselect added to avoid the garbage bus number
    during the probe and spi_register.
 -- master mode bits updated
 -- address sequence is different from TI and Intel SoC Ip handling
    so modified as per Intel and differentiating by use_dac_mode variable.
 -- dummy cycles also different b/w two platforms, so keeping separate check
 -- checkpatch errors which are intentional left as is for better readability

changes from v5:
 -- kbuild test robot warnings fixed
 -- Add Reported-By: Dan Carpenter <dan.carpenter@oracle.com>

changes from v4:
 -- kbuild test robot warnings fixed
 -- Add Reborted-by: tag

changes from v3:
spi-cadence-quadspi.c
 -- static to all functions wrt to local to the file.
 -- Prefix cqspi_ and make the function static
 -- cmd_ops, data_ops and dummy_ops dropped
 -- addr_ops kept since it is required for address calculation.
 -- devm_ used for supported functions , removed legacy API's
 -- removed "indirect" name from functions
 -- replaced by master->mode_bits = SPI_RX_QUAD | SPI_TX_DUAL | SPI_RX_DUAL | SPI_RX_OCTAL;
    as per Vignesh susggestion
 -- removed free functions since devm_ handles automatically.
 -- dropped all unused Macros

YAML file update:
 -- cadence,qspi.yaml file name replace by cdns,qspi-nor.yaml
 -- compatible string updated as per Vignesh suggestion
 -- for single entry, removed descriptions
 -- removed optional parameters
  Build Result:
   linux$ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml dt_binding_check
    CHKDT   Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
    SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
    DTC     Documentation/devicetree/bindings/spi/cdns,qspi-nor.example.dt.yaml
    CHECK   Documentation/devicetree/bindings/spi/cdns,qspi-nor.example.dt.yaml


Ramuthevar Vadivel Murugan (2):
  dt-bindings: spi: Add schema for Cadence QSPI Controller driver
  spi: cadence-quadspi: Add support for the Cadence QSPI controller

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ---
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 142 +++++
 drivers/mtd/spi-nor/Kconfig                        |  11 -
 drivers/mtd/spi-nor/Makefile                       |   1 -
 drivers/spi/Kconfig                                |  10 +
 drivers/spi/Makefile                               |   1 +
 .../spi-cadence-quadspi.c}                         | 641 ++++++++++-----------
 7 files changed, 456 insertions(+), 417 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
 rename drivers/{mtd/spi-nor/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (73%)

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
