Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B39C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 10:41:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C15864E6C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 10:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C15864E6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ao7lrdlmmxQ+KEf5xHl4Qgxr5iP6vfPzlN0kSydC4bQ=; b=XOgAZh+vI9CFNHhv9fZVTq/Q4X
	zeuIoXub+ybx99hRbVAQp1lUN3u70lXpKYluPz0YFFM6GXv9Udxnay8MFgLaBOYX5NwIRfW0zwZ2d
	WxHrKubtkToOCsc2qOfsD3gW9IRzvwVcrbl1dGMpFDvooA5lkn3LWtAG841AK9XZrmtldGrTLaQ6i
	G8igGg3EvkWb+TkWEwb2O6vHNhBsVcGz9kv/OHNRwpQ+SPHzjnwnMa84qF7cgGAYKP/0qSFA12B2/
	PrkcMCa6YkKX+ZvxMsOgXex6a9lgeiw7dZsYXU+dbN9q/DOVYoWZ3UlZaqTLAcAg2lxYsxtrl29bO
	ijId291g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAVsD-0003OE-9C; Fri, 12 Feb 2021 10:40:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAVsA-0003N2-In
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 10:40:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5876864E6B;
 Fri, 12 Feb 2021 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613126425;
 bh=xzoXFaoeYDTEMR3GxWVBJHXTFKlnfSz6FIU6JbD02kg=;
 h=Date:From:To:Cc:Subject:From;
 b=OdS1E/690pVqNSZvz1hzx9/9wmwurZzzpcY4AbVAjTN0P4zswcp6MDU2ezyVlqltY
 vjY1YHqdStftk1JhFtRgM76uLU0EmIHPwNWtlEWYO3ndST1KJ3YsrPHdA+uvSTOEnx
 I8elamVniEYZmov6Cw8uvECwV/WekrStAWPeAyriL/hGurbRCIG8LreOGUyAnpLAQV
 RMGj0N6kl+/Gpl5L8M/h+OPtCTliU05lHFDlx9tIbAWGpXWB8QWj2eq1TxEO91LXIs
 bUZ2rWMkjznQoAGv8nFgdRpj7J5F/D1XdqMHNJpdlRW+nd+ayjkScO1Bd3g2RW755h
 +cuefkoNQrvrw==
Date: Fri, 12 Feb 2021 04:40:22 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: [PATCH] mtd: physmap: physmap-bt1-rom: Fix unintentional stack access
Message-ID: <20210212104022.GA242669@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_054026_709970_5C7BDBD6 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cast &data to (char *) in order to avoid unintentionally accessing
the stack.

Notice that data is of type u32, so any increment to &data
will be in the order of 4-byte chunks, and this piece of code
is actually intended to be a byte offset.

Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
Addresses-Coverity-ID: 1497765 ("Out-of-bounds access")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/maps/physmap-bt1-rom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
index a35450002284..58782cfaf71c 100644
--- a/drivers/mtd/maps/physmap-bt1-rom.c
+++ b/drivers/mtd/maps/physmap-bt1-rom.c
@@ -79,7 +79,7 @@ static void __xipram bt1_rom_map_copy_from(struct map_info *map,
 	if (shift) {
 		chunk = min_t(ssize_t, 4 - shift, len);
 		data = readl_relaxed(src - shift);
-		memcpy(to, &data + shift, chunk);
+		memcpy(to, (char *)&data + shift, chunk);
 		src += chunk;
 		to += chunk;
 		len -= chunk;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
