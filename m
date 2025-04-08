Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470FEC369A1
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5aGBdQZd2MwbqNuFg9XAYXWKE7Yo30VqHOCANwSpMDA=; b=r5g3nM/aflgZOx
	N/i4DeBwj7W2SSixfOgbhlI9FsXbQBCH+/6hZzohpnYmoHLfeQnhosWNSG/XZzZmWi1eYPItVEbQy
	4Eq7EpNbmB9vGTqMxCcL7ihg3JVsbwHs0+zzCS8DbOT2IoQIzCiyeQ7TxndPU8WidtOiKgYLoZr6C
	D1lLFJtgM0doMFtHFVP9bSQe7RSN1q06O2uo/2DzHFNJY3WcsPA/TqfDmLPtNvmsJfiGo6Mx/OCqq
	nzInHIuG+UQGtfUAGerE70AWzXt6ihTJGNu1U6uU4yK8+g3gZElJGRvfyqY1UTUBscMht3ER0xBiz
	g9k/WCpX0TuR4qJ5H0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GhZ-00000005SyH-1ovp;
	Tue, 08 Apr 2025 21:41:49 +0000
Received: from forward102d.mail.yandex.net ([178.154.239.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GfB-00000005SeD-1bIY
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 21:39:24 +0000
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:c54a:0:640:3e90:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 24FFE6098D;
	Wed,  9 Apr 2025 00:39:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 8dlTpA3Lj4Y0-JWBBQtGG;
	Wed, 09 Apr 2025 00:39:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1744148353; bh=JZcXqYJrQv6btI2jGdZDGW5h7bHWwXKxZoNoLSUTsnk=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=OdDSfyarzXf6b9xGs1RS9fAjnVN0YHKQSNeUJ7HGsUFO6080+NKjIt5Qt1+EAWsHS
	 t10a9cQfD2P3M50WLiBn1CL9as/uCNnlw1WsENBaZLPOiE9STo5ljkkCncfaZEIHZB
	 nODID2ntwoKtZtL6XIp6YF2AA1oow9gQJwpJH9p8=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Mikhail Arkhipov <m.arhipov@rosa.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mikhail Arkhipov <m.arhipov@rosa.ru>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
Date: Wed,  9 Apr 2025 00:39:06 +0300
Message-Id: <20250408213906.23129-1-m.arhipov@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_143921_917896_6FCF2378 
X-CRM114-Status: GOOD (  10.76  )
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

If ctx->steps is zero, the loop processing ECC steps is skipped,
and the variable ret remains uninitialized. It is later checked
and returned, which leads to undefined behavior and may cause
unpredictable results in user space or kernel crashes.

This scenario can be triggered in edge cases such as misconfigured
geometry, ECC engine misuse, or if ctx->steps is not validated
after initialization.

Initialize ret to zero before the loop to ensure correct and safe
behavior regardless of the ctx->steps value.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
Signed-off-by: Mikhail Arkhipov <m.arhipov@rosa.ru>
---
 drivers/mtd/nand/ecc-mxic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 6b487ffe2f2d..e8bbe009c04e 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -614,7 +614,7 @@ static int mxic_ecc_finish_io_req_external(struct nand_device *nand,
 {
 	struct mxic_ecc_engine *mxic = nand_to_mxic(nand);
 	struct mxic_ecc_ctx *ctx = nand_to_ecc_ctx(nand);
-	int nents, step, ret;
+	int nents, step, ret = 0;
 
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
-- 
2.39.5 (Apple Git-154)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
