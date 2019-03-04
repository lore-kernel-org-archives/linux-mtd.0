Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3944C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:13:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D3520823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O6/6ZR2h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nJWju+q3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D3520823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFCiPz0e3UYJRl5uDS13t+VfjTyqQeoXv7N0OSEabXQ=; b=O6/6ZR2hbxxU2t
	rZjHcz7DZWFcLfT5hF65iSlsUgBjYbxutKVhgkztFu6m/EEDK0QjkpAwOQZ5KaIw2EUOtEd/L5EL8
	pycNhoidKzuW5+nj9EoeTEMeTsU+qi9iMwCz9KFWJXrBNtrAufk9z7EQR8RpiRPiHlVRjei0d7au6
	kFxkAY8nUwqE3IotYizFWAV7aQ0fSK5G/uE8KQJkdGCj1UdOM6cxq7lvpFRdPV4MnXxI0GkOjONqM
	YVbNtImeL7HzmD3lfQeesbwpp4tiBn9WURyBZT+FXp0wJ9O4JbBUPRTBsrSmfcqGS/wBNEJGUNaIb
	vR8dZEH9gzWfL3b/qaDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wmF-0002Qh-8R; Mon, 04 Mar 2019 23:13:43 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wja-0007DE-LK; Mon, 04 Mar 2019 23:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4rIDRB0EBpNckt01c+JYVwV0JBiOhi487PWp6G34Lfo=; b=nJWju+q3RtAxoQXE95EhxwkhLY
 S1vbcYGkjy/rXuJBqSCQEXOM/IJi+LXrbFGY14r3Z99EezNRG5M7+pxAxCzuUvcjUT5QF/Opn1dsD
 uJxw3klmFyLWlNmm463qBk5HlFS0Kvxg7VWJr+lFeFgkN720WKc8SjgKNN5S821UH/zA6tV5IZ39J
 ITkMRqeDFZA0yZaEMvUxddmip5h9JkA5FkMY7FBIzYnD5OwDcNcOpHbco54+/FSJlTxhDcJz8fLyp
 xrZqGdhRvAS28II8/RpXmBl54c+LzJ383DJU+n093lG2GEOQOjq9h0cwRZJahCap5ritd7TrGfCQd
 P97D1WIQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6n-00019B-Mu; Mon, 04 Mar 2019 22:30:54 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2B668240007;
 Mon,  4 Mar 2019 22:30:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 19/36] mtd: nand: ecc: Use SPDX license identifier for the
 software Hamming code
Date: Mon,  4 Mar 2019 23:28:24 +0100
Message-Id: <20190304222841.13899-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173053_883716_4F823DCF 
X-CRM114-Status: GOOD (  15.93  )
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
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove the legacy license text and replace it with the new standard:
an SPDX license identifier.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/sw-hamming.c       | 16 +---------------
 include/linux/mtd/nand-ecc-sw-hamming.h |  5 +----
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/ecc/sw-hamming.c b/drivers/mtd/nand/ecc/sw-hamming.c
index b6931cd9f401..ba84f5ebbc37 100644
--- a/drivers/mtd/nand/ecc/sw-hamming.c
+++ b/drivers/mtd/nand/ecc/sw-hamming.c
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
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index c0f015b1a077..1bd7493c682b 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
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
