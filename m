Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDCEC4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:40:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B8C20797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swx1FQDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35B8C20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4VGRRbBMbI5BKxPeq+gqcWzDesqTLp+wL3iuDyRefOE=; b=swx1FQDgtx+26jnGMJO4xEFE69
	BloY4BGcWZIECiRNcnPhXu371AN4jf+fCPdQwelWjx6GPd0fZ7LBmRHHaUAniVK/i1K06VS3EggE4
	PBJ/Fxb7kztbQ7tdrKJZIu2QYOR6RYRw4MzV4rFL/bgAJvZ5YKnLDT6kp8uxdOC+WjFoI2A/MWINK
	omydOklFt8ZFV4MsYdlcrbLdR57LT42P3pNgEvuhKth7SPY7nl33de8zSgxYN7NW9VmI0DfrO4jxb
	uUtneoQ2gcVs8fEPToRB2PMI4zapuTr5OjjKqvFcIz3yqIDVTOMi588wf20jq++C1W4JOhvYJh1ao
	AI3rHiEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYMt-00020a-AK; Fri, 13 Nov 2020 12:39:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYMp-0001xf-1b
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:39:52 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 845B260005;
 Fri, 13 Nov 2020 12:39:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: Change dependency between the NAND and ECC cores
Date: Fri, 13 Nov 2020 13:39:45 +0100
Message-Id: <20201113123945.32592-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073951_267752_D49A2E11 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The NAND ECC core is included in the generic NAND core when it is
compiled in.

Different software ECC engines drivers will select the NAND ECC core
and thus also have a dependency on the NAND core. Using a "depends on"
between the two leads to possible cases (not real cases, but created
by robots) where one is still unselected because of the "select does
not verifies depends on" game:

WARNING: unmet direct dependencies detected for MTD_NAND_ECC
  Depends on [n]: MTD [=m] && MTD_NAND_CORE [=n]
  Selected by [m]:
  - MTD_NAND_ECC_SW_HAMMING [=y] && MTD [=m]
  - MTD_NAND_ECC_SW_BCH [=y] && MTD [=m]

Fix this by using a select instead.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 15ffe1a1b863..b40455234cbd 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -13,7 +13,7 @@ menu "ECC engine support"
 
 config MTD_NAND_ECC
        bool
-       depends on MTD_NAND_CORE
+       select MTD_NAND_CORE
 
 config MTD_NAND_ECC_SW_HAMMING
 	bool "Software Hamming ECC engine"
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
