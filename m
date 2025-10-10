Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12954CAC5BB
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EQqACeA83oSOvKS0syCnv9nk+C5SgInrrB047//EIjg=; b=rJOepILXCtO7u8
	4vLSeHX92GGCoc4GE8BiJEiJcQ/APi7rQW5ziLM53ngiv08h+rKVh5BoQ9mg4nNvhhrmQHDkfZVMV
	Kmt/YYPC9qq9QxkJAHN2qC10oNkqxPKzbEkJ+xp8A/wHgkjPXu6iKnp6SR90iq4eC/wlyf3lkkj6b
	oor+4NlW/8buCootUulaFT4PjgVGyDyqTc62+SUdftHGWgeOvopyzHPevfGuUau4CFhxu/l7BTxD4
	QjMXv3DjLaE9V8/bKBWvhe9SbZ31e88qgZMjG0/lBdaz6o4uQHrdgFs3bS1rdJeBlb7lJBY5bSjPM
	1RT0nBHawoUl2Fw0K2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h0-000000081MB-1wYs;
	Fri, 10 Oct 2025 08:41:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78gw-000000081KV-2mHI
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:41:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CA104E40FCC;
	Fri, 10 Oct 2025 08:41:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20FCE60667;
	Fri, 10 Oct 2025 08:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35FFF102F21F6;
	Fri, 10 Oct 2025 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085686; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=VlNW7Be15vPzXytv5j+MryEbpzdAb9uI6s31TlFZlxk=;
	b=Lj2r5OGqlb6pAwKRb6ymYRsKb/WCiIrt5ExubUC7yOt0wyvxJ4w5iJ869x5DHqNWvNQfeM
	FSMCV7eBLKWlcScPxqAP1b4FEOL+DhOZbiFAkIO5S3aPcPLeN3oQKTqWiejlZn5KINLrwc
	06GDruTOHWg7A0NCjy81rtgJQ51o04bogC/WcemZEN+KSpKFOg7NAqm5E1WA3dK9E46eZe
	OdzyxpaKVs5qz4L/zKgsoN04U+iVN2Hb9O+nUGld5CydqxL0fT1Cgo5PaI+67AxwVNYYZd
	UDAaaqKmaVkiy/VUGMUvRhZPAP2Myzata1cZvomNiapd06GgqUaZdyEc6oSuag==
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
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 00/15] Introduce Allwinner H6/H616 NAND controller support
Date: Fri, 10 Oct 2025 10:40:27 +0200
Message-ID: <20251010084042.341224-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014134_829578_AB012AC8 
X-CRM114-Status: GOOD (  11.05  )
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

Patch 2 introduces allwinner,sun50i-h616-nand-controller compatible
in order to differentiate from the A10 and A23.

Patch 3 adds the NAND controller node to sun50i-h616.dtsi

Patches 4-14 are paving the way to the introduction of H616 NAND
controller support.
They are small, without functional change and easier to review than a
big patch.
They move a fixed value (register offset, field mask, SRAM size) into
the struct sunxi_nfc_caps when those values are different on H6/H616.

Patch 15 introduce the support for H6/H616 NAND controller.

Regards,
Richard

Richard Genoud (15):
  mtd: rawnand: sunxi: Remove superfluous register readings
  dt-bindings: mtd: sunxi: Add new compatible
  arm64: dts: allwinner: h616: add NAND controller
  mtd: nand: sunxi: move ecc strenghts in sunxi_nfc_caps
  mtd: nand: sunxi: introduce reg_ecc_err_cnt in sunxi_nfc_caps
  mtd: nand: sunxi: introduce reg_user_data in sunxi_nfc_caps
  mtd: nand: sunxi: rework pattern found registers
  mtd: nand: sunxi: add has_ecc_block_512 capability
  mtd: nand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps
  mtd: nand: sunxi: introduce random en/dir in sunxi_nfc_caps
  mtd: nand: sunxi: introduce reg_pat_id in sunxi_nfc_caps
  mtd: nand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
  mtd: nand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
  mtd: nand: sunxi: introduce sram_size in sunxi_nfc_caps
  mtd: rawnand: sunxi: Add support for H616 nand controller

 .../mtd/allwinner,sun4i-a10-nand.yaml         |  56 ++-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  50 +++
 drivers/mtd/nand/raw/sunxi_nand.c             | 342 +++++++++++++++---
 3 files changed, 390 insertions(+), 58 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
