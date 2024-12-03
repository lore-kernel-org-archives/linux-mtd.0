Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7FD4979A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//ifDu+nta3vq1WHMyU8hEuxMLJ1trqz4fSzM404+AY=; b=MPd7ANNsohJDPf
	wucW3I1rYhLHq00afINQCDE9awPFnVlTxIa07OF9P4sAIJGmemQFHv/fqEwkzAw8uYFaN32+hhhIx
	L8QY7R5SWwQKLjv2G4HD/4ed49/Hu/X7zlO0F1RGId/GCTeefmgBnOC7YEB+8WU9MqARVW8nS1y3A
	v/74ZddI7sx/1X9sJoyajOZVON3q3DtUwZWiBXonuENi669eGSEvZCxGKGfb2WhqxMy2DNLLx6CY0
	LRHn4Bg8nMYXZgwimMDdWvVHk5cGtihHnzdi7e+c8CYCOJKLXdl7g+gNEcLcSvvScGe0jHioTNT0/
	CPG0uA0hZOpO/o7J+dpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPM3-00000008v6a-1V4G;
	Tue, 03 Dec 2024 09:38:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPLz-00000008v39-1GQc
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 09:38:00 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tIPLZ-0006C6-GQ; Tue, 03 Dec 2024 10:37:33 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v2 0/3] Add support for Fujitsu MB85RS128TY
Date: Tue, 03 Dec 2024 10:37:24 +0100
Message-Id: <20241203-mb85rs128ty-v2-0-42df3e7ff147@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFTRTmcC/1XMQQ6DIBCF4auYWZcGiFDoyns0LlSmOouCAWs0h
 ruX2lU3k/yTvO+AhJEwwb06IOJKiYIvIS8VDFPnR2TkSoPkshZCWvbqjYpJSLPsTCuLRljOrbp
 BWcwRn7Sd2qMtPVFaQtxPfBXf788p589ZBeOs05r3urbcDaaZ0Y/vJQZP29UhtDnnDyv0186rA
 AAA
X-Change-ID: 20241129-mb85rs128ty-659e81900957
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=7ev4NVxVo+TJSeuLy6DxDZOiuXgvvpucuXg1z5L2tY8=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkj3uxgW8ufDefNr6a93WP5onTXH7feiiLPehjFS04y+6
 x/YLcmY1VHKwiDGwSArpsgSqyanIGTsf92s0i4WZg4rE8gQBi5OAZhIdg/DH55fC1+aaZYUbW5i
 OVmotP6BP0eaPoPhzCm+82TPbljFN4eRYV/+l8wFiYXn4vR9lntHzsz1kZvANjP3Q2bdLS82pb+
 5nAA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_013759_342792_7656757A 
X-CRM114-Status: UNSURE (   8.97  )
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
