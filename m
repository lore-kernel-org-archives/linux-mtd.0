Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0AAC9832A
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FN/TEmjI/HvPUwQ0KPpi0DwUibCQq/hnzAewVuflTUQ=; b=mHZ3/M8vT8ys6a
	4dFwlpuPWYcJCe+JvzoK3vBkvJhe+7OpqzFLy4a/mgzKQx5q6jbCdhfBAmOGuPK+/iIQR0SJ31grD
	q/+ZeCeJoo88YndxUmX7CXAwU2es/XeDE5UIbgM0hOVUkaE50Q5TiJ4SKp3OcSRzhrVoWEhnWuWxA
	xD0vZd8nxapAPXneEnocPg6Xd3XMH2mGOxrG3CVxZEuRXJ5deDmE8R3JmgAsFvmqLa6So2qpmCKND
	G2r7tnVw2IUbAQGoAYaFPlKL5ODlFJoOMZlTpb6q9S782VzuGTT12/p2PWn+lnHdZlfhDCQZqefzB
	pAn79UnbUpQBVKfb89Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8p8-0000000DwBx-1w1F;
	Fri, 25 Sep 2026 16:30:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8p7-0000000DwBn-2eu0
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 16:30:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0A5660136;
	Fri, 25 Sep 2026 16:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D52E1F000FF;
	Fri, 25 Sep 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353856;
	bh=4fULh+l1B6/QfnWfkwgXEXAOf4zGK0ZET5rXOX80kJI=;
	h=From:To:Cc:Subject:Date;
	b=FXTuyUJQpVQSZUT4PtOeGhjkd+SQpo/wfKSALQ4bg98jx1P0j/9JVPxmJICkNmj4u
	 v4ilk0Sp35vDZQRi0ZcmMKxeQ+s/u/UIf15BC8xEfMUF2ORO46OrpUCcbMaQN+cWPh
	 2mtp3G4a8lomdAki3Qbu7wAhOjZSxrmk95e9Xjk3G85AUK8O5gWh7NEUmA7+z66+w4
	 QtbXIU1fTfw1ysxGYjOjMrtJk0/MbmUfdtpTPHTGvgAqTimDfB/PXlP4xmR9RVPuNS
	 Aw2WkRgV/kc2V3zskKvwL95nlN6kH1Nbd0RaOdq0caydlgd+nOde2vZguhu9q5RK6I
	 3S5/pjLV3v79w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mtd: arasan: Add "power-domains" for ZynqMP
Date: Fri, 25 Sep 2026 11:30:44 -0500
Message-ID: <20260925163045.1920345-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

ZynqMP NAND controller nodes use "power-domains" property already, so add
it to the schema. As ZynqMP is the only supported platform currently, no
need for a conditional schema.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop num-cs property
---
 .../devicetree/bindings/mtd/arasan,nand-controller.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index b90d3b48c2f2..7154245b00e3 100644
--- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -35,6 +35,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
