Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B13C44506
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 19:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcAdzxt77nAtlcj+nQV0KCVrZO8KThaPer1ahov5u34=; b=rfnZNXV327SRSe
	nZGum/bQ6o6oxo0Klqy5RHUf2pZk9SBbCSOhazIG6XJXbLrumCpyGT8kvx9/YhewQYedbukhkha3k
	4+/o1OhWTTmd/V/65LE+2SCSd0fdT8nyLFBDDbBqR5LdBmQODeh3jh0zuEa+DQpPVqpiCANCUj/Bv
	i4PxSyhWahkFjkVMwh3yF6yUjKb8PBsBSqlQO/CwFqersZTnKy8Ef8n+vKqS1SQeRgA49k4mp3RWY
	esPxW5Gm85hdEWJYlaab5DGVw3g9dYmAew04an0HQs1JZsx3lJhvkOCoLfjGKxUz04exSQws/w68y
	VWAT+f04RcJg7QzS1b6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK3-00000005zgB-1IoY;
	Wed, 21 Jan 2026 19:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK2-00000005zfj-0Y2Q
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 19:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CBF160137;
	Wed, 21 Jan 2026 19:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE381C4CEF1;
	Wed, 21 Jan 2026 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025416;
	bh=/ZlnKnKx7utqc5wND/d2GRMNuYYpxYnoMehK3GUY9hQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B3b/aQthrQzJU9J5LRmk/7/delrvkOOR5vjzUHVjx0YypDVYWHp7m93d8aznCFT2L
	 rtewlrw6IXMuQJSyRLFxOcsFxMn42ruoInR/7VH3qqoeA0enRNNART74n/huMd1574
	 Luhsc8F+hg+EA22YOdzzqVfnQr934geK0fH780D7M/Vi+4+IEMA+7hD+1/fpS4ZdhA
	 5vyIXnDL+B9azBNcnFPTXJi5Iyfmvz3ZbqICjSNNoiSlDpPez7h2ZCj95yHxyDdlJV
	 b5cbTu/RM/KNfMaaXN+CiQz9Ag8iT5HDDjM6pyGvpEKOQbCbPBn5x758Q6t6LJqO6H
	 8Fr6tEI9zn8Rg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 21 Jan 2026 13:56:34 -0600
Subject: [PATCH v3 01/10] dt-bindings: mtd: brcm,brcmnand: Drop
 "brcm,brcmnand" compatible for iProc
MIME-Version: 1.0
Message-Id: <20260121-dt-mtd-partitions-v3-1-ec3af93c8f93@kernel.org>
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
In-Reply-To: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
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

Some users of "brcm,nand-iproc" include "brcm,brcmnand" and some don't.
The "brcm,brcmnand" compatible is not useful for iProc systems as
there's a separate driver for iProc. So drop it as a fallback.

Reviewed-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index 064e840aeaa1..3105f8e6cbd6 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -66,7 +66,6 @@ properties:
         items:
           - const: brcm,nand-iproc
           - const: brcm,brcmnand-v6.1
-          - const: brcm,brcmnand
       - description: BCM63168 SoC-specific NAND controller
         items:
           - const: brcm,nand-bcm63168

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
