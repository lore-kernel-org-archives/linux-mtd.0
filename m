Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12851D2ED01
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB1Ue6SI9hZ2agMDxfFLlvqa0kqjz5VYZhfS3tYH+pQ=; b=Q6q3DjIfzVHv/z
	QX4Lqa20dYPt9X7kdcokvM8/lZaoicVFlIY1kvrsG1P+9+BG1EeQAu3uN0mvXWFBjXgWxaNTEZmhZ
	+aB8bdmjoxV2KR2FuDo1Ty1zQ5l8JB2B5sMHBlEtYIM8TJbOgg1NTAiIW57lJrzwHvHqNrKjLr9tu
	9CZiXuyLwhYaTJ+AJN2k+u13rjUg1wSmicYlh6FhxbhkNXdwJpFjvcq9b7FuhICI6m6P3rnGZDH/Q
	dDvXNAByzG2Jw8c8OYmpbr/HoBDSvFnFgrFK8/403cGwW3qgzQD0T2ka+IYZSYdh9nhKCyP7Ksjfa
	WaAZmc/1FRNMbzPPBALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rl-000000033h8-0NxB;
	Tue, 20 Jan 2026 01:49:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rh-000000033f2-3pkq
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5851460008;
	Tue, 20 Jan 2026 01:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F3C116C6;
	Tue, 20 Jan 2026 01:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768873745;
	bh=/xLQMDY+Z5c201pwV6drsWJD9hut61CKQg2Ohei6ByU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p1lAb+jD/p3Y44MKW3bTvXJ5NYdQMa8AEUSC5uJr1IAxeLOcLRfuu8VWjz7Pb8B0v
	 dmkyYekGm/JrrhZcLt9e3Sp6VY1uYmG5nAkXKq7YOxFTcSh2erkUivaUNhdjWo3k/N
	 oOzaIqfmAwSbEp/iTpvMeUhcuGiz9P5ErYRZRXqH8EtoASk7vORDUfIFqWWLRJOgUW
	 hNqTnLeNrl02C9Rr+Op4CV7Ov/UcaCyMdL+n06rVylYtg975nDJhU3uv+N8BgIUYlc
	 7vaIZbU0VMcUvHOybwZK7Y9j8Uol8cvpjdTMuUzwRqVI7zgoaNiudzGORTq2VHxeB+
	 f+M4t3L42kWtA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:48:29 -0600
Subject: [PATCH v2 08/10] dt-bindings: mtd: fixed-partitions: Restrict
 undefined properties
MIME-Version: 1.0
Message-Id: <20260119-dt-mtd-partitions-v2-8-77ebb958a312@kernel.org>
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
