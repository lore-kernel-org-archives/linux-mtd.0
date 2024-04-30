Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3CBC4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2024 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sZnTqCUhKyMN91xrBHr1fKv1ds5U5XWM+8f/lf6UxTk=; b=F4HuH+wcRGeNfh
	OXUMJHRc+wnkoK2AXQPv6mzgBKzq3Nm0D1oBgZJNMcFAv4E65MeRmSLHI5wXtNbQNtujTwe4xEQtQ
	srf5nlq3LKwH0bU6dQav4z9XuIhpnLpfJzVRBhShZ9mCXctUMuCDhP2Bum0kIDkS+NlU83HWrTj7X
	JHf8lyrVCwYVKzBBi04qzo3PyldRTX7D9Fd4BJNaSt5FvXrCh+b25wlhiVPENeTlZLbT3ZcglAI0q
	ONDmPdcUo5BC6BNFpS4hEGw7LNbyZ+yIrk68Xe5ZatapOtT+MD7bxCf4IbBSNw1wKbY8C9uaHOnUj
	Ux7ad9nbC5o8a5jXNGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lOg-000000068c9-33L9;
	Tue, 30 Apr 2024 11:11:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lOa-000000068Yz-0h5n
	for linux-mtd@lists.infradead.org;
	Tue, 30 Apr 2024 11:11:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7068CCE0F18;
	Tue, 30 Apr 2024 11:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 935B6C4AF19;
	Tue, 30 Apr 2024 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714475493;
	bh=OEZfaxKF5ZU2ktXmlXA2zI10IqUQ7mPBu+B5L+gYq0U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D/+3JsSU0ZQe9OSr8IWr+cPr6CkXLFAUYNYtgJfbLcYh3AA86hKZ+yKbekrEh2SO6
	 7HQ1PFkYANdVWbfnNdXnsxkEgETUrDOsScMOENfHxuLZIcRPpRtGyrzarEIDC3KfnS
	 3JAXcvv7tjbG1IxyC2IBA7VxtkSy9uYr4Hu1bAuO93xYHaF9fvfBWq9RvTRQJJiXE8
	 guicSscxoZKjjeuziQQ0klih8DNnYIoo1ttaWYpSMq3sEFi+ebupX6U7AYJq+JyXm+
	 4UP/oLqR1nbtzVEsHss79Tn5zCEpwip168GtFfR1tazMY10Pr1SuSwJoEa8ceASmVh
	 OZLDN08lowNCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82412C10F16;
	Tue, 30 Apr 2024 11:11:33 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v7 0/3] Add support for Loongson-1 NAND
Date: Tue, 30 Apr 2024 19:11:09 +0800
Message-Id: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM7RMGYC/12OzQ6CMBAGX8X07JL+YCuefA/DoYFtaYTWtEhUw
 rtbiCbGyyZz2PlmJgmjw0ROu5lEnFxywWdQ+x1pOu0tgmszE055SQWT0IfgbQqegde+heoouGq
 VQmokyU+3iMY9NuGlzmxiGGDsIuqvhtFDvrzkTBSqogoYXNHe81bxWhfPdtCuL5owrL7OpTHE5
 9Y3ydX6SeHqP2WSQEGZSjDWoKGc/pjqZVnemPQfiOwAAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714475491; l=2270;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=OEZfaxKF5ZU2ktXmlXA2zI10IqUQ7mPBu+B5L+gYq0U=;
 b=hwxNWFMKDlRXils8CJGuEeMePaS3aFaXpabooj7K3FH22BhA6kh2hIorxi51q3NMwq6ZjXOZY
 Kewg6Zw9t+vD2GXqyqj6rBUhb0xqT6M9rAKI5XP95b17Bx/XHjlcrfg
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_041136_951595_427468F4 
X-CRM114-Status: GOOD (  11.74  )
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
And modify nand_read_subpage() to allow subpage read by a single operation.

Changes in v7:
- Rename the file to loongson,ls1b-nfc.yaml
- Rename the dependency to LOONGSON1_APB_DMA
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
Keguang Zhang (3):
      dt-bindings: mtd: Add Loongson-1 NAND Controller
      mtd: rawnand: Enable monolithic read when reading subpages
      mtd: rawnand: Add Loongson-1 NAND Controller driver

 .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml |  66 ++
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1_nand.c              | 748 +++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c                   |   5 +-
 include/linux/mtd/rawnand.h                        |   5 +
 6 files changed, 830 insertions(+), 2 deletions(-)
---
base-commit: d04466706db5e241ee026f17b5f920e50dee26b5
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
