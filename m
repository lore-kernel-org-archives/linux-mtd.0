Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB4C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F530214AE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WOyIp8xk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="NORy5/8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F530214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qj2vC+02pCPgm9enQANKf11hLz/ynK7J54G/44siBtY=; b=WOyIp8xk4rfjYQOG1LH6Iz37jD
	fUvq/BperaBc2toM0uWT4NuA2P4bxlam2L9dTC6ynR6dVLbTUM62MuVsnY6e/WCkWV3SeFcI+jtXG
	KCG7Svg21BxusqRh17HkDHMzGtzuPsiYiEuq2tM/mfFQfwxsURdol0KjPxD2Rg4EFuoH3LPBGUb7x
	zBUpB+wbh3sEnrQMHw0uQY3b4N42owzozy3WpK2v3EcqI9FKvusd0cgCzltDrKUhfSUv2Bu7fU3zZ
	X08CdV9G85KCbZxptTQ3tokwcNJMSlI3geaO+PmkckUj+PocGnhwh6XEWEmPS4zGvwRkTYDwZ5IA3
	gwIgigYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3d39-0000no-Rs; Tue, 12 Mar 2019 08:46:15 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3d2e-000074-IW
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 08:45:47 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x2C8j6Zd004092;
 Tue, 12 Mar 2019 17:45:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x2C8j6Zd004092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1552380318;
 bh=qWRjILUJ5jjZY9FFH+5ZJYFjW1Di+opuV2JZeSRLmxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NORy5/8bdn8Lkj/xBxzJVLbdu4wKQmDJUa7pWwu9BQgl5fN6jzQLlUeEsV4rGrTnv
 nqDHbOH/aXTOuFsl1GePMvdWrJeRoHTEAlUrIlE1wC5BE87hVSH61Nz8krg0rf1Y+R
 WxNnAjLL5G7REQ/OpZYjmIcmgEQ8pr2FVTi50rMCQbdDbxuJ6nRJZCYVqgnrTkgsX+
 CRMJoAt0XC0BTImMtYETULmyaa2f8jrGiRrTINzyj6dp9nNRrGSr99ummQCkEhiUbF
 6CJ0jbOTovxDo2mmcPo43S6IrzA6JJaMvWxzVhVKDCqnYRcRD0ks2C1dWhcA7vYtyA
 o2fROoHmL4rSQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 3/9] mtd: rawnand: denali: remove unneeded casts in
 denali_{read, write}_pio
Date: Tue, 12 Mar 2019 17:44:44 +0900
Message-Id: <1552380290-19951-4-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_014544_932059_E1740D86 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since (u32 *) can accept an opaque pointer, the explicit casting
from (void *) to (u32 *) is redundant. Change the function argument type
to remove the casts.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index ebeedbd..d2040b7 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -478,11 +478,10 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 	denali->host_write(denali, mode | 0x14000, 0x2400);
 }
 
-static int denali_pio_read(struct denali_nand_info *denali, void *buf,
+static int denali_pio_read(struct denali_nand_info *denali, u32 *buf,
 			   size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status, ecc_err_mask;
 	int i;
 
@@ -494,7 +493,7 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 	denali_reset_irq(denali);
 
 	for (i = 0; i < size / 4; i++)
-		*buf32++ = denali->host_read(denali, addr);
+		buf[i] = denali->host_read(denali, addr);
 
 	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
 	if (!(irq_status & INTR__PAGE_XFER_INC))
@@ -506,18 +505,17 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 	return irq_status & ecc_err_mask ? -EBADMSG : 0;
 }
 
-static int denali_pio_write(struct denali_nand_info *denali,
-			    const void *buf, size_t size, int page)
+static int denali_pio_write(struct denali_nand_info *denali, const u32 *buf,
+			    size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	const uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status;
 	int i;
 
 	denali_reset_irq(denali);
 
 	for (i = 0; i < size / 4; i++)
-		denali->host_write(denali, addr, *buf32++);
+		denali->host_write(denali, addr, buf[i]);
 
 	irq_status = denali_wait_for_irq(denali,
 				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
