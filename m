Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED407C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:32:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D3C6124C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D3C6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LjrCyQANMI5iQO7bmRihjCqXGX5G+thB7Ua6cnMrj3A=; b=W+2LlOW7gpEAQJ86yRXLogj7s
	lpUIbEy3siwsUFdadIozApowviEjhmgcro1mCEtnKjvBfYpAk/2rUwOL+kyEm1kKwvo56iqtuNlhM
	jl4ARGkjx2UDNpQtNw7BeeBlTeR8XadwlJDFnCtJ53yGZeQm6wHsHjzRmaSxWFbw1R9NR0B5aChqb
	0ymIA1x7DiCEv7zwp4eZxLDMGRrbPS8Z7u2/jnHlcgRL3Nh+dQUVYn3Pm3+2OF72U2Wj62VQqikht
	2iVzYVDmuc08tVNPcohHNjMRPxF4g/QBAKG2oIDi8ZbkjdleX/ozfpPBdfN1rKGDVsTNjudIRqV4S
	Ks5IVwf5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQyl-004mBu-7P; Wed, 19 May 2021 18:31:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuJ-004lO6-1j
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=b89znMrhKzTZKPOAZu/EDa+Q/XdaF3C05k+eNLtL7LA=; b=wD9bLay7Y9qKnM78nZaxf/DsG3
 3krSMjKyhhBBzGQD360N9/mgQecAtMJDbfGHPRLExDif6dObtd3HDFBP6HskpXdTIh7vrEWHPaIu+
 jbHk+qd0aiOecKGYnU8Fywb5jQqogcH7OPlg2YnlTVRMNqbOy/c2TJZG8b/KiME79DwlD+iqPnnJu
 N5LheV9BYLKimA9weFm+CqDwSPX0+oDhcagsgvV7lPiINeq7O5csywDuKDhtV58QLFiN4rXkT7tTP
 Vt50ns4BkYNlJEwRc9WRBggb35EksQKZPWP1nYSDRkZczXgPwzpreTOpBf3RT3pY+5rohanjF8u3q
 bbM3KYCw==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuG-00Fh7X-Ip
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C84ECC0004;
 Wed, 19 May 2021 18:26:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 08/19] dt-binding: memory: pl353-smc: Fix the reg property
 in the example
Date: Wed, 19 May 2021 20:26:25 +0200
Message-Id: <20210519182636.1110080-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112656_774680_939ECDC6 
X-CRM114-Status: GOOD (  10.55  )
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

The reg property should describe the entire accessible zone, not only
the one the driver wants to access. With this in mind, the example
should map two regions instead of one to be entirely accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/pl353-smc.txt       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index 1335b94291ad..9d220d4cb39d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -27,7 +27,8 @@ Example:
 		compatible = "arm,pl353-smc-r2p1", "arm,primecell";
 		clock-names = "memclk", "apb_pclk";
 		clocks = <&clkc 11>, <&clkc 44>;
-		reg = <0xe000e000 0x1000>;
+		reg = <0xe000e000 0x0001000>,
+		      <0xe1000000 0x5000000>;
 		#address-cells = <2>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
