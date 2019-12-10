Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240E5C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 15:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3942077B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 15:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OsBMQMCD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eaxlabs.cz header.i=@eaxlabs.cz header.b="RLELJyUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA3942077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eaxlabs.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZfZqf8QtumuGFhpFRi5cQLqsFAOo3rFguLMuCi7i/E0=; b=OsB
	MQMCD8mcS5MtB2nhRUzVIB/FYypWN35wWWVLVbdVUZ2FQjDFVALBDyCYlhqASrBtQd/GEKdqh8n7c
	gz1dDE12N00ueIMEIaVzEf+mLQLbgoGTyEX5DTCwQKoeidZcdaNNPjtrEB/KSpQLM/B8YmvXDHq61
	ywa0IaNDZ3ACoIKHTWpqw1Z8eiVvLG4Db1AeW6PjHVFqLK/ZIwLDE9//UUpLT8nkIQMLMmn6ZIS9r
	aJ7xmJ0Bu4+mS70/IzkzujTQKDm/Bv5FbDzAArR4f0W2HXvtyNoyZIj9Kf6bvmUGCF3BESmDQTCPS
	LXlutVGy531flFhG3x8fabpAWsTuV4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieh3z-0005Rs-Ci; Tue, 10 Dec 2019 15:04:35 +0000
Received: from ms9.eaxlabs.cz ([147.135.177.209])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieh3w-0005RM-1A
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 15:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=JYLcJhGa26ePxUhCLaeVt5gG3fUkiaBnY+uXwvTg0qA=; 
 b=RLELJyUDmacFSXsa8R7Tt97fV3tJOUdtlPaZ1LeqB1ELIK4D7sgzOZiSTzIm4uEoC4mH3fMh7qGECVW48jpVxK3CZe1XC8vlBkn9M+F2Nm89MRzCrN5JR0XU/7BpDjOQ2YUoXJZyepDJtLXvmYJkjRfQOpzylpxnA9vKR4QfFI8=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1ieh3e-0002ca-76; Tue, 10 Dec 2019 16:04:16 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Fix unexpected timeouts in waitrdy
Date: Tue, 10 Dec 2019 16:03:18 +0100
Message-Id: <20191210150319.3125-1-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_070432_386717_B82294B3 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Martin Devera <devik@eaxlabs.cz>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, jan.pohanka@merz.cz,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The used way to compute jiffies timeout brokes when
jiffie difference is 1. Simply add 1 - it has no other
side effects.
Fixes STM32MP1 FMC2 NAND controller which sometimes failed
exactly in this way.

Signed-off-by: Martin Devera <devik@eaxlabs.cz>
---
 drivers/mtd/nand/raw/nand_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d527e448ce19..beab3a775cc7 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -721,7 +721,11 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 	if (ret)
 		return ret;
 
-	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
+	/* +1 below is necessary because if we are now in the last fraction
+	 * of jiffy and msecs_to_jiffies is 1 then we will wait only that
+	 * small jiffy fraction - possibly leading to false timeout
+	 */
+	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms) + 1;
 	do {
 		ret = nand_read_data_op(chip, &status, sizeof(status), true);
 		if (ret)
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
