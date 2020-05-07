Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC276C38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 10:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8461D2083B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 10:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfwVZGAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8461D2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZWGvDeItN/hG6db0R3aKJwwzFBPmfIy1BljYFB6N5I=; b=EfwVZGAgBjbc5J
	NdHbL7Nvygx7oqIBwrrFvA//vhR8TfcNH/BOyZWiiv4iS3XmcExSRM35NNQJuWeuXiwYtkIVmyBc1
	AazoZ8SLK581NajwYi7KxXnxgNoKrwJz18KPVqNRN/Gfn5wP2U2uhPuzn2Tq7VPjZhTvYqsoomtEI
	F9PWmQWidzC4yTp2GEN5MgmVAJKMcP69vrVgYEhWvHphlajAAZkoRIy6LE4vuj69d3TWGS7nqHTCs
	w7cafXbTMSfsoStivuE8BOoCe0rMGfTs4Mk7M+iIj4zbYMg4nMHLa66XB7nT+p8b479MmcVWaqfd+
	ugEeMWSl54PA/Ofjxx4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWeCS-00019B-6k; Thu, 07 May 2020 10:56:20 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWe9F-0004Em-6M
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 10:53:02 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 88CD124000A;
 Thu,  7 May 2020 10:52:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 13/13] mtd: rawnand: micron: Allow controllers to overload
 raw accessors
Date: Thu,  7 May 2020 12:52:41 +0200
Message-Id: <20200507105241.14299-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507105241.14299-1-miquel.raynal@bootlin.com>
References: <20200507105241.14299-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_035301_376924_AF037E18 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some controller drivers do not support executing regular
nand_read/write_page_raw() helpers. For that, we created
nand_monolithic_read/write_page_raw() alternatives. Let's now allow
the driver to overload the ECC ->read/write_page_raw() hooks when
these hooks are supported.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 3a37d48c9472..b2b047b245f4 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -508,8 +508,10 @@ static int micron_nand_init(struct nand_chip *chip)
 			chip->ecc.read_page_raw = nand_read_page_raw_notsupp;
 			chip->ecc.write_page_raw = nand_write_page_raw_notsupp;
 		} else {
-			chip->ecc.read_page_raw = nand_read_page_raw;
-			chip->ecc.write_page_raw = nand_write_page_raw;
+			if (!chip->ecc.read_page_raw)
+				chip->ecc.read_page_raw = nand_read_page_raw;
+			if (!chip->ecc.write_page_raw)
+				chip->ecc.write_page_raw = nand_write_page_raw;
 		}
 	}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
