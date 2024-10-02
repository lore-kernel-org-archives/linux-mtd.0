Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF8CF319D
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fFBpx97VpnIlIBONtzRwCuzDgtwZpiKjP8b/7vtEL0o=; b=Joez8E3+on0rt8
	/8gem+qcSB7JK/MwvB80nAf3MC3BETwJTYQY5zuicmIfXBcrtMBLh3747tZXCr63188i0r8U/s12C
	MrL0YEcFy+NAuiaOpJnDi94h2DmwUOjectUW9u+gFtk4/7iUMEA+Nwj/omjTTuPVKfUeD7iD+ZOYS
	n19LOAKaXE4nSbtCGBD5N9L5OxKK4xZfupVNNuqscNW+nONPh48XhGFKxMjE16NmOlCXCeudv8ROr
	pM0CJkGDe6Ut9N21Hrq6wYj1tjUbqHFxvIVrJXy2cLbQbiw1CZAMtbrT6VxZCvFWwXt/uBI41yJma
	6qZCtQ6K3UXDdmFlDUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svuRr-000000057bI-2zRT;
	Wed, 02 Oct 2024 08:11:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svuRo-000000057Yq-213n
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 08:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12667A43818;
	Wed,  2 Oct 2024 08:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04D41C4CEC5;
	Wed,  2 Oct 2024 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727856659;
	bh=78nozp/Mc27LH8gzkmfEGw4bmdaczO2JoemMKWTqfuM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jZIKvPnOEE7prazEgXSs6vnu0ylA6rLmfutcuHtTinDJvaNSt0LVBtTDOByY/4w+/
	 tgPtxWKnehZ65PvabEvZEixrTx/VpLrZnTRT7KushAW/BhAW4XxGMQUjmYuW4ldUI1
	 t3Ooo8mQI/4Lsib426C9wn4ZcngzQ53pYLXFfnVmDun0zK3ZydC4oC5Dcwmj+eeZG1
	 IHF+vKmFFS5nYHsbk64IkhgJRbeUt7T5fkgZiUH69C8sVI7lN1Dfgyp/PiTdjLKReK
	 k2X7CKh7pXtfULc1OWpTRal0CEtGZMcHPVwtUQ8g84aNxj8I5uqC2Re4Iiv7iZhC6e
	 ZpVIfwWCb61Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E629ECF319C;
	Wed,  2 Oct 2024 08:10:58 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v10 0/2] Add support for Loongson-1 NAND
Date: Wed, 02 Oct 2024 16:10:44 +0800
Message-Id: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAQA/WYC/2XOTW7DIBAF4KtErIs1/ISBrnqPKguCwUaNocKJ1
 Tby3YujVo7sDdIgfe+9Oxl9iX4kr4c7KX6KY8ypHgxeDsT1NnWexrZ+EA5cgmCKXnJO3ZgTo8m
 mlhotOLaIHoIiFX0WH+LXI/H9VO9Q8kCvffH2P4bBsb5cciYaNICU0Q/f3WpX87M0vnWDjZfG5
 WHJ6+N4zeX7MXBSS+rfFI7bKZOiQDEYwZjzATg8JS1TJly5FLDjWLkC1OgEk8HKLdcr16B3XFf
 ujGq9lUyfJdtys3LD9+2mcuMcno2QRwvimc/z/Au17NJxqgEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727856656; l=3730;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=78nozp/Mc27LH8gzkmfEGw4bmdaczO2JoemMKWTqfuM=;
 b=Oxe63gylG8lnRhj7McdoIlvfA4KFcZDbC9qmCo9II6XObHzTiFewE4kKx/2hBPpJ1K9suJZPx
 LJcBroLOp6dCIiZA4p2b9sa0ewHN2t+T+CyWOblDJI2txCZHblaZeat
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_011100_713822_FEAB2CA9 
X-CRM114-Status: GOOD (  14.63  )
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
Reply-To: keguang.zhang@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the driver and dt-binding document for Loongson-1 NAND.

Changes in v10:                                                                                                                                              
- Fix the build error reported by kernel test robot.
  Link: https://lore.kernel.org/oe-kbuild-all/202409220010.vctkHddZ-lkp@intel.com
- Link to v9: https://lore.kernel.org/r/20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com

Changes in v9:
- Change the compatible to 'loongson,ls1*-nand-controller'.
- Rename the dt-binding file to loongson,ls1b-nand-controller.yaml.
- Update MAINTAINERS file accordingly.
- Some minor adjustments.
- Rebasing due to recent upstream changes.
- Link to v8: https://lore.kernel.org/r/20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com

Changes in v8:
- Add a description part.
- Adjust the compatible because the match data for ls1c-nfc differs from ls1b-nfc.
- Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
- Delete the superfluous blank lines.
- Drop NAND_MONOLITHIC_READ and add support for real subpage read instead.
- Simplify the logic of ls1b_nand_parse_address() and ls1c_nand_parse_address().
- Split ls1x_nand_set_controller() into ls1x_nand_parse_instructions()
  and ls1x_nand_trigger_op().
- Implement ls1x_nand_op_cmd_mapping() to convert the opcodes instead of forcing them.
- Add ls1x_nand_check_op().
- Remove struct ls1x_nand after moving its members to struct ls1x_nfc.
- Add the prefix 'LS1X_' for all registers and their bits.
- Drop the macros: nand_readl() and nand_writel().
- Some minor fixes and improvements.
- Link to v7: https://lore.kernel.org/r/20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com

Changes in v7:
- Rename the file to loongson,ls1b-nfc.yaml
- Rename the Kconfig dependency to LOONGSON1_APB_DMA
- Link to v6: https://lore.kernel.org/r/20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com

Changes in v6:
- Amend Kconfig
- Add the dt-binding document
- Modify nand_read_subpage() to allow subpage read by a single operation
- Add DT support for driver
- Use DT data instead of platform data
- Remove MAX_ID_SIZE
- Remove case NAND_OP_CMD_INSTR in ls1x_nand_set_controller()
- Move ECC configuration to ls1x_nand_attach_chip()
- Rename variable "nand" to "ls1x"
- Rename variable "nc" to "nfc"
- Some minor fixes
- Link to v5: https://lore.kernel.org/all/20210520224213.7907-1-keguang.zhang@gmail.com

Changes in v5:
- Update the driver to fit the raw NAND framework.
- Implement exec_op() instead of legacy cmdfunc().
- Use dma_request_chan() instead of dma_request_channel().
- Some minor fixes and cleanups.

Changes in v4:
- Retrieve the controller from nand_hw_control.

Changes in v3:
- Replace __raw_readl/__raw_writel with readl/writel.
- Split ls1x_nand into two structures:
ls1x_nand_chip and ls1x_nand_controller.

Changes in v2:
- Modify the dependency in Kconfig due to the changes of DMA module.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Keguang Zhang (2):
      dt-bindings: mtd: Add Loongson-1 NAND Controller
      mtd: rawnand: Add Loongson-1 NAND Controller Driver

 .../mtd/loongson,ls1b-nand-controller.yaml         |  75 ++
 MAINTAINERS                                        |   1 +
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1_nand.c              | 825 +++++++++++++++++++++
 5 files changed, 909 insertions(+)
---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
