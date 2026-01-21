Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33850D4696F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JA72HJ1WhDU5i8R6yV3LWsA316vsMrgKdwPnE7adGN8=; b=aW2tj1zce7adhW
	8pofsCsyrKbp434sH6EdvVcVjC8mq3F9ggxCNqZ2Lj1ZpI7O/oRGeAgrhcaHfAi+FyYijCpiGJeFA
	nqL5SUdI0u8GGLjTVpvw9ikoQ6/VYKuPSHa7GttzGxryOyo2d62Nu9fTynwF/uOKywDkh4CLXBXUt
	+T2BD2w0ShQ2V6e2DKvzSxQ3XWh+uXTFJvvVQZRF6Pk4Ak1f04MdNYSC91lUs1OKbTcYpTPWZMWbn
	FA90gKFwoibSC/IHHB60wlsw/AbQzXArpFLZudaLZvI6fzvaIhdyr4ycUfd8tPZaRvRMrMX5f4Sit
	GlZxKqALPvy/PDpyFWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK3-00000005zfu-07ux;
	Wed, 21 Jan 2026 19:56:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK1-00000005zfd-0BEJ
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 19:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21AE360131;
	Wed, 21 Jan 2026 19:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D6CC4CEF1;
	Wed, 21 Jan 2026 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025415;
	bh=O2g4aZxguQSd3/Hhutlh4goIwEfHLGt72wUIY/7+5pE=;
	h=From:Subject:Date:To:Cc:From;
	b=DIZCFNUqn4U1f9tXUbuxL+XFPQF+6044rzFpWFYeEnc7lSbRPPchLdba5j8tbqRIi
	 Ewdwehg03Jf+Zcl8jlur20CU8WyiAZTANNGQac1SW2rPM7EMXM+fAZMdKMpjXR1PFx
	 2ZMo28+2BX20B4iBvUElMWVKVe+droUyp0nM+l4YdL9KPSYvQUQ7dGfgAeU4lGl49k
	 CC4xk/1iyrwHuJPbCrJ86J5X+fHh5cb5FbHKcbeugyATIEy0zvLeHYM1Ck2IGXRi37
	 UlesgQ/tARMiKxhbULrurMM8GOaKXaUl+5ITAjcRapfxrP4vP088JsaWNLo4WYe1Ru
	 CZoaCRBCZ0VWg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 00/10] dt-bindings: mtd: Partition binding fixes and
 restructuring
Date: Wed, 21 Jan 2026 13:56:33 -0600
Message-Id: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHEvcWkC/33NzQ6CMAzA8VcxPTuzdfLlyfcwHgYrsKhAumXRE
 N7dwUkT4/HftL/O4IkdeTjtZmCKzrtxSKH3O2h6M3QknE0NKDGXSpbCBvEIVkyGgwtp2Qvd2qy
 k2tjWSEh3E1Prnpt5uabunQ8jv7YXUa3Tf1pUQgqFR5PphnIsqvONeKD7YeQOVi7iB6GqXwQmo
 iiorqusNFrhF7EsyxuIbSGl9gAAAA==
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
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Simon Glass <simon.glass@canonical.com>
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
Changes in v3:
- Add $ref to partition.yaml for brcm,bcm4908-partitions child nodes in 
  patch 10. Patches 1-9 unchanged.
- Link to v2: https://patch.msgid.link/20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org

Changes in v2:
- Rebase on mtd/next
- Link to v1: https://patch.msgid.link/20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org

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
base-commit: 779c59274d03cc5c07237a2c845dfb71cff77705
change-id: 20260108-dt-mtd-partitions-3fd58ebadfa0

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
