Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B270DCCD1A5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eP3NGYugZZdscacFH+4pm/euh5uct7hl+XIAeTEkDgE=; b=TQXZFhKrpCoIWV
	xLR7sxGxwRy3Xt3yMAgyXYLlr93zZKtW4Kz7rVo+tGyGA4JlkYxzKmbsq2U+rfPQLT1oH6ae8qg4h
	N03Brip3/qCrh/whhK97g2tIH7Xaq/3uuTQigTQiskDI7JbmBJC1zqAdYivDcPasMasT3p4ObU4Xb
	7MQZNa0wj2Y482luM/yF5dIB0L2fwmxKIr3hoSM7weFOk36t9xsnnfTbTeM4La0eehSSVDmqq8n/l
	Xi6NcDrQVir7WSQpW2jGHc9p331m5JOGy0H0UGxRgoxM0CK2pZwaMO9NHyUEEk6gx0aO1AAun6G2n
	7MRL+vOnPkNzcthaPK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmty-0000000Cmlb-0dR4;
	Mon, 20 Oct 2025 10:14:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmtm-0000000CmY5-1sOX
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 10:13:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7ECC1A1537;
	Mon, 20 Oct 2025 10:13:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A4E2606D5;
	Mon, 20 Oct 2025 10:13:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D13A2102F0848;
	Mon, 20 Oct 2025 12:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760955225; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TlgpiaXdHomM8CcSygjkcn+ee6YskO7bh1LOyxfaLSg=;
	b=ldFkaM6PGz+ac5R4MZPS60mfQ9HDzcx+xxSA3NPHxzeUgZaAWD9aTF6JyjF3jn9Sq3CXC1
	yARRrNWWVsKOko+v3UN86GXnql17r07oqn9n02MWHO11q10p6lohMAeWfnkjgzRi/XK2U2
	dg/MZHh4DlwySBRqxGn0qsWMClTtoY5TbMXO/mgE2FIVV6+3BS9mOLSVPvO0P54URLuEiK
	HLV6FiDFqDpHbBwe+sGJvHd8IoOCrvGAS8prcR+0JC4MySY2ZafezqXWlJwG6KBhfq3HDq
	diI/vkxLXKRTLUax5YZG23/mde3hMjTg7L76MGRlETd4mvOFxydDO7vPg6p5Fw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 00/15] Introduce Allwinner H6/H616 NAND controller support
Date: Mon, 20 Oct 2025 12:12:56 +0200
Message-ID: <20251020101311.256819-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_031354_614047_1758BC34 
X-CRM114-Status: GOOD (  13.65  )
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

Hi everyone,

This patch series introduce H6/H616 NAND controller support (but not yet
the DMA/MDMA part).

All the work was done on a H616 board with a Kioxia TC58NVG1S3HTA00 NAND
chip.
ECC is supported, as well as scrambling.

H6 SoC has not been tested, but it shares all registers with H616, plus
some registers dedicated to Embedded Crypto Engine that H616 lacks.

This IP has quite some register fields modified from the A10/A23, but in
the end, it works more or less the same.
Main differences with A10/A23 are:
- The need for 2 more clocks (for ECC and MBUS)
- The use of a new USER_DATA_LEN register
- More ECC strengths (44, 52, 68, 72, 76 and 80 bits / 1KB)
- MDMA based on chained buffers
- some registers layouts have changed (mainly due do the stronger ECC)

Patch 1 removes a superfluous call, and is independent from the others.

Patches 2-12 are paving the way to the introduction of H616 NAND
controller support.
They are small, without functional change and easier to review than a
big patch.
They move a fixed value (register offset, field mask, SRAM size) into
the struct sunxi_nfc_caps when this value is different on H6/H616.

Patch 13 introduces the support for H6/H616 NAND controller.

Patch 14 introduces allwinner,sun50i-h616-nand-controller compatible
in order to differentiate from the A10 and A23.

Patch 15 adds the NAND controller node to sun50i-h616.dtsi

Changes from v2:
- add missing 'status = "disabled";' in nand controller node.
- factorize back clock/clock-names in binding.
- pick-up reviewed-by

Changes from v1:
- reorder patches to have dtsi/bindings patches at the end.
- reorder nand-controller and pins nodes to respect the order.
- add /omit-if-no-ref/ on pins that may be unused.
- remove pinctrl from nand controller node (this should be added to device
 DT).
- rework dt binding.
- fix H616 comment on chained descriptors support.
- add missing mbus_clk description.
- make ECC clock mandatory for H6 (because it's indeed mandatory).
- harmonize new clock retrieving error messages with older ones.
- harmonize commits subjects (mtd: rawnand: sunxi).
- reword commit messages to use imperative mood.
- pick-up reviewed-by

Thanks Krzysztof, Jernej and Chen-Yu for the reviews!

Regards,
Richard

Richard Genoud (15):
  mtd: rawnand: sunxi: Remove superfluous register readings
  mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_ecc_err_cnt in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_user_data in sunxi_nfc_caps
  mtd: rawnand: sunxi: rework pattern found registers
  mtd: rawnand: sunxi: add has_ecc_block_512 capability
  mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce random en/dir in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_pat_id in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce sram_size in sunxi_nfc_caps
  mtd: rawnand: sunxi: Add support for H616 nand controller
  dt-bindings: mtd: sunxi: Add H616 compatible
  arm64: dts: allwinner: h616: add NAND controller

 .../mtd/allwinner,sun4i-a10-nand.yaml         |  41 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  52 +++
 drivers/mtd/nand/raw/sunxi_nand.c             | 350 +++++++++++++++---
 3 files changed, 395 insertions(+), 48 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
