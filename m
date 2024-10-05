Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AB4CF8869
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2024 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WF8G/Pw7dx6bL63Eeo3ClkpOALiPSHRnbX0Pt40gcLM=; b=Ww58aJJC1Wudy0sDsGKGzBEtYU
	gzOfq6R12iFQwVqgBzCBXdvV3QoZOly/kpldO0hN8H/IN20VBkiky0cR8A66nyrV56iOcWRpUkPo9
	e4Eeg3BGOPKKqxKA62iZ0GGA7xIY5KnyyVE/CfG9oQDU4qO1HptsBlOnCotvftRFh99Y2/tvDYImv
	NoFeFvk/4Jgzodyu3H5fsT7YZMVxr1rsfiQxSJh+55cW7CZkw7iyr/8mH8XAm0UD8073P6LaVBchv
	6zF+4SO33GV3lPsdGgbp2xVivabH8SIjAmodVrHGye4Yz7WLk2S4fsfeBvkpROocppbZwgELIN/p3
	rJmGR5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swsyB-0000000EYT1-1XAB;
	Sat, 05 Oct 2024 00:48:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swsvf-0000000EY5V-0SUT;
	Sat, 05 Oct 2024 00:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9634AA441DA;
	Sat,  5 Oct 2024 00:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D340C4CEC6;
	Sat,  5 Oct 2024 00:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728089149;
	bh=D8THuL/WtjamRz9W5coZAbJh0EtstxtlVs5yWnjdESk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uKARuMy09Q0qxfk2hLo/lsJCQT/NM+khzdhiyM6w+mtS8zviqo4UBbJDBF98P8Wwd
	 jsTTIfqaD90nJcc+qR03NlkSHw7l29eLm/0q6TqZD/ZwlPZIpO5EGP5kmQqnqYQBdG
	 j7Yjr4ZrDUOPy2kf5PoSISmH2ZA0MMMK/BBbrlteWeZ4oshlKFDkL6rGBYxrEhSihJ
	 0ixbLATSjwhFXnIqvgS3rtAHPGRdHJktsqYpKpfvMOHaVMNR9N+97Ku/7a4wP26AaH
	 pDx17AqmbqfoC0qFh2JEgrGMHAY04nPlFnfTsbwEfn1/FgrpbRuVejpUdjbQZVVriL
	 OMVHSO67n5Bhw==
Date: Fri, 04 Oct 2024 19:45:47 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 "David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jakub Kicinski <kuba@kernel.org>, linux-mtd@lists.infradead.org, 
 Richard Weinberger <richard@nod.at>, 
 William Zhang <william.zhang@broadcom.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
Message-Id: <172808887889.121631.5291340274404319375.robh@kernel.org>
Subject: Re: [PATCHv2 0/5] devicetree: move nvmem-cells users to
 nvmem-layout
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_174551_651711_EFF53980 
X-CRM114-Status: GOOD (  11.60  )
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


On Thu, 03 Oct 2024 17:00:10 -0700, Rosen Penev wrote:
> The former has been soft deprecated by the latter. Move all users to the
> latter to avoid having nvmem-cells as an example.
> 
> v2: add missing semicolon to fix dt_binding_check
> 
> Rosen Penev (5):
>   ARM: dts: qcom: ipq4019: use nvmem-layout
>   arm64: dts: bcm4908: nvmem-layout conversion
>   arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
>   arm64: dts: mediatek: 7886cax: use nvmem-layout
>   documentation: use nvmem-layout in examples
> 
>  .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++-----
>  .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
>  .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
>  .../bcmbca/bcm4906-netgear-r8000p.dts         | 14 +++++----
>  .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
>  .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
>  6 files changed, 53 insertions(+), 43 deletions(-)
> 
> --
> 2.46.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y broadcom/bcmbca/bcm4906-netgear-r8000p.dtb marvell/armada-3720-gl-mv1000.dtb mediatek/mt7986a-acelink-ew-7886cax.dtb' for 20241004000015.544297-1-rosenp@gmail.com:

arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts:149.4-30: Warning (ranges_format): /bus@ff800000/nand-controller@1800/nand@0/partitions/partition@0:ranges: "ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
