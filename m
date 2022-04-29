Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE055C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IDx3KTzQ9OcvVR1hpq5v06JbJUxDOCiUsWb4vOnMJdc=; b=rDr4dGVyODK0vm
	nwQ/GnS1GsG+7spzkatrEXsS9hEXQFI8K20r72yHtCqZEhpUeXliZCE1dVbaBGFOkBAizD6GRzbsY
	OzX1tMSdPTVWSho6yZ1xInbon6rZTlsE1Bw9Gz3I7LJF7/syPb+HZ3WtoCgWzTNgPxTcM8TnVr2u1
	rwFTIGbqQ053MB/Mv5BD/ovsMty9ttnnKV0Nuv5VxetMHHfzScErLaQp4D3AQRgHnhmw4Erc5iVru
	OScs+zysm4zUJ3+Ty8klmXP8MXCOEi+9y4j23cbfc+EsKXPODxIRcdhxGVOhuMEk0CwxWj5moikmV
	Hg99K+s3GWr82odjVcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkOEv-00AtpZ-DN; Fri, 29 Apr 2022 10:52:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkOEo-00Atn3-67
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 10:52:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 411FDFF808;
 Fri, 29 Apr 2022 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651229552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=47f5CkZ51Myfo+gccHSm9Z0rncUryFnISEYnNJWOrTs=;
 b=UPGki2FZclsfBmCdsbMiTTjrDUacq2Si4WhmmKVZ1R3o+7OHmsZtSQ1bbqVfjnjvx53FER
 fFvOjtEqi5Et/H57h1hH4uM/tKH4mmhalyZjr9iJ3FxgLzIGtPHyveBTAooQFSIyXgSA6M
 2OTCwRT5cRI5BctQwaZ2d0jiiOngIuVMFM8qCPfGbYcFGDvk/U/x7yjTfseXkUOUW7oStI
 RYOrzljRIUAs2+X/PDsWHq0u1pJ6AQdtAK450uICdqrSDMjmbEXCxG0qSa7s/hxdMohL5d
 8IGDh/a25kXwzsQP1gXzcBXFLtv2kc8Qhb9WiMTUqFqPoMP6bm5XRu0HY8upJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] mtd: rawnand: renesas: Runtime PM use
Date: Fri, 29 Apr 2022 12:52:26 +0200
Message-Id: <20220429105229.368728-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_035238_415112_7ED854E7 
X-CRM114-Status: GOOD (  10.25  )
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

There was a small mistake when first introducing this controller driver:
the power-domain property was missing in the device tree because there
was only one controller supported at this time (UART) and this is a
Synopsis IP which did not support power domains. The idea is to always
use these power domains when available, so let's add it to the bindings,
the DT and use it from the driver through the runtimpe PM API instead of
doing raw clk API calls.

Miquel Raynal (3):
  dt-bindings: mtd: renesas: Fix the NAND controller description
  ARM: dts: r9a06g032: Fix the NAND controller node
  mtd: rawnand: renesas: Use runtime PM instead of the raw clock API

 .../bindings/mtd/renesas-nandc.yaml           |  5 ++
 arch/arm/boot/dts/r9a06g032.dtsi              |  1 +
 .../mtd/nand/raw/renesas-nand-controller.c    | 58 +++++++++----------
 3 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
