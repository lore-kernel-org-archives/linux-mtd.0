Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE62EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BDF7206A1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J0gBfh3Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mHyj/HuP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BDF7206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EWABEUVOgHNmzQvGmlxv9PDXvaZfAP5e47rJd2neH4k=; b=J0gBfh3ZGaH/KDtrRjRXkxRO8
	8ext7lUrtK+YuG4Wbr4sq7dnm0olJYksTDiP3aIGE1Cu99ZLZMt4zNBtvQ56x69SHsi/TpR8q+Y3v
	pgIiRehnzA4gIGi6da4EFqMNys/4+vBBOm+5Tt+iFEOxLdJjKjmoHobCZYNYrNb3HTLzClMh4nTDm
	uyssTF4WbhqYj8tDkWDN3pPiLFxtRnK2eeWHuiT7N7xklOqgxtBNpFKVfDbBqcDZ6th8NDvhH7vMx
	bRrzyu5nM60HpZlGhU/ldYNIJb+DHXDi9lNliHcGBoE+VriYMWbfRKYd9WEQDDbnfV9dmRvt5yNy8
	98EVz8lhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomcN-0005mn-Sq; Fri, 26 Jun 2020 11:34:04 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolK9-0000aR-1C
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ehNcOAfR0CpPLFOm/6VeaNXYrqC7A4/FyIt0Ypob2UQ=; b=mHyj/HuPbda3NJk7CweSuhls15
 qAu6zZwe5DJrG0/lnpgubQHB2d67HjItzuDFMMIv3sotuVCM4UwrzkD786mx4GRhErESAPMrXcovc
 1j6RQyDCdKcRQOV2O/OW5gC1oLDuHarBtbxXm+uPTgvtV6cD3TPfudg5FRGGWeQgqsYAkRSsu6H2O
 nbN12IpaW9ANcd2EYfejsLzVl5fEHQpLI8TvX12Qo384HbEPtIFsVNpFOnIeYBhn+pPltme/etSGK
 Smao545rIVUTq8oq3S+i7vFd/CeGOt+gSacHCO1SW0dRmg06TQMzLB8Ewni2dPGLUw7EKNv8gWN89
 nCQpWVwg==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joiZE-0003V6-St
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 07:14:35 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7C767100008;
 Fri, 26 Jun 2020 07:14:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v11 2/2] dt-bindings: mtd: Document boolean NAND ECC properties
Date: Fri, 26 Jun 2020 09:13:57 +0200
Message-Id: <20200626071357.21421-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626071357.21421-1-miquel.raynal@bootlin.com>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_081433_510742_8614C59F 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, masonccyang@mxic.com.tw
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
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 0969d2e6720b..a3750978ebb8 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
           3/ The ECC engine is external, in this case the phandle should
           reference the specific ECC engine node.
 
+      nand-use-soft-ecc-engine: true
+        description: Use a software ECC engine.
+
+      nand-no-ecc-engine: true
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
