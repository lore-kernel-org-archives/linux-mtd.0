Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ABBD78337
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gbLn1XJYgL9WEvR7OR/L5xmMGLPntN5iVo9hSpc+IAk=; b=DI2OhUgZ6YWMk1
	9kzDO3rVr60/VcYx2OGgJkKJWrwTuSj2dY737IVfAztFFtC7R834CPwD+tNKt3v9TtAZAsz//f2jn
	D4ZXteQIoCnKHRP10WWP9TJpNT6/NxRiuPpk1FG6Skq+JEkRgcMLBIqD5xC6AdLf5v2Pk4dW1jlr1
	UTSn0pH9RqEitkDluek/3/ecMjNkbOPBsey3EU1bW21x9RYHq2wtJE0eyjF10Pdw7hjw/v0LrLp36
	v2LS/rMOpZEWa48+6DQFAmmnWfgEc72fV6Vk9eZ6cxuIy5XEslbYlzlRt477kUXXmOXw1e6CKGxq0
	4zBQsNsbhcIbv2cVLMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9W0-00000006tf8-3zWE;
	Mon, 02 Dec 2024 16:43:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Os-00000006sEN-3rTf
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 16:35:57 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tI9Od-0004Mi-4G; Mon, 02 Dec 2024 17:35:39 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/3] Add support for Fujitsu MB85RS128TY
Date: Mon, 02 Dec 2024 17:35:19 +0100
Message-Id: <20241202-mb85rs128ty-v1-0-a660b6490dc8@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMfhTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyNL3dwkC9OiYkMji5JKXTNTy1QLQ0sDA0tTcyWgjoKi1LTMCrBp0bG
 1tQByA2NzXQAAAA==
X-Change-ID: 20241129-mb85rs128ty-659e81900957
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=N/KblnNkQgu8OfZGvboZSwnR5GTetQaJWrhDYvUvQ14=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkj3fXjJctWKp7lTm6aq8XF9t7eTWVQU7X1rafvu0mPb/
 mz7Lcf+t6OUhUGMg0FWTJElVk1OQcjY/7pZpV0szBxWJpAhDFycAjCRUEdGhjNSR16f39Pyptdn
 +pL9Ew2dn0tGyvDm5de3TdFe+m3H+UuMDO1/HnTnqqj+sGDwkGU4wabG2Hdfck+dwMMTVWt71h5
 +yA8A
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083554_986390_3AC5B888 
X-CRM114-Status: UNSURE (   8.19  )
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
David Jander (2):
      mtd: mchp48l640: make WEL behaviour configurable
      mtd: mchp48l640: add support for Fujitsu MB85RS128TY FRAM

Jonas Rebmann (1):
      dt-bindings: mtd: mchp48l640 add mb85rs128ty compatible

 .../bindings/mtd/microchip,mchp48l640.yaml         |  1 +
 drivers/mtd/devices/mchp48l640.c                   | 28 +++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)
---
base-commit: 7af08b57bcb9ebf78675c50069c54125c0a8b795
change-id: 20241129-mb85rs128ty-659e81900957

Best regards,
-- 
Jonas Rebmann <jre@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
