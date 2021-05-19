Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21459C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:27:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02CA61073
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02CA61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ofBiWn05O0/Fqg9RjZk/J1y2G9PYoowi+bNv4G/s3bI=; b=dYvDnnxnqI1eRzNYA/P9zSBcZ
	vAhqISRMxPfr6LJwBzrdth0CkPZireh3VNPwSezEFwsJTX/nmOShQxqNnBz8yM8QaAo+0TVu7Lb41
	j+f5IqkgHYsH8QyFMzRilAJHlrvI6u4kmtc8UnslzIcgKPXmTcWpTwh9u43HlMTyfPN0Ri/VsOZS6
	5hSeMvt3GHpAHJQUROUxzIzd3FVUjgOBiNHcwI+8WsbZVv16T1iZUI4vzG96h70aHNnbvo7P+HwGE
	sj/qNV7Oi2XBJ/ovYZSvanHFxlnxPS67raH4hBqyPZF1ELR2dqGkAqrO7Mo13BIkbMLzd19MsRrzM
	i0y8G7imA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQuD-004lNG-Ht; Wed, 19 May 2021 18:26:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu7-004lMV-RT
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=6JQK6S64bi8xpEc8yMMLo6zrZw6EtykD8jmLXuAxg/U=; b=mTTisuRfLBl9h3RKc1zUiC0SSc
 6EcDsSjg7WY7ntSj1lg3vHiS6ZbeZrNtdYmhEL0+kuQtJu/SMoopBy3KowsWfse62g6xlFdSmcmOE
 bbfeCg8utrBespDudRza49KJ/OBWxqYzvdWJJOBPRq1aJ4RybW1netzI3gvifni7RzO5b/G/cfAir
 bsQ6JvGIUU+v7goaM6N0RWUV1wnmZL4taqIUfezhbBiFjQ/W86kNg89cj8191vZ57M+DR6/wqj9DB
 2MG474oJ+xMdCDq2vT3v8p36Uxu7pTwK+Pl2E2lPY08HNqRxkgb7SnEIvfRvXlUjQntYi3mvSYMdo
 iwa33d1Q==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu4-00Fh5a-RV
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 89F86C0008;
 Wed, 19 May 2021 18:26:39 +0000 (UTC)
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
Subject: [PATCH v20 01/19] dt-binding: memory: pl353-smc: Rephrase the binding
Date: Wed, 19 May 2021 20:26:18 +0200
Message-Id: <20210519182636.1110080-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112645_049174_600BD9EB 
X-CRM114-Status: GOOD (  10.27  )
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

Reword this document before converting it to yaml.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/memory-controllers/pl353-smc.txt         | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index d56615fd343a..f0b7fe173668 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -1,8 +1,7 @@
 Device tree bindings for ARM PL353 static memory controller
 
-PL353 static memory controller supports two kinds of memory
-interfaces.i.e NAND and SRAM/NOR interfaces.
-The actual devices are instantiated from the child nodes of pl353 smc node.
+PL353 Static Memory Controller is a bus where you can connect two kinds
+of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
 
 Required properties:
 - compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
@@ -13,9 +12,9 @@ Required properties:
 - address-cells		: Must be 2.
 - size-cells		: Must be 1.
 
-Child nodes:
- For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
-supported as child nodes.
+The child device node represents the controller connected to the SMC
+bus. Only one between: NAND controller, NOR controller and SRAM controller
+is allowed in a single system.
 
 for NAND partition information please refer the below file
 Documentation/devicetree/bindings/mtd/partition.txt
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
