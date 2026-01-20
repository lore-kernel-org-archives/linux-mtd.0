Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DD5D2ECFB
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfhq2R32oDqFArQwK/wJGJu62EecLhJkDUBqwCkNXBM=; b=r/b1J5lA/ekiCE
	fwDd1jKCab/QmcJ71GcG5AswHzOz66N2QgLH4BxjAB3/YyfmSBV8ivKHItjLUa+exs9uoHPcsLX0m
	c/gODhy0FmzJtrbAXFU8Bwi4pxMjfa98p7nBCrQmagYW1swnrcrklAtqP9PdaipAnDdnOIF+HVaZH
	KZA3hNQPUFmlMJaELKUNA76joV1dPY07gkrjIP0grn7Srgsg2ypUbu/wCAzBoPstjsIBMb33y7nTJ
	AAPVuRjIVCdT2VYhlOWZQzkuLE0mVXdsP0A55dU3MLmlQczI59rfmJ+4PO3sVjoMNpV860QiSvfT0
	NruGLu2Unt6AQWju1Bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rk-000000033gO-0rMq;
	Tue, 20 Jan 2026 01:49:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rd-000000033dA-2mdS
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0245C4438C;
	Tue, 20 Jan 2026 01:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D7CC2BC86;
	Tue, 20 Jan 2026 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768873740;
	bh=OsjbooI0PzsSGUgngyI7clHgsjttkcXNF84NTeIQn64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WMyU05kfD6wMw3HNL51ohB+EWjX6Q11jMpErJ66tyqDx823smK+VyGSYwd0lpHM1j
	 yHmOPy0SxO1gU5B9Kh38d4kr9FSMTCz6aHhNK0cQdsq/Ewr7K/eG80QD96swb0Jpa5
	 t4m1hdz5rTUxD49SBS2HEs0nq1az6+Bh7ek3qTzV2+x3Sjbl90xU6MecvMMUjheopH
	 n3j4OvlvWVk5s1A1gqL6D0K8od0q2PM2JgFPgd3zUab7VHsCnsHoHI60iBWG1hcuRF
	 AT467ptvtQYTmK+LT7EOEeEtpyKl7T+PkmDvF+f5+DxhIe0cUaw5UU/LpHULSBxA1K
	 HKgtKUhDaQJaQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:48:25 -0600
Subject: [PATCH v2 04/10] dt-bindings: mtd: partitions: Allow
 "nvmem-layout" in generic partition nodes
MIME-Version: 1.0
Message-Id: <20260119-dt-mtd-partitions-v2-4-77ebb958a312@kernel.org>
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
X-CRM114-CacheID: sfid-20260119_174902_643784_CB33FC99 
X-CRM114-Status: UNSURE (   9.36  )
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
