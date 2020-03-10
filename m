Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB63BC10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 01:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCD12465A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 01:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpfG6GA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCD12465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=H1XXI28JXh7axdXI3QVcdHmsmuCOXEBJrm3aJAtFNlg=; b=cpf
	G6GA3P38jAAAMDJnnH6M069sYgsZYe70YMqOmvirds5UGoZDxgw7TVdASA72HRQq1NERkMu5JMPgC
	MgqQ7sOG35vGEgStpUrKu0ALwVohBdm2TBKZxm+pi4KP/XhvbtLViH6oUbq1/VHMHW1q3EdOoHa5a
	ruhY4/TWDLACObOQGsj3XyJJK6M4vjfa9lph8ZW+1Cew2KUDq9b2bsARYW2v6d86sGpMEmiwu1TEX
	5cH935Jlz+HtR8RAiHLcHp42VITifLuCiH7+tgmonzDN3epOd54N2gd467IxSAxqq7MQItcT4MUFS
	uTiMaEEPwjPQNhPwedhafoyIbOfUJHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBU4T-00048b-93; Tue, 10 Mar 2020 01:52:37 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBU4Q-000489-AN
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 01:52:35 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 18:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="265455423"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2020 18:52:28 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, vigneshr@ti.com, robh+dt@kernel.org
Subject: [PATCH v12 0/4] spi: cadence-quadspi: Add support for the Cadence
 QSPI controller
Date: Tue, 10 Mar 2020 09:52:09 +0800
Message-Id: <20200310015213.1734-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_185234_371007_97A330B4 
X-CRM114-Status: GOOD (  17.71  )
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
 simon.k.r.goldschmidt@gmail.com, dinguyen@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cheol.yong.kim@intel.com, cyrille.pitchen@atmel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 david.oberhollenzer@sigma-star.at
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for the Cadence QSPI controller. This controller is
present in the Intel Lightning Mountain(LGM) SoCs, Altera and TI SoCs.

This driver does not support generic SPI and also the implementation
only supports spi-mem interface to replace the existing driver in
mtd/spi-nor/cadence-quadspi.c, which supports SPI-NOR memory.

So we have decided that adapt spi-mem framework with existing driver 
to support SPI-NOR and SPI-NAND flash memories.

changes from v11
 -- Boris suggested to split the patches
 -- split 3 patches like below  
    i) spi-mem adaptation
    ii) convert the existing drivers to spi based.
    ii) add intel changes to above 2 patches.
 -- Rob's build issue resolved
 
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

Ramuthevar Vadivel Murugan (4):
  dt-bindings: spi: Add schema for Cadence QSPI Controller driver
  mtd: spi-nor: add spi-mem support in cadence-quadspi controller driver
  spi: cadence-quadspi: Add support for the Cadence QSPI controller
  spi: cadence-quadspi: Add qspi support for Intel LGM SoC

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ---
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 127 ++++
 drivers/mtd/spi-nor/Kconfig                        |  11 -
 drivers/mtd/spi-nor/Makefile                       |   1 -
 drivers/spi/Kconfig                                |  10 +
 drivers/spi/Makefile                               |   1 +
 .../spi-cadence-quadspi.c}                         | 643 ++++++++++-----------
 7 files changed, 442 insertions(+), 418 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
 rename drivers/{mtd/spi-nor/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (73%)

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
