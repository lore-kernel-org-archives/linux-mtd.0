Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F15EC388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA3E20797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nh1/A0nY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA3E20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RhsNJcPz/wkuNRqoRqSoRI6VYKC20QdV2OaEiTl7kjI=; b=Nh1/A0nY5bQYvbtfAmbfXoi8Y
	fZidO3WNK72C8IzYPv/engIdhs343fnYuRvjHpWrdKnqwEGac5vW7MumPGuUFACCZpGMt58IS18hX
	Zu9ELGU94sXwjo1RWRiSNaxdE4FkPk/uIJo8AuP3uNM2BwONTdcUJ3/+go/L9ikbPLEiSEq0YmiyB
	wjssFF4z3Yd0yV77aH1/9x7IA1Dbw61CX31nbjQ1zBaHJWVP6ajNUmrC8fZT83Bfv6CvxWT51Q1tp
	/k42mf6LC3Ha5YOy+4CzjhcEW205nrRJO3g1/yIV2KBZQlhjhMdcx+6RmyOc+Ga214j2q8i4HMvek
	kQXasu3ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYHx-00087K-OL; Fri, 13 Nov 2020 12:34:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHf-0007yr-4y
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:32 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A8F79C0005;
 Fri, 13 Nov 2020 12:34:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/19] mtd: rawnand: cs553x: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:10 +0100
Message-Id: <20201113123424.32233-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073431_346136_039CA3B9 
X-CRM114-Status: GOOD (  15.27  )
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
 drivers/mtd/nand/raw/cs553x_nand.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index b066dcae31ab..6edf78c16fc8 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -242,8 +242,24 @@ static int cs_calculate_ecc(struct nand_chip *this, const u_char *dat,
 
 static struct cs553x_nand_controller *controllers[4];
 
+static int cs553x_attach_chip(struct nand_chip *chip)
+{
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
+	chip->ecc.size = 256;
+	chip->ecc.bytes = 3;
+	chip->ecc.hwctl  = cs_enable_hwecc;
+	chip->ecc.calculate = cs_calculate_ecc;
+	chip->ecc.correct  = rawnand_sw_hamming_correct;
+	chip->ecc.strength = 1;
+
+	return 0;
+}
+
 static const struct nand_controller_ops cs553x_nand_controller_ops = {
 	.exec_op = cs553x_exec_op,
+	.attach_chip = cs553x_attach_chip,
 };
 
 static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
@@ -285,14 +301,6 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 		goto out_mtd;
 	}
 
-	this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	this->ecc.size = 256;
-	this->ecc.bytes = 3;
-	this->ecc.hwctl  = cs_enable_hwecc;
-	this->ecc.calculate = cs_calculate_ecc;
-	this->ecc.correct  = rawnand_sw_hamming_correct;
-	this->ecc.strength = 1;
-
 	/* Enable the following for a flash based bad block table */
 	this->bbt_options = NAND_BBT_USE_FLASH;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
