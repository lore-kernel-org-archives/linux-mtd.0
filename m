Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B34BC47258
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N8ExEfN/8/Dja7JaZkT9kTYDefxtoj2YtPicQZR7yBc=; b=VXCGDkB4MAVHCR
	U3FVMro40oUSZ9l5gIchJRWInHFbw3U3qYx2p85zlyWwuB1aET+YMVGdSOznbZ2JkwBs5vHMbF1X4
	rDXVAhRCFp+EUi0/CmEtlfGisChJBK06t9hiUj5lAf5BQkUFwQmJxzNskG6Cr5+YwrqKFW03im+5G
	J+jyRX8loG/KukHlyb3hIEIRllrXTq6wmrS5GJEtoe81BYN0iH1d+XHOo0Nmj68NjNBiilHCreir0
	0BYtUTJFN8mnBpBZc/ck7EOuZ0pxw/G6OPUdxbsPCTBYbVNKq5MAS91khtzZxemYnqflRImZ7F9ii
	tXaB7uLA1ovH9+iOvVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb5-001Fbr-2H;
	Wed, 24 Jan 2024 03:06:39 +0000
Received: from mail-oa1-f99.google.com ([209.85.160.99])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb0-001FWb-0f
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:37 +0000
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-214917ed35aso637853fac.2
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065530; x=1706670330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7KxdgIABAQGBD38+JxvgSmrGDmsE+8Sj0czftnrUzU=;
        b=Ia8TSqbpz2qmZTJB9PYtX4bNEDrs6LM2TIiZwLnDjrI3h5GsjwlLA4BvYkeZwzYEbG
         9UtDAm64jinhCJRRot60YG31I6Tv+o/5veVZnNMiuEoM7KNscTTC9BnlVln4sxJ70HyV
         fw2ItuU6zN0NvNLTjCLgpDc7Cs0Fkxn/Mw4TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065530; x=1706670330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7KxdgIABAQGBD38+JxvgSmrGDmsE+8Sj0czftnrUzU=;
        b=Ibp0R9bDDvLkVNycOOYoCe6DXp+SAnNEW1d8YmE+UndlCjpXxJElSeR4RBd9blYSwv
         anSPMYeYeI3YKLnLXlWqTx1Z+gxMeyTYNTTxuSgcFDR/y052TP/k97/bop0ZownKCF/r
         om/E+NArDNnCGqgN8OQKrB43jC6zs5HUDCq3Q2hMN3Xg11veFkZNLlfHwXo2eIFzFOvH
         WIFaZeNbla9VRh3SCnEGTdicKq8P7Jva4sopQtAvfvwOfNalTsuoGVnZLtCbIiJg9Ira
         AvXCocN2ycmHqPThuPSYGTwlrYN1cMct6q5HXolQuv460Fmd/vK8vqgNooB3vZOjh6Xu
         0zeA==
X-Gm-Message-State: AOJu0Yy558CGihE42/5MgqDmYOIDLIOmdVCdFv2HQuBy5B8p4WWK6yHb
	XAlNGkwHAwkqtDWlDSICQdNr2SSANcwKfbRZ5kuuwzMiPOcwYWLhd2hzqu40xHEga3t+VgvG/OK
	yky4FTvR/36svx1CfkV17PVhbC5EWQQ==
X-Google-Smtp-Source: AGHT+IEJxubg1f0YZ0+rItm2W/njIh4Ow/SOhAglwE4uM77J3dRR0uKAb7I+RPN4THEmri6Sp3Ho+paKfgBN
X-Received: by 2002:a05:6871:b07:b0:210:9789:7457 with SMTP id fq7-20020a0568710b0700b0021097897457mr2828052oab.99.1706065530407;
        Tue, 23 Jan 2024 19:05:30 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: dregan@broadcom.com,
	dregan@mail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	computersforpeace@gmail.com,
	kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com,
	baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: [PATCH v3 00/10] mtd: rawnand: brcmnand: driver and doc updates
Date: Tue, 23 Jan 2024 19:04:48 -0800
Message-Id: <20240124030458.98408-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190634_279479_6163F15F 
X-CRM114-Status: GOOD (  17.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch series is an update from the previous version [1] after
exex_op support and fixes (patch 1 to 4 from the previous version.)

It updates all the BCMBCA SoC to support the nand controller and add
functions to handle BCMBCA specific needs on ECC and Write Protection
usage. The device tree document is also updated accordingly with the new
properties needed by the driver.

In addition there is a bug fix for exec_op helper functions and on-die ECC.

[1] https://lore.kernel.org/lkml/20230606231252.94838-1-william.zhang@broadcom.com/

Changes in v3:
- Update brcm,nand-use-wp description
- Revert the description change to BCM63168 SoC-specific NAND controller
- Updated bcmbca_read_data_bus comment

Changes in v2:
- Revert the new compatible string nand-bcmbca
- Drop the BCM63168 compatible fix to avoid any potential ABI
Incompatibility issue
- Simplify the explanation for brcm,nand-use-wp
- Keep the interrupt name requirement when interrupt number is specified
- Add nand controller node label for 4908 so it is consistent with other
SoC's and can be referenced by board dts file
- Drop the is_param argument to the read data bus function now that we
have the exec_op API to read the parameter page and ONFI data
- Minor cosmetic fixes
- Added patches 8, 9, 10 to patch series

William Zhang (7):
  dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
  ARM: dts: broadcom: bcmbca: Add NAND controller node
  arm64: dts: broadcom: bcmbca: Add NAND controller node
  mtd: rawnand: brcmnand: Rename bcm63138 nand driver
  mtd: rawnand: brcmnand: Add BCMBCA read data bus interface
  mtd: rawnand: brcmnand: Add support for getting ecc setting from strap
  mtd: rawnand: brcmnand: Support write protection setting from dts

David Regan (3):
  mtd: rawnand: brcmnand: exec_op helper functions return type fixes
  mtd: rawnand: brcmnand: update log level messages
  mtd: rawnand: brcmnand: allow for on-die ecc

 .../bindings/mtd/brcm,brcmnand.yaml           |  37 ++++-
 arch/arm/boot/dts/broadcom/bcm47622.dtsi      |  17 ++
 arch/arm/boot/dts/broadcom/bcm63138.dtsi      |  10 +-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi      |  17 ++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi      |  17 ++
 arch/arm/boot/dts/broadcom/bcm6756.dtsi       |  17 ++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi       |  17 ++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi       |  17 ++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi       |  17 ++
 arch/arm/boot/dts/broadcom/bcm947622.dts      |   4 +
 arch/arm/boot/dts/broadcom/bcm963138.dts      |   4 +
 arch/arm/boot/dts/broadcom/bcm963138dvt.dts   |  12 +-
 arch/arm/boot/dts/broadcom/bcm963148.dts      |   4 +
 arch/arm/boot/dts/broadcom/bcm963178.dts      |   4 +
 arch/arm/boot/dts/broadcom/bcm96756.dts       |   4 +
 arch/arm/boot/dts/broadcom/bcm96846.dts       |   4 +
 arch/arm/boot/dts/broadcom/bcm96855.dts       |   4 +
 arch/arm/boot/dts/broadcom/bcm96878.dts       |   4 +
 .../boot/dts/broadcom/bcmbca/bcm4908.dtsi     |   5 +-
 .../boot/dts/broadcom/bcmbca/bcm4912.dtsi     |  17 ++
 .../boot/dts/broadcom/bcmbca/bcm63146.dtsi    |  17 ++
 .../boot/dts/broadcom/bcmbca/bcm63158.dtsi    |  17 ++
 .../boot/dts/broadcom/bcmbca/bcm6813.dtsi     |  17 ++
 .../boot/dts/broadcom/bcmbca/bcm6856.dtsi     |  17 ++
 .../boot/dts/broadcom/bcmbca/bcm6858.dtsi     |  17 ++
 .../boot/dts/broadcom/bcmbca/bcm94912.dts     |   4 +
 .../boot/dts/broadcom/bcmbca/bcm963146.dts    |   4 +
 .../boot/dts/broadcom/bcmbca/bcm963158.dts    |   4 +
 .../boot/dts/broadcom/bcmbca/bcm96813.dts     |   4 +
 .../boot/dts/broadcom/bcmbca/bcm96856.dts     |   4 +
 .../boot/dts/broadcom/bcmbca/bcm96858.dts     |   4 +
 drivers/mtd/nand/raw/brcmnand/Makefile        |   2 +-
 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c |  99 ------------
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c   | 126 +++++++++++++++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 146 +++++++++++++++---
 drivers/mtd/nand/raw/brcmnand/brcmnand.h      |   2 +
 36 files changed, 578 insertions(+), 138 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
 create mode 100644 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c

-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
