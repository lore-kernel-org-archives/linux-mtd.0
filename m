Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795B6C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:53:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C049A206F0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ds6UrS5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C049A206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9tB7uJxA3Lg/P2XER1FZjkNxNeip6gBIoW8evdHc/M=; b=Ds6UrS5aOmieh42ASkzU46qX5M
	Tl5LN6aFlZydfFnWPiF2P3PHBd70Tqx6NjNAjzPTXvNq+koYE52bcQKNcq/kKcIkcA05McLBoJwUG
	R6BAcgE2Ih5kspOnZZdj65Sj94D8QLsJOy9GPhOEIY/5yi39jjgzsYca0nWwXp+FrdIkSWvenF7VH
	nlfYWF33JKwfBmhRs/zZtqUue9cVeMiSOAUbekkO8VOc+zBMWSBblC09NNbAOHGYQ1MmknBDolL2e
	KZVTbBRePrxOBd+T0cAsFgROBvNRcsSS2EVYl+55ER/acm/kgDpdoidZfqRpTk7sJpBgavyVBXV/2
	vusRMfnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDeV-0005aK-FL; Thu, 27 Aug 2020 08:52:59 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDe1-0005Pc-3B
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 08:52:30 +0000
X-Originating-IP: 77.205.47.153
Received: from xps13.clients.t25.sncf (153.47.205.77.rev.sfr.net
 [77.205.47.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id EB06A1C0006;
 Thu, 27 Aug 2020 08:52:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v13 07/20] dt-bindings: mtd: Document boolean NAND ECC
 properties
Date: Thu, 27 Aug 2020 10:51:55 +0200
Message-Id: <20200827085208.16276-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-1-miquel.raynal@bootlin.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045229_375733_B6FB5876 
X-CRM114-Status: GOOD (  10.47  )
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

Document nand-use-soft-ecc-engine and nand-no-ecc-engine properties.
The former is here to force software correction, the latter prevents
any correction to happen.

These properties (along with nand-ecc-engine) are supposed to be more
accurate than the current nand-ecc-modes wich is very misleading and
very often people think it is mandatory while the core should be
relied upon to decide which correction to handle.

nand-ecc-mode was already inacurate, but it becomes totally
problematic with setups where there are several hardware engines.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/nand-controller.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index ba7f8e4db5a5..e79bb6d2c108 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -68,6 +68,14 @@ patternProperties:
           3/ The ECC engine is external, in this case the phandle should
           reference the specific ECC engine node.
 
+      nand-use-soft-ecc-engine:
+        type: boolean
+        description: Use a software ECC engine.
+
+      nand-no-ecc-engine:
+        type: boolean
+        description: Do not use any ECC correction.
+
       nand-ecc-placement:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
