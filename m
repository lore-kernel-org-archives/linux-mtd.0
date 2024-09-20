Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4379DC78820
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IvbIv+J/U6GeDrpPIwDHQUTqIoCSSOZFRGxtXCSVUrQ=; b=VN/v9lX+i0w36h
	fatfA37xFNBcIPH6OGdgYhfugzhNaiDUMBbpkWkxZq68zKTJce2FzRSs/ny+tvmLxCULCQ7FnS5kQ
	7ZxLFK47J5YOxcB7ZaHSSknW9g6LyazCiqlbqdp7bkQuddUoCHPDvTOJnOH/MmArXWSUejQUhCXLC
	Dn2Tcy06ljcmPVtVB1ZRLx5chEV+j9aFoVzn4fAySg4xnHi4gPQ1OEnzLjjl5ymgeO6SWO9fERLdL
	yWowmQSRowLSGy+ez/RALrETagyxDy6QK4TR9ZWJKBr7F9Si6/v91GdcsiGCP2SJrgd2x4wfIEKZ6
	M8W2aeyjRF2gjuQRGr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srbg2-0000000C4p0-1r3n;
	Fri, 20 Sep 2024 11:19:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srbf9-0000000C4Zi-0iqX
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 11:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3634A4322F;
	Fri, 20 Sep 2024 11:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42830C4CEC3;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726831137;
	bh=Gjm/OXw8AryyA1/fNIlK2HMCrdcZH4b/R9DMBkpA7VE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hb+QmlIKCvIlhOiJ9vJuC0V6H/rHbiy58toxZc5K+5tQu0I7fSwRy3IZMP3QHvZ1t
	 1xg6zfW3KK1EqUFc271G/q15ZeyeQFwAm/Da69vDCzoU6QgiXAHrog15V/wx9mqm0J
	 KA3njhNj85Ryt6A5BV/K9JztN5u0sfXucGC72Ec/YWlHUtzATkYDJ4vk1eJ2pxK5O5
	 kkJbwk4bMPiJ7jGpEK0mWwe0Mffpf30jkRWH/5Wj7hnnXJdFBdUm23JYd0M4dP4ouU
	 ak0vN//1/uN8GxPOp6YxK2M5UQAfal9p6/a9WcwYWvnEsCf2U58ZQNN5Vg38acCmTF
	 CEjCs/rRDSHxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E61C78829;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v9 0/2] Add support for Loongson-1 NAND
Date: Fri, 20 Sep 2024 19:18:52 +0800
Message-Id: <20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABxa7WYC/2WOzW7DIBAGXyXiXKzlpyzuqe9R5UDxYqPGUEFit
 Y387sVRq0TJZaXvMLNzZpVKpMpedmdWaIk15tRG/7RjfnJpJB6HtpkEqUEJww85p7HmJHhyaeC
 9VRIHRIJgWIM+C4X4dRG+7dsOJc/8OBVy/xoBz+1KLYXqsAfkgn/QeGq/up/t4+s4u3jofJ433
 xTrMZfvS99iNutfisT7lMVw4Bh6JYSnABJuTFvKgldcK3jAseEG0KJXQgen73F7xS3YB9w23Pd
 mIKeFfdfiFl/X9RdTr3CGagEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726831135; l=3339;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=Gjm/OXw8AryyA1/fNIlK2HMCrdcZH4b/R9DMBkpA7VE=;
 b=q7t6wP+CKt0Ahu7sAppj6dtSYbC4IZd4qMaPVejH+1Li+NItb/JHeT0K6k6juHKYOtWTBL7y0
 nA18aZZWJDoCFpw4Sx5CZYKjbUo3BnKJEoxZdcOzH85OT6WvzuMRuG/
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_041859_401471_5489D61D 
X-CRM114-Status: GOOD (  13.68  )
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
 drivers/mtd/nand/raw/loongson1_nand.c              | 824 +++++++++++++++++++++
 5 files changed, 908 insertions(+)
---
base-commit: 62f92d634458a1e308bb699986b9147a6d670457
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
