Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EA6D46971
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfhq2R32oDqFArQwK/wJGJu62EecLhJkDUBqwCkNXBM=; b=a+0tU0x0mLGhOT
	rY5Vw9q5l3tIs8D1j1cwqNyEMQwp+vKEEaya9FRcGZ0ADNW0KFgTfv4vx94Wbj1x4ZoAUXeJAK61N
	+cxWIus4jjQe1o+5xeJjUdPf44KeVc3g4jVkas1HelqUS4Nif2IebN3lC7mUoED4bNgzEFypMYCVI
	LkZRJtPPEFobRwMC3aNXT4HDussvPf6mz2zVmSfJlrzyXng9awEUb4NdfPBDt4HI3ppuzaejZ+hf9
	hmDuIC/1cM/2jYo6vpRGPCAHHkobSbIV0PTVQTGLKaIhwUh4r5vBHFH7i1oZI9HCYu8s3Jmrk2mFz
	SknCTK6T6bdOEksCntVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK7-00000005ziJ-3MHZ;
	Wed, 21 Jan 2026 19:57:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK4-00000005zgW-3UG6
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 19:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 434BD600AA;
	Wed, 21 Jan 2026 19:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D362DC4CEF1;
	Wed, 21 Jan 2026 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025420;
	bh=OsjbooI0PzsSGUgngyI7clHgsjttkcXNF84NTeIQn64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nAMgMGsAlFypN4Ya2goe99Kc/ynhx11xJAcCtHPXg+DD1DaBZeFLBLUzVUtT0zcn3
	 B7oWBBg71kLI6delh0CBhqJHStvuws/Eba2MC08DMRf7TwoZbBK1+CWCyQYph8Lw9I
	 /t938+stLXCjaERmVrW5MuO6I2xzCRNiuUF6YY4RRuirkjUNtprI0WpqrU87ZS2cZ/
	 Cn6d5o3sk6RjxS7AVcvEM1EF+vn9NiNUBDqjMkvKcSTepD1PSwSFrR0Qfe/6iwRZm3
	 rI1CUk/IFLnuBmfzEwdQdWRISU4xBiXWInmijLXz0NthsliZR7vNRhYHRdeD0xx2KV
	 R+G9i3bAYdoFA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 21 Jan 2026 13:56:37 -0600
Subject: [PATCH v3 04/10] dt-bindings: mtd: partitions: Allow
 "nvmem-layout" in generic partition nodes
MIME-Version: 1.0
Message-Id: <20260121-dt-mtd-partitions-v3-4-ec3af93c8f93@kernel.org>
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

An "nvmem-layout" node can be used in any partition node, so add it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 568fac50f921..fe2f7d622e8b 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -135,6 +135,9 @@ properties:
       but may differ if device has bad eraseblocks on a flash.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 if:
   not:
     required: [ reg ]

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
