Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBFCC47DD9
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9gq7vA8NIginmYNPpWg0HhdUbYkk1+5mMMg/bXMVoQc=; b=r9gLdVGy2oH/vl
	wJR+y8dNR8fJ0N1RqyF50sDO+JG1HPLOwso/hKAzSwMSieK4c6HIrSfgJtmLg9oTTFQI+z/7msF9m
	p9iUg/2rnnXon7ucPA8hP5JjPdM2T1gQoqn/PPSCjq6XywcdyToqHiRFUmN/TDEqWQM4E743scxnc
	cVPpvGJO6qvbxQO1jFt8CfT06EsluiUy9N/fSwbmsxoirzWywcF4nVvYRnH1kdekeSgB4d/K7V9Ow
	Yhx4B/YCzCZFBDf8wA4dD3IwFW8Kj0gEJE4G2HyDbeqZ4XL0Ovw+H08RdUOPgynkl/iBGW1DnXgEF
	JOH0iGpX/8v/QuFAFing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQmA-00000008Six-3tnY;
	Wed, 27 Mar 2024 10:44:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQm6-00000008Sfs-21jF
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 10:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64DCCCE25FE;
	Wed, 27 Mar 2024 10:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AC9AC433C7;
	Wed, 27 Mar 2024 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711536291;
	bh=5LDshXlu0PfiuyoM4qYt8E3ozT2zpeM2FAiCZBLBCNs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YcIj3Gx1N7OWP4vqM44BuQyumKsHRw6KseVbyAmED9ONAHzDYw/If8qCmwVIgm3t7
	 6s+BW6eutu/q6ksvVSX/clWxXSRPvZgfsPFurLBbOIJ2KJqG6LqA02wH8+gDaTcLet
	 a2vysw7wwWEqAjb7gs/Q/GwtzXtFGSjlheWsclE1zcNMCsIlQoP9dNQhUqpdTwczXu
	 io2bJFX2uCmSSZrrxPlYZgmf+SL8NM8f6wFd/1SmeC8OWJ/oXjLxI1M/7fVeoQN1T0
	 gjKNn1guYI+tg2MQ/qVuj7IjUG+qx74T0iai8lBTWyJbE3S5nNx/9GbE+q0bNbobFq
	 00pAfb5uSHVgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8813CCD11DF;
	Wed, 27 Mar 2024 10:44:51 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v6 0/3] Add support for Loongson-1 NAND
Date: Wed, 27 Mar 2024 18:43:58 +0800
Message-Id: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG74A2YC/zWNyw7CIBBFf6WZtUN4VLCu/A/jgpSBElswoMbY9
 N9FEzc3OYt7zgqVSqQKx26FQs9YY04N9K6DcbIpEEbXGCSXPVdC45xzCjUngckmh8NBSeOMIe4
 1tNOtkI+vn/B8aexLXvA+FbJ/jeD7trKXQjEzcIMCrxQercXe3+IpLDbObMwLbNsHP9fsmqAAA
 AA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711536289; l=2068;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=5LDshXlu0PfiuyoM4qYt8E3ozT2zpeM2FAiCZBLBCNs=;
 b=3RTvOkvFiswtfYQcWbIvcSER2itdIL0AeQVtEs/e5MrHwNDzLk5E+H6/2S30psHNXdtb6+jed
 pv25qL0eBUqAmGtwVhy5+Sj4Dx+dqMpuibTVWD+W7vTe++nIoskh5DK
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_034455_024441_9F177F64 
X-CRM114-Status: GOOD (  11.40  )
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

 .../devicetree/bindings/mtd/loongson,ls1x-nfc.yaml |  66 ++
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1_nand.c              | 748 +++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c                   |   5 +-
 include/linux/mtd/rawnand.h                        |   5 +
 6 files changed, 830 insertions(+), 2 deletions(-)
---
base-commit: 084c8e315db34b59d38d06e684b1a0dd07d30287
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
