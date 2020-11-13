Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423B0C4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFF420797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s6KoXtbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFF420797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tLDwuzAa0Yj+gKd8Spy9H4888Xmxhx6A2SOpvHofbJA=; b=s6KoXtbc/ItDVIq577n1GW+Sj
	rey9BeIXUzV+FFipJT3A5mtm8fMLNcUiLZddhJ/g/bFJHQZaE49zKL4Pr4hUrJGODLpZUKVYhn9An
	9URurMxOWPNMELUwS9DX5uIX1vXQ6LhCozLHaptEfhZnEzDKyoayz7oY7b+1d6f8zrTNlm9OFAZFm
	bMT8qZ205BmNorXo/HqY/r/vqNJuICquIRZMFSzK3JVNqIGGZrritWFmFUgvmVLuveQ11tDxtsQVV
	IJl0LRDm1YDWrolniZs4KxYMpM/6mMOynutKt6DlnSPfDzso5d8S6r21VAqOOoXnMMA0g2cW4D4pV
	ILbewTZ4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYI8-00089b-AG; Fri, 13 Nov 2020 12:35:00 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHg-000801-Jz
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:34 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3190CC000C;
 Fri, 13 Nov 2020 12:34:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/19] mtd: rawnand: diskonchip: Move the ECC initialization
 to ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:12 +0100
Message-Id: <20201113123424.32233-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073432_859170_6683B4B3 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The probe function is only supposed to initialize the controller
hardware but not the ECC engine. Indeed, we don't know anything about
the NAND chip(s) at this stage. Let's move the logic initializing the
ECC engine, even pretty simple, to the ->attach_chip() hook which gets
called during nand_scan() routine, after the NAND chip discovery. As
the previously mentioned logic is supposed to parse the DT for us, it
is likely that the chip->ecc.* entries be overwritten. So let's avoid
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 94432a453e5e..26b265e4384a 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1269,12 +1269,31 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
 	return 1;
 }
 
+static int doc200x_attach_chip(struct nand_chip *chip)
+{
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
+	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
+	chip->ecc.size = 512;
+	chip->ecc.bytes = 6;
+	chip->ecc.strength = 2;
+	chip->ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
+	chip->ecc.hwctl = doc200x_enable_hwecc;
+	chip->ecc.calculate = doc200x_calculate_ecc;
+	chip->ecc.correct = doc200x_correct_data;
+
+	return 0;
+}
+
 static const struct nand_controller_ops doc200x_ops = {
 	.exec_op = doc200x_exec_op,
+	.attach_chip = doc200x_attach_chip,
 };
 
 static const struct nand_controller_ops doc2001plus_ops = {
 	.exec_op = doc2001plus_exec_op,
+	.attach_chip = doc200x_attach_chip,
 };
 
 static int __init doc_probe(unsigned long physadr)
@@ -1452,16 +1471,6 @@ static int __init doc_probe(unsigned long physadr)
 
 	nand->controller	= &doc->base;
 	nand_set_controller_data(nand, doc);
-	nand->ecc.hwctl		= doc200x_enable_hwecc;
-	nand->ecc.calculate	= doc200x_calculate_ecc;
-	nand->ecc.correct	= doc200x_correct_data;
-
-	nand->ecc.engine_type	= NAND_ECC_ENGINE_TYPE_ON_HOST;
-	nand->ecc.placement	= NAND_ECC_PLACEMENT_INTERLEAVED;
-	nand->ecc.size		= 512;
-	nand->ecc.bytes		= 6;
-	nand->ecc.strength	= 2;
-	nand->ecc.options	= NAND_ECC_GENERIC_ERASED_CHECK;
 	nand->bbt_options	= NAND_BBT_USE_FLASH;
 	/* Skip the automatic BBT scan so we can run it manually */
 	nand->options		|= NAND_SKIP_BBTSCAN | NAND_NO_BBM_QUIRK;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
