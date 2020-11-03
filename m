Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF75C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 07:58:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327D12222B
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 07:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2bUxFdzG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 327D12222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HpUx5qvnHozCIcb+DKgbMbzY053eney6C7DfDposR0s=; b=2bUxFdzG6nd06wBjYT3s49ferg
	ddQaesGfFIxdXC2lXaBA2ZnYpRB14c5zB7Yd/2oiE46A3T/8vGQL0XKxacrRso2MNrn+24q1KtUBX
	MFQc2WETy26PgMn7dnYewKIFj8lP006Np9hINaW3Ec47EIIM01InPS1wj0DKsnmiJXqCM6K8Olxtt
	LRiCTtgYaUVtwKjhr0MHYkfu2tlNJIWucXGqIrG1V9IwgWFDKb5E0j/yl8Db9bT3BC9eTybjbslwB
	gE7Jdq8n2WxT/zbPy8FRz+uWZKjgnLQB7ogWHgZR0OVLHWY7OhW2cLM8smaXjqJutF18pZ9i7fsdo
	gjoqX7rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrBl-000497-3u; Tue, 03 Nov 2020 07:57:09 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrBg-00047c-TK
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 07:57:06 +0000
IronPort-SDR: OIjy/xKN1QAzq0n6Jz16/skKf8AVZmzvSNGywbXZWQXdLIt91EEEnWdDLoQKl7M/GQfGb3i4g0
 r+o/7cFZhv6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169118371"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; d="scan'208";a="169118371"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 23:57:01 -0800
IronPort-SDR: vRrAit4sJJp4SKMMfiUJ3uFdVuX9DHmv0vKYy38mjSIoFpr2RT+DTPQl3hMsQuochB12ZICItq
 n0dKaPviluPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; d="scan'208";a="336416497"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga002.jf.intel.com with ESMTP; 02 Nov 2020 23:56:57 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com, tudor.ambarus@microchip.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org
Subject: [PATCH v16 0/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
Date: Tue,  3 Nov 2020 15:56:53 +0800
Message-Id: <20201103075655.18699-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_025705_172766_2F85CEA8 
X-CRM114-Status: GOOD (  24.24  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 richard@nod.at, simon.k.r.goldschmidt@gmail.com, dinguyen@kernel.org,
 qi-ming.wu@intel.com
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
v16:
  - address Miquel Raynal review comments update
  - modify the commit message
  - add unit for timeout_ms variable
  - insert nand_sdr_timings directly in the function instead 
    of adding helper function.
  - modify the code to handle single CS in probe
  - replace 'reg' property instead of 'nand,cs'
  - add 2 compatible strings generic one followed by intel,lgm-ebunand
Resend-v15:
  - Rebased to mtd/for-5.10
v15:
  - Address Miquel review comments update
  - add common helper function for status check for
    ebu_nand_waitrdy()
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
v16:
  - No change
resend-v15:
  - No change
v15:
  - No change
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
 drivers/mtd/nand/raw/intel-nand-controller.c       | 722 +++++++++++++++++++++
 4 files changed, 830 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/intel-nand-controller.c

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
