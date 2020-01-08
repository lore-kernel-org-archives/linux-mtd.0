Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09CCC33CA2
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9A520656
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rjRaTRKm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b31dMLyl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9A520656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=dXNTjeS0GWqaDc6ZyFTipQnG1F+EMzsbJQPtL7lpPgo=; b=rjR
	aTRKmFHS/1ucGnIhTVVSiPL+CzZ35YNZZOZidtWT1E8bpvIxOa9lubL7v2J4Qr81NifIxUuLG8VdK
	h8rvgDDFBZ3d7B4uT/3J+1aTGuFcaFbxSE2oromAHHzekM+JTxllP98453Pb1fEFtWxrq2rQbguJU
	zmJBd32XLXx/P5ztm3xO8VtAk4F1evExt3+Oh6tFvO+ktrfCGOxz5mKMOp6fuCUa0SMuzd1+dN1S9
	nDLLyZED8NmpBLuUBUix0S/rOTe2kLzVtF4U0cx9+c0QZIVXrRCpkqG0nL9bcZQkaN+PbAHrSa1xn
	UQuTvoW0NMx0MbiWK2dslTWwJ3fq6yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIKt-0006MP-1e; Wed, 08 Jan 2020 20:53:51 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKq-0006LL-95; Wed, 08 Jan 2020 20:53:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id j42so4855567wrj.12;
 Wed, 08 Jan 2020 12:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3med5z+Qa5fYXWFNKFb9s4Ru5QMDkS0db/NoqxQ+tPM=;
 b=b31dMLylORZPzTu3NbrFjCRxoutU2z1dGlKDedPHqnMbpFgeXoykIv0TukUhrvVmDl
 y+/6r4XwoWs9verWnMvsURKHCr249vQKjs7XMEzcTFIa2mVv9c8XtgJ94T37VF+3s3gw
 xLh4Ap+BdJc13VD1bu13fxAYEnbpRaRVY1HTgyUOVbwPEZzYQShJOqQhgvMhBwiD+cIU
 n6+lksUiXt65N6wLPCCUPNqlpKp/B6h9LHmLgR+/Na0NU80FsLG2t58CfHAaNwIDjivP
 27oK+8OyyLMIOcHpFMCU9pHblBaXg0VVkS4/b29yGucKMwBc2GxWqd0k3S6FBHYbmkiT
 cuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3med5z+Qa5fYXWFNKFb9s4Ru5QMDkS0db/NoqxQ+tPM=;
 b=QyVAcbAfQN1ZYBfN732bcDWMXCDkaSAXq9qQ+esEm1DBOTePnA7HEOoH4hQQofPhKg
 iMa9AQKKpYFddqUruw1HHoYE5CL1BBv6wn2wU3C65XYjh7uBhhe8aMGHEjMfvzEzp1xe
 EjWa+p0gOVeYtUjbi71OiktH2lemYQMmSQ9TaUM+2JNWm0jMp4dJodyXlNm9trNf4Bmh
 Bb2CMxkTEG3Nnn9sV1uuCWFMGBpTGxivTB9KgElA8jX+o2URU7/18htJ9qR7nzW42/2a
 AmXZclRZ58c5rbv6/PjCDaQkJMfNQvPWWtKYD7E5Q2MQbsQFKWebumzGJjkfMOD/D4Bo
 3B4g==
X-Gm-Message-State: APjAAAVD5PiqRPWwZ/DOKoMrB0aCP+JivXTy3B+cmt+hif8/73YItQ6v
 trpXDPFE++ZN9yF6aygpqfY=
X-Google-Smtp-Source: APXvYqz2vS9D0SjtKCJWnsLfha7RGe/V+cVD2jGWhMEYs7bYpm1daCxMBDF4+hA4fivk3kgxZxmc0Q==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr6734075wrp.1.1578516826138;
 Wed, 08 Jan 2020 12:53:46 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:45 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 00/10] Enable RK3066 NANDC for MK808
Date: Wed,  8 Jan 2020 21:53:28 +0100
Message-Id: <20200108205338.11369-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125348_359561_658E5846 
X-CRM114-Status: GOOD (  13.02  )
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
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DISCLAIMER: Use at your own risk.
Status: For testing only!

Version: V1

Title: Enable RK3066 NANDC for MK808.

The majority of Rockchip devices use a closed source FTL driver
to reduce wear leveling. This patch serie proposes
an experimental raw NAND controller driver for basic tasks
in order to get the bindings and the nodes accepted for in the dts files.

What does it do:

On module load this driver will reserve its resources.
After initialization the MTD framework will then try to detect
the type and number of NAND chips. When all conditions are met,
it registers it self as MTD device.
This driver is then ready to receive user commands
such as to read and write NAND pages.

Test examples:

# dd if-/dev/mtd0 of=dd.bin bs=8192 count=4

# nanddump -a -l 32768 -f nanddump.bin /dev/mtd0

Not tested:

NANDC version 9.
NAND raw write.
RK3066 still has no support for Uboot.
Any write command would interfere with data structures made by the boot loader.

Etc.

Problems:

No bad block support. Most devices use a FTL bad block map with tags
that must be located on specific page locations which is outside
the scope of the raw MTD framework.

No partition support. A FTL driver will store at random locations and
a linear user specific layout does not fit within
the generic character of this basic driver.

Etc.

Chris Zhong (1):
  ARM: dts: rockchip: add nandc node for rk3066a/rk3188

Dingqiang Lin (2):
  arm64: dts: rockchip: add nandc node for px30
  arm64: dts: rockchip: add nandc node for rk3308

Jianqun Xu (1):
  ARM: dts: rockchip: add nandc nodes for rk3288

Johan Jonker (2):
  dt-bindings: mtd: add rockchip nand controller bindings
  ARM: dts: rockchip: rk3066a-mk808: enable nandc node

Jon Lin (1):
  ARM: dts: rockchip: add nandc node for rv1108

Wenping Zhang (1):
  ARM: dts: rockchip: add nandc node for rk322x

Yifeng Zhao (1):
  mtd: nand: raw: add rockchip nand controller driver

Zhaoyifeng (1):
  arm64: dts: rockchip: add nandc node for rk3368

 .../devicetree/bindings/mtd/rockchip,nandc.yaml    |   78 ++
 arch/arm/boot/dts/rk3066a-mk808.dts                |    9 +
 arch/arm/boot/dts/rk322x.dtsi                      |   11 +
 arch/arm/boot/dts/rk3288.dtsi                      |   24 +
 arch/arm/boot/dts/rk3xxx.dtsi                      |   11 +
 arch/arm/boot/dts/rv1108.dtsi                      |   11 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   15 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   11 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   12 +
 drivers/mtd/nand/raw/Kconfig                       |    8 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/rockchip_nandc.c              | 1224 ++++++++++++++++++++
 12 files changed, 1415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
 create mode 100644 drivers/mtd/nand/raw/rockchip_nandc.c

--
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
