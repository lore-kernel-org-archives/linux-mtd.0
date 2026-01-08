Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3803D1D483
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LNYel4fUbxlzyioDXSbsQtu+zu7VWNwre5KIwFXgwTg=; b=D5AUSML1x8VzFf
	VFkJwA0TYuVWh8jcg6F/IAFFoysswCP7QKYDP72r/VtmeAqP4nOJ8bByaKU430s1bztojiZDxwo+G
	AS8PQeQLkKcn/ZgqNOR1iOoWTTI8wcewdaDK8AhBjCMLJ7qzoMc5RVJIwL5Umo2VbuD2V4g6Jdmzl
	jQru5/iUPtiMPngitx9HFRVEeOjuty5MZ0oRNGQDWrqeWvTSj+o0T1x9xvwrEAo6ekAsNf4o65ZxC
	4oMK8TzWvN4jXeYSRN82nKqfhENB2LfCIcY5lMj1Gvt2LUsKZHLbw8bbXJsYupzk9/bolngwkuUCQ
	SjU7lbt0uOFQvPJ7rUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCc-00000000Vc5-2Mlz;
	Thu, 08 Jan 2026 17:53:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCY-00000000Vaf-3fIw
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 100D14005F;
	Thu,  8 Jan 2026 17:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6F4C116C6;
	Thu,  8 Jan 2026 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894817;
	bh=EpeLs1hupKlkC3f4T5WsMQDKzIOTZY86hves7++2JUI=;
	h=From:Subject:Date:To:Cc:From;
	b=ivZc6EBsyPMVfPTYjQEWagwN/pirjUKfWJl4cth6wdp/9zCMNe2USua3VRpIAYRCM
	 qcBc2Ov76Qh5DCdon9LxjVFN3u3xtw7rLEc0fQhr25C8RYGvjQokk568fJW8bnBQRb
	 itChIgO5q8agWgYonj28sO2QyjBXfOUqvgyAkKUbCtXsc3+qhnXINg2gWqHyEf/bq2
	 q/TYKBa8ktpF+aLQ5sPnsa2ZqOE6lC8xnNqY/VTLhgf6dOrlr2IP5ojjTXwgato2+q
	 0GCx1IcUbP8E/PxUHtTzdvbX4pRd0MjPXAp9nu6mQGJmRwjIGyNVQwrluUSGS7IU5p
	 dmXH1wTb3Absg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 00/10] dt-bindings: mtd: Partition binding fixes and
 restructuring
Date: Thu, 08 Jan 2026 11:53:09 -0600
Message-Id: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAbvX2kC/x2MQQqAIBAAvxJ7bkGLQvpKdLB2rT1kohKB9Pek4
 8DMFEgchRNMTYHItyS5fAXdNrAd1u+MQpWhU92otDJIGc9MGGzMkqucsHc0GF4tOaugdiGyk+d
 /zsv7fqvmAHRjAAAA
X-Change-ID: 20260108-dt-mtd-partitions-3fd58ebadfa0
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
X-CRM114-CacheID: sfid-20260108_095338_956100_54969E71 
X-CRM114-Status: GOOD (  10.70  )
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

The partition bindings fail to restrict undefined properties. This is 
primarily on fixed-partitions which can be nested and partition nodes 
without a compatible string. This series fixes those issues and then 
several problems exposed by restricting undefined properties. As part of 
this, the schema structure is reworked to follow more conventional 
structure of applying schemas by compatible and a schema only checks 1 
level of nodes (unless possible child nodes are fixed).

In theory, we could have all sorts of combinations of different 
partition types nesting, and those may or may not work. No attempt is 
made to support them here. Only the known cases are supported.

Rob

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (10):
      dt-bindings: mtd: brcm,brcmnand: Drop "brcm,brcmnand" compatible for iProc
      dt-bindings: mtd: fixed-partitions: Move "compression" to partition node
      dt-bindings: mtd: partitions: Move "sercomm,scpart-id" to partition.yaml
      dt-bindings: mtd: partitions: Allow "nvmem-layout" in generic partition nodes
      dt-bindings: mtd: partitions: Define "#{address,size}-cells" in specific schemas
      dt-bindings: mtd: partitions: Drop partitions.yaml
      dt-bindings: mtd: Ensure partition node properties are documented
      dt-bindings: mtd: fixed-partitions: Restrict undefined properties
      dt-bindings: mtd: partitions: Convert brcm,trx to DT schema
      dt-bindings: mtd: partitions: Combine simple partition bindings

 .../devicetree/bindings/mmc/mmc-card.yaml          | 20 ++-----
 .../devicetree/bindings/mtd/brcm,brcmnand.yaml     |  1 -
 Documentation/devicetree/bindings/mtd/mtd.yaml     | 10 +---
 .../mtd/partitions/arm,arm-firmware-suite.yaml     |  2 -
 .../devicetree/bindings/mtd/partitions/binman.yaml | 53 ------------------
 .../mtd/partitions/brcm,bcm4908-partitions.yaml    |  8 +--
 .../partitions/brcm,bcm947xx-cfe-partitions.yaml   |  2 -
 .../mtd/partitions/brcm,bcm963xx-imagetag.txt      | 45 ---------------
 .../bindings/mtd/partitions/brcm,trx.txt           | 42 --------------
 .../bindings/mtd/partitions/brcm,trx.yaml          | 65 ++++++++++++++++++++++
 .../bindings/mtd/partitions/fixed-partitions.yaml  | 43 ++++----------
 .../mtd/partitions/linksys,ns-partitions.yaml      | 10 +---
 .../bindings/mtd/partitions/partition.yaml         | 44 ++++++++++++++-
 .../bindings/mtd/partitions/partitions.yaml        | 42 --------------
 .../bindings/mtd/partitions/redboot-fis.yaml       |  4 --
 .../devicetree/bindings/mtd/partitions/seama.yaml  | 44 ---------------
 .../bindings/mtd/partitions/simple-partition.yaml  | 61 ++++++++++++++++++++
 .../partitions/tplink,safeloader-partitions.yaml   |  2 +-
 .../devicetree/bindings/mtd/partitions/u-boot.yaml |  2 +-
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   |  4 +-
 .../devicetree/bindings/mtd/ti,gpmc-onenand.yaml   |  2 +-
 MAINTAINERS                                        |  5 --
 22 files changed, 196 insertions(+), 315 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260108-dt-mtd-partitions-3fd58ebadfa0

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
