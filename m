Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1C2D2ECFF
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcAdzxt77nAtlcj+nQV0KCVrZO8KThaPer1ahov5u34=; b=EvFQJEZXJnnhbD
	FgFs+yCMeixmRNiuVZ2rZSoS1RJykeRvLOvXr02/O7CR8y8W/ZZ48GxYiaI7mJ/cd5ShW9oY1/xSd
	NgYSBuZiN797eNKXE3P/N3h1NNCGTwO9DKu13iRpEynZtIV6iYe4gayAstslPBDVagUA7oCr3URh0
	6/7usmZKMXDjpALsmsAiVbifbbosncvgF93grIaeIwqgCTisAtiSWxuHK5KbYpKGr9SKlmYGwefSp
	5FKqR0UDkoOZdNwGzH7+xYNGfee1Qv/UFkpgMcCwCzKHdKYCDYKjcEaJDmLBtX2gFrKgg9fPkD0a8
	Zj2u2EWEDzlbr2FVdTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rc-000000033cw-34ly;
	Tue, 20 Jan 2026 01:49:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0ra-000000033cH-39fH
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1A0744363;
	Tue, 20 Jan 2026 01:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B110BC19424;
	Tue, 20 Jan 2026 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768873737;
	bh=/ZlnKnKx7utqc5wND/d2GRMNuYYpxYnoMehK3GUY9hQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jEEJuJljiPATumdLNELfSGh7SGdYUJPcXbVE72c0SE+CmKNtyUkkUcwSSI/xF8p8J
	 nIQlT/T/JDUB+L+uusoha0kDwwf2R8Dw4MR+sX+NwKkVeRFi2jt9ZPEtZ2fk198SXJ
	 +7hodq5wcKqUa8qP4OjlULgqBhRU00zCvGqvxdQFk/tFeHClxFByruqorCUCAxLeng
	 tCufp3bTckdf6sPsdwrhN7e5Vn1GReYH3WGkLMtIeLn0UWh3qpToDfeYCpR1/SDHHA
	 585R1tsBEZjSctmvOMO6THZYJvMLDIe/rvapAvmRvgVonendHKK3sKYH0KdbeVb5P7
	 WLwlZ47KalCcw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:48:22 -0600
Subject: [PATCH v2 01/10] dt-bindings: mtd: brcm,brcmnand: Drop
 "brcm,brcmnand" compatible for iProc
MIME-Version: 1.0
Message-Id: <20260119-dt-mtd-partitions-v2-1-77ebb958a312@kernel.org>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
In-Reply-To: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_174858_813725_0471C580 
X-CRM114-Status: UNSURE (   9.68  )
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
