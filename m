Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A56C52D6F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ov6zigWd89W1HjEQghdIz/CbvqXCPwTK2p6qLOpfGt0=; b=oOSHUdQ+ngQp7R
	2OsQ1jPV0akIhk/Vl91v59jBadp9njQDSFLAssQEKot+ehasf/E1S//krAOV+dAuQDVAwp7FUs06n
	024gmQCaMzv4dR5f6ja6wzCJx4IVlVH0tcBj5OW78RZx3YFH1lZBCAwJ1VZ2K1itAvbU4oes5copD
	Ca6My4XpQdrQgPaDTQpHkU990HIBnAwZRkJqKONwUVmFwkdb70jFJXxQmy9aMRRAylSgeC4e4nQ6h
	0fZvscDYVxeXOoOgyEjcK/EqrYug/Orl4tmWG7Pld4LiPyJ0d8XPi/xRO4dgciZc5iNZtxN2OihOG
	eaD+h/QTLDwSXrb+tzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1E7-0000000834y-1waa;
	Thu, 08 Aug 2024 11:22:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1E4-0000000833u-0Tix
	for linux-mtd@lists.infradead.org;
	Thu, 08 Aug 2024 11:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E630660F12;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CF06C32782;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723116154;
	bh=nMJ5ipPoSCdCFITUI50B1DzMLqNTR5+6qqFehLh2juA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nr3n7KQ2+kM4cwrQfrHGiZhMd4ZA0TutIyGIvhnJmoHdHFt/PhTTpL2YHc27umXOg
	 mVnHwq9xTt8B6GmXJUshhiggxB/X8uefBjGdY1gcBlCELUD80sfmgAMxt5X7NidLWs
	 z5mfl5yX2KNUbjDOkIrw2YbHK2G1YZSnWM7Cu0+swKt9BoQYhI8ZXye/wU+DvT2NLk
	 3wwc9CBCtlBEjrAmxNF85LKeYeCN1WXg5cJB+BT1SuUJQozleISOIVvNlTrJ8WZmZu
	 8/xRueOPd96XPkRVqi/hXG1lFFE70D7gERNGddLsM+7uoYJKU/puxD63oHf2WWEH0F
	 HFKiXfev8RI1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769E1C3DA4A;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v8 0/2] Add support for Loongson-1 NAND
Date: Thu, 08 Aug 2024 19:22:18 +0800
Message-Id: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGqqtGYC/2WOzWrDMBAGXyXo3DWrn2jtnvIeoQdhr2zRWCpSY
 tIGv3vlkNLQXha+w8zOTRTOgYt43d1E5iWUkGId7ctO9JOLI0MY6hYKlUEtLZxSimNJUUJ0cYC
 u1YoGIkZvRYU+MvtwvQuPb3X7nGY4T5ndj0bivl5llNQNdUgg4Z3HS/3VfG0fD+Pswqnp07z5p
 lDOKX/e+xa7WR8piv6mLBYQyHdayp49KnwybSkL/eJG4z+cKm6RWuq1NN6ZZ3xd129Tf1ndKwE
 AAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723116152; l=2926;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=nMJ5ipPoSCdCFITUI50B1DzMLqNTR5+6qqFehLh2juA=;
 b=WB92qpooblzVPCarQF1A6FPBQnb0XnrAJ63g7qCkxT/suSwku8yX8VdaX8mMH9VODx+DbYpiq
 Pb5ZboQF8kRCSSQIZ4JjCPwzhzr7BrZ9/cmJf+dTMtp2F0vzqZ0Eyu4
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_042236_294677_73C196F6 
X-CRM114-Status: GOOD (  13.40  )
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
      mtd: rawnand: Add Loongson-1 NAND Controller driver

 .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml |  75 ++
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1_nand.c              | 818 +++++++++++++++++++++
 4 files changed, 901 insertions(+)
---
base-commit: 222a3380f92b8791d4eeedf7cd750513ff428adf
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
