Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A58BC64E90
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 10:02:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2AD12085B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 10:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wqSIdIlD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2AD12085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XN35ujvzwrFBAvUC/4Nlz071nVwu4YZvncO15MXwQI=; b=wqSIdIlDjTyR2D/Yi113s52ZrP
	5arl4ocfUABfWl/UNaENlGEKkoitYnz5XZOFRiftwJeUoVa+SLfqHT6YLmrRCYJDyaomDREpMnSjf
	/Kkc6si6cbGVIeLbHyB1n0vpYPwEDHr1Hvtgaf+lHUijXPIsr0edTj80FZPDSx+jTICx1aIyFNhV2
	Q4X2b+n1VqV0p8VUiavT5zSUuhnzSSVP9p0N8nJlzkwprH4LM0GcOUf6PjimxeoZ3LSVx0q1npBsz
	NWSvQ+e2jnRgpmtRr3CwF79r8I6FnC8nwxIsprhb0w3IGWmsT/6BbhdelM8kuvAY4aX5B74t+fUyt
	K1KHyzgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjfzo-0005PH-3T; Mon, 30 Nov 2020 10:01:24 +0000
Received: from lucky1.263xmail.com ([211.157.147.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjfzK-0005GU-Tr; Mon, 30 Nov 2020 10:00:57 +0000
Received: from localhost (unknown [192.168.167.32])
 by lucky1.263xmail.com (Postfix) with ESMTP id 6A886B693C;
 Mon, 30 Nov 2020 18:00:46 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P26666T140451562632960S1606730439337010_; 
 Mon, 30 Nov 2020 18:00:45 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <814f726f99261274f19fd6e8cbb2dfb3>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Yifeng Zhao <yifeng.zhao@rock-chips.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v15 0/8] Add Rockchip NFC drivers for RK3308 and others
Date: Mon, 30 Nov 2020 18:00:27 +0800
Message-Id: <20201130100031.22083-1-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_050055_482815_85F4E996 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Rockchp's NFC(Nand Flash Controller) has four versions: V600, V622, V800 and
V900.This series patch can support all four versions.


Changes in v15:
- Use a buffer pointer nfc->page_buf instead of the original two pointers.
- Fix coding style.
- Fix some comments.

Changes in v14:
- Add oob_read and oob_write hook api.
- Support timing config and ecc config for each chips.
- Fix some comments.

Changes in v13:
- The nfc->buffer will realloc while the page size of the second mtd
  is large than the first one.
- Fix coding style.
- Fix some comments.

Changes in v12:
- Fix some warnings while make dt_binding_check
- Drop a allOf defined

Changes in v11:
- Fix compile error.

Changes in v10:
- Fix compile error on master v5.9-rc7.

Changes in v9:
- The nfc->buffer will realloc while the page size of the second mtd
  is large than the first one
- Fix coding style.
- Remove struct rk_nfc_clk.
- Prepend some function with rk_nfc_.
- Replace function readl_poll_timeout_atomic with readl_relaxed_poll_timeout.
- Remove function rk_nfc_read_byte and rk_nfc_write_byte.
- Don't select the die if 'check_only == true' in function rk_nfc_exec_op.
- Modify function rk_nfc_write_page and rk_nfc_write_page_raw.

Changes in v8:
- Fix a error while make dt_binding_check

Changes in v7:
- Fix some wrong define
- Rebase to linux-next.
- Fix coding style.
- Reserved 4 bytes at the beginning of the oob area.
- Page raw read and write included ecc data.

Changes in v6:
- Fix some wrong define
- Modified the definition of compatible
- The mtd->name set by NAND label property.
- Add some comments.
- Fix compile error.

Changes in v5:
- Fix some wrong define.
- Add boot-medium define.
- Remove some compatible define.
- Add boot blocks support  with different ECC for bootROM.
- Rename rockchip-nand.c to rockchip-nand-controller.c.
- Unification of other variable names.
- Remove some compatible define.

Changes in v4:
- The compatible define with rkxx_nfc.
- Add assigned-clocks.
- Fix some wrong defineChanges in.
- Define platform data structure for the register offsets.
- The compatible define with rkxx_nfc.
- Use SET_SYSTEM_SLEEP_PM_OPS to define PM_OPS.
- Use exec_op instead of legacy hooks.

Changes in v3:
- Change the title for the dt-bindings.

Changes in v2:
- Fix compile error.
- Include header files sorted by file name.

Yifeng Zhao (8):
  dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash controller
  mtd: rawnand: rockchip: NFC drivers for RK3308, RK2928 and others
  MAINTAINERS: add maintainers to ROCKCHIP NFC
  arm64: dts: rockchip: Add NFC node for RK3308 SoC
  arm64: dts: rockchip: Add NFC node for PX30 SoC
  arm: dts: rockchip: Add NFC node for RV1108 SoC
  arm: dts: rockchip: Add NFC node for RK2928 and other SoCs
  arm: dts: rockchip: Add NFC node for RK3036 SoC

 .../mtd/rockchip,nand-controller.yaml         |  161 ++
 MAINTAINERS                                   |    4 +-
 arch/arm/boot/dts/rk3036.dtsi                 |   52 +
 arch/arm/boot/dts/rk3xxx.dtsi                 |    9 +
 arch/arm/boot/dts/rv1108.dtsi                 |   11 +
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   15 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |   15 +
 drivers/mtd/nand/raw/Kconfig                  |   12 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 .../mtd/nand/raw/rockchip-nand-controller.c   | 1500 +++++++++++++++++
 10 files changed, 1778 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
 create mode 100644 drivers/mtd/nand/raw/rockchip-nand-controller.c

-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
