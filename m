Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22D8C4708D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 10:10:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B52761378
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 10:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B52761378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpOr5OfNputugwh8AZcMat+61304HavOQ4SNf26Oivc=; b=xgNznV+G+L76yc
	51yrv7D7e7KKPhGk/eY0EnWIqpA46GS5KeV/UjPj6xr4Vqp9qBP0bQyswAopsqpwtHKeqrx9IZX3Y
	Ns4V3ckFTDFQxU1f+XelU5hs9gmx7l/SQyARjvBS6QUHZEC1zwzCpVeOYf/HGN+LHcnYb9Y9JgH87
	OJHdzzluKW/bSzlXzIoRr9ynaTlhpdKqQEVcMyOUIr8TxssluAwzHHn4/LpwXeXxiRWwsHsXo5Xtp
	gNFqAwXlicjjY7KSV7QOIXknhMCEjFMNvCL2FkFRSofS0NKYCiK0Y5oJU9cdI/Aq0BqJeUIm55BvN
	B0l5mU8Ev1NIejRYBcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmZRN-00EG3Q-J9; Fri, 28 May 2021 10:10:05 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZJg-00ECal-2W
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 10:02:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 843D41BF20B;
 Fri, 28 May 2021 10:02:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, helmut.grohne@intenta.de,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v21 08/18] dt-binding: memory: pl353-smc: Enhance the
 description of the reg property
Date: Fri, 28 May 2021 12:01:41 +0200
Message-Id: <20210528100151.286662-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528100151.286662-1-miquel.raynal@bootlin.com>
References: <20210528100151.286662-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_030208_285837_ED5BDADC 
X-CRM114-Status: UNSURE (   9.93  )
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

The SMC bus controller features several register sets. The one pointed
by the reg property is for the SMC configuration (impacts the
sub-controllers configuration), while the others are meant to be used to
send regular cycles on the memory bus (eg. CMD, ADDR, DATA for a NAND
device). Detail this a little bit for the sake of clarity.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/pl353-smc.txt       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index ecd46856f139..ba6a5426f62b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -5,7 +5,8 @@ of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
 
 Required properties:
 - compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
-- reg			: Controller registers map and length.
+- reg			: SMC controller and sub-controllers configuration
+			  registers.
 - clock-names		: List of input clock names - "memclk", "apb_pclk"
 			  (See clock bindings for details).
 - clocks		: Clock phandles (see clock bindings for details).
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
