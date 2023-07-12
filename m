Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7924EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BKdzhQK3fpY16RA+FEiQHCV16GHCRoW2QCouhil+VYU=; b=X6oiEKo+n+vZSF
	rYWcF+6WVolu2Wr0/hp5/DtGI9K6s/DFrodqszYrq+t4ZOmj0fpNs0SeTitTpX7NvJd2QM9efIWyd
	qp0visEIrCG+AiJ8bsaoSKE4TwNpeTDkD0AyUA5CHQtoiE+TFxUC6BR1rpzxhLMBgo9sBEhWFdObb
	y2TTqkHn7JTgHN6CYQSxVk/XApdog9jpD2gm38q2q0gUEfd400VzDDuOa2ee3MrGMXadfBmDG4OC0
	7u2np8MEJRnkvrjZ5vy0AsmnqXbFBd4tDZJALhkkmf9Hb0ci8ZcpvR0hzcMYZrjS+SR+T6rcp054B
	gMt1RO977a0/SPIiNr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbUS-000IcY-0T;
	Wed, 12 Jul 2023 15:10:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbUO-000Ib6-2c
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 15:10:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E9D4C0005;
	Wed, 12 Jul 2023 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689174645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XS/qu6lWg8ZcxRp4xgP1j4CX9yqUYefgPxA7VZYp8fQ=;
	b=jLrEx7Attt8FZMi2jUL6DkD027X8VrHdH6zz75PggAo/kbY3zRSzQ/s7nzWgK3YkQeeHgb
	E1yUKhuOo+wzR+formGSWEZGYRtk/pzl+yqt609F2rhGbPoWClY6FYsfZLGFkrCWdpQeVs
	QkiEAgloPMzE72pVDFrarnvSm+lTti89Urp7p0qbGVF9GDAB0ibMggSO5r4feeT6yheGp7
	KE/+Z1EBfNwhViUsPlmV8ykw0LLuzwjJ7T+KdfQ//He4hxRoFin1W7Iv8AzGe1Tu9PjUSB
	i3FfimdC1lS8gfljOqQT1rLUylAgtcAJmMMRh+tveML177T7KBNQGBsuFvbp5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2] dt-bindings: mtd: Fix nand-controller.yaml license
Date: Wed, 12 Jul 2023 17:10:42 +0200
Message-Id: <20230712151042.433593-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_081049_128809_FAC72F6F 
X-CRM114-Status: GOOD (  12.17  )
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

Binding files should be dual licensed. This file was initially written
as a .txt file with no specific license, so was implicitely
GPLv2. Significant part of this file and its conversion into yaml were
written by Bootlin employees which agree to comply with the rules
regarding the dual licensing so let's fix the SPDX tag to reflect the
correct license by changing it from GPL to GPL + BSD-2-Clause.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>

---

* Collect Maxime's tag.
* Fix a typo in the commit message.
* Reword the commit message to give more context.
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 83a4fe4cc29d..28167c0cf271 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
