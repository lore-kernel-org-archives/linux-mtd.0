Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C013C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NfT7ZecntS0aG02rrdIzk2VD/G7Kt9k0cTmQSjj+zEU=; b=tBrqUpXD7aQkCs
	Bf1AAjukcpH7cTaOGHX2DlD2DjNLJmFCkSG+Xzk8iTWlIbKBa44OSwdURKjBgjbEMX6o4tBfXIn0x
	1RgYMtl9r9rTwf+NzNDX1DulN5NATK1TXT55/TkFHVldBLRk1+NJxr4JKWulLqciLm8f1UOTIFZve
	sKeRfSwm4DsHzqgpICaW0Gj5+o18F48oLAX3ZaYFCpdSa3Xy7MM3GNIdfdCEOEgg7tAA8aXWnQnDi
	059Ckhyqc9fooc21LZRBF0OErKxQ0pA+BGI+XZthZZ1jOcUV9CT7ZnLyiuXurH5TJpxntuqQsd4dL
	zzIvwpt9yt1ov5traSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVBvR-001cPh-Ao; Fri, 18 Mar 2022 12:41:49 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBvD-001cLm-P1; Fri, 18 Mar 2022 12:41:37 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Fri, 18 Mar 2022
 20:41:26 +0800
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
Subject: [PATCH v3 0/2] refine the NFC clock framework
Date: Fri, 18 Mar 2022 20:41:18 +0800
Message-ID: <20220318124121.26117-1-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_054135_855189_4DF1CDAB 
X-CRM114-Status: UNSURE (   8.29  )
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

Background firstly, 
Both EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK' which is
defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is the divider and
bit6~7 is the mux for fix pll and xtal.
Previously a common MMC sub clock framework is implemented and shared by EMMC and
NAND, but that is coupling the EMMC and NAND, although EMMC and NAND is mutually
exclusive. see the link:
[https://lore.kernel.org/all/1jy23226sa.fsf@starbuckisacylon.baylibre.com/]
Now we plan to abandon common mmc sub clock framework and recovery the series.

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

Liang Yang (2):
  mtd: rawnand: meson: discard the common MMC sub clock framework
  dt-bindings: nand: meson: refine Amlogic NAND controller driver

 .../bindings/mtd/amlogic,meson-nand.txt       |  60 -----------
 .../bindings/mtd/amlogic,meson-nand.yaml      |  71 ++++++++++++
 drivers/mtd/nand/raw/meson_nand.c             | 101 +++++++++---------
 3 files changed, 124 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
