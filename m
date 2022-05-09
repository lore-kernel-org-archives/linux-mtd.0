Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE280C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K7kfmWgGMQ5gI7IxEEdDU7UR1EF4xSj3J894O3J5V5U=; b=xlHCJb2EF+KHou
	49/AhcbjRvbvq6V1Mt4Tdnzlgn6mdvUQAFYSTSbyiA9XS/LocS22E4D7u9vNuITaf2NAllOd5U+eP
	TOCfiEFcLIQOB6EOY9XAI0vOeGGS+jgL5KuDn2BueHw/LGdit17DxSJ2Lclzy87EL6Mth70Dlvyso
	onTSElCr9aqv0j1q48/XWZ6UEMQ+h82IS/GVHskmNbLTm7vT0oKXIU2CKiS/IKLPd6fDGc7shhPPy
	GCHoLhaNdzZyglmpPw9RiPt/JjFFOF7kurSJGCCtEKnYDsq4eZxzgOyNKYqu7JCO9af3QyNOhlEZa
	rznAh6EIXIunBzd50fQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no5dz-00FCkg-VS; Mon, 09 May 2022 15:49:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no5du-00FCha-Ui
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 15:49:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBE9CFF803;
 Mon,  9 May 2022 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652111386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mIquRG577JqEJQFRHPKavgPrOYAE9YyAjroW6Bm9Lt8=;
 b=KxqAo1RleezPKdee9P+jVaqAyQbjagyU8gaRVXDs4FXLK4B6FzQv2yjd1aHJLkmjG07OrJ
 ffUV3tzsSFEHDqZ6BEBlxRrK27uA0gWSbvbQmEmA4Dh6kFB2vuym4+SuDFBjbvrOtphu4Z
 iQFQmZgWfuB/0CsHuXxWBNhto1uv3SHroBgRZOon0MHdzmyf5QZTwEAsZh2ycSbP4WneDB
 Pv58t3m1SFOl1LVSVBPgH3AoHywPaRs12EeBfM8ia00TcGWvzNt7Yv9dywlKtnQ7fR7I1v
 k0+sSq837fgso/EVxl02udUfYyxU+jT4Jvkw5bs7JXR0MKJ+vLdDIxO1OGpxTw==
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
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] mtd: rawnand: renesas: Runtime PM use
Date: Mon,  9 May 2022 17:49:41 +0200
Message-Id: <20220509154943.25422-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_084951_198543_B206F15A 
X-CRM114-Status: GOOD (  11.65  )
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

Changes in v2:
* Dropped the DT patch merged by Geert.
* Used devm_pm_runtime_enable() instead of pm_runtime_enable() and
  dropped the pm_runtime_disable() calls.
* Used pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
* Collected the tags on the bindings.

Miquel Raynal (2):
  dt-bindings: mtd: renesas: Fix the NAND controller description
  mtd: rawnand: renesas: Use runtime PM instead of the raw clock API

 .../bindings/mtd/renesas-nandc.yaml           |  5 ++
 .../mtd/nand/raw/renesas-nand-controller.c    | 58 +++++++++----------
 2 files changed, 31 insertions(+), 32 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
