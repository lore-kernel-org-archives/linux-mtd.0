Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A401C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rsnZ0OEorZ9yRp8a57VeY0+2DLJvB/yA4xTE4BUZTO4=; b=AtuIpBmL1RDczN
	JRiheYxLDEvi5500zFzm5yxum0QGxzmfLA+9WgXgTu38NkO1dQO0Y58tYavPTfJTXW6xGUdUUJEOY
	lHqTA7CZO9aSHvmGrtfJohgdRQRReLrtLadW6poL8bgK7lqLRxIEs9xDN3rzQg0XZkd8THaxf/+Cw
	s6MleDnda1ezqYZcc/X+faf0ByQdKZI+SV48wRyWu/mniO57C7npStscu+eDrfrUYbpvSSP9dTIJS
	7pMC5Tup85UN7nnmXlSONkyGQyHzcvHzUMB1uirsnYo1c1WBheZJbne6I3fXOCVU0j9idbqQIFpqX
	1YQxQ9frTesLkFKBFmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npABR-00CVrx-Ud; Thu, 12 May 2022 14:52:54 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npABM-00CVoG-Vq
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 14:52:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49D01FF811;
 Thu, 12 May 2022 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652367164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oBHgUfjkvjlOrlP0AfXjalTcWpG6ICU7K/iN/xZMXlI=;
 b=osJeEdmvZN9+RU0m75ElviajW9Dx9hv2xk8vs5LWy0n9W9ROWeCocOomfjnEusbjcQ89/T
 NY58W3GYu+FmCkPb2LG1r71qodOPjur1/SkMxI/Vv9MjEq5aytyJ9XTGtI1njH4KJzCd1x
 BBfNTnm91dikw01VfoB02jfqmjeoZwniWauMoPzUAKDXfKdeqYJI31v3/AhloxX2OPYEIS
 VOkZ9saSzEr8cSV1y7nB3L/+4vVozEm3vaS2i/kaJbyx2TtTQyUl2Bk+vhjkzJ+xnQygYQ
 +/tI/0WmNDE+OOnRd+rYIhiL18A92IjIk2iGV7NwdydrYpxGa0qJuyZJbYY+RA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/2] mtd: rawnand: renesas: Runtime PM use
Date: Thu, 12 May 2022 16:52:38 +0200
Message-Id: <20220512145240.243469-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_075249_207973_FC082A7C 
X-CRM114-Status: GOOD (  12.07  )
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
