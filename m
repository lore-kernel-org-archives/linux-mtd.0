Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24785E69EB3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LmBk/yLLRLTPMrWSLGn6GWf41LPMvTRtVKi0moNpOhc=; b=0ksT91Fueboghx
	6OeY9cKg00SmLLiNabE+4ZkKGYzy3L9j0zE4Ol+JlE9GD+IJpHcAnn6hnIJclZTLgDh9BSwRnYGeu
	eugIkljRn1LyYzVNMJ8Xhne48UO6Ox0xQdmv9tjhdkcJTYyjiQMZGz37Um0gKh6hu3wL12MucCYwq
	p8Qze4NKK0NZUskbv+YL1jZkWWdJnRaQNRhKXFx+e9pp753VnGMvzg3bifEdn56MsJL3r58ysgX7E
	dO4eBNz66Ut6wgRtEFrXBMCrQFfASgKXoo1ROfZW+26QGmGoDZqAuBcgOXDsm8v+pacszpUDW2hOX
	+RzqQ4JXJZC9IWISTRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQaJ-000000099qT-08vY;
	Tue, 03 Dec 2024 10:56:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQJH-0000000964L-3UVD
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 10:39:17 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tIQJ6-00012Q-0j; Tue, 03 Dec 2024 11:39:04 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v3 0/3] Add support for Fujitsu MB85RS128TY
Date: Tue, 03 Dec 2024 11:38:34 +0100
Message-Id: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKrfTmcC/2XMQQ6DIBCF4asY1qUBRISueo+mC5VBWRQNUKIx3
 r1oNzXdTPJP8r4VBfAWAroVK/KQbLCjy1FeCtQNjesBW50bMcI4pUzhVysrHyiTccGiUiCpIkR
 VNcqLyYOx86E9nrkHG+LolwNPdP9+nXxOTqKY4EYI0gquiO7kfQLXv6MfnZ2vGtCOJfYLlGeAZ
 YAzbUqojaG8/gO2bfsAl/4CbuwAAAA=
X-Change-ID: 20241129-mb85rs128ty-659e81900957
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=7eftw6vTVAZ6qV7FZ2xrJN05h5veZj7YhZDDwKfUJdA=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkj3u78/r0M3t33fFq0Ua9NjV89f8zoULC93eV5vbUeaC
 aOet8LNjlIWBjEOBlkxRZZYNTkFIWP/62aVdrEwc1iZQIYwcHEKwESS4xn+yt1nMA69sKfjzCoJ
 Dd7Ls+UdsyaETE4/Ex9wweqASJPJdkaG198Z3nreW19+6cxFzQg/a6sl9fOemclGu0tof7v55Gw
 8KwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023915_882326_3B9F3526 
X-CRM114-Status: UNSURE (   9.19  )
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

The Fujitsu MB85RS128TY FRAM chips behave almost identically to the
Microchip 48L640. This series adds their support to the mchp48l640
driver.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v3:
- Alphabetically sort compatible list
- Link to v2: https://lore.kernel.org/r/20241203-mb85rs128ty-v2-0-42df3e7ff147@pengutronix.de

Changes in v2:
- Correct dt schema in Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
- Link to v1: https://lore.kernel.org/r/20241202-mb85rs128ty-v1-0-a660b6490dc8@pengutronix.de

---
David Jander (2):
      mtd: mchp48l640: make WEL behaviour configurable
      mtd: mchp48l640: add support for Fujitsu MB85RS128TY FRAM

Jonas Rebmann (1):
      dt-bindings: mtd: mchp48l640 add mb85rs128ty compatible

 .../bindings/mtd/microchip,mchp48l640.yaml         |  5 ++--
 drivers/mtd/devices/mchp48l640.c                   | 28 +++++++++++++++++++---
 2 files changed, 28 insertions(+), 5 deletions(-)
---
base-commit: 7af08b57bcb9ebf78675c50069c54125c0a8b795
change-id: 20241129-mb85rs128ty-659e81900957

Best regards,
-- 
Jonas Rebmann <jre@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
