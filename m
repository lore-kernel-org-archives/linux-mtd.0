Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA2DC4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:49:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B82223772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMOqWoaJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B82223772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UqTAcnlNptQIfifK1ANFaLrJrvyRssP8o94xgFUdwys=; b=iMOqWoaJdb/DL/dYnRRuzgdL3Y
	MJY4N3MzGnrglm0036/3m7+uH+UA7k9Mh+8Vko4ndQh11G2Ha30nvV3HnCS8Zb9B0lFc03zE6bC4y
	kB+0ZpGvMD8WpnQL3Ajg+d4lyDtEx22w5LmsOu/2T6cK8mlowc2JSvE3HJrn0z9LBBZ72IbsZawun
	/XDGTSnhe5cBNBcUoNqfGZiBHkzegNeQ9s550fs4EqWpc7VyvHTXFDrJpC99mIlhavHzcYszcyGOe
	bLBKT/RIJCOndV9f/C7vE7+bLvjHY58AlDo/gEVvvXIPZmc42yRPKGv6JLupkNloDcqg2fKTARQoY
	flJs4qCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMvx-0006RX-GF; Thu, 24 Sep 2020 08:48:57 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMvs-0006Pk-1f
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 08:48:53 +0000
IronPort-SDR: UpYsSqqy115RTHGiaik6F9M+k/XfFHtolfChYNcSYFUaRHK7q59Kdxu1K8RdGC+vikQP6GLerE
 PFkhttYOLUYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222732477"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="222732477"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 01:48:49 -0700
IronPort-SDR: qRQugmTYSlDosqV1VhzurUrQLCdp5Dc1aWIwtxj6kdcgk3buHuA/itcH2jEA2vvrkAkUfax6op
 1cRtMScztZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="335871733"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by fmsmga004.fm.intel.com with ESMTP; 24 Sep 2020 01:48:45 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: miquel.raynal@bootlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 0/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
Date: Thu, 24 Sep 2020 16:48:40 +0800
Message-Id: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_044852_292461_1CBB3B99 
X-CRM114-Status: GOOD (  23.95  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, christophe.kerello@st.com, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 "Ramuthevar, Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, qi-ming.wu@intel.com, robert.jarzmik@free.fr,
 piotrs@cadence.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds the new IP of Nand Flash Controller(NFC) support
on Intel's Lightning Mountain(LGM) SoC.

DMA is used for burst data transfer operation, also DMA HW supports
aligned 32bit memory address and aligned data access by default.
DMA burst of 8 supported. Data register used to support the read/write
operation from/to device.

NAND controller also supports in-built HW ECC engine.

NAND controller driver implements ->exec_op() to replace legacy hooks,
these specific call-back method to execute NAND operations.

Thanks Miquel, Boris, Andy, Arnd and Rob for the review comments and suggestions.
---
v14:
  - Address Andy's review comments
  - align the headers and revome Duplicates 
  - replcace numerical const values by HZ_PER_MHZ and USEC_PER_SEC
    defined macros
  - add dev_err_probe() api instead of legacy err check
  - add get_unaligned_le32() api instead of manual endiness
  - remove redudent check
  - split the lines logically in between and add require spaces
v13:
  - Address Miquel Raynal review comments
  - update the return type with variable 'ret'
  - handle err check statement properly
  - change the naming convention aligned with recently changed the naming
    around the data interface
    data structure and function names
  - replace by div 8 instead of <<4 in ecc calculation better code readability
  - handle check_only properly like existing drivers
v12-resend:
  - No Change
v12:
  - address Miquel Raynal review comments update
  - add/modify the comments for better understanding
  - handle the check_only variable
  - update the ecc function based on the existing drivers
  - add newline
  - verify that mtd->name is set after nand_set_flash_node()
  - add the check WARN_ON(ret);
v11-resend:
  - Rebase to v5.8-rc1
v11:
  - No Change
v10:
  - No Change
v9:
  - No change
v8:
  - fix the kbuild bot warnings
  - correct the typo's
v7:
  - indentation issue is fixed
  - add error check for retrieve the resource from dt
v6:
  - update EBU_ADDR_SELx register base value build it from DT
  - Add tabs in in Kconfig
v5:
  - replace by 'HSNAND_CLE_OFFS | HSNAND_CS_OFFS' to NAND_WRITE_CMD and NAND_WRITE_ADDR
  - remove the unused macros
  - update EBU_ADDR_MASK(x) macro
  - update the EBU_ADDR_SELx register values to be written
v4:
  - add ebu_nand_cs structure for multiple-CS support
  - mask/offset encoding for 0x51 value
  - update macro HSNAND_CTL_ENABLE_ECC
  - drop the op argument and un-used macros.
  - updated the datatype and macros
  - add function disable nand module
  - remove ebu_host->dma_rx = NULL;
  - rename MMIO address range variables to ebu and hsnand
  - implement ->setup_data_interface()
  - update label err_cleanup_nand and err_cleanup_dma
  - add return value check in the nand_remove function
  - add/remove tabs and spaces as per coding standard
  - encoded CS ids by reg property
v3:
  - Add depends on MACRO in Kconfig
  - file name update in Makefile
  - file name update to intel-nand-controller
  - modification of MACRO divided like EBU, HSNAND and NAND
  - add NAND_ALE_OFFS, NAND_CLE_OFFS and NAND_CS_OFFS
  - rename lgm_ to ebu_ and _va suffix is removed in the whole file
  - rename structure and varaibles as per review comments.
  - remove lgm_read_byte(), lgm_dev_ready() and cmd_ctrl() un-used function
  - update in exec_op() as per review comments
  - rename function lgm_dma_exit() by lgm_dma_cleanup()
  - hardcoded magic value  for base and offset replaced by MACRO defined
  - mtd_device_unregister() + nand_cleanup() instead of nand_release()
v2:
  - implement the ->exec_op() to replaces the legacy hook-up.
  - update the commit message
  - add MIPS maintainers and xway_nand driver author in CC
v1:
 - initial version


dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
---
v14:
  - No change
v13:
  - No change
v12-Resend:
  - No Change
v12:
  - No change
v11-resend:
  - No change
v11:
  - Fixed the compatible issue with example
10:
  - fix bot errors
v9:
  - Rob's review comments address
  - dual licensed
  - compatible change
  - add reg-names
  - drop clock-names and clock-cells
  - correct typo's
v8:
  No change
v7:
  - Rob's review comments addressed
  - dt-schema build issue fixed with upgraded dt-schema
v6:
  - Rob's review comments addressed in YAML file
  - add addr_sel0 and addr_sel1 reg-names in YAML example
v5:
  - add the example in YAML file
v4:
  - No change
v3:
  - No change
v2:
  YAML compatible string update to intel, lgm-nand-controller
v1:
  - initial version
 
Ramuthevar Vadivel Murugan (2):
  dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
  mtd: rawnand: Add NAND controller support on Intel LGM SoC

 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    |  99 +++
 drivers/mtd/nand/raw/Kconfig                       |   8 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/intel-nand-controller.c       | 750 +++++++++++++++++++++
 4 files changed, 858 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/intel-nand-controller.c

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
