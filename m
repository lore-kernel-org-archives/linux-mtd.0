Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VCeltWNXva4132v/AjC+tDZwlnlRRYRAXFKfF0ixYrI=; b=Y6wECIs7sCj+Dp
	Rdk8CgU4TTsIbDoX+qX3cod8GJiQ1NVbi58gXTg4AOByIKbj9LZsBZPubm3kXxoRekOX+0vfoak4E
	p7t1yoeKQDLpyO2FaartKDUhOucPJfl9Co845RHD07sELTT+MiEwrNiZrnMDpFPgW1nsKEwV6geG1
	6ZWjBBsBf1/ARdsJHnqFJ6M+bAz9ohRM+v002uXqk5/VipHJAJ+7/XvgT9xkuiX3tD01dplJ2jbtL
	9OpnOggnH8MnihXDu3WrVg3b964IoVe7V3jAz3fYtEizLyWhQqHyGwaOEEqGQzyCTtO9Q997ZtTJk
	X1q7IkEFF70SrA3G44mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npSs2-00FdnE-LG; Fri, 13 May 2022 10:50:06 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npSrz-00FdlE-LV
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 10:50:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 39E7BFF810;
 Fri, 13 May 2022 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652439000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EOnBw339JZrqM43NcFanIyq3YzXvKL8IR0/WPRtOnr0=;
 b=dv8mGuviAjL/9g1H1jG/m6wLkRB5Fon/bb3iJikEI9pBpc7sIRYSIhlw4CLq1bcPeRKp8J
 zcfF2vHZ7vFcNVU6FHOHY/mjLidppUFvu+qKU186e+5uDKWxo28ecJziCyOwE4oZQY4O8h
 UGJKQF1k9SW8Fyinwbzz5H9Tgamml4igqVoQSGpkGEZ15BrrWO7YCsTLL/lmi8/mLMInbV
 5/RJLACBjTJwv5fb/3ycAHohahCkEbZzRq+aSTzWjaDsY1dZrpJIR5BGkHvfrh8ZqZnoE5
 pGW637LNzfqY058RWJhu4z6Rmd830/bI7DbkDDtO67CXnxDRXXxFvkFX063trQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/2] mtd: rawnand: renesas: Runtime PM use
Date: Fri, 13 May 2022 12:49:55 +0200
Message-Id: <20220513104957.257721-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_035003_886591_5A72574E 
X-CRM114-Status: GOOD (  11.94  )
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

Changes in v4:
* Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().

Changes in v3:
* Moved the pm_runtime calls earlier in the probe to avoid possible
  register accesses while the clocks have not yet been enabled.
 
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
 .../mtd/nand/raw/renesas-nand-controller.c    | 51 +++++++++----------
 2 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
