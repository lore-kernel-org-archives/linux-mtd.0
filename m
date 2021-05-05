Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7390C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:17:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB96606A5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BB96606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N5yeZ+A073j3MPA1Y+Ot8kGc3N8z4ImIPn56IEzQhBc=; b=Ft4AIn/fdOL7r/t3IrKVhyo6U
	J/GJ+nkz+MRXS25rIhf4l5Sr/Fw7qib8yVT97oc6alcZHDzPyH6+9m8d9jGSuILvy1hxXwT7dFhXl
	hlca6vGqnQJNOIZTSd8+2S82ty7qKwqENh1Ckh/8sSieP92BxmDkvDDJooK3GaKKA9mn3QdU84vVa
	ekGRwEtducMdMSSJU4y10N9lAYRsCgtaLVARJL8faZKKad6flcLsYSUZlyPQerNsozSg3JkXNlucU
	E4I/ph3IdUX+HQBM8+zW+m0RtWpy95lqmvmFEahwACN+qcEyIJFEwB1lLJdGmWrXhiLCn511qI5cx
	B9+h3buFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePpD-002TSz-9e; Wed, 05 May 2021 22:16:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDk-002OpE-RL
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=gaowJLIAziQCDv1jY08LwpnMc9/uaO4ZRR2lGHMQRyw=; b=TjoF1X2h0Q+L50eTj9hNStH356
 FSoFUDx/tufJt0hKjvDGN9yrX+8MrZn1Akbi2+NU9vZwZ9d+OxDku8xvmluTGS+P3AcH5OCDr3IYx
 oySl/S9bDw5OuJA4oGehkcpC4vby9oYu4/LyfduR2z5ZiWkVe9MZ09PehoK0o8QtMc/XwSeAAm7Eg
 IfyigDqzFkYg8lE0geQqQFBQIL9mQnF9q8G27kJVimR/20aTyKBAslbMVrLZVN/ErkckmS/AQf2dc
 AsqtZ+sJlNwMmWAd1v1eXSF0VFpSXOsezgWZxmfdSB4RURQR7QNTepC2gYrlZvseel5CPjcLeoqT/
 x2zftw9Q==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDi-005Iho-Am
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:15 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 16FCC1BF207;
 Wed,  5 May 2021 21:38:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 20/22] mtd: rawnand: arasan: Fix a macro parameter
Date: Wed,  5 May 2021 23:37:48 +0200
Message-Id: <20210505213750.257417-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143814_525172_44F21AD5 
X-CRM114-Status: UNSURE (   9.99  )
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

This macro is not yet being used so the compilers never complained
about it.

Fix the macro before using it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 65a52bb2731e..d5fab3cbaa54 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -91,7 +91,7 @@
 
 #define DATA_INTERFACE_REG		0x6C
 #define   DIFACE_SDR_MODE(x)		FIELD_PREP(GENMASK(2, 0), (x))
-#define   DIFACE_DDR_MODE(x)		FIELD_PREP(GENMASK(5, 3), (X))
+#define   DIFACE_DDR_MODE(x)		FIELD_PREP(GENMASK(5, 3), (x))
 #define   DIFACE_SDR			0
 #define   DIFACE_NVDDR			BIT(9)
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
