Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44471C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 20:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7CD60462
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 20:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE7CD60462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mQ+SM+VElfFfksq+NE6xL3pGeupkb8xeTYLXgPWFKMc=; b=HlntWArJB0GDgk
	xD0B1b5pFMIDKmmMLUkd4GYNXHN1eXRoPEf4Oqdt+cDKqyZUmoS/voaYGSr67fdP26HlPpnTMa9W/
	ZATb2VbxlR2SjIYeqlHgSNaB8Aym40DMN/zxzxYVmWy9sw+F2WBilxlQrTrUnceVdQznOKluYPPS7
	s6LD2UjJD04VZhL3b/9VpH7qjZ0qW4/7DzpRkXbDzgCdAmPhiCfR1T71DXThfhsCV6iiqtw/OaWVk
	B8l+Hz48FNNyFEterMy+3g+L/ib/8UGhZ2WaGjacwTtaDboXLSw/Lk8YAedQyLtRUmBW6qjsNk+3V
	CN+WDoyZI1pendBCq2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi0Hm-002voo-2E; Tue, 02 Nov 2021 20:21:34 +0000
Received: from mailout05.rmx.de ([94.199.90.90])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi0Hg-002vim-6G
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 20:21:30 +0000
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout05.rmx.de (Postfix) with ESMTPS id 4HkLrn26B9z9tv3;
 Tue,  2 Nov 2021 21:21:13 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin01.retarus.com (Postfix) with ESMTPS id 4HkLrL1hc1z2xhq;
 Tue,  2 Nov 2021 21:20:50 +0100 (CET)
Received: from N95HX1G2.arri.de (192.168.54.19) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 2 Nov
 2021 21:20:49 +0100
From: Christian Eggers <ceggers@arri.de>
To: Michael Trimarchi <michael@amarulasolutions.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Stefan Riedmueller <S.Riedmueller@phytec.de>,
 Han Xu <han.xu@nxp.com>, Greg Ungerer <gerg@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Christian Hemp <C.Hemp@phytec.de>, 
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Stefan Riedmueller <s.riedmueller@phytec.de>, 
 <stable@vger.kernel.org>
Subject: [PATCH 1/2] mtd: rawnand: gpmi: Remove explicit default gpmi clock
 setting for i.MX6
Date: Tue, 2 Nov 2021 21:20:21 +0100
Message-ID: <20211102202022.15551-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.19]
X-RMX-ID: 20211102-212050-vNRqcPQyngmv-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_132128_434590_1CFEA47D 
X-CRM114-Status: GOOD (  14.98  )
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

From: Stefan Riedmueller <s.riedmueller@phytec.de>

There is no need to explicitly set the default gpmi clock rate during
boot for the i.MX 6 since this is done during nand_detect anyway.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: stable@vger.kernel.org
---
@stable: This patch fixes a bug because this (superfluous) call to
         clk_set_rate() misses the required clock gating. The resulting
         clock glitches can prevent the system from booting.

Changelog:
-----------
RFC --> v1
- Cc: stable@vger.kernel.org

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4d08e4ab5c1b..a1f7000f033e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1034,15 +1034,6 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 		r->clock[i] = clk;
 	}
 
-	if (GPMI_IS_MX6(this))
-		/*
-		 * Set the default value for the gpmi clock.
-		 *
-		 * If you want to use the ONFI nand which is in the
-		 * Synchronous Mode, you should change the clock as you need.
-		 */
-		clk_set_rate(r->clock[0], 22000000);
-
 	return 0;
 
 err_clock:
-- 
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Trauninger; Markus Zeiler


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
