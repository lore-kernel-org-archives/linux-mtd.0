Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9E2C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:28:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B646861073
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B646861073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xAQMTWcesoC3vUPsddackvKfeqG6Vwo2Nk7TAfxxfsU=; b=q5Jd0fGdgvyn4XzEDaJgy5xX4
	kzVSeyAgAiv0h5Tzm7wBxHjx8sUm3BvTa6BYARZKp5tNOt/2op8KKwJ6lbH3uiuyYv/HMwzk+q7jw
	nlepviFKmcwBbhtrmV58E9I8RjDx7vQojxD5JCc5rH4h0iqFhOMYgXKY0mkS7FHBzdefnymy04CLw
	V9MS0F83YaJRhprsMGhwZZBIYVPdm1584P82c8JcnuO2ddhJmRPDbvVrAJ8u/68bG/1tqw9klVNHO
	8C5u6hYdPp+fMOckpCVHJKQYRHKBavOULH3uV2UeZ/vElhzWY472gDVWgb2PBiwhG65TWwLbGghPr
	kPIwThJfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQuq-004lRy-TX; Wed, 19 May 2021 18:27:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu8-004lMr-UO
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=yM7Kfb7HhUyoteNLWyuAF4Bcl5Of2O487gcRl9MeXk0=; b=TVYrX3kXT5ByIqZVb9Lcl8qaRZ
 rMDl5b70FTUfQ63ncmXpE29kFzuFu3YYTkExp+QRx4TfMlsYk8QGXiKKXWxpYTxmaJQaZT/i+izbm
 uufMbtYofQLrahwekFq/G0CsRDTZ4cuIX+/Tc3dIkDVMDNclsfzRwHfmfS7PLzb1k2eeDq6P7fd2p
 czpqdBy/c3XmRhyVLEAbB02Bjf3VSWgiEsMC6FNA/HhbCA19GQyISgEhzxOV1s0ZcTrBqAc8xLMe4
 1wS+a9RGSH2nNRYuYFpYFbrtNmDUU8wyM/rnqIGod+V12ks5mF5urIAJJ60DAFcVZtlOv6xomSVtz
 q/ii5pbw==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu6-00Fh65-CO
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6289AC0006;
 Wed, 19 May 2021 18:26:42 +0000 (UTC)
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
Subject: [PATCH v20 03/19] dt-binding: memory: pl353-smc: Drop the
 partitioning section
Date: Wed, 19 May 2021 20:26:20 +0200
Message-Id: <20210519182636.1110080-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112646_575701_19246CC1 
X-CRM114-Status: UNSURE (   9.60  )
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

This sentence does not belong to this file as this file describes the
bus on which various controllers are wired to.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/pl353-smc.txt        | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index e585f0022eca..52bff129cf7b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -17,8 +17,6 @@ The child device node represents the controller connected to the SMC
 bus. Only one between: NAND controller, NOR controller and SRAM controller
 is allowed in a single system.
 
-for NAND partition information please refer the below file
-Documentation/devicetree/bindings/mtd/partition.txt
 
 Example:
 	smcc: memory-controller@e000e000
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
