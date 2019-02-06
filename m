Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20025C282CB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 00:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8B52183E
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 00:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t94iFcfx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvuIvSW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8B52183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kq/q04pYyNG2i7To/WxjjbQ7GNxnGNxUEhmFF9nju6I=; b=t94iFcfxazJvel
	RXquJJrMWiv1XZPefwJZ+7n12Xo5kwfN5mYvF0LDC+/Ndbmu/q4Z44euFQ65+ccrfQobkC+P9anb3
	jo5EdEqT1ziy4Vkokcbjxkfc2sjKGy4q6b+Ien7hU3taDuIbqx1KzHzL0im5MF8GPiA0hC87SKHEc
	g7zCzBic6BAVd2SkJg8doFjmGXkvKCkzGEJehpufN2oaJc3J+bjZgS55Ukfmqz9LnpVgI6DYyedvm
	08aO5rW7CCnmYSRPCgTeGwRmwoQasV/lCy5kzi9/DL01etpyslm78JeOAHc1dYnbrarXldBWD30A2
	GL4GCU2CTa7o0KmaxBRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grBDO-00077B-AL; Wed, 06 Feb 2019 00:37:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grBDJ-00076n-Qg
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 00:37:19 +0000
Received: by mail-pf1-x442.google.com with SMTP id j3so159482pfi.12
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 16:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfdCioFzbTseBaawu0KavZtAtUhME0p1BmaW9QG2WgI=;
 b=HvuIvSW2IfmAaHbpFtcXVD8h9OB5ItVxD1COY8G9IjKrUu/DIP2vn3UKzwjR2cteHq
 xfKvTH7HTwlKaxbsm2oY1gvn2fzvIqtrwYDGg++tWaY0cxNfbPLfUSt6Rnp6qkYKK7l4
 6fdslErzASbL4QxK+2hFU+xDr61ImsBISPgajx9XORGmrghCBSFVlv3gdsgF8L5qxJbs
 9HflCbYk7FXmrcpxdIUSAdUpvZ1XsVspqd30SH/+r8q5A2v0VGqjfaPELR6PbpSkoXFo
 H8OXWggxLvpt3la9hFRfmVPXGeuxbPIfajutuQJboLyt0dQ7uHAH4lmSF+OLYvQV2FlU
 UJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WfdCioFzbTseBaawu0KavZtAtUhME0p1BmaW9QG2WgI=;
 b=h4WOk0nBA/pkBJsol7MSb/iqc++XitqzuTurVlP7eVmtra3Xny+uQ2HRAFK83aHUC7
 dXfex+jNoQallUTU0D0t+M3u0o4YBfC65M008k9w97mXMLHG2O3ElljuM+f/kBqGjOxF
 9PpiUB5kEew6LhTPHC+JARejkTICoSXTSIhDhNbf6p/ZFAzsnszGeeiqWKNUUaNO9BUS
 JQkVarTZCl9X/8QrB6CYeLVH5piLdGhEZM2+iyGvCoYDmmjN/gnyQF325gsUZUDZ/gem
 0XEyjN0TzBIQlAg8OHtaBHqBgFSQOguOwRtZabiicIOc5/kFeYbaQPNM8PGuW+oAIIT8
 yHKQ==
X-Gm-Message-State: AHQUAuZAEKrJ6f6baRYcuZrTy8OrcRPbKHFAx3wKUhzoV1K/rEpc+fSW
 bfWtsH7iBepHxcPOk1EMNmQ=
X-Google-Smtp-Source: AHgI3Ia1lQvagj/wMFSvfYFeEW9H/pWNyuQSBw5wL9k10zMCUCVgiF0xOwknBHUbXkk13acwLXyS1g==
X-Received: by 2002:a63:26c1:: with SMTP id m184mr6600295pgm.367.1549413432820; 
 Tue, 05 Feb 2019 16:37:12 -0800 (PST)
Received: from voyager.jms.id.au ([45.124.203.0])
 by smtp.gmail.com with ESMTPSA id t3sm5474688pgp.5.2019.02.05.16.37.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Feb 2019 16:37:12 -0800 (PST)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Wed, 06 Feb 2019 11:07:05 +1030
From: Joel Stanley <joel@jms.id.au>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: powernv: SPDX and comment fixups
Date: Wed,  6 Feb 2019 11:06:58 +1030
Message-Id: <20190206003659.27107-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_163717_869458_7C09478F 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This converts the powernv flash driver to use SPDX, and adds some
clarifying comments that came out of a discussion on how the mtd driver
works.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/mtd/devices/powernv_flash.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 22f753e555ac..0bf43336c3f7 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  * OPAL PNOR flash MTD abstraction
  *
  * Copyright IBM 2015
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/kernel.h>
@@ -261,6 +253,14 @@ static int powernv_flash_probe(struct platform_device *pdev)
 	 * The current flash that skiboot exposes is one contiguous flash chip
 	 * with an ffs partition at the start, it should prove easier for users
 	 * to deal with partitions or not as they see fit
+	 *
+	 * When developing the skiboot MTD driver an experiment with FFS
+	 * parsing in the kernel, and exposing a seperate /dev/mtdX for each
+	 * partition (eg BOOTKERNEL, PAYLOAD, NVRAM, etc), was done.
+	 *
+	 * We didn't go with that as it meant users couldn't do a full flash
+	 * re-write, as this can cause a partition to change size, and there
+	 * wasn't a way to tell the MTD layer that a device has shrunk/grown.
 	 */
 	return mtd_device_register(&data->mtd, NULL, 0);
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
