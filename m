Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78ABD1D483
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ac2mqac6hMxqfhKY/sdcobnzeHSdxldrxarKAWSBQ9Y=; b=Do2jbq+kab6zyI
	V8d1OsGbua0WCbWnyGyyflaLv64hLJ0Wx4Lhjmi2xYkNSu6vEM/S5jENrDV16g4DJaITVE4Gc26sJ
	2+VILS8xRP8ui9TdNw2GHf4IMdCcEbNBRXY+4gShN7/hrOqRVaXDLzZxzrsA7Ur/EPj2noBalw3sf
	Wkc8+xbbSDcfsS02m/mYYvlN0A2o/A+03//gstHC9Zgsr4Uk5Tv00DtLsyjaOxSbfOjPCUARj6duT
	R0grC2Dn6A9jpMIVl6Pr4IJDdNfh0kDQI3AESQ+1EqcZe39yiHWgEhCiLDMvXux7VLKIvNSAyMEhA
	K0XNCpHYUANw/o1JFJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCh-00000000Vgm-2HIQ;
	Thu, 08 Jan 2026 17:53:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCc-00000000Vc3-2jbz
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 469D344464;
	Thu,  8 Jan 2026 17:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF46C2BCB9;
	Thu,  8 Jan 2026 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894822;
	bh=yhzVtvkMvI4BlC+wimvaT+E0X5KJhQFWtWdpmAh4oCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hrPTojfnbA6BUQ2nCn+Eco6pHIvwpP713P8KMcdQAkJfar0l4WyF4MARbr/5iQqFc
	 aKuwCqkfqsvL/svapSP7eDK4IYH34WFkC29YDV3Ear0mi/YzpdcGEG2JIp+nGP3MkX
	 D+Uctm+Vy1rbQ9SlYMZkNzVXI43LD2CKnTKljJusQecd5aXdGr0fT6pmV5/pWHgltY
	 SuxH2DQOZ/J4oI+3QbvagUMoWuZ/tqoQE+bBNO9jI1qAgBUmdd4VdXVxhbijuJIU8w
	 5mb7hppSdIZL0YmPFCAOQqPpMwxzVXs9cpTgji1qpdHYOe8FQc2OuTezljyQkOymQk
	 c64wOv3UdORuQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 08 Jan 2026 11:53:13 -0600
Subject: [PATCH 04/10] dt-bindings: mtd: partitions: Allow "nvmem-layout"
 in generic partition nodes
MIME-Version: 1.0
Message-Id: <20260108-dt-mtd-partitions-v1-4-124a53ce6279@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_095342_714365_C959CFFE 
X-CRM114-Status: UNSURE (   9.04  )
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

An "nvmem-layout" node can be used in any partition node, so add it.

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
