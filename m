Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9289C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:27:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0E461073
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0E461073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYPU4tgAnPfhX5cgyH2ZkaLWcAO5reXn3Ja9rlOY7D4=; b=Kspt1tZ6Znv1f0d8UnI7KX+mL
	0VTfxXrv0bDaDJsjMGPvGNI2Fkyw4qaBJYKZEhib+8NdfeHWYMgJDowLb1kXyG2qC3fjTqEMmd1MY
	AAEw0ZDTcKc72IaaZaWqsOQ4/8q/GoscvQt/LDhCkS+Rrny1y+/oRDE2v9fnCxc94zg2qzrQoEiv1
	n0ULNSbVT4UvjYW1ojL1Z+pdhTRk01aPqYkfT4AKtBM57HapL/rDU4FWDkKX5qEQFCJW5XqSn1nH3
	5I7I/LrzGRay51PqzbX7MRi7r36bwTq2lziqNDkCuwjY9MTQMFM0pgr9XPEjuWPt/+k6qn9GxxGoq
	X8aovyehA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQud-004lQb-Sj; Wed, 19 May 2021 18:27:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu8-004lMp-Mz
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=nNFGLhAsO7RhyvifK782CrAqO53WAyso1eZ8gh5MEOc=; b=KA2S6Wl2TNyOzCF6E71NY3aIzx
 4jeNoDl0PNJN2lBFk+YBX9kE80uz44+L/AH9r+tmgKxtWU1C3+aHkv82/DwXhwTV4s3ul16SWeV/T
 /n6MxHAsOFtO8GGcQLJ2eJ3rnUWtkZECwcyVH+CFUVhTzTIFL+aCvMa+SLeS7x9y2iApKWzFgyf5Q
 Fe8fW1GOF3/tlNlY9edzAYiLKvJBPLfGrf8V9pCEow3KzZ6IzF2GjPDU1D/9xMy8mHYPeYMQ4RUW7
 uGUMFa4gvGdSLWb6SnYmfbNAiw5Q7WvxD2AgYhyemYNRwFohZsEdPu8x67sAkZvQfcFGZj9VO2u03
 2BO+iGQw==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQu5-00Fh5b-22
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EE10EC0005;
 Wed, 19 May 2021 18:26:40 +0000 (UTC)
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
Subject: [PATCH v20 02/19] dt-binding: memory: pl353-smc: Document the range
 property
Date: Wed, 19 May 2021 20:26:19 +0200
Message-Id: <20210519182636.1110080-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112645_259650_62AF03AC 
X-CRM114-Status: UNSURE (   9.22  )
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

The ranges property is missing in the description while actually used in
the example. This property is actually needed, so mention it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/pl353-smc.txt         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index f0b7fe173668..e585f0022eca 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -11,6 +11,7 @@ Required properties:
 - clocks		: Clock phandles (see clock bindings for details).
 - address-cells		: Must be 2.
 - size-cells		: Must be 1.
+- ranges		: Encodes CS to memory region association.
 
 The child device node represents the controller connected to the SMC
 bus. Only one between: NAND controller, NOR controller and SRAM controller
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
