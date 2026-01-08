Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6209ED1D478
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naog5Ql8MoINPQ+8EeaKsI3LI5AJB/ZfmDlGyxpoB+Y=; b=PcY77IiXFUooOX
	2japqjEBpgorjgLSmb3Kg3x4pL857uQ8nkUeEfjdagQGbXS6KGKMhnzC6uL0xjT3UnmOKIOPNi8Ci
	j1U1A4NgWOKrBf1uTLus83h/FNHDjiRy3IPCgpZOMSbe+I/2pJhoiiBc62zwqEpIfnMVbQyRipMtL
	EZq2cyxrxqDTNiVxaH4Y18eJ+3n4LRET+2i6bzZTo1VSpXuYegTc697pEtKhaEevjsupjg23FNGMp
	i6aBc0bQ6/O55n07oni30STwJtjYcxJRQp1huK0+J4zt26kF4guPIRL4egXXNcH3nEWIwYztqzXi8
	34J4wO8NlIh8oLsGSOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCc-00000000VcV-3YPr;
	Thu, 08 Jan 2026 17:53:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCa-00000000Vb6-1wix
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D4EC60134;
	Thu,  8 Jan 2026 17:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3951C116C6;
	Thu,  8 Jan 2026 17:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894819;
	bh=6HFnUhWZUEk2RhQKjWWeyOvTXPTWq/QyXuHiHZxW6SE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oR53mHtuR+WC9a8UxTBOl0S0MXXcm+UnxBwAqixphHrAt9JEv3haRYXjPBWPQtXjF
	 nUFJlqMMkFT81PQHYuX6AdlJrvU69Trlo658AJtnz2tprI48DKqWy/FjCP374CHkEb
	 zk/l05dYUw9ZtbWjtUGuDjlq3At7y8NIP3aevNzhd8DDQG8cTabDGi2AsyOovnz6jN
	 s742reOiRQPzEm++Hu0+2QR10FOxqYz+d7wvc7eauYtL0xavv5Ty6kdYFbTJMizdA2
	 x4RgllNX/96v50bQpeIL3fGaOcQMJsLd938KjTRIHvPpa6CXXQeXCHnXBpd/0GQH2R
	 44MIYPIHlGQ+g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 08 Jan 2026 11:53:10 -0600
Subject: [PATCH 01/10] dt-bindings: mtd: brcm,brcmnand: Drop
 "brcm,brcmnand" compatible for iProc
MIME-Version: 1.0
Message-Id: <20260108-dt-mtd-partitions-v1-1-124a53ce6279@kernel.org>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
In-Reply-To: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
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
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
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
