Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685BFC43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 05:16:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37960206D3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 05:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bqkn4Z07";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="gDedeshF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37960206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UtbypBNWtVaEFjUu8Rvf5tvEEKaQznUGvJ3yaqqsy9I=; b=Bqk
	n4Z07d/EDPNBXmzFfSgB3AprOvxbGd9XiV7LMV9VGpXLovt/5JHjm60nuFnbKwFzAyhbu5AJl6u8p
	bl9LMAl9y9F0z8sMFId4OjgSmJJUzuoRxrR1CzJPX/XccHaoEbP2Lwcjz4ZedbCjOqAJLSrvqspsW
	mkUlxauNzarH+ao/XPdVXlBjKCYm9XG4qUx7e6i8TCDqzWi1sElRJNdGEY5N2wjpEOZu2JiUxdib+
	4P/4FwYwnRvbSd1GKX+aBh62GEgkP3HIXN7UrQb8ilKQxI8VJ8/6JSTAZeZkz5DMhDTLxREzPaI9s
	L731ZL2azDW9MVYZrHsEDnETKF0Sl+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieBOw-0007cx-Tr; Mon, 09 Dec 2019 05:16:06 +0000
Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieBOo-0007cT-Cp
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 05:16:02 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id xB95FR53012005;
 Mon, 9 Dec 2019 14:15:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com xB95FR53012005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1575868528;
 bh=YUKwrQ0HNTM5/RA0jtvxUxrn3eWB5Xxa4b2uKY9dbao=;
 h=From:To:Cc:Subject:Date:From;
 b=gDedeshFSu7VE1TZH3L6Mc/zJwLLcWAC4nUfyH1+SRaTCFwOF0rphr6qHaZ5sDWsR
 6dteJukWCZYitIcH0RdDfWGC2gZVwxvjHvOg4sp8ME+yOqCaZXlTd0ANc3jQGMO0sM
 vS8mTs3PrFoK4cIFEhJ1rS3Hma9dcU1d94K1JWq//ZWx1AWXtsuyZBYHRzbS8Iay48
 kyTukskR/KlrkNZ5XZQN6KDYORqTHmLQ+XuAtZeMzQoauDswMur+PJ+fLx4NEPk/w2
 7iQ5yCP2kKWDYufFSTKqPDKfbiUynmB5yXb6DRge1r3evPDQsYbm6CVYOcMNf5XFO/
 Ho7W0mcaoXibw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: denali: error out if platform has no associated
 data
Date: Mon,  9 Dec 2019 14:15:23 +0900
Message-Id: <20191209051523.21772-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_211559_303201_3BE854EB 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

denali->ecc_caps is a mandatory parameter. If it were left unset,
nand_ecc_choose_conf() would end up with NULL pointer access.

So, every compatible must be associated with proper denali_dt_data.
If of_device_get_match_data() returns NULL, let it fail immediately.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali_dt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8b779a899dcf..276187939689 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -118,11 +118,12 @@ static int denali_dt_probe(struct platform_device *pdev)
 	denali = &dt->controller;
 
 	data = of_device_get_match_data(dev);
-	if (data) {
-		denali->revision = data->revision;
-		denali->caps = data->caps;
-		denali->ecc_caps = data->ecc_caps;
-	}
+	if (WARN_ON(!data))
+		return -EINVAL;
+
+	denali->revision = data->revision;
+	denali->caps = data->caps;
+	denali->ecc_caps = data->ecc_caps;
 
 	denali->dev = dev;
 	denali->irq = platform_get_irq(pdev, 0);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
