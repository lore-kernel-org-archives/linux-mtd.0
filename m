Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9794AC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674192148D
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJAOMn2S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674192148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFvQ9VQ934T2grJ80W0IVCkx7nFN4Ym8IWSiGiSr4F8=; b=iJAOMn2SWANTmc
	pVN9RG4osvfc4kdbFf+op7rv8W2J8UGVcgF8X83jyt43D20lzie+wwq1qNnnEEn0qPacqZzqt0mT8
	L4mrgRJm6wGnoDPFw5QEI+XwuVg3oFADAb/RxkSbrvaPs2dfILhxVE7mf4yoR8Sikb/cgVzAlyPdk
	SntYS1R71LEr1s4djh8Qb6e82CtobTBzMPoTq58kgSg0KdJBSTHqHl8pG7UWV6dAmYkSBWa8DyTBn
	53jxtIyUqXc9f/vkjzAxCqOudRdI7Usn7uIYr5IE0svreEOjvvGboU4EyaLwMmHojUKQcJvcox5A1
	wnkimLItIPtdMAgPfMfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwlNk-0001gC-BZ; Thu, 21 Feb 2019 10:15:08 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwlBz-0007nn-Ha; Thu, 21 Feb 2019 10:03:31 +0000
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1F5B1100016;
 Thu, 21 Feb 2019 10:02:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [RFC PATCH 12/27] mtd: nand: ecc: Use SPDX license identifier for the
 software Hamming code
Date: Thu, 21 Feb 2019 11:02:01 +0100
Message-Id: <20190221100216.25255-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190221100216.25255-1-miquel.raynal@bootlin.com>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_020300_466545_199F23C7 
X-CRM114-Status: GOOD (  15.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove the legacy license text, also update the MODULE_LICENSE macro
in accordance with the text at the top of the file (GPL v2 or
higher).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/sw-hamming-engine.c   | 18 ++----------------
 include/linux/mtd/nand-sw-hamming-engine.h |  5 +----
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/ecc/sw-hamming-engine.c b/drivers/mtd/nand/ecc/sw-hamming-engine.c
index 9abef611456f..6ba0205f1b4f 100644
--- a/drivers/mtd/nand/ecc/sw-hamming-engine.c
+++ b/drivers/mtd/nand/ecc/sw-hamming-engine.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * This file contains an ECC algorithm that detects and corrects 1 bit
  * errors in a 256 byte block of data.
@@ -11,21 +12,6 @@
  *
  * Information on how this algorithm works and how it was developed
  * can be found in Documentation/mtd/nand_ecc.txt
- *
- * This file is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 or (at your option) any
- * later version.
- *
- * This file is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this file; if not, write to the Free Software Foundation, Inc.,
- * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
- *
  */
 
 #include <linux/types.h>
@@ -493,6 +479,6 @@ int nand_correct_data(struct nand_chip *chip, unsigned char *buf,
 }
 EXPORT_SYMBOL(nand_correct_data);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
 MODULE_DESCRIPTION("Generic NAND ECC support");
diff --git a/include/linux/mtd/nand-sw-hamming-engine.h b/include/linux/mtd/nand-sw-hamming-engine.h
index c0f015b1a077..1bd7493c682b 100644
--- a/include/linux/mtd/nand-sw-hamming-engine.h
+++ b/include/linux/mtd/nand-sw-hamming-engine.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  *  Copyright (C) 2000-2010 Steven J. Hill <sjhill@realitydiluted.com>
  *			    David Woodhouse <dwmw2@infradead.org>
  *			    Thomas Gleixner <tglx@linutronix.de>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * This file is the header for the ECC algorithm.
  */
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
