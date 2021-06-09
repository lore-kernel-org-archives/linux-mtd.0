Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283DAC47095
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 08:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8B861364
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 08:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8B861364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoK5gi5idPOeSRUI1Okefdp02zdlnuYZ3sXwOITPtZI=; b=0i7dmNzsNZ56nf
	bevE3uWXYyymNTkseTolP8cIKlZE9hHD+qGeQLzOumVEHAcFEFHpjf6+Sugr/6UjCghJvKrv0Qlli
	wGFHw/zCVkTkQJqYdgod/2if48PZ2oOJ/C1UDSh6nuQWYvYCES6ARV7iplsqmAbe0lwd0wgIeWpFl
	1LYiu7jyp4OXVF8Yo1H4UDuqRKiykk2daQNiSY3r7zAjnQRUMLWok9XUL6TSqxmzYei1GkOzRKx2r
	UBoRJASbZNSGhWJHY8PePVOmGIBR+yQvQWVdILtudRuW6Y3c11MVaQ7ywyJN/ZEBmEID50mdu5iKz
	hnmnzc6nHez6TVujLvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqtH5-00CIJT-E5; Wed, 09 Jun 2021 08:09:19 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqt9X-00CEv6-5X; Wed, 09 Jun 2021 08:01:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 50E4D200019;
 Wed,  9 Jun 2021 08:01:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v22 06/18] dt-binding: memory: pl353-smc: Drop unsupported
 nodes from the example
Date: Wed,  9 Jun 2021 10:01:00 +0200
Message-Id: <20210609080112.1753221-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010131_367227_9BF7C2C2 
X-CRM114-Status: UNSURE (   7.81  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/memory-controllers/pl353-smc.txt          | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index 46e17f5bc45b..3ff6a4a49302 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -39,14 +39,4 @@ Example:
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
