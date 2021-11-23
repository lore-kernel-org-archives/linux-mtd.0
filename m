Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F060FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 10:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqRK9a0LgdSHFnqgDctNwggv/7eqLku4G1QcM2nM7Eo=; b=doByujZI8OULE0
	6q21X7AiudEZXkuq49b1FAXxG2BM5p9EDJnYRPyLZzLiGdL/Zcmrh62qP6oeM+N4hzruw3zZWAdCC
	8Ozel+3vvcTB98bAMtJteTaz8CVcAGMVlMUsn+R+XyVtftyrEqLNqCZXSOiShtA9mgbYyYDOKvJwN
	MHJhJBcFoRJhgRpG0xGiLgjs9HOfwpU/uyjWcVQ3o47DunbfHiFSSmH+VFhF+xXSTMYWHocNFo0OG
	v/9vtj7lWJ1w7cS2UU+y+CZIDjUceHBQr8SJUlOQtmG9EMYcnbIZoxxqMbUGtXIJxV9qGtFISiHKq
	y6uFTrXwcFdRfMZP939g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTA7-001ioM-H6; Tue, 23 Nov 2021 10:36:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpT9v-001ikl-DO
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 10:36:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD5B960F24;
 Tue, 23 Nov 2021 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637663779;
 bh=wXAS/FpjSEB7/o6d+SMqmkV9s0JuSHiAKnUPppuzEHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h3Do7CHTOoveWOr3k7F+0yl6ExGfaXIdcsoVM/GWSdKnrsmJfBK/VK+IA2SDTaq4o
 ckZ9wYK2aG+evJ0aq4GldIY8WpTNGp7QHkwdOOc4ihKk4KvQd5tUaoUcxTtBL/GMOk
 ha/z8+T8WD0jedcVuSYTgTMYqBoCn36aj6XUwMu/WW//CTxaoc88V4DhFApZTiKiqb
 NoemiJFORZcHcZKQ7tYfR12jC8gUlR4Rd9LHxa2uzRChhi+f1r9I5mzqAVF5iYRG/y
 j8wkXT8sMDjiNZl80sAzjvrNLeIGAGUn2rVmEOa8pr4DGnGsgA6emedaDKUGu7mTpd
 mSq33sOlPRvtw==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: kishon@ti.com, nm@ti.com, tony@atomide.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/4] dt-bindings: mtd: ti,
 gpmc-nand: Add compatible for AM64 NAND
Date: Tue, 23 Nov 2021 12:36:06 +0200
Message-Id: <20211123103609.14063-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123103609.14063-1-rogerq@kernel.org>
References: <20211123103609.14063-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_023619_508764_7C493789 
X-CRM114-Status: UNSURE (   9.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

AM64 SoC contains the GPMC NAND controller. Add compatible for it.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
index beb26b9bcfb2..666ae4a78544 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
@@ -16,7 +16,10 @@ description:
 
 properties:
   compatible:
-    const: ti,omap2-nand
+    items:
+      - enum:
+          - ti,am64-nand
+          - ti,omap2-nand
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
