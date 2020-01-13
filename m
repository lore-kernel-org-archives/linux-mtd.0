Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60587C33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 01:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31EAF2084D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 01:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKOQLfgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31EAF2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B89yxvBsmQOlgHLaR/niFehxf1YxdEw0EjZQ3Ug1uio=; b=UKOQLfggMcY/ncIYuOoLu4n3j
	dmGKpvnUl2xSiwANOPnKlZjFfljEs/WiiJzO8cOC71K4hvTHznEClcH6CzjUavmXyt0nofGIlLhit
	lz0neMcB2j5cPmD7Y2fvRwga+y+0J6zFKnC0CthbXDNSuisEVigE+AmVL2owghmV4RUfzCskCOX/A
	vHx6z/1TNrVGb+dLdXPBvB6KhOFTw1EJazR/rPO/sIz6YYaJNCIBGJ67a18pWtqFev7DCrsa/4k6p
	pDiHtwU7zDZisubThp7hDbj0JYOqkHHB28+DZ91xD6aVBzY7+FhedEHMw6/aGGyZFqetjJ6lZGoKF
	TNDpGm3HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqoxL-0002yO-08; Mon, 13 Jan 2020 01:55:51 +0000
Received: from lucky1.263xmail.com ([211.157.147.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqoxB-0002rl-SQ; Mon, 13 Jan 2020 01:55:43 +0000
Received: from localhost (unknown [192.168.167.32])
 by lucky1.263xmail.com (Postfix) with ESMTP id D031C4FED9;
 Mon, 13 Jan 2020 09:55:29 +0800 (CST)
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.37] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P42449T140532558391040S1578880527820565_; 
 Mon, 13 Jan 2020 09:55:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <94200a1cdef87e531379bdde04cd5b27>
X-RL-SENDER: shawn.lin@rock-chips.com
X-SENDER: lintao@rock-chips.com
X-LOGIN-NAME: shawn.lin@rock-chips.com
X-FST-TO: zyf@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: =?UTF-8?Q?Re=3a_=5bRFC_PATCH_v1_00/10=5d_Enable_RK3066_NANDC_for_MK?=
 =?UTF-8?B?ODA444CQ6K+35rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNl?=
 =?UTF-8?Q?s+shawn=2elin=3drock-chips=2ecom=40lists=2einfradead=2eorg?=
 =?UTF-8?B?5Luj5Y+R44CR?=
To: Johan Jonker <jbx6244@gmail.com>, miquel.raynal@bootlin.com
References: <20200108205338.11369-1-jbx6244@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <aad92eb5-00ed-5071-c206-491eff243537@rock-chips.com>
Date: Mon, 13 Jan 2020 09:55:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_175542_402669_71DA381E 
X-CRM114-Status: GOOD (  22.03  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+ Yifeng Zhao

On 2020/1/9 4:53, Johan Jonker wrote:
> DISCLAIMER: Use at your own risk.
> Status: For testing only!
> 
> Version: V1
> 
> Title: Enable RK3066 NANDC for MK808.
> 
> The majority of Rockchip devices use a closed source FTL driver
> to reduce wear leveling. This patch serie proposes
> an experimental raw NAND controller driver for basic tasks
> in order to get the bindings and the nodes accepted for in the dts files.
> 
> What does it do:
> 
> On module load this driver will reserve its resources.
> After initialization the MTD framework will then try to detect
> the type and number of NAND chips. When all conditions are met,
> it registers it self as MTD device.
> This driver is then ready to receive user commands
> such as to read and write NAND pages.
> 
> Test examples:
> 
> # dd if-/dev/mtd0 of=dd.bin bs=8192 count=4
> 
> # nanddump -a -l 32768 -f nanddump.bin /dev/mtd0
> 
> Not tested:
> 
> NANDC version 9.
> NAND raw write.
> RK3066 still has no support for Uboot.
> Any write command would interfere with data structures made by the boot loader.
> 
> Etc.
> 
> Problems:
> 
> No bad block support. Most devices use a FTL bad block map with tags
> that must be located on specific page locations which is outside
> the scope of the raw MTD framework.
> 


Hi Johan,

I loop in the author of the original NANDC driver who is now gonna to
develop a new version of NANDC driver in near future that supports more
features like bad block supoort. Maybe he could share his TODO.

> No partition support. A FTL driver will store at random locations and
> a linear user specific layout does not fit within
> the generic character of this basic driver.
> 
> Etc.
> 
> Chris Zhong (1):
>    ARM: dts: rockchip: add nandc node for rk3066a/rk3188
> 
> Dingqiang Lin (2):
>    arm64: dts: rockchip: add nandc node for px30
>    arm64: dts: rockchip: add nandc node for rk3308
> 
> Jianqun Xu (1):
>    ARM: dts: rockchip: add nandc nodes for rk3288
> 
> Johan Jonker (2):
>    dt-bindings: mtd: add rockchip nand controller bindings
>    ARM: dts: rockchip: rk3066a-mk808: enable nandc node
> 
> Jon Lin (1):
>    ARM: dts: rockchip: add nandc node for rv1108
> 
> Wenping Zhang (1):
>    ARM: dts: rockchip: add nandc node for rk322x
> 
> Yifeng Zhao (1):
>    mtd: nand: raw: add rockchip nand controller driver
> 
> Zhaoyifeng (1):
>    arm64: dts: rockchip: add nandc node for rk3368
> 
>   .../devicetree/bindings/mtd/rockchip,nandc.yaml    |   78 ++
>   arch/arm/boot/dts/rk3066a-mk808.dts                |    9 +
>   arch/arm/boot/dts/rk322x.dtsi                      |   11 +
>   arch/arm/boot/dts/rk3288.dtsi                      |   24 +
>   arch/arm/boot/dts/rk3xxx.dtsi                      |   11 +
>   arch/arm/boot/dts/rv1108.dtsi                      |   11 +
>   arch/arm64/boot/dts/rockchip/px30.dtsi             |   15 +
>   arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   11 +
>   arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   12 +
>   drivers/mtd/nand/raw/Kconfig                       |    8 +
>   drivers/mtd/nand/raw/Makefile                      |    1 +
>   drivers/mtd/nand/raw/rockchip_nandc.c              | 1224 ++++++++++++++++++++
>   12 files changed, 1415 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
>   create mode 100644 drivers/mtd/nand/raw/rockchip_nandc.c
> 
> --
> 2.11.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
> 
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
