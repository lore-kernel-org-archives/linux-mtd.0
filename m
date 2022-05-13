Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C65BC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L8e8VSCD1iDJqx4oMOURrtETtL8wO4ExjdiDnolsdnQ=; b=sgkClP5vJhpl0P
	N9TXvRpGloSq9ieFf+t+8ZBLbgm/dpANga9HClSRloBasqB7yl4swrxEpLuTIm43sBqSp1lL6EkVp
	uYdfpQq3G7/oNEXp6LkDxBe92Kb1RJDK0gGJhDhe5AR6wQ5Vq4h5yMUzXH590J2N90SoT0wBZZbpv
	tT0A2PE7c8OI575Z+BRX7ZmiZdPozQ7QZs638reiFIqrrfdPczHSsOjArlrY71V8BgdTc3friu8+Y
	D7CoJWLAWT8l1xbB/L9BSzaIdhjnUjrzrQlAAUaMr8yV+Z+2IoMtOm1ErO7+20v917vsN+iTD9qRP
	GxxTM8BeJef1hq/Nm5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npUVR-00G2tt-Qu; Fri, 13 May 2022 12:34:53 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npUUn-00G2Sp-Vg; Fri, 13 May 2022 12:34:15 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Fri, 13 May 2022
 20:32:42 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 0/4] fix the meson NFC clock
Date: Fri, 13 May 2022 20:34:00 +0800
Message-ID: <20220513123404.48513-1-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_053414_116009_549AF43C 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
a common MMC and NAND sub-clock was discussed and planed to be implemented
as NFC clock provider, but now this series of patches of a common MMC and
NAND sub-clock are never being accepted and the current binding was never
valid. the reasons are:
1. EMMC and NAND, which are mutually exclusive anyway
2. coupling the EMMC and NAND.
3. it seems that a common MMC and NAND sub-clock is over engineered.
and let us see the link for more information:
https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
so The meson nfc can't work now, let us rework the clock.

Changes since v4 [5]
 - split the dt binding patch into two patches, one for fixing, 
   clock, the other for coverting to yaml
 - split the nfc driver patch into two patches, one for fixing 
   clock, the other for refining the get nfc resource.

Changes since v3 [4]
 - use devm_platform_ioremap_resource_byname
 - dt_binding_check for mtd/amlogic,meson-nand.yaml

Changes since v2 [3]
 - use fw_name from dts, instead the wrong way using __clk_get_name
 - reg resource size change to 0x800
 - use reg-names

Changes since v1 [2]
 - use clk_parent_data instead of parent_names
 - define a reg resource instead of sd_emmc_c_clkc 

[1] https://lore.kernel.org/r/20220106033130.37623-1-liang.yang@amlogic.com
    https://lore.kernel.org/r/20220106032504.23310-1-liang.yang@amlogic.com
[2] https://lore.kernel.org/all/20220217063346.21691-1-liang.yang@amlogic.com
[3] https://lore.kernel.org/all/20220318124121.26117-1-liang.yang@amlogic.com
[4] https://lore.kernel.org/all/20220402074921.13316-1-liang.yang@amlogic.com/

Liang Yang (4):
  dt-bindings: nand: meson: fix meson nfc clock
  mtd: rawnand: meson: fix the clock
  mtd: rawnand: meson: refine resource getting in probe
  dt-bindings: nand: meson: convert txt to yaml

 .../bindings/mtd/amlogic,meson-nand.txt       | 60 -------------
 .../bindings/mtd/amlogic,meson-nand.yaml      | 88 +++++++++++++++++++
 drivers/mtd/nand/raw/meson_nand.c             | 86 +++++++++---------
 3 files changed, 130 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
