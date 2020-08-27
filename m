Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F182C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:53:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F65E206F0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OxbZTljy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F65E206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0tl7sCfCfQrmwGHaAO6Q+BpKEQScRDb4s3Idas5k2Q=; b=OxbZTljyH36Ip3AjTaMxxXXO+K
	PtNhr+0ax/QUEpvhRo/eC1bB73t9JvDiANWy152ta0M9EURQUMJc6PkXxGiQ2VZk5XwtH3001WwdB
	uubUjTY97P4FK3SJdA6QepzmORMTKCGp992LdETL35WyFtV0KuV5CVmoJmbQrE7/wZQ/Df8ifDE5i
	zKc6DsPUQaqBYzw2DHzvlh/hixLbJ5zyVtsbN27RWE8WgZUxU94zPnjyJ1fc5WocuGIKe/zfl41gy
	ebhnMLSehcUfD1ZNLfuvcEZBlBuboS0errb2KIf4B0L78po4uczRfLH5ssPI3qeAOQyxwSr6PH4X2
	fE0pU41A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDeR-0005Yi-Hz; Thu, 27 Aug 2020 08:52:55 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDdz-0005P5-EW
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 08:52:29 +0000
X-Originating-IP: 77.205.47.153
Received: from xps13.clients.t25.sncf (153.47.205.77.rev.sfr.net
 [77.205.47.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 51BE11C0005;
 Thu, 27 Aug 2020 08:52:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v13 06/20] dt-bindings: mtd: Document nand-ecc-engine
Date: Thu, 27 Aug 2020 10:51:54 +0200
Message-Id: <20200827085208.16276-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-1-miquel.raynal@bootlin.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045227_738282_48C86832 
X-CRM114-Status: GOOD (  10.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

This property is needed to precisely point to the hardware ECC engine
to use when there are several of them available. Here, hardware also
refers to the on-die possibility.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/nand-controller.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 02f0347ff102..ba7f8e4db5a5 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -55,6 +55,19 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         enum: [none, soft, hw, hw_syndrome, hw_oob_first, on-die]
 
+      nand-ecc-engine:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/phandle
+        description: |
+          A phandle on the hardware ECC engine if any. There are
+          basically three possibilities:
+          1/ The ECC engine is part of the NAND controller, in this
+          case the phandle should reference the parent node.
+          2/ The ECC engine is part of the NAND part (on-die), in this
+          case the phandle should reference the node itself.
+          3/ The ECC engine is external, in this case the phandle should
+          reference the specific ECC engine node.
+
       nand-ecc-placement:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
