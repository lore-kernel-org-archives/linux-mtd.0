Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3121C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 14:15:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AF76144B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82AF76144B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMPRMwdcbmFT1Q3zWy1AfIbvcNDYka4XTrsBq1SByoA=; b=gwQSh95ALDDChrVBj+uHzp2ycH
	S0ZiNibD3kd5T8xLUfgC5Ng0pKkKwInwOcXRKeWFHKJY28Iy7jEiQhQ6IHrbb1mF3MNpUcEkOqf1f
	VyfZZJMjHI3hUZD8YxLzJQEYfpZXQkYsZCNGZG0TQt0KeuMJP8WpDHLPpfvBTKcxlJ8k/tW3vATjH
	mXeFs/RzxNtCeXmUApZ8CqPuylQPMcBmzhYNIXDotM2e6JYPA5J+LkK6lwDfaxG6pz+1uVU/ayJYZ
	RKLUzbFPbGoKZEybkEUx+2wlHA5AEaPYVrgpDBMYNjw36gRqCJxE43Z5L7vL56fPIr+k0sHm8/Sum
	gL6ql3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyazW-00EJLw-C8; Wed, 30 Jun 2021 14:15:02 +0000
Received: from regular1.263xmail.com ([211.150.70.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyajD-00EEAp-TV; Wed, 30 Jun 2021 13:58:17 +0000
Received: from localhost (unknown [192.168.167.225])
 by regular1.263xmail.com (Postfix) with ESMTP id E996AE2D;
 Wed, 30 Jun 2021 21:58:06 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.73] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31200T139970222221056S1625061484141554_; 
 Wed, 30 Jun 2021 21:58:05 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <355a8d1c07372b95a3f7e6af800a3092>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: linux-clk@vger.kernel.org
X-RCPT-COUNT: 18
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 00/10] Add Rockchip SFC(serial flash controller)
 support
To: linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 jbx6244@gmail.com, hjc@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, macroalpha82@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 linux-clk@vger.kernel.org
References: <20210630134702.7346-1-jon.lin@rock-chips.com>
From: Jon Lin <jon.lin@rock-chips.com>
Message-ID: <7aff22d7-f644-1494-9c60-ae8a25d01d50@rock-chips.com>
Date: Wed, 30 Jun 2021 21:58:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210630134702.7346-1-jon.lin@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_065812_597510_13B7D034 
X-CRM114-Status: GOOD (  40.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


At the first, I sincerely apologize for frequent submission.

The frequent submission is mainly due to:
1. I'm too anxious to incorporate my personal code into Chris's code
2. Unfamiliar with upstream and not careful enough

I will sum up more experience and make more exchanges with my colleagues.


On 6/30/21 9:46 PM, Jon Lin wrote:
> Changes in v10:
> - Fix dma transfer logic
>
> Changes in v9:
> - Separate DMA IRQ setting and wait_completion from DMA fifo transfer
>    function to make dma_status_poll be possible(Which I will implement
>    in u-boot)
> - Add SFC Kconfig detail comment
> - Separate FDT binding docs and includes from rk3036 sfc_hclk patch
> - Separate FDT binding docs and includes from rk3036 sfc_hclk patch
>
> Changes in v8:
> - Fix indent 4 to 2 in yaml
>
> Changes in v7:
> - Fix up the sclk_sfc parent error in rk3036
> - Unify to "rockchip,sfc" compatible id because all the feature update
>    will have a new IP version, so the driver is used for the SFC IP in
>    all SoCs
> - Change to use node "sfc" to name the SFC pinctrl group
> - Add subnode reg property check
> - Add rockchip_sfc_adjust_op_size to workaround in CMD + DUMMY case
> - Limit max_iosize to 32KB
>
> Changes in v6:
> - Add support in device trees for rv1126(Declared in series 5 but not
>    submitted)
> - Change to use "clk_sfc" "hclk_sfc" as clock lable, since it does not
>    affect interpretation and has been widely used
> - Support sfc tx_dual, tx_quad(Declared in series 5 but not submitted)
> - Simplify the code, such as remove "rockchip_sfc_register_all"(Declared
>    in series 5 but not submitted)
> - Support SFC ver4 ver5(Declared in series 5 but not submitted)
> - Add author Chris Morgan and Jon Lin to spi-rockchip-sfc.c
> - Change to use devm_spi_alloc_master and spi_unregister_master
>
> Changes in v5:
> - Add support in device trees for rv1126
> - Support sfc tx_dual, tx_quad
> - Simplify the code, such as remove "rockchip_sfc_register_all"
> - Support SFC ver4 ver5
>
> Changes in v4:
> - Changing patch back to an "RFC". An engineer from Rockchip
>    reached out to me to let me know they are working on this patch for
>    upstream, I am submitting this v4 for the community to see however
>    I expect Jon Lin (jon.lin@rock-chips.com) will submit new patches
>    soon and these are the ones we should pursue for mainlining. Jon's
>    patch series should include support for more hardware than this
>    series.
> - Clean up documentation more and ensure it is correct per
>    make dt_binding_check.
> - Add support in device trees for rk3036, rk3308, and rv1108.
> - Add ahb clock (hclk_sfc) support for rk3036.
> - Change rockchip_sfc_wait_fifo_ready() to use a switch statement.
> - Change IRQ code to only mark IRQ as handled if it handles the
>    specific IRQ (DMA transfer finish) it is supposed to handle.
>
> Changes in v3:
> - Changed the name of the clocks to sfc/ahb (from clk-sfc/clk-hsfc).
> - Changed the compatible string from rockchip,sfc to
>    rockchip,rk3036-sfc. A quick glance at the datasheets suggests this
>    driver should work for the PX30, RK180x, RK3036, RK312x, RK3308 and
>    RV1108 SoCs, and possibly more. However, I am currently only able
>    to test this on a PX30 (an RK3326). The technical reference manuals
>    appear to list the same registers for each device.
> - Corrected devicetree documentation for formatting and to note these
>    changes.
> - Replaced the maintainer with Heiko Stuebner and myself, as we will
>    take ownership of this going forward.
> - Noted that the device (per the reference manual) supports 4 CS, but
>    I am only able to test a single CS (CS 0).
> - Reordered patches to comply with upstream rules.
>
> Changes in v2:
> - Reimplemented driver using spi-mem subsystem.
> - Removed power management code as I couldn't get it working properly.
> - Added device tree bindings for Odroid Go Advance.
>
> Changes in v1:
> hanges made in this new series versus the v8 of the old series:
> - Added function to read spi-rx-bus-width from device tree, in the
>    event that the SPI chip supports 4x mode but only has 2 pins
>    wired (such as the Odroid Go Advance).
> - Changed device tree documentation from txt to yaml format.
> - Made "reset" message a dev_dbg from a dev_info.
> - Changed read and write fifo functions to remove redundant checks.
> - Changed the write and read from relaxed to non-relaxed when
>    starting the DMA transfer or reading the DMA IRQ.
> - Changed from dma_coerce_mask_and_coherent to just
>    dma_set_mask_and_coherent.
> - Changed name of get_if_type to rockchip_sfc_get_if_type.
>
> Chris Morgan (8):
>    dt-bindings: rockchip-sfc: Bindings for Rockchip serial flash
>      controller
>    spi: rockchip-sfc: add rockchip serial flash controller
>    arm64: dts: rockchip: Add SFC to PX30
>    clk: rockchip:  add dt-binding for hclk_sfc on rk3036
>    arm: dts: rockchip: Add SFC to RK3036
>    arm: dts: rockchip: Add SFC to RV1108
>    arm64: dts: rockchip: Add SFC to RK3308
>    arm64: dts: rockchip: Enable SFC for Odroid Go Advance
>
> Jon Lin (2):
>    clk: rockchip: rk3036: fix up the sclk_sfc parent error
>    clk: rockchip: Add support for hclk_sfc on rk3036
>
>   .../devicetree/bindings/spi/rockchip-sfc.yaml |  88 +++
>   arch/arm/boot/dts/rk3036.dtsi                 |  42 ++
>   arch/arm/boot/dts/rv1108.dtsi                 |  37 +
>   arch/arm64/boot/dts/rockchip/px30.dtsi        |  38 +
>   arch/arm64/boot/dts/rockchip/rk3308.dtsi      |  37 +
>   .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  16 +
>   drivers/clk/rockchip/clk-rk3036.c             |   5 +-
>   drivers/spi/Kconfig                           |  12 +
>   drivers/spi/Makefile                          |   1 +
>   drivers/spi/spi-rockchip-sfc.c                | 681 ++++++++++++++++++
>   include/dt-bindings/clock/rk3036-cru.h        |   1 +
>   11 files changed, 956 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
>   create mode 100644 drivers/spi/spi-rockchip-sfc.c
>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
