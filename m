Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0F1C4363D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 13:46:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599DD206DD
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 13:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5yNGRc5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599DD206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=skIncjdGHNCC/SoCQm+kaInlx783ZAyudXngTnpiBCY=; b=k5yNGRc5JnMir8+4v0QE66hUrt
	qlOAlTqGkubN/BiEjWqHqtbJ+bVTm3p+7xlXdA+5ehAkBwxLwQ3ElpTFVBp6inWsLMabosbFV2brl
	OfOpLUfNH70BEs/ISC0aYHr8ZrGiGwnluijm72+CgcUzHGNsm4ZUAKjdlu3jICzN73cfZBV2uy6zT
	vC1JoLGTcJ4GsiukKLCB6qdD3WIp8vcIUTULZG7ha1QwtPW4wpCsExZU/F7y2UFpuVxTC+vC4MYEm
	tujFaEJY/CiIbwTpL6wm2a7UkHDDavu0vBlloWScsFPpZHH34TvEMzP0g1L3f+B/UxkCauRunIWLN
	L9Gly8Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ9lc-0006bM-Fi; Wed, 07 Oct 2020 13:46:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ9lZ-0006ab-Mv
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 13:46:02 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kQ9lW-0006QA-2C; Wed, 07 Oct 2020 15:45:58 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kQ9lU-0008IA-IO; Wed, 07 Oct 2020 15:45:56 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: han.xu@nxp.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH] mtd: rawnand: gpmi: cleanup makefile
Date: Wed,  7 Oct 2020 15:45:33 +0200
Message-Id: <20201007134533.31390-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_094601_761085_636507DC 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The extra gpmi_nand.o object is not needed anymore since
commit 3045f8e36963 ("mtd: rawnand: gpmi: move all driver
code into single file").

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/Makefile b/drivers/mtd/nand/raw/gpmi-nand/Makefile
index 9bd81a31e02e..247cbfceaa19 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/Makefile
+++ b/drivers/mtd/nand/raw/gpmi-nand/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_MTD_NAND_GPMI_NAND) += gpmi_nand.o
-gpmi_nand-objs += gpmi-nand.o
+obj-$(CONFIG_MTD_NAND_GPMI_NAND) += gpmi-nand.o
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
