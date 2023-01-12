Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C29C54EBD
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPEpmE+Rbb6jGkTJNuedGyvMyTIwPzHvFKMmdX5pLLg=; b=wCMgcymnpyqcO+
	kzZZJmFkdsWJBn6nKBkOSrWS+j4t0aLuu3HZ6f46Y4UX+y46lKBDsFHuPA6XS5NUuJ5/KWYvx1iP/
	F0rSCsHhbZBrsryFJc5oZoqvHRO14/HsCI4i5wue0ZpWZDLS8dUWJ8rXLsetgxEpVHJJk1VZ5FrbB
	OCOI38tnMG37Rtpt1qAgmnrr9T5cr5B2ZRVRqLO3fvx6bKiAQ7esQpMdzTHP7qB/WkN2M6ZWob4vv
	5AYPxaQFmPifkHFixWlZLlYoOKT3IndjhgooRCgiyDr3ZgpUa7PhdqiBm4AHfaPcywSr79uOaUWoA
	q0hEA6zU4Cr1DWG7G4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu10-00EOjS-Dt; Thu, 12 Jan 2023 09:36:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu0s-00EOeh-Uc
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2023 09:36:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A5707E0016;
	Thu, 12 Jan 2023 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673516202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ehx03+mzy92E1KNqfT+pSWcfM/T3ECjmM2BooPTBTKc=;
	b=Jkq4VgD1igDxOCk1XRD0/vgVPFI+z1drtQU4Jy2CZtwrSi3uFJc0p1ffQzPs0l6dIk86lq
	xipalS0n5mCfMu7B2KDIOdbJSVkY88S6pwj5gWjqrosfIZCgmI89ArhbZFpvqso683usiL
	OpJ3QJKrznEZ3fnEaPneaNwpkywpaJadc4ciWFMrlK7t9RHClMQNDIlKTxhkEzjzOyFV6z
	vmLtSclQ/DGC172xpx6e/aG2ONx+YZ77a4p0LEuwEcYiVPPi0NiJkr3z69+Jt5VHvSxBWS
	0mZGs1EQsabL46yNu3Pb5R6+1DXEUPAS8ENIrnonuIq/S9T8fDrv6DQZ6qLlKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/3] mtd: rawnand: Prepare the late addition of supported operation checks
Date: Thu, 12 Jan 2023 10:36:36 +0100
Message-Id: <20230112093637.987838-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112093637.987838-1-miquel.raynal@bootlin.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_013647_158368_71C89809 
X-CRM114-Status: GOOD (  10.99  )
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

Add an empty envelope just to show how to add additional checks for new
operations. This is going to be used for sequential cached reads, which
require the page size to be known (and the discovery to be over), hence
the "late" designation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 83bfb1ba2fa3..34395d5d3a47 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5009,6 +5009,14 @@ static void rawnand_early_check_supported_ops(struct nand_chip *chip)
 	rawnand_check_data_only_read_support(chip);
 }
 
+static void rawnand_late_check_supported_ops(struct nand_chip *chip)
+{
+	/* The supported_op fields should not be set by individual drivers */
+
+	if (!nand_has_exec_op(chip))
+		return;
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -6345,6 +6353,8 @@ static int nand_scan_tail(struct nand_chip *chip)
 			goto err_free_interface_config;
 	}
 
+	rawnand_late_check_supported_ops(chip);
+
 	/*
 	 * Look for secure regions in the NAND chip. These regions are supposed
 	 * to be protected by a secure element like Trustzone. So the read/write
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
