Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0EC28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=inDPumUYXKoyO+0gX6U+UEYdS766NSRfEqa4zqkqua0=; b=gC9FFju8SnJC3b
	HFZx+iB+F79e5u0zLh6vE1C5bvVhnBd/OvFDPDWocaHUKPhxTy2kcrZFDemjU0Aq8CeR7zO4sYHUs
	eG7cxQKe5GxBDFUqahL2ngzHQsYI95wv0xi2EiStcQClA+H6ycyZfWA3fy2lMiPt+pNh3KI4nWbiY
	OOCaS9oPypev6QkJ39QHOBXBfehntobULVrAys/VcvXLk+AUWY0E18zCNJqx4pnDOBVGRW0uToJ1U
	oNGKYFCcuvFVjr/n0LQ02NeuDFJ/MZa/giYIV3sXvtHapFr2+PGYewm0ONMG7aTtNDxKmPwGKVIL/
	EuVOguRgEyCxq4Vy1Pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDCM-0000000Bowq-3Q1a;
	Thu, 20 Mar 2025 10:32:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDCK-0000000Bovy-3RE2
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 10:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72B2F61134;
	Thu, 20 Mar 2025 10:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDF63C4CEDD;
	Thu, 20 Mar 2025 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742466743;
	bh=B13pFH7D4VtuN7xDuQk0J77vKE6wU3ix+q9mqc2aPoU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Aq7I16wYBIbhcg1Kh9KzJ53z0LgMG8D7Q4FyLSxytoFGNW3DWLCBib6+X2BZEc42e
	 kuJXbkS5nnDSEZd8LhyhBx00R7yW92FJcjsJmG+I3BASW+hMmBVifeouGyUMATXzaL
	 57Tcb/gbAbWs/aeJK9xZ13yj2iVw3Ch6WlW2cCX0mvHMJ1MxaDf68gDlnQwGY5Wc9A
	 gmCvA4QYyoklr9rdv2MpqqU9eApNGzllHCyJJi2YwNSJsKG0RxJXsUTmXEL+XKIiOF
	 3m4UNghmvWZhaFLvWIDGR6QnAncVUj5doZLrYpt1HSsAe48HKVoGBZqaEiC2xrsbuW
	 g65EaW52fsUMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CFBC28B30;
	Thu, 20 Mar 2025 10:32:23 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v14 0/2] Add support for Loongson-1 NAND
Date: Thu, 20 Mar 2025 18:31:36 +0800
Message-Id: <20250320-loongson1-nand-v14-0-2fef37c8607f@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIju22cC/2XQS07DMBCA4atUWeNqZvwcVtwDsXAcO41oE5SUC
 Kh6d5yKkireWLKl/5uRL9UUxy5O1fPuUo1x7qZu6PMF1dOuCgfft1F0TX6oCEiBRCOOw9C309C
 j6H3fCHaSbGNthGSqHH2MMXVfN/H1Ld/TOJzE+TBGf2cQdD5JEcq9ZbACxXtsP/Os/c8y8aU9+
 e64D8Np8Q7ddB7G79uCs1nUv1XIbleZjQBhE0vEEBMQPEjLKrNdcyWhyG3ODVhng0SVvNrmbs0
 duCJ3OQ9smugVulrhNuc1Zyqnc845BFuzVNqD3OYI/z0CUNEjZAAtGoopOYhUALgChOXvIWagN
 kxBO3aurguA7oCGLJQAZUBLDZaZmyi5AOQKSNAlIDPgde0DoZEYmkfger3+AlecnS+uAgAA
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742466741; l=5453;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=B13pFH7D4VtuN7xDuQk0J77vKE6wU3ix+q9mqc2aPoU=;
 b=9fAErtTyeoVuJCa0k/ynuOBwmenc/vyj4WZTo3dkesSwi8LgealQ2LsyDnMO7f7WGsLOwImD1
 jcIJ8RQszs5BjohLwS5o3txI0YFYwJ3QGT3JNCyx+E2sTxLqOeexfaT
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
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

Changes in v14:
- Clean up unnecessary print messages in the driver.
- Some minor related adjustments.
- Link to v13: https://lore.kernel.org/r/20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com

Changes in v13:
- Improve ls1x_nand_check_op() to cover all opcode checks and eliminate redundancy.
- Revert ls1x_nand_exec_op().
- Some minor adjustments.
- Link to v12: https://lore.kernel.org/r/20250121-loongson1-nand-v12-0-53507999de39@gmail.com

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
 drivers/mtd/nand/raw/loongson1-nand-controller.c   | 838 +++++++++++++++++++++
 5 files changed, 919 insertions(+)
---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
