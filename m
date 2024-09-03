Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95278CD3448
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SCA6PcWLI3jvV7iBNnrFk1VqkZZNYAy4Fz9+Iaj0oFs=; b=DynAYdUg5ZX8Zp
	nydZaf6GXJmFmALRQBPLMLURDnNMV7HExMbaqGctGHJC1jB8zO/zWdib7RSdkJNZdHMRDIB8hHnua
	SwAeWxgoJtnT3r9xpbCN8Bpl9/DJ6BDmGZ+2xWPLLV5go60eO1yOZUR7Y8kAZfgygeu28/Drfun2B
	+slV1zjeFB1/vdlk8NdEkpEvDsxz8XkMQKa6ueykAR9h6Lx8WYaO9r6gkEFjMsi77tss1RPJbIzvO
	x0L53i94kcvzc6CEHDN3cjz0VjM1BwUSXG79bzM6zq/wnp60UW4nDTybfWwWD5gNf43gSMS5aVUw3
	z/qBtsJVRlIgavyfnvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWR1-000000017aO-0BM9;
	Tue, 03 Sep 2024 16:31:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWPu-0000000175y-1cnW;
	Tue, 03 Sep 2024 16:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CA155C59F4;
	Tue,  3 Sep 2024 16:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C65EC4CEC4;
	Tue,  3 Sep 2024 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381005;
	bh=ZB0ZGid7oYvX+NEZ2K4bE2HWU1BmgbIDt4uG0XbOQ00=;
	h=From:Date:Subject:To:Cc:From;
	b=obYyIdBi0lHyyRze0F9LXfG3EYfQ3K2Ec2vQyalVmEezN0wqQ645aFB/1OqMgJle1
	 O2TpvXlGt8N2LpVsrG5vH2y6JCNTNhPIek2dVQHOhCWATjfGLXCtwxvSanqPh/sAyj
	 nHd4J7n5SxJLL0vo34KObKKHHH1x3jFl0WD4u+V13WC3uHLoXuxZXX+6eJMFN00kEn
	 gCSkyTbUiA+HJRqKe4r272tzHMsttb/Xcm81pKSNsderfddwX2XHWpNJI2NCqrs7Xf
	 gPZv+s8FORKHdv2tJXoFlnlBd+CdIo/vbOO3tLLxndb61nmLQgg0WzJyvwWGa95D+D
	 f4QzY23Lpn6wA==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 03 Sep 2024 19:29:57 +0300
Subject: [PATCH v2] dt-bindings: mtd: ti, gpmc-nand: support partitions
 node
MIME-Version: 1.0
Message-Id: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIQ512YC/23MQQ7CIBCF4as0sxYD1Gh11XuYLugwUKLSZmiIp
 uHuYtcu/5eXb4NEHCjBrdmAKYcU5lhDHxrAyURPItjaoKU+ya6Vwi8vFHYdhSWNpDuDbjxDvS9
 MLrx36j7UnkJaZ/7scla/9Q+SlVDictVoUJFrEfsHcaTncWYPQynlCyBjt9WhAAAA
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Nishanth Menon <nm@ti.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: srk@ti.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=ZB0ZGid7oYvX+NEZ2K4bE2HWU1BmgbIDt4uG0XbOQ00=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm1zmJbaVP/ewIJ9pyrYDtWXsaHySvmZFudVp4y
 qiaMKE3kUKJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtc5iQAKCRDSWmvTvnYw
 k921D/9P8/VEILXiD9ZI1cn1LOZMD27ku1ZqmP9k0r3XFDDrmuuJhm7DKSetMG6jU7HEVEEDYvU
 qIjK5KlIY6XJfWcrvo5eVhPXrUD3NChWFYdOz8Os1TIxlsP153tC50xZ7vJ/1HtHJk94zR6cYhX
 wZ9zB9aWQqe8u78Fn9KFovJlmpmn2ABDIbNBuW/l6nljG9QOwWhNRm8KgcmcERfIkof0RQUl6st
 oni8LAqlLfaUkH69B0nd/PotqKpvGsr5xv0/W5TDvqLLj4WtFBMEVk/9dzxm0MUqnxm1czWtezT
 Y47sbwzn9gCcgBEV/ZJ9vpxCJalNnAa3kigTmf0Kr/j/8ptmsNYVo46CQrxFbbqXxfvLMjSZ/dA
 WT9zLxy2ji0hCHYBl6h80EiwfijSLT0Dx7yCz/PYQFLV10WOr9UiHJIDqY9o0RRw3oXkZj/JpBH
 Ygeo0wpv5+fbxUx8igsC5Z2oa/PXzfsnw5EEGtz2gY5gU1Y2gNMXfcwXglIq+AHx3CoMJJvUbsu
 foZkWHPL1OXkIf6tTEb0WeEeehAzYrJ2ggLBWGk13hzqth0WWBYKyMqugAsLXCK8fQ3TtMTILw+
 SuMa1Vyks4q9F60ELtKmqK0yXbO1gtC1G2kxDbuLpJO/u0wofmC3eEpKyiOrAdch1gyyVlQhxzV
 I+QnRMJUTQ1DEJw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_093006_641906_C9A5B5F5 
X-CRM114-Status: UNSURE (   8.94  )
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

Allow fixed-partitions to be specified through a partitions
node.

Fixes the below dtbs_check warning:

arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changes in v2:
- reference mtd.yaml for standard mtd properties like partition as
  suggested by Rob Herring.
- Link to v1: https://lore.kernel.org/r/20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
index 115682fa81b7..00540302bcae 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
@@ -61,12 +61,9 @@ properties:
       GPIO connection to R/B signal from NAND chip
     maxItems: 1
 
-patternProperties:
-  "@[0-9a-f]+$":
-    $ref: /schemas/mtd/partitions/partition.yaml
-
 allOf:
   - $ref: /schemas/memory-controllers/ti,gpmc-child.yaml
+  - $ref: mtd.yaml#
 
 required:
   - compatible

---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240830-gpmc-dtb-de2ce28acfb6

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
