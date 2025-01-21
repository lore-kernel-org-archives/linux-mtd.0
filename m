Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26990C0218B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2025 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jajP36DvqJMeI4mhk2IaOSotRgFk/2CZzcpIlth+Amo=; b=Ew7ahZe2SNiVoG
	WZ8qz+i3FaXpR7Ogwt5D9ls9r8B835IFDL68cMF9wwXLALePxiWeNPAiYEjatefRzPbjtty++WTS3
	bDgtZFzSDsQZUFR4CeaotBVhj/nAeFnm4s2GH5Q1Le/NpVgo9zBkvL/4mlYDYUalh2CqahepUey2Q
	KcdHMUqAlm/511ehL5y/PJ9uZFMXDLtBT4k0bz62CBI9i/eouhI7+55FaBqRF5msUnyDB5G14G40a
	JqpDgRT5uOiD9anHldaOSYlph4xVKfC2drC1iMpMCybRAMQg5ixKaIwLjFiTSFroIiWwsjxV7ORk8
	f7VRNcoXeX8yfueUGehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBX7-00000007aMF-0uOf;
	Tue, 21 Jan 2025 10:30:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBVH-00000007Zr4-1Tdx
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jan 2025 10:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D780A5C137C;
	Tue, 21 Jan 2025 10:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06E20C4CEDF;
	Tue, 21 Jan 2025 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737455342;
	bh=oivwy9+4kGQkax+o5jgP32thBf0RIS9UWK8V65d5szY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oJaGVCbLtUjlfF1//SG67/GLR2zmP9kVigrkfGzgqUDSkH3staRGnXOI4AZBACcjy
	 rjsFqAam8xMaNEFkBFV4Kb7op0JuzcRv+Y+vZPp2iaS5dfaA6uTHemN5mmcLWtT1w7
	 VwAgjwDeW1n7jy91Lw7Bs4puEV8K/k+6V/KSOPULbKekk4lz6aFyBBXZ/1A2cp088S
	 ozKySWoNjawlJocJB6sUNFRRWuznMeIDinGwzlbJ7gkThCbiEbiE/8ujkK1zjSS5XR
	 O0Egru2Xxrg9uo6q50iPfGII3GglaCJx+OM0qNtZgw1EPtM/7yJzitfdBk/fnB90rf
	 CJOYQEoV4S3/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA1C02182;
	Tue, 21 Jan 2025 10:29:01 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v12 0/2] Add support for Loongson-1 NAND
Date: Tue, 21 Jan 2025 18:27:32 +0800
Message-Id: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJR2j2cC/2XQwW7DIAyA4Vepch6VbQiGnvYe0w6EQIrWhinpo
 m1V332k2pYquSCB9P22uFZjGFIYq8PuWg1hSmPKfbkgPe0qf3R9F0Rqy0NFQAokanHKue/G3KP
 oXd8KayRxyxwg6qqg9yHE9HkvvryWexzyWVyOQ3B/GYS6nKQI5Z4tsEDxFrqPMmv/PU987s4un
 fY+n+feMY2XPHzdF5z0XP1dhXi9yqQFCI5WIvoQgeChNK8y8cKVhA3nwjWwYS9RRafW3CzcgNl
 wU7i3ug1OoWkUrrlduKXtdFu49Z4bK1XtQK45wr9HANp4hBJARk0hRgOBNgFcAoTb30MsgUZb8
 rWxxjTNY+B2u/0A1DkVaywCAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737455340; l=4993;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=oivwy9+4kGQkax+o5jgP32thBf0RIS9UWK8V65d5szY=;
 b=MsUPB4i4S7yu8Uk5FlADyWlCzsWLQoj5ZaysLkj0GIJQnHLTYXdTynJDkLRJGUTS9DIt+unm+
 og82OQVl91zCJrecL5qg2jEB3C+TVvN3gkicUA67x5xaQfPZKwZGshB
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_022903_478685_46363802 
X-CRM114-Status: GOOD (  17.49  )
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

Changes in v12:
- Add MTD label in the example.
- Use MTD label for mtd->name instead of hardcoded assignment.                                                                                               
- Removed redundant fields addr1_reg and addr2_reg from struct ls1x_nand_op.
- Introduced .set_addr in struct ls1x_nand_host to replace the previous .parse_address,
  and improve its logic using regmap_update_bits() to avoid restoring the row address.
- Improve the logic of ls1x_nand_check_op() to eliminate repetitive checks.
- Add ECC engine type check in ls1x_nand_attach_chip().
- Some minor improvements.
- Link to v11: https://lore.kernel.org/r/20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com

Changes in v11:
- Remove the requirement for 'nand-use-soft-ecc-engine' and 'nand-ecc-algo'.
- Add 'reg-names' to support DMA address.
- Move the DMA address to DT.
- Rename the source file to 'loongson1-nand-controller.c'.
- Improve the logic of ls1x_nand_op_cmd_mapping().
- Improve the logic of ls1x_nand_check_op() to exclude unsupported cases.
- Substitute 'host' for the improper term 'nfc'.
- Some minor fixes and adjustments.
- Link to v10: https://lore.kernel.org/r/20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com

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

 .../mtd/loongson,ls1b-nand-controller.yaml         |  72 ++
 MAINTAINERS                                        |   1 +
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1-nand-controller.c   | 852 +++++++++++++++++++++
 5 files changed, 933 insertions(+)
---
base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
