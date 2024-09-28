Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E75CF6495
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2024 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7pFU91egNZ69fVA9IxxRSLIiub3T9NhYCFHICvG5xNs=; b=T0RUAHzlMuZQh/
	J5Rao91ns/tm0zdNASmvp8UBpNCvKXq27JxlUuBFu2JfdCzsEMBhjFneJdEg6CowCqBZzAQlreiqO
	lRPAFr9RBekl7ZXhH/IDPbU8x9AFh8IqPDkp380K+9xR5UGyAwn5FdSOflXfOeWwTCPupjCl5RXHe
	5BenW1rBDP0P5pvljykenceSKh7kRx58CaUnXpSznH4NP5oViB1BomxTPzjXmDennJeIRDpGxc+mm
	N9pxBBzzZOHZd9G+QlOH+tvUsZh+ALzbRytlkGuAxd2PlqVmr1nHZ5I/hZQvjhK0QnxBcLS0BlxSH
	WeAZ2atpA8iqngLQwZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suWs7-0000000D4Xx-47YH;
	Sat, 28 Sep 2024 12:48:27 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suWs3-0000000D4X9-2ZKt
	for linux-mtd@lists.infradead.org;
	Sat, 28 Sep 2024 12:48:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1suWrh-000000004V2-2pUt;
	Sat, 28 Sep 2024 12:48:01 +0000
Date: Sat, 28 Sep 2024 13:47:54 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Daniel Golle <daniel@makrotopia.org>,
	John Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/2] dt-bindings: mtd: ubi-volume: add
 'volume-is-critical' property
Message-ID: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_054823_676456_478526E8 
X-CRM114-Status: UNSURE (   9.65  )
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

Add the 'volume-is-critical' boolean property which marks a UBI volume
as critical for the device to boot. If set it prevents the user from
all kinds of write access to the volume as well as from renaming it or
detaching the UBI device it is located on.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/mtd/partitions/ubi-volume.yaml   | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
index 19736b26056b..2bd751bb7f9e 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
@@ -29,6 +29,15 @@ properties:
     description:
       This container may reference an NVMEM layout parser.
 
+  volume-is-critical:
+    description: This parameter, if present, indicates that the UBI volume
+      contains early-boot firmware images or data which should not be clobbered.
+      If set, it prevents the user from renaming the volume, writing to it or
+      making any changes affecting it, as well as detaching the UBI device it is
+      located on, so direct access to the underlying MTD device is prevented as
+      well.
+    type: boolean
+
 anyOf:
   - required:
       - volid
-- 
2.46.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
