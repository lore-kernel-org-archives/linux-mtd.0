Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC21D1D483
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB1Ue6SI9hZ2agMDxfFLlvqa0kqjz5VYZhfS3tYH+pQ=; b=gaZnxWltwbk85o
	ZzDnrk48idWTUrPaFp8BSoqEzBZchVnYGw9UDzs83+AKhSj8BqYhWOPC8Jr2qWTWPNxNMC3j7MYcf
	ASaKjgqojrT13u0OxkMiZHmjjNrw6ur28XHj6sT2n9GOzHfi4Rh65GumCo/nbG2Nk/zjNgx/IHmIj
	ECLDDMteRNC9kmxqx7B71pJeqWYV6BclWyH1pPNkAA9aUk25+aooFZK8agFZZgg3qJ80Vi0dTZatc
	xA9hnRsm2++3P11gU2GcDtEKR0KzgxFODu3dVsVml8NcdcqbjHUOuGYg9f6+7JdafAkXGvJqcqTVK
	j565lNlsO8dSoXvk3FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCn-00000000VoJ-37bu;
	Thu, 08 Jan 2026 17:53:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCg-00000000Vf8-1ph1
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24E49440DB;
	Thu,  8 Jan 2026 17:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED7C116D0;
	Thu,  8 Jan 2026 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894826;
	bh=/xLQMDY+Z5c201pwV6drsWJD9hut61CKQg2Ohei6ByU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Le3Uy+re5r+KiKpy56t2y4K9CEu4ZDEzyHjguCdB/ACk9BBEVX52msmhek+a1JC8i
	 +Dxg2XGl/sHOd3TvvDyaSTjg5T6Gu8s9L6C31IX5yjnvOSTSxPzhIJVsnkeSVm0XqS
	 DebMcdMrbbPoKwjOah/UB6smg0xrtgu+xxIPG8zKO7QYRCkEdQDz8yYfn7fLtHEKLX
	 tMaB8Q0lHTLzYd37UOXD/fT0cfB+TsaRjGI+qwJ43+qRLkq7QZHISsKomp+2Qx4GF/
	 tYFtGEqjl0AG8x9POlueSHN/4+ZfkVHxSJtN578ANldkC0NE/X6TcHZhQHiIPkUNJP
	 R2tB/uFOrqwMA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 08 Jan 2026 11:53:17 -0600
Subject: [PATCH 08/10] dt-bindings: mtd: fixed-partitions: Restrict
 undefined properties
MIME-Version: 1.0
Message-Id: <20260108-dt-mtd-partitions-v1-8-124a53ce6279@kernel.org>
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
X-CRM114-CacheID: sfid-20260108_095346_523076_83BE509E 
X-CRM114-Status: GOOD (  10.13  )
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

The fixed-partitions schema allowed undefined properties in order to
avoid warnings when there are nested fixed-partitions.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml       | 7 +++++--
 Documentation/devicetree/bindings/mtd/partitions/partition.yaml    | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 4d79f786fcd5..984823108f9c 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -39,7 +39,11 @@ required:
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: true
+# fixed-partitions can be nested
+allOf:
+  - $ref: partition.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -115,7 +119,6 @@ examples:
             compatible = "fixed-partitions";
             label = "calibration";
             reg = <0xf00000 0x100000>;
-            ranges = <0 0xf00000 0x100000>;
             #address-cells = <1>;
             #size-cells = <1>;
 
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 51fd48af55ec..2397d97ecac5 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -144,7 +144,7 @@ if:
 then:
   properties:
     $nodename:
-      pattern: '^partition-.*$'
+      pattern: '^partitions?(-.+)?$'
 
 # This is a generic file other binding inherit from and extend
 additionalProperties: true

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
