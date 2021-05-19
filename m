Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1BC433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:30:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767B261001
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 767B261001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ROf19+waMm7VkbaT103wujjAohm9pdp4GkEJL1qenCs=; b=m8VIbP/jXeP24VE734MPghnTW
	zWpWMQMQH3Cgz99SvyG4K3ai/j7sutIuHA7GgEz2O1tJgLIYSGPPQHKtgW3jOt5sF5veLP5su8jzn
	efg09lBCcKTfev9SD7Z72fvE59yaXafz7to5LN7ne/kiW3nSbZbSy1MRDRDVZLkQu++ioaR07s29L
	2SwLVxzUTobxIbKuq9nqYZQzx1xYPNtzl0MrxeILskDuZCYFHTPRfkrJPkb3oJiKRh6io8x4RTPAc
	WpHzLnyKAPU5nJga9NlyVmLdVfiR6x7UwofT362j49C4QdDYy1OFw4NB3aEqypRf6Qwhc0AYtkgEN
	C2DXk1BrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQwX-004lnp-GH; Wed, 19 May 2021 18:29:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuE-004lNd-OW
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=C9oCS/RxYAjKrYHT/DQLjfdya6MIO8Plx1sprdS+ljc=; b=X9dQfbUQqzPSuOnW9yjZWgAegM
 kMXv3OTGIxljirPIp0uU7dJRWo9nq27a/B/Ck99J8KxS00RQDwFn0FSM9RNbGN1ah9Ih5DJVqwlO2
 LrmzkyGDNFC1khNZ2IvqB+EoEyMTsI23hOIvvSciPl+EqKZoWxMwm/R7tR37oNT6GDe3kxn1U/VPS
 0y5lninWztQkxWYCioswHKnIVYqUh3bc2eHMKfJAlziHbbQIAhCMAxJhrILa/xWf5GVhywSc7nAFd
 pbEOlPktdoBIWBkwBV2JdFJ5JEWwG11pGNYgoG3zlK9dH36Z1GmDpLAV3fKy7aVbw80SJk1C4E03t
 7+dNR+zg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuC-00Fh73-8z
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0B2D2C000D;
 Wed, 19 May 2021 18:26:48 +0000 (UTC)
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
Subject: [PATCH v20 06/19] dt-binding: memory: pl353-smc: Drop unsupported
 nodes from the example
Date: Wed, 19 May 2021 20:26:23 +0200
Message-Id: <20210519182636.1110080-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112652_470912_9373C1FB 
X-CRM114-Status: UNSURE (   9.38  )
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

These nodes are given as examples and are not described nor used
anywhere else. There is also no hardware of my knowledge compatible with
these yet. If we want to be backward compatible, then we should avoid
partially describing nodes and their content while there are no users.
Plus, the examples are wrong (the addresses should be updated) so
let's drop them before converting this file to yaml (only the NAND node,
which will be fixed in the example and described somewhere else is
kept).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/memory-controllers/pl353-smc.txt          | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index 9f65df034b45..f67715d95852 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -38,14 +38,4 @@ Example:
 			compatible = "arm,pl353-nand-r2p1";
 			reg = <0 0 0x1000000>;
 		};
-
-		nor0: flash@e2000000 {
-			compatible = "cfi-flash";
-			reg = <1 0 0x2000000>;
-		};
-
-		nor1: flash@e4000000 {
-			compatible = "cfi-flash";
-			reg = <2 0 0x2000000>;
-		};
 	};
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
